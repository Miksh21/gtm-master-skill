# Clay HTTP API: Formula mode + JSON Schema gotchas

Practical lessons from building a high-reliability Clay → external-webhook pipeline. These aren't in Clay's docs but they save hours.

Read this when:
- Clay's HTTP API column shows "Some inputs missing" for some rows
- You're building a body with chips that may be blank for some rows
- You're using Claygent JSON Schema output and trying to access nested fields
- A formula mode body fails to parse

## 1. The two body modes — when to use which

Clay's HTTP API column body has two input modes (gear icon ⚙️ on the body section):

| Mode | When to use | Trade-off |
|---|---|---|
| **Text with tokens** | Body has 1-3 chips that are guaranteed non-blank | Fast to write; chip-by-chip blank validation = "Some inputs missing" if any chip is blank for a row |
| **Formula** | Body has any chip that might be blank for some rows | Always handles blanks; manually escape JSON; verbose |

**Default to Formula mode** for any production body. The 30 seconds of formula writing saves hours of debugging.

## 2. Formula mode language — Clay-specific JS subset

Clay's formula language looks JS-like but is a constrained subset:

| Supported | Not supported |
|---|---|
| `+` for string concatenation | `JSON.stringify()` |
| Optional chaining (`{{Col}}?.field`) | Most JS globals |
| `Clay.formatForJSON(value)` | Custom imports |
| Template literals (sometimes) | Async / Promises |
| Standard string escapes (`\n`, `\"`, `\\`) | `||` short-circuit (sometimes works, sometimes doesn't) |

**Critical:** `JSON.stringify` is NOT exposed. Use `Clay.formatForJSON()` for everything that needs JSON serialization, including arrays and objects.

## 3. `Clay.formatForJSON` semantics

Returns a JSON-formatted representation suitable for embedding inside a JSON body:

| Input type | Output |
|---|---|
| String `"hello"` | `hello` (no surrounding quotes — you provide them) |
| String with `"` or `\n` | `hello \" world` (escaped, no surrounding quotes) |
| Number `42` | `42` |
| Null / undefined | `null` |
| Array `[1,2,3]` | `[1,2,3]` (full JSON array literal) |
| Object `{a:1}` | `{"a":1}` (full JSON object literal) |

Usage patterns:

```
"  \"name\": \"" + Clay.formatForJSON({{Name}}) + "\","        // string field — surround with quotes
"  \"count\": " + Clay.formatForJSON({{Count}}) + ","          // numeric field — no surrounding quotes
"  \"items\": " + Clay.formatForJSON({{Items}} || []) + ","    // array field — no surrounding quotes
"  \"meta\": " + Clay.formatForJSON({{Meta}} || {}) + ","      // object field — no surrounding quotes
```

The `|| []` and `|| {}` fallbacks are critical for null/undefined safety.

## 4. JSON Schema output — what Clay does with it

When you set a Claygent column's output format to JSON Schema with mixed property types, Clay splits behavior by type:

- **Scalar properties** (string, number, integer, enum) → become individual columns named `{ParentColumn} {property_name}` with sortable/filterable values
- **Array properties** → stay nested inside the parent column. Access via `{{ParentColumn}}?.array_property`
- **Object properties** → also stay nested

Example schema:
```json
{
  "type": "object",
  "properties": {
    "count": {"type": "integer"},
    "outreach_hook": {"type": "string"},
    "confidence": {"type": "string", "enum": ["high","medium","low","none"]},
    "articles": {"type": "array", "items": {...}}
  }
}
```

After Clay processes this, you get:
- `My Column count` — sortable integer column
- `My Column outreach_hook` — text column
- `My Column confidence` — enum column
- `My Column` (parent) — contains the full object including `.articles` array (nested, not split)

Access patterns in formulas:
```
{{My Column count}}                       // direct chip — uses the split column
{{My Column}}?.count                       // nested access — also works, redundant for scalars
{{My Column}}?.articles                    // ONLY way to access the array property
{{My Column}}?.articles[0]?.url            // first article's URL specifically
```

For array properties, you almost always want the full array. Use `{{Parent}}?.array_field`.

## 5. The "Run condition not met" trap

When a Claygent or enrichment column has a conditional run that's not met, Clay populates the cell with the literal string `"Run condition not met"`. This is NOT the same as blank/null.

**Symptom**: downstream HTTP API column in chip mode shows "Some inputs missing" because Clay's body validator treats the special-status string as a missing input (not as a real value).

**Fix patterns**:

A. Always run the column, instruct the AI to return a sentinel like `"unknown"` or `"none"` when input doesn't warrant work. Real string values pass validation.

B. In formula mode: wrap the chip in a check:
```
SUBSTITUTE(IF({{Column}} = 'Run condition not met', '', {{Column}}), '"', '\"')
```

Pattern A is simpler. For domain enrichment fallback specifically:

```
Find the domain for "{{ developer }}". If you can't find one with high confidence, return the literal string "unknown" — never leave the field empty.
```

This costs more credits (column always runs) but eliminates downstream brittleness.

## 6. Webhook-source column schema lock

When a Clay table's source is a webhook, Clay auto-detects the schema from the FIRST POST payload. Once you accept the schema, it's locked — subsequent POSTs with extra fields silently drop them, missing fields produce nulls.

**To extend the schema** after locking:
- Send the new fields manually via curl with the existing webhook URL (Clay rejects new fields silently — schema doesn't expand)
- OR: add the new field as a manual Clay column, populate via formula or AI

The robust pattern: send the WIDEST payload on first test. Include placeholder fields you don't have data for yet (e.g. `"future_field": ""`). Clay locks them in, and you can populate later.

## 7. JSON-escape failure modes

When building a JSON body in formula mode, three classes of input can break the JSON:

| Input | Breaks because |
|---|---|
| String containing `"` | Mid-string quote terminates the JSON value early |
| String containing `\n` (newlines) | Most JSON parsers reject literal newlines in strings |
| Object/array passed as a string | Inner quotes need double-escaping that's hard to get right |

`Clay.formatForJSON()` handles 1 and 3. For 2 (newlines), wrap in `SUBSTITUTE`:

```
SUBSTITUTE(SUBSTITUTE({{News Hook}}, '"', '\"'), char(10), ' ')
```

Or use `Clay.formatForJSON()` which (as of Clay v2.x) escapes newlines as `\n` literals.

## 8. "Try on 5 rows" before saving

Bottom-left of the HTTP API editor. Always click before saving and re-running. Shows the rendered body for 5 sample rows. Catches:
- Malformed JSON (mismatched quotes)
- Missing chips (typos in column names)
- Unexpected blanks
- Extra trailing commas

If even one of the 5 preview rows has invalid JSON, fix before running on the full table.

## 9. Run condition for HTTP API column

Set the run condition to the loosest possible:

```
{{Developer}} is not blank
```

(or whatever the universal column is for your data). This fires for every row that has the minimum required input. Formula mode handles the rest.

Avoid over-conditioning the HTTP API column itself. Let the body formula sort out edge cases internally.

## 10. Cost discipline

For high-volume tables (1k+ rows), each Claygent column costs ~3-5 credits per row. Stack:
- 2 enrichments (Domain, LinkedIn) ≈ 2 credits
- 1 AI fallback (Company Domain) ≈ 3 credits
- 1 AI research (News) ≈ 5 credits
- Formula columns ≈ 0 credits

= ~10 credits/row.

Rate-limit at the source (e.g. cap at N rows/run from upstream) rather than relying on Clay's conditional run patterns. Conditional run wastes the orchestration tax (Clay still parses, queues, and shows "Run condition not met" cells) without saving the credit cost.

## 11. Workflow patterns for n8n ↔ Clay round-trip

For n8n → Clay → n8n flows:

1. **n8n Stage 4** POSTs developer to Clay's inbound webhook (one HTTP call per row)
2. **Clay** enriches asynchronously (~30-90 sec per row, parallelized internally)
3. **Clay's HTTP API column** (with run condition `Developer is not blank`) POSTs back to n8n's webhook URL
4. **n8n's webhook trigger** has `responseMode: onReceived` so it 200s instantly to Clay
5. **n8n Stage 5+** processes asynchronously

The webhook trigger in n8n must use the **Production URL** (`/webhook/path`), not the Test URL (`/webhook-test/path`). And the n8n workflow must be **Active**.

Clay's HTTP API column expects a 2xx response from your webhook. If you return 500, Clay marks the row as failed. If you return 200 but the body is empty, Clay marks it green and moves on.

## Quick reference: bulletproof http_body formula template

```
"{\n" +
"  \"key1\": \"" + Clay.formatForJSON({{StringChip}}) + "\",\n" +
"  \"key2\": " + Clay.formatForJSON({{NumberChip}} || 0) + ",\n" +
"  \"key3\": " + Clay.formatForJSON({{NestedColumn}}?.field || []) + ",\n" +
"  \"key4_string_with_special_chars\": \"" + SUBSTITUTE(Clay.formatForJSON({{HookChip}}), char(10), ' ') + "\"\n" +
"}"
```

Adjust per row. Always wrap string fields with quotes outside the call; always omit quotes around number/array/object fields. `Clay.formatForJSON` escapes content; you control structure.
