#!/usr/bin/env bash
# Stop the Playwright MCP daemon and Cloudflare tunnel started by pwc-up.sh.

set -e

PWC_DIR="$HOME/.cache/playwright-clay"
PIDFILE="$PWC_DIR/pwc.pid"
TUNNEL_PIDFILE="$PWC_DIR/cf.pid"
URL_FILE="$PWC_DIR/public-url.txt"
PORT=3030

stop_pid() {
  local file=$1 name=$2
  if [ -f "$file" ]; then
    PID=$(cat "$file")
    if kill -0 "$PID" 2>/dev/null; then
      kill "$PID" 2>/dev/null || true
      sleep 1
      kill -9 "$PID" 2>/dev/null || true
      echo "✓ Stopped $name (PID $PID)"
    fi
    rm -f "$file"
  fi
}

stop_pid "$PIDFILE" "MCP daemon"
stop_pid "$TUNNEL_PIDFILE" "tunnel"

# Belt-and-braces: kill anything matching, in case pidfiles drifted
pkill -f "playwright/mcp.*--port $PORT" 2>/dev/null || true
pkill -f "cloudflared tunnel --url http://localhost:$PORT" 2>/dev/null || true

rm -f "$URL_FILE"
echo "Done."
