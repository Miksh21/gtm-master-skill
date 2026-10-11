# ColdIQ takes: objections

Source: ColdIQ radar (third-party GTM skills listed on coldiq.com/skills). Promoted from `_external-takes/coldiq-objections.md` at /creator-radar-review 2026-10-11.

## Unvalidated — external, not yet run by Jan
> Filed by the ColdIQ radar from third-party skills. Attributed; NOT gtm-master doctrine.
> A bullet moves into the body above only after it has been run in a real campaign and worked.

- Fail-closed reply classification: an ambiguous reply may never be classed NOT_INTERESTED; it goes to UNCLEAR ("We're good right now", "Thanks for reaching out", "Let me think about it", bare "Thanks"/"Ok"). When torn between two categories take the less negative one. Guards the irreversible action of dropping a lead from sequence. [janskuba/reply-classifier]
- Split TIMING and REFERRAL out as their own reply categories: TIMING turns the mentioned date into a scheduled follow-up task, REFERRAL means contacting the named person within 24h and citing the referral. [janskuba/reply-classifier]
- Each category carries a next-action SLA (INTERESTED 2h, OBJECTION 24h, REFERRAL 24h, AUTO_REPLY resume after return date), with sentiment and urgency stored as separate axes from category so routing and reading do not collide. [janskuba/reply-classifier]
