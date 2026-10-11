# Swan external takes — cold-email (Unvalidated)

## When to load
Only on a request for alternatives, a pushback on a canonical cold-email position, or a deliberate second-opinion check (gtm-master SKILL.md step 5). Topics: message-per-lead-status ladder for inbound leads, chained AI variables that compose into carrier sentences, lint rules for AI copy columns. Always attribute; never present as gtm-master doctrine.

## Unvalidated — external, not yet run by Jan
> Filed by the Swan radar from third-party skills. Attributed; NOT gtm-master doctrine.
> A bullet moves into the body above only after it has been run in a real campaign and worked.

- Message per inbound lead STATUS, not per sequence step: form not completed = acknowledge + push booking; form completed, no meeting = reference their stated priority + offer 2-3 slots; meeting booked = build momentum, no reselling; tried calling = mention once, move scheduling to email; LinkedIn = mention only if a connection was actually sent. Fills the gap between write-followup (outbound states) and inbound-orchestration (form plumbing). [alex-vacca/sdr-master-prompts]
- Chained AI variables: each prompt generates ONE constrained variable (e.g. top-3 ICPs as abbreviated titles, 8-word company description, top-3 problems at 10 words each) that must fit grammatically into a fixed carrier sentence ("We work with a similar [output]"); the template then assembles them. The binding test is grammatical fit, not quality of each output alone. [alex-vacca/ai-personalization-prompts]
- Lint rules for AI variable columns (Clay/lemlist): all lowercase unless sentence start, no trailing full stop, no sales buzzwords, abbreviated titles (CEO, not Chief Executive Officer), "and" before the last list item. Run as a deterministic check after generation, not as a prompt instruction alone. [alex-vacca/ai-personalization-prompts]

## Source
swan-gtm/gtm-skills (alex-vacca) · MIT · filed 2026-07-28 · reviewed 2026-10-01
