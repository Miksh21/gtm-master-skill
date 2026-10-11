# ColdIQ takes: lead-scoring

Source: ColdIQ radar (third-party GTM skills listed on coldiq.com/skills). Promoted from `_external-takes/coldiq-lead-scoring.md` at /creator-radar-review 2026-10-11.

## Unvalidated — external, not yet run by Jan
> Filed by the ColdIQ radar from third-party skills. Attributed; NOT gtm-master doctrine.
> A bullet moves into the body above only after it has been run in a real campaign and worked.

- Resolve identity before scoring, no row silently dropped: email input -> match by email only and a miss is a hard fail (never fall back to name search, a typo can resolve to a different real person); LinkedIn URL -> by URL; name + company -> match but tag "Verified (caveat)" (no confidence score, a hit at a 10k-employee company is not as safe as an email hit); persona-only rows ("the CFO at X") -> match company, sample by title + seniority, user picks. Statuses: Auto-resolved / Verified (caveat) / Ambiguous (pause) / Failed. [explorium/score-leads]
- Add inbound source as a scoring axis with caller-set weights (demo_request, pricing_inquiry, free_trial, content_download, webinar_attended, cold_inbound); the ICP 40 / signal 40 / persona 20 model has no slot for MQL source. [explorium/score-leads]
- Caveat flags travel with the row into the tiered output: record >12 months old -> downweight title fit; Hot candidate with no phone and no work email -> verify contact data before outreach; Failed rows listed as unscoreable; cross-functional C-level with null department -> "Unattributed", not guessed. Process in chunks of ~25. [explorium/score-leads]
