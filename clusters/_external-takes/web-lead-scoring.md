# External takes — lead-scoring (Web radar, UNREVIEWED)


## Signals in the CRM, with Decay (Play 37) — frontal.so  ·  filed 2026-11-07
Source: https://frontal.so/plays/signals-in-crm-with-decay · cluster: lead-scoring
- ⚠️ contradicts [lead-scoring/tasks/score-and-prioritize.md:97]: always-on tiering uses lazy decay, never a scheduled batch rescore. Both sides — gtm-master: decay applied only when a run happens anyway; frontal.so: the score drifts down every day and the list re-ranks itself each morning, HOT/WARM/COLD moves both ways automatically.
- 🆕 new-angle: each signal stored as its own CRM custom-object record (type, date, summary, source URL, weight, age) with company rollups; undated signals not stored; dedupe on account + type + source; exponential decay per signal type with weights and rates in a config table, not code.
- 🆕 new-angle: two thresholds per signal: decay window (counts for ranking) and a tighter copy window (may be named in an email or call), hard hide around 6 months; intent topics may steer the subject but are never stated; generators check a yes/no copy-safe flag instead of a prompt rule. Provenance: Frontal = former ColdIQ Agency (same operators as the coldiq-* holding files), so agreement with coldiq takes is NOT independent corroboration.
Review: contradicts
Status: holding

## Review-Site Intent Scoring (Play 25) — frontal.so  ·  filed 2026-11-07
Source: https://frontal.so/plays/review-site-intent-scoring · cluster: lead-scoring
- ✅ supports [signals/knowledge/signal-detection-tools.md:84]: G2 activity as a timed signal.
- 🆕 new-angle: parse G2 buyer-intent alerts from Slack; page-type weights: category low, competitor comparison medium, pricing highest, repeat visits within a week compound; cumulative per-company score with decay, threshold flips HOT; HOT = owner alert + same-day call, WARM = category sequence, COOL = keep scoring. Provenance: Frontal = former ColdIQ Agency (same operators as the coldiq-* holding files), so agreement with coldiq takes is NOT independent corroboration.
Review: additive
Status: holding

## HubSpot Account Tiering (17) + PLG-to-Sales dual score (13) — frontal.so  ·  filed 2026-11-07
Source: https://frontal.so/plays/hubspot-account-tiering-scoring · cluster: lead-scoring
- ✅ supports [icp/tasks/build-icp.md:32]: build tiers from closed-won and closed-lost of the last 12 to 24 months, including disqualification patterns.
- 🆕 new-angle: PLG dual score 0 to 100 (firmographic fit + product usage) rolled into a Total Account Score; auto-created leads carry the creation reason in the name (https://frontal.so/plays/plg-to-sales); HubSpot workflows with re-enrollment plus a fallback flag for accounts missing a tier. Provenance: Frontal = former ColdIQ Agency (same operators as the coldiq-* holding files), so agreement with coldiq takes is NOT independent corroboration.
Review: additive
Status: holding
