# Task: Run an Email Waterfall

Recipe for finding verified emails on a contact list using multiple sources in sequence — stopping per-contact when a verified email is found. Maximizes find rate while protecting bounce rate.

## When to use this

User asks to find emails for a contact list, run email enrichment, maximize find rate, or build a Clay waterfall.

## Inputs required

- Contact list with: name, company domain, role (LinkedIn URL helps a lot)
- Access to enrichment tools (Clay waterfall preferred; Apollo, GetProspect, Hunter as alternatives)
- Tier of list (Tier 1 = unlimited budget; Tier 3 = pattern-only)

## The waterfall sequence (in order, stop when verified)

| # | Source | Best for | Cost |
|---|---|---|---|
| 1 | **Clay waterfall** (75+ sources simultaneously) | Best overall coverage | Highest credits |
| 2 | **Apollo** | US tech companies | Medium |
| 3 | **GetProspect** | LinkedIn-based finding | Medium |
| 4 | **Hunter.io** | Pattern-based guessing on company domains | Low |
| 5 | **Manual LinkedIn pattern** | When domain pattern is known (e.g. firstname@company.com) | Free, manual |

## Process

1. For each contact without a verified email, start at source 1
2. Move to next source ONLY if the previous returned no result OR returned "risky/unknown"
3. Accept emails marked **"valid"** only
4. Reject "risky", "catch-all", "unknown"
5. For catch-all domains: flag separately — sendable but with lower confidence, test with small batch first
6. Run ZeroBounce validation on ALL waterfall results before finalizing (regardless of source's claim)
7. Return enriched list with source attribution + confidence level

## Conditional run rule (Clay-specific)

In Clay, set conditional formulas on every paid source:
- Run source 2 ONLY if source 1 returned empty/risky
- Run source 3 ONLY if source 2 returned empty/risky
- ...
- This is non-negotiable. Without conditionals, you pay for every source on every contact = 5x credit waste.

## Output format

```
Waterfall enrichment: [list name]
Date: [date]
Contacts processed: [n]

RESULTS
Verified emails found: [n] ([%])
Catch-all (sendable, lower confidence): [n] ([%])
Not found: [n] ([%])

SOURCE BREAKDOWN
Clay:        [n] found
Apollo:      [n] found
GetProspect: [n] found
Hunter:      [n] found
Pattern:     [n] found

VALIDATION
ZeroBounce valid:           [n]
ZeroBounce risky/invalid:   [n] — removed

CREDIT USE
Clay credits used: [n]
Average per find: [n credits]
Optimization opportunities: [if any source's hit rate < 10%, drop it from waterfall]

Final clean list: [n] contacts ready for sequencing
```

## Pass criteria

- Find rate: 70%+ on Tier 1 lists with LinkedIn URL; 50%+ on lists without
- Validation rate: 95%+ "valid" on ALL accepted emails
- Conditional formulas applied at every paid source (Clay)
- Credit use proportional to list quality (high-tier list = high credits OK; low-tier = pattern-only)

## Common failures

- **No conditionals** — Clay charges per source per row. Without conditionals, 5 sources × 1000 rows = 5000 credit hits when 1500 would suffice.
- **Trusting source's "valid"** without ZeroBounce — sources lie. Independent validation always.
- **Sending to "catch-all"** at full volume — test with 50 first; if bounce < 1% on test batch, scale.
- **Same waterfall for Tier 1 and Tier 3** — Tier 3 should be Hunter+pattern only; Tier 1 gets full Clay waterfall

## What to do after

- Verified emails → push to `clusters/list-building/tasks/validate-and-cleanup.md` for final dedup + sender-protection check
- Then → `clusters/campaign-ops/tasks/setup-campaign-platform.md` to wire into sender
- Track find rate per source over time; drop sources whose hit rate < 10% from your waterfall

## Deeper knowledge

- Full waterfall theory + provider ordering + coverage benchmarks → `knowledge/waterfall-enrichment.md`
- Clay conditional formula syntax + copy-paste library → `knowledge/formulas/clayscript-guide.md` + `knowledge/formulas/copy-paste-formulas.md`
- Credit optimization (which provider for which use case) → `knowledge/operations/clay-operations-credit-optimization.md`
- HTTP API column patterns (sending Clay output to n8n / external systems) → `knowledge/operations/clay-formula-mode.md`
- Claygent (AI agent for harder enrichments — exec emails, niche personas) → `knowledge/prompts/claygent-guide.md`
