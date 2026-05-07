# Recipe: Add a Claygent Web Research column

**Status:** draft v0 — selectors and button labels need verification on first real run. Update under "Drift notes" as you harden.

**Goal:** On a Clay table that's already open, add a Claygent Web Research column with a custom prompt, generate the JSON output schema, optionally set a conditional run, and validate the column on 3 test rows.

**Used by:** Phase 03 (Qualification), Phase 05 (Enrichment) — anywhere `clay/claygent.md` says to spec a Web Research column.

---

## Inputs

The orchestrator (the calling Claude session) must provide:

| Name | Type | Required | Description |
|---|---|---|---|
| `TABLE_URL` | URL | yes | The Clay table URL (`https://app.clay.com/workspaces/.../tables/...`) |
| `COLUMN_NAME` | string | yes | Display name for the new column (e.g. `"ICP Qualification"`) |
| `PROMPT_BODY` | multiline string | yes | The Claygent prompt with `{Variable}` references — written per `clay/claygent.md` rules |
| `MODEL` | enum | optional, default `"GPT-4.1 Mini"` | Web Research uses `GPT-4.1 Mini`; Create-or-Modify uses `ChatGPT 4.1 Nano` |
| `CONDITIONAL_RUN` | string \| null | optional | Formula expression for "Only run if". **Per `clay/claygent.md`: skip this if the only condition is "input variable not empty" — Clay auto-skips on empty input.** |
| `TEST_ROW_COUNT` | int | optional, default `3` | How many rows to manually run before declaring success |

---

## Pre-flight checks (run before the recipe)

1. Playwright MCP is loaded in this session — verify with a tool listing.
2. Browser is logged into Clay (persistent profile dir from setup). If not, navigate to `https://app.clay.com` first and prompt the user to log in.
3. `PROMPT_BODY` includes at least one `{Variable}` reference and a fallback instruction (per `clay/claygent.md` rules — confirm before running).

---

## Sequence

### Step 1 — Navigate to the table

```
browser_navigate(url=TABLE_URL)
browser_wait_for(text="Add column")  # or any Clay-loaded indicator unique to a table view
browser_snapshot
```

**Verify:** snapshot shows the table view (column headers visible, rows rendered).

### Step 2 — Open the Add Column panel

From the snapshot, find the "Add column" button (usually `+` at the rightmost column header).

```
browser_click(ref=<add-column-button-ref>)
browser_snapshot
```

**Verify:** a side panel opened with enrichment categories / search box.

**Drift notes:** Clay sometimes labels this "Add enrichment" instead of "Add column" depending on context. If the search returns nothing for `"Add column"`, search for `"Add enrichment"` or for a `+` button at the table header right edge.

### Step 3 — Search for and select Claygent Web Research

```
browser_type(ref=<search-input-ref>, text="Claygent Web Research")
browser_wait_for(text="Claygent")  # wait for results to populate (1-2s)
browser_snapshot
browser_click(ref=<claygent-web-research-entry-ref>)
browser_snapshot
```

**Verify:** the column config view is now showing — should see a column-name input, model selector, prompt area, and "Define Outputs" section.

**Drift notes:** Claygent may be split into `Claygent — Web Research`, `Claygent — Create or Modify Content`, `Claygent — Image Generation`. Match exactly.

### Step 4 — Set the column name

Find the column-name input (usually at the top of the config panel — labeled "Column name" or shown as a placeholder).

```
browser_click(ref=<column-name-input-ref>)
browser_press_key(key="Cmd+A")  # select existing default name if any
browser_type(ref=<column-name-input-ref>, text=COLUMN_NAME)
```

**Verify:** snapshot shows the input contains `COLUMN_NAME`.

### Step 5 — Set the model

Find the Model dropdown (typically below the column name).

```
browser_click(ref=<model-dropdown-ref>)
browser_snapshot
browser_click(ref=<model-option-ref-for-MODEL>)
browser_snapshot
```

**Verify:** the dropdown now shows `MODEL` as the selected value.

### Step 6 — Paste the prompt (Lexical editor — fallback strategy)

Clay's prompt editor is Lexical (rich text contenteditable). `browser_type` is unreliable here.

**Primary attempt:**
```
browser_click(ref=<prompt-editor-ref>)
browser_type(ref=<prompt-editor-ref>, text=PROMPT_BODY)
browser_snapshot
```

**Verify:** snapshot shows `PROMPT_BODY` rendered in the editor. If the text is missing, mangled, or the `{Variable}` chips didn't render, fall through to the fallback.

**Fallback (clipboard paste):**
```
browser_click(ref=<prompt-editor-ref>)
browser_press_key(key="Cmd+A")  # clear if anything there
browser_press_key(key="Delete")
browser_evaluate(code=`await navigator.clipboard.writeText(${JSON.stringify(PROMPT_BODY)})`)
browser_press_key(key="Cmd+V")
browser_snapshot
```

**Verify after fallback:** the `{Variable}` references should render as colored chips, not plain text. If they're plain text, the editor didn't parse the variables — Clay needs them inserted via its variable picker rather than pasted. Pause here and report to user.

### Step 7 — Generate the JSON output schema

Per `clay/claygent.md` rule 4: this is non-negotiable. Always generate the schema before running.

Scroll to / find the "Define Outputs" section.

```
browser_snapshot
# If "Define Outputs" controls aren't visible, the section is collapsed.
browser_click(ref=<define-outputs-header-ref>)  # only if collapsed
browser_snapshot
browser_click(ref=<json-schema-toggle-ref>)
browser_click(ref=<generate-from-prompt-button-ref>)
browser_wait_for(text="schema generated" OR <output-field-list-rendered>)  # ~5-15s
browser_snapshot
```

**Verify:** snapshot shows generated output fields with names + types.

**Pause point:** report the generated schema to the user for review before saving. The user confirms it looks sensible (field names match what the prompt asked for, types are right).

### Step 8 — Set conditional run (only if `CONDITIONAL_RUN` is provided)

**Skip this step entirely if `CONDITIONAL_RUN` is null** — see `clay/claygent.md` for when conditional runs are redundant vs needed.

Find the "Run Settings" section (often collapsed by default).

```
browser_click(ref=<run-settings-header-ref>)  # if collapsed
browser_snapshot
browser_click(ref=<only-run-if-input-ref>)
browser_type(ref=<only-run-if-input-ref>, text=CONDITIONAL_RUN)
browser_snapshot
```

**Verify:** the formula renders without a syntax-error indicator. If the conditional input is also a Lexical editor (likely), use the same paste fallback as Step 6.

### Step 9 — Save the column

```
browser_click(ref=<save-button-ref>)  # usually labeled "Save", "Add column", or similar
browser_wait_for(text=COLUMN_NAME)  # the new column header should appear in the table
browser_snapshot
```

**Verify:** the new column header is visible in the table at the rightmost position. The side panel may close automatically.

### Step 10 — Run on `TEST_ROW_COUNT` rows

For each of the first `TEST_ROW_COUNT` rows:

```
browser_click(ref=<row-N-cell-in-new-column-ref>, button="right")
browser_snapshot
browser_click(ref=<run-this-row-menu-item-ref>)
```

**Or via hover toolbar fallback:**
```
browser_hover(ref=<row-N-cell-in-new-column-ref>)
browser_snapshot
browser_click(ref=<run-cell-toolbar-button-ref>)
```

Wait for status to flip to "Done" (or for the cell value to populate):
```
browser_wait_for(text=<expected-pattern>)  # depends on prompt output schema
```

### Step 11 — Verify outputs

Snapshot the new column for the first `TEST_ROW_COUNT` rows. Check:

- **Format:** values match the JSON schema's expected structure.
- **Content:** values are sensible (not "Unknown" for every row — if so, the prompt's fallback is firing too eagerly).
- **Missing-input behaviour:** if any row had an empty input variable, that row should show a "missing input" status with no credit charge. If it shows "Unknown" or a real Claygent attempt, the prompt is referencing a variable that isn't actually empty in that row, OR the conditional run is misconfigured.

Report results to the user:
- N rows tested
- N successes
- N "missing input" (expected)
- N errors / failures (problem)
- Sample outputs for the first 3 rows

---

## Failure handling

| Failure | Likely cause | Recovery |
|---|---|---|
| `browser_type` to prompt editor produced empty / mangled text | Lexical editor doesn't accept type events cleanly | Use clipboard fallback (Step 6) |
| `{Variable}` references render as plain text after paste | Lexical didn't parse variables; Clay expects them inserted via its variable picker | Pause; report to user. Variable insertion via picker is a separate UI flow not covered in this v0 recipe. |
| "Generate from prompt" hangs >30s | Claygent backend slow or prompt too long | Wait once more (60s total) before failing. If still failing, save the column without auto-schema and report to user — they can generate manually. |
| Save button stays disabled | Required field missing (column name, model, prompt) | Re-snapshot and check each. Common: model dropdown not actually selected even though it shows a value. |
| "Run on row" menu has no "Run this row" option | Right-click context menu varies | Use hover-toolbar fallback. |
| Test row stays in "Pending" state | Claygent queue backed up | Wait 60s, then re-check. Don't fail the recipe over queue latency. |

---

## Drift notes

*(Populate this section after the first real run. Format: `Step N — actual label / ref pattern / scoping requirement`.)*

- (none yet — recipe has not been run)

---

## Linked references

- `clay/claygent.md` — prompt rules, model choice, output schema, conditional-run logic
- `phases/03-qualification.md` — when this recipe is invoked from the qualification phase
- `phases/05-enrichment.md` — when invoked for an enrichment Claygent column
- `ui-playbook/README.md` — global conventions and sticky points
