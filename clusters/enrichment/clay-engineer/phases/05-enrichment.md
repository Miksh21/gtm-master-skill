# Phase 5 — Enrichment

Building enrichment columns after qualification — contact finding, email waterfall, normalisation, personalisation.

---

## Standard Enrichment Order (Table B)

After companies are qualified (Table A), Table B handles:

0. **LinkedIn headcount verification (Clay Find Companies tables only)** — Claygent Web Research (ChatGPT 4.1 Nano). **Always the very first enrichment when Clay Find Companies is the list building source — no exceptions.** Scrapes the company LinkedIn profile and returns the exact employee count. Clay Find Companies only gives headcount as a range (e.g. 51-200) and is often wrong — LinkedIn is the source of truth. Not needed when the imported CSV already provides an exact headcount column.
0b. **Apply table filter on LinkedIn headcount column (Clay Find Companies tables only)** — immediately after the LinkedIn headcount enrichment completes. Use Clay's table filter feature (see `clay/table-mechanics.md` → Table Filters) to exclude companies outside the tier's headcount range. Filters hide rows entirely — enrichments don't run on filtered rows, no credits spent. This replaces formula column gates for headcount verification.
1. **Find contacts** — conditional on ICP qualification passing
2. **Name normalisation** — Claygent Create or Modify Content (ChatGPT 4.1 Nano)
3. **Company name normalisation** — Claygent Create or Modify Content (if needed for personalisation or CRM)
4. **Email waterfall** — Work Email native waterfall, ordered cheapest to most expensive
5. **Email validation** — built into waterfall (Icypeas 0.1cr, ZeroBounce 1cr, Debounce 1cr)
6. **LinkedIn URL finding** — if HeyReach or CRM matching requires it (Claygent Web Research)
7. **Personalisation enrichments** — Claygent Web Research or other providers, each gated on qualification + email found
8. **Sending Gate formula column** — free formula column that evaluates all conditions, outputs TRUE/FALSE
9. **Push to sequencer** — conditional on Sending Gate = TRUE only

---

## Finding Contacts at a Company — Decision Tree

| Situation | Approach |
|---|---|
| One-time / manual list build | **Find People** (free, new table source) |
| Evergreen / automated campaign | **Surfe: Find People at Company** — cap contacts per company to control cost |
| Last resort | **Find Contacts at Company** (enrichment column — max 10, random — last resort only) |

**Always confirm before building:**
- "Is this a one-time list build or an evergreen automated campaign?"
- "How many contacts per company do you want to pull?"

**Always check after building:**
- "How many contacts are you targeting per campaign? Once we see the final count per segment, flag any that fall short and do additional list building for those."

---

## Name Normalisation — When and What to Build

**Ask first:** What columns does the list provider give? Full name as one column, or already split?

**Rule:** Only build the columns the destination actually needs.

**Scenario A — Full Name as one column:**
1. Claygent Normalise Full Name (ChatGPT 4.1 Nano, Create or Modify Content)
2. Formula: Normalised First Name — split before first space
3. Formula: Normalised Last Name — only if needed by CRM or sequencer

**Scenario B — Already split into First + Last:**
- Outbound only: normalise First Name column only (never the last name — not used in copy)
- CRM involved: check CRM properties first, then normalise what's needed

**Always use Normalised First Name in outbound copy — never the raw first name.**

---

## Company Name Normalisation

Always normalise before using as a personalisation variable or CRM field.

Claygent Create or Modify Content | ChatGPT 4.1 Nano
```
You are a text normalisation agent. Your task is to clean a company name so it is suitable for use as a personalisation variable in a cold email.

You have the following information:
- Raw Company Name: {Company Name}

Clean the company name by:
1. Removing legal suffixes (Inc, Inc., Ltd, Ltd., LLC, LLP, GmbH, S.A., etc.)
2. Removing country, city, or region names appended to the name (e.g. "- Germany", "UK", "Europe")
3. Removing standalone punctuation left after stripping (commas, dashes, pipes at start or end)
4. Fixing all-caps — convert to Title Case unless known brand capitalisation (HubSpot, OpenAI, GoCardless — preserve)
5. Return the cleaned name only — no explanation, just the name

If already clean, return as-is.
```

---

## Personalisation Variable Workflow

**Copy is always written manually.** Clay's role is to build the data points that get inserted as variables.

1. Identify the personalisation variable needed — e.g. `{subindustry}`, `{use_case}`, `{tech_stack}`
2. Build that data point in Clay — use Claygent Web Research, another enrichment provider, or formula column
3. The enriched column becomes the variable in Instantly/HeyReach
4. Map the Clay column to the exact `{{variable_name}}` in the sequencer

---

## Personalisation Waterfall — Multiple Signals, One Variable

When multiple signals can feed the same personalisation variable, use **Merge Columns** (free) or a **Custom Waterfall column**.

**Merge Columns** (preferred when enrichments already ran):
- Add as a free column
- Define priority order: Signal A → Signal B → Signal C → fallback generic line
- Outputs the first non-empty value

**Custom Waterfall column** (when you want enrichments to run conditionally as part of the priority logic):
- Add via + Add column → Waterfall
- Add providers in priority order
- Only runs each step if previous steps returned empty

---

## Gates Before Credits — Key Conditional Run Patterns

**Never run a paid enrichment on a row that hasn't passed the free gates.**

Standard conditional runs:
- Contact finding: `Run if ICP Qualified is not "No" AND Domain is not empty`
- Email waterfall: `Run if First Name is not empty AND Last Name is not empty AND Domain is not empty`
- Tech stack enrichment: `Run if Domain is not empty AND ICP Qualified is not "No"`
- Personalisation enrichment (campaign-specific): `Run if ICP Qualification is "[Sub-industry]" OR ICP Qualification is "[Sub-industry A] & [Sub-industry B]"`
- Phone waterfall: Only run if phone outreach is explicitly part of the campaign — never by default

---

## Waterfall Enrichment — Key Principles

Instead of relying on one data provider, Clay checks multiple providers sequentially until it finds a match — then stops. You only pay for successful matches.

**Order rule:** Always cheapest to most expensive.

**Work Email waterfall standard order:**
1. Cheapest providers first (e.g. FindyEmail, Icypeas at ~0.5 cr)
2. Mid-tier providers next
3. Premium providers last (Datagma, ContactOut)

The exact ordering depends on the providers connected in the workspace and their per-row costs. Always order ascending by cost.

**Phone waterfall:** Same logic — own API keys first ordered by cost, then Clay-managed ordered by cost. Only run when phone outreach is explicitly needed.

---

## Tech Signal Enrichment

Run BuiltWith first (1 cr/row), Sumble as fallback (6 cr/technology):

```
Sumble conditional run:
Run if:
1) Company Domain is not empty
AND
2) BuiltWith Result is empty
```

**Never connect Sumble via own API key** — native Clay integration is cheaper (exception to the standard rule).

---

## Free Tools Before Paid

**If a formula column can do the same job as a Claygent step, use the formula column.**

Claygent is for: language understanding, judgment, web research, text generation/analysis.
Formula column is for: string manipulation, math, conditional logic on existing clean data.

Before adding any Claygent step, ask: can this be done with a free formula column?
