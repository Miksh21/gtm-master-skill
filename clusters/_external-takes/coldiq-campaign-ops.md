# External takes — campaign-ops (ColdIQ radar, UNREVIEWED)

## Outbound Analyst — l3mpire/claude-skills/outbound-analyst  ·  filed 2026-07-13
Source: https://github.com/l3mpire/claude-skills · cluster: campaign-ops
Benchmark verdict engine on lemlist data (244k campaigns / 249M emails). NOTE: the numeric benchmark tables live in the skill's resources/, not its SKILL.md — only the diagnostic frame was fetchable this run.
- 🆕 new-angle: fixed metric-triage ladder for diagnosing a campaign — (1) deliverability/warmup [foundation] → (2) reply rate [main KPI] → (3) accept rate [entry point] → (4) positive reply rate [pipeline quality] → (5) open rate [weak signal]. Fix upstream before downstream. gtm-master campaign-ops has weekly-report + analyze-replies but no single ordered triage ladder.
- ✅ supports [campaign-ops deliverability stance]: open rate is a weak/unreliable signal (post-MPP) and should never be the primary optimization target.
Status: holding

## A/B Testing — coreyhaines31/marketingskills/ab-testing  ·  filed 2026-07-20
Source: https://github.com/coreyhaines31/marketingskills · cluster: campaign-ops
Context caveat before reading the contradiction: this skill is written for web/CRO experimentation (landing pages, signup flows), not cold email. Sample-size mathematics is domain-independent, but the practical volumes are not. Judge the promotion on that basis.
- ⚠️ contradicts [gtm-master send-volume significance table — campaign-ops/tasks/run-ab-test.md:27-32]: gtm-master declares a test "statistically meaningful, act on it" at 100+ sends per variant (50-100 = directional). This skill's power table says a 5% baseline needing a 20% lift requires ~7,000 per variant, and a 10% baseline needing a 20% lift ~3,000 — one to two orders of magnitude above gtm-master's bar. Both sides — gtm-master: 100+ sends per variant = act; A/B Testing: 95% confidence (p<0.05) with a pre-declared MDE, meaning most cold-email A/B tests at realistic volumes are underpowered and gtm-master's "meaningful" tier is closer to directional. This is the highest-stakes divergence in the run: acting on 100-send winners means shipping noise.
- ⚠️ contradicts [gtm-master run-ab-test.md:85 "Directional → run another 50 sends per side to reach significance"]: this skill states as a critical rule that you must NOT stop early or extend based on peeking at interim results, because sequential peeking inflates false positives. gtm-master's guidance is exactly the peek-then-extend pattern. Both sides — gtm-master: check, then top up to significance; A/B Testing: fix sample size before launch, do not look at interim results to decide.
- 🆕 new-angle: guardrail metrics as a mandatory third metric class (primary / secondary / guardrail), with "stop the test if a guardrail declines significantly". gtm-master's run-ab-test measures the funnel layers but has no defined harm-detection stop condition.
- 🆕 new-angle: hypothesis template as an artifact — "because [observation/data], we believe [change] will cause [outcome] for [audience]; we'll know when [metrics]" — prioritized across a backlog with ICE (Impact, Confidence, Ease). gtm-master has build-hypothesis-matrix but no ICE scoring or written hypothesis contract.
- 🆕 new-angle: run tests across whole days/weeks to absorb time-of-day and day-of-week effects; 2-4 weeks typical duration. gtm-master gates on volume only, never on calendar coverage.
- 🆕 new-angle: program-level health targets rather than per-test ones — 4-8 experiments launched per month, 20-30% win rate (a HIGHER win rate means hypotheses are too conservative), 20+ hypotheses in backlog, quarterly audit of which winning patterns remain underexploited.
- 🆕 new-angle: a persistent experiment playbook where every result is documented with the reusable PATTERN extracted, not just the winner, so the library compounds.
- ✅ supports [run-ab-test.md:77]: one variable per test, or attribution is impossible; changing variants/traffic/tracking mid-test invalidates the result; a no-difference outcome means test bolder changes, not more of the same.
- ✅ supports [run-ab-test.md:79 kill-the-hypothesis rule]: distinguishes statistical significance from practical significance — a real but tiny effect may not justify implementation.
Status: holding
