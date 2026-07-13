# External takes — campaign-ops (ColdIQ radar, UNREVIEWED)

## Outbound Analyst — l3mpire/claude-skills/outbound-analyst  ·  filed 2026-07-13
Source: https://github.com/l3mpire/claude-skills · cluster: campaign-ops
Benchmark verdict engine on lemlist data (244k campaigns / 249M emails). NOTE: the numeric benchmark tables live in the skill's resources/, not its SKILL.md — only the diagnostic frame was fetchable this run.
- 🆕 new-angle: fixed metric-triage ladder for diagnosing a campaign — (1) deliverability/warmup [foundation] → (2) reply rate [main KPI] → (3) accept rate [entry point] → (4) positive reply rate [pipeline quality] → (5) open rate [weak signal]. Fix upstream before downstream. gtm-master campaign-ops has weekly-report + analyze-replies but no single ordered triage ladder.
- ✅ supports [campaign-ops deliverability stance]: open rate is a weak/unreliable signal (post-MPP) and should never be the primary optimization target.
Status: holding
