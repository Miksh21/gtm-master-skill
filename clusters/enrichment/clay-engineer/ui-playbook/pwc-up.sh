#!/usr/bin/env bash
# Start the Playwright MCP server (HTTP/SSE on localhost:3030) AND a Cloudflare quick
# tunnel that exposes it as a public HTTPS URL. The public URL goes into Claude Desktop's
# Custom Connectors panel.
#
# Browser runs on your Mac (Clay login persists in the user-data-dir). Cloudflared rewrites
# the Host header to "localhost:3030" so the MCP's built-in host filter still passes.
#
# Usage: ./pwc-up.sh
# Stop with: ./pwc-down.sh

set -e

PORT=3030
PWC_DIR="$HOME/.cache/playwright-clay"
LOG="$PWC_DIR/pwc.log"
TUNNEL_LOG="$PWC_DIR/cf.log"
URL_FILE="$PWC_DIR/public-url.txt"
PIDFILE="$PWC_DIR/pwc.pid"
TUNNEL_PIDFILE="$PWC_DIR/cf.pid"
MCP_VERSION="0.0.75"

mkdir -p "$PWC_DIR"

# 1. Check cloudflared
if ! command -v cloudflared >/dev/null 2>&1; then
  echo "✗ cloudflared not installed. Install with: brew install cloudflared"
  exit 1
fi

# 2. Start MCP daemon if not already up
if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
  echo "✓ MCP daemon already running (PID $(cat "$PIDFILE"))"
else
  nohup npx -y "@playwright/mcp@$MCP_VERSION" \
    --port "$PORT" \
    --host 127.0.0.1 \
    --user-data-dir "$PWC_DIR" \
    >"$LOG" 2>&1 &
  echo $! > "$PIDFILE"

  for i in {1..30}; do
    if curl -sS -m 1 -H "Host: localhost:$PORT" -o /dev/null -w "%{http_code}" "http://127.0.0.1:$PORT/mcp" 2>/dev/null | grep -qE "^(2|4)"; then
      echo "✓ MCP daemon started (PID $(cat "$PIDFILE"))"
      break
    fi
    sleep 1
  done

  if ! kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
    echo "✗ MCP daemon failed to start — check $LOG"
    exit 1
  fi
fi

# 3. Start cloudflared quick tunnel if not already up
if [ -f "$TUNNEL_PIDFILE" ] && kill -0 "$(cat "$TUNNEL_PIDFILE")" 2>/dev/null; then
  echo "✓ Tunnel already running (PID $(cat "$TUNNEL_PIDFILE"))"
else
  : > "$TUNNEL_LOG"
  nohup cloudflared tunnel \
    --url "http://localhost:$PORT" \
    --http-host-header "localhost:$PORT" \
    --no-autoupdate \
    >"$TUNNEL_LOG" 2>&1 &
  echo $! > "$TUNNEL_PIDFILE"

  for i in {1..30}; do
    URL=$(grep -oE "https://[a-z0-9-]+\.trycloudflare\.com" "$TUNNEL_LOG" 2>/dev/null | head -1)
    if [ -n "$URL" ]; then
      echo "$URL" > "$URL_FILE"
      echo "✓ Tunnel started (PID $(cat "$TUNNEL_PIDFILE"))"
      break
    fi
    sleep 1
  done
fi

URL=$(cat "$URL_FILE" 2>/dev/null || true)
if [ -z "$URL" ]; then
  echo "✗ Tunnel did not produce a URL within 30s — check $TUNNEL_LOG"
  exit 1
fi

echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Custom Connector URL (paste into Claude Desktop):"
echo
echo "  $URL/mcp"
echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "MCP log:    $LOG"
echo "Tunnel log: $TUNNEL_LOG"
echo "Stop with:  $(dirname "$(realpath "$0" 2>/dev/null || echo "$0")")/pwc-down.sh"
