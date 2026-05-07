# Waterfall Enrichment

Instead of relying on one data provider, Clay checks multiple providers sequentially until it finds a match — then stops. You only pay for successful matches.

---

## Two Types of Waterfalls

### 1. Native Waterfall (Work Email + Mobile Phone)

Clay has built-in native waterfall enrichments for Work Email and Mobile Phone. All providers are pre-loaded, draggable, and toggleable. This is the standard approach — not manually stacked separate enrichments.

**To configure:** Open the Work Email or Mobile Phone enrichment → drag providers into the correct order → toggle off providers you don't want → Save. The estimated average cost per row is shown at the bottom before saving.

### 2. Custom Waterfall Column

Built via + Add column → Waterfall. Use when you want to run enrichments conditionally and stop as soon as one returns a result, beyond the native email/phone waterfall.

**Configuration options:**
- Data Type — expected output type
- Waterfall sequence — add providers in priority order, drag to reorder, toggle off to skip
- + Add provider — add any Clay enrichment as a step
- + Add formula — add a formula as a step (e.g. reference an existing column value)
- Output name of successful provider — optional, outputs which provider won
- Hide provider columns — on by default, keeps table clean

---

## Provider Order Logic

**Best practice:** Order providers cheapest to most expensive. This maximises coverage while minimising credit spend. The waterfall stops the moment a match is found — so expensive providers only fire when all cheaper ones have failed.

**Rules:**
- If the client has an API key for a provider → include it, place it in cost-ascending order
- If the client has no API key for a provider → use Clay-managed cost as sort key, cheapest first
- Providers requiring own API key with no Clay-managed option → toggle off if no key available

**Expected coverage:** 80%+ with a well-configured waterfall vs 40-50% with a single provider.

---

## Work Email Waterfall — Standard Order

| Position | Provider | Cost | Notes |
|---|---|---|---|
| 1st | FindyEmail | 2 cr | Cheap, accurate, always position 1 |
| 2nd | Icypeas | 0.5 cr | Cheapest, accurate — always second |
| 3rd+ | Other providers | ascending cost | In order: Hunter (2 cr, free tier), Dropcontact (2 cr), Prospeo (2 cr), Nimbler (2 cr), Apollo (own API), PeopleDataLabs (own API — most expensive) |

**Validation:** Always validate as part of the waterfall. Icypeas Verify Email (0.1 cr) is cheapest. ZeroBounce or Debounce (1 cr) when no own validation API key. Apollo is never a valid validation choice.

**Mandatory inputs before running waterfall:**
- Full name (or split first + last)
- Person's LinkedIn URL
- Company domain

All three are required. Missing any one significantly reduces match rates.

---

## Mobile Phone Waterfall — Standard Order

Same ordering logic as Work Email. **Only run when phone outreach is explicitly part of the campaign — never by default.**

Providers (ascending cost): Lusha (5 cr/phone), SMARTe, Swordfish, SignalHire, Identity Matrix, Upcell — all require own API key. Validate with ClearoutPhone (1 cr) after finding.

---

## Merge Columns

**Not a waterfall enrichment** — a free column type that outputs the first non-empty value from a priority order of existing column values.

Use when:
- All signal enrichments have already run
- Each result is in its own column
- You want to pick the "most relevant" result for a personalisation variable

How to add: + Add column → Merge Columns → define priority order.

Free — no credits consumed.

**Rule:** If the signal enrichments have already run and results are in columns → use Merge Columns. Use Custom Waterfall when you want to run enrichments on demand as part of the priority logic itself.

---

## How It Works (Mechanics)

1. Provider 1 searches → Found? Stop. Not found? Next.
2. Continue until data found or all providers exhausted
3. **Credits refunded** if a provider returns no data — you only pay for successful matches
4. Validation runs as part of the waterfall (built-in)

**Coverage comparison:**
- Single email finder = ~40% coverage
- Well-configured waterfall = 80%+ coverage

---

## Conditional Runs (Save Credits)

Use Run Settings → Conditional Run on every paid waterfall step (the gate is what stops the waterfall from running on unqualified rows entirely):

```
Run if ICP Qualified is "Yes"
AND Work Email is empty
```

Common gates: ICP qualified, contact role matches target persona, no existing email, CRM lookup empty.

**Note:** Conditional runs that just check "input variable not empty" are redundant — Clay automatically skips a step (and spends zero credits) when any referenced variable is empty. Add conditional runs only when the gate is on a *different* signal than input emptiness.

---

## See Also

- **Provider-specific operational detail** (exact provider order, credit costs, validation choices) → `clay-engineer/providers/contact-finding/email-waterfall.md`
- **Phone waterfall providers and validation** → `clay-engineer/providers/contact-finding/phone.md`
- **Native vs custom waterfall configuration** → `clay-engineer/clay-engineer-master.md` (file map)
- **Conditional run formula syntax** → `clay-engineer/platform/formula-syntax.md`
