# Clay UI Playbook — Execution Layer

Deterministic recipes for driving Clay's web UI via the **Playwright MCP server**. Pairs with `phases/` (decides *what* to build) and `providers/` (which provider to use). Playbooks here decide *how to actually click through Clay* to make the build happen.

**Status:** v0 — first recipe (`add-claygent-web-research-column.md`) is a draft and needs hardening on the first real run. Selectors, button labels, and panel scoping must be verified against live Clay. Once a recipe runs clean three times in a row, mark its status `hardened` at the top.

---

## Why this layer exists

The phases tell you to "add a Claygent Web Research column on Domain with this prompt and a conditional run." A human reads that and clicks through Clay. The UI playbook is the same recipe written for Playwright — the same sequence of decisions, but expressed as a deterministic series of UI actions Claude executes itself.

This is **not** a generic browser automation library. Every recipe is Clay-specific and assumes Clay's current UI layout, accessible-name conventions, and panel structure.

---

## Setup (run once)

### 1. Install the Playwright MCP

```bash
claude mcp add playwright -s user -- npx -y @playwright/mcp@latest --user-data-dir /Users/janmikes/.cache/playwright-clay
```

The `--user-data-dir` keeps your Clay login between sessions. **Log into Clay once** in the headed browser; future sessions reuse the cookie.

### 2. Restart Claude Code

The MCP's tools (`browser_navigate`, `browser_snapshot`, `browser_click`, `browser_type`, etc.) only surface to a session that *starts after* the MCP is registered.

### 3. First-run Clay login

In a session with the Playwright MCP loaded, navigate to `https://app.clay.com` and let the headed browser open. Log in normally. The cookie persists in the user-data-dir.

---

## Conventions every recipe follows

1. **Always `browser_snapshot` after any state change** — never assume the next element is where you expect.
2. **Find elements by role + accessible name** from the snapshot. Avoid CSS/XPath unless a known-sticky point requires it (see below).
3. **One UI action per step** — don't batch a click + type without a snapshot in between, except inside a `browser_batch` for the same logical sub-flow (e.g. open modal → type → press Enter).
4. **Verify after every state change** — confirm the new state matches expectation before moving on. On mismatch, re-snapshot, do not blindly retry.
5. **Inputs are explicit** — every recipe declares what data it needs (table URL, column name, prompt body, etc.). Orchestration code passes them in; the recipe doesn't infer.
6. **Pause points are explicit** — if a step requires user judgment (e.g. reviewing the auto-generated JSON schema before saving), the recipe says so.

---

## Known sticky points (apply across recipes)

### 1. Lexical / contenteditable prompt editor

Clay's Claygent prompt area is a Lexical-rich-text editor, not a `<textarea>`. `browser_type` sometimes succeeds with no visible text, or text appears mangled.

**Fallback strategy:**
1. Click the editor to focus.
2. Use `browser_evaluate` to set clipboard: `await navigator.clipboard.writeText(<prompt>)`.
3. Press `Cmd+V` via `browser_press_key`.
4. Snapshot to confirm the text rendered.

### 2. Formula editor

Same shape as the Lexical editor. Same fallback.

### 3. Run Settings side panel scoping

When the Run Settings panel is open, the snapshot may include both the table behind it and the panel. Element refs can collide if you don't scope. Always scope clicks to the panel's container ref before drilling into children.

### 4. Drag-to-reorder columns

Playwright supports drag, but Clay's drop zones are picky — they only accept the drop in a narrow band at the column header boundary. If you need column reordering, use `browser_evaluate` to read the column header positions and pass exact pixel coordinates to a manual drag, rather than `browser_drag` element-to-element.

### 5. "Define Outputs" section sometimes collapsed

If the snapshot doesn't show the JSON schema controls, the section is collapsed. Click its header first, then re-snapshot.

### 6. "Run on row" button

Right-click context menu vs hover toolbar varies by viewport size. Try right-click first; fall back to hover-then-click toolbar button.

### 7. Slow enrichment search

Add Column → enrichment search can take 1-2s to populate. Always `browser_wait_for(text=<expected entry>)` before clicking.

---

## Recipe index

| Recipe | What it does | Status |
|---|---|---|
| `add-claygent-web-research-column.md` | Add a Claygent Web Research column with custom prompt, JSON schema generation, and (optional) conditional run | draft v0 — needs first-run hardening |

Add new recipes here as we harden them.

---

## Hardening protocol

When a recipe is run for the first time:

1. Run it end-to-end with the headed browser visible.
2. After every step, verify the actual UI state matches the recipe's assumption. If it diverges:
   - Note the actual element label / role / scope in the recipe under "Drift notes".
   - Update the step.
3. Re-run from scratch on a fresh table. If clean, mark status `hardened-1`.
4. Run two more times on different table layouts (e.g. with/without existing columns). If all clean, mark `hardened`.

Never edit a recipe to "match what happened" without verifying the change works on a fresh run.
