# External takes — icp (Web radar, UNREVIEWED)

## The TAM Mapping Playbook — workflows.io  ·  filed 2026-11-07
Source: https://www.workflows.io/workflows/the-tam-mapping-playbook (2026-07-28) · cluster: icp
- ⚠️ contradicts [campaign-ops/tasks/map-tam.md:25]: what goes into TAM tiers. Both sides — gtm-master: Tier 1 = strongest ICP fit + active signal, Tier 2 = fit without signal; workflows.io: score TAM tiers on account fit only and never mix intent signals in at this stage (signals act later through awareness scoring).
- ✅ supports [icp/tasks/build-icp.md:34]: backtest the model on closed-won and closed-lost, add AE and CSM interviews.
- 🆕 new-angle: explicit pass bar: 95%+ of closed-won accounts should qualify under the model, otherwise the model is wrong.
- 🆕 new-angle: binary research agent ("is this actually an eCommerce brand?") on cheap models (4o-mini or Haiku) before expensive enrichment; run the enrichments most likely to disqualify first; for large TAMs load only Tier 1 into the CRM to start.
Review: contradicts
Status: holding


## Pain-Qualified Segments from Calls (Play 41) — frontal.so  ·  filed 2026-11-07
Source: https://frontal.so/plays/pain-qualified-segments · cluster: icp
- ✅ supports [icp/tasks/build-icp.md:32]: backtest against closed-won and closed-lost.
- ✅ supports [icp/tasks/build-icp.md:74]: situational fit (why now) over static firmographics.
- 🆕 new-angle: segment = a situation (something that happened to them) + a tension (two facts pulling against each other) + an amplifier (deadline or season) + an existential number; no such number = incremental segment; kill vague, single-signal or unfixable segments. Calls with buyers outrank internal kickoffs; count occurrences (12 of 100 calls is a finding); build a language bank.
- 🆕 new-angle: membership test field by field with source, field, operator, threshold, each marked public (filter and copy), proxy (score and ask, never state) or not public (drop, becomes a call question); measure: free count, open 5 rows (2 of 5 wrong = fix the test), backtest share of closed-won in the situation 90 days before purchase vs a random TAM sample = lift; low lift = firmographic in disguise; discover on one filter, score on the rest. Provenance: Frontal = former ColdIQ Agency (same operators as the coldiq-* holding files), so agreement with coldiq takes is NOT independent corroboration.
Review: additive
Status: holding

## 100 GTM rules, ICP and targeting rules 1-10 — frontal.so  ·  filed 2026-11-07
Source: https://frontal.so/blog/go-to-market-strategy-framework · cluster: icp
- ✅ supports [icp/tasks/build-icp.md:74]: define by pain and situation, not title plus headcount; start with one ICP; revisit quarterly; score by signal density rather than company size (claimed: a 20-person firm with five signals beats a Fortune 500 with none). Provenance: Frontal = former ColdIQ Agency (same operators as the coldiq-* holding files), so agreement with coldiq takes is NOT independent corroboration.
Review: corroboration
Status: holding
