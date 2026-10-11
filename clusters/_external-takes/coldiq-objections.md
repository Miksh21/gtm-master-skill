# External takes — objections (ColdIQ radar, UNREVIEWED)

Auto-filed by coldiq-radar-collect. NOT canonical, NOT in gtm-master routing. Promote/keep/reject at
`/creator-radar-review`. ⚠️ = contradicts a canonical gtm-master position (never auto-resolved).

## Reply Classifier — janskuba/outbound-agents#reply-classifier  ·  filed 2026-09-07
Source: https://github.com/janskuba/outbound-agents (`.claude/agents/reply-classifier.md`) · cluster: objections
Note: the Outbound Agents rows ship as Claude Code subagent definitions, not `SKILL.md` files. Extraction used the agent file at the path above; earlier runs recorded these as unfetchable.
- 🆕 new-angle: **the Golden Rule — an ambiguous reply may NEVER be classified NOT_INTERESTED; it goes to UNCLEAR.** Worked examples of replies that read negative but are not: "We're good right now", "Thanks for reaching out", "Let me think about it", and one-word "Thanks"/"Ok". Tie-break rule: when torn between two categories, always take the less negative one. gtm-master's `campaign-ops/tasks/analyze-replies.md` has a "Needs follow-up" bucket for ambiguity but no rule forbidding the negative default, and `score-meeting-intent.md` sends "not an opportunity" straight to no-further-outreach. This is a fail-closed classification gate on an irreversible action (dropping a lead from sequence) and it is the sharpest thing in this block.
- 🆕 new-angle: **7 categories vs gtm-master's 5**, splitting TIMING and REFERRAL out as first-class. gtm-master's analyze-replies runs Interested / Not interested / Out of office / No reply needed / Needs follow-up; janskuba adds TIMING (carrying "set a follow-up reminder for the mentioned date" so a future date becomes a scheduled action, not a note) and REFERRAL (carrying "reach out to the referred person within 24h MENTIONING the referral"). gtm-master's `handle-objection.md` covers wrong-person replies but the reply-analysis task has no timing bucket at all.
- 🆕 new-angle: each category ships a bound next-action SLA (INTERESTED 2h, OBJECTION 24h, REFERRAL 24h, AUTO_REPLY resume after return date) alongside sentiment and urgency as separate axes from category — so a negative-sentiment INTERESTED reply and a neutral one route the same but read differently.
- ✅ supports [`objections/tasks/handle-objection.md:76,82`]: reply length capped at 60 words, tone-matched to the inbound register, never defensive on objections, and "no guilt-tripping" on NOT_INTERESTED — the same acknowledge-and-leave discipline gtm-master states as "'Not interested' with new pitch — never."
Review: additive
Status: promoted-unvalidated
