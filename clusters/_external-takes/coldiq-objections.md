# External takes — objections (ColdIQ radar, UNREVIEWED)

Auto-filed by coldiq-radar-collect. NOT canonical, NOT in gtm-master routing. Promote/keep/reject at
`/creator-radar-review`. ⚠️ = contradicts a canonical gtm-master position (never auto-resolved).

## Reply Handler — l3mpire/claude-skills/reply-handler  ·  filed 2026-07-11
Source: https://github.com/l3mpire/claude-skills (reply-handler) · cluster: objections
- ✅ supports [handle-objection "We already have a solution" + budget]: never defend price/incumbent — ask a diagnostic question instead. reply-handler operationalizes this ("Budget: never defend pricing. Ask about constraints. Offer ROI angle or cheaper entry point. Or accept it's not a fit"; competitor: "Ask 'How's <use case> going?' rather than defend").
- ✅ supports [handle-objection brevity <80 words]: reply-handler caps replies at "3–5 sentences max; one question max" — same brevity + single-ask discipline.
- 🆕 new-angle: value-on-exit — on a hard "not interested / remove me", leave ONE genuinely useful resource before bowing out, not just a soft seed. gtm-master's "Not interested" = acknowledge + soft seed + no follow-up; it does not prescribe leaving a resource on the way out.
- 🆕 new-angle: add a distinct "soft interest / maybe-later" reply class (value + patience + reconnect timing) separate from the 6 objection types — gtm-master folds these into timing objections.
- 🆕 new-angle: mirror the prospect's register/language (casual↔casual, formal↔formal), not only the objection type.
- ⚠️ contradicts [handle-objection "one reply per objection, max. If they don't respond, close" + "Not interested → No follow-up after this reply"]: reply-handler is relationship-first / nurture-biased — after a soft rejection it says "discover actual priorities and offer help there" and provides reconnection timing rather than closing after one reply. Both sides — gtm-master: one reply then close (guards against being annoying; treats no-context "not interested" as a targeting problem, not a copy/nurture one). reply-handler: keep giving value and schedule a reconnect (treats every reply as a relationship). Jan's call at review.
Review: contradicts
Status: holding

## Reply Classifier — janskuba/outbound-agents#reply-classifier  ·  filed 2026-09-07
Source: https://github.com/janskuba/outbound-agents (`.claude/agents/reply-classifier.md`) · cluster: objections
Note: the Outbound Agents rows ship as Claude Code subagent definitions, not `SKILL.md` files. Extraction used the agent file at the path above; earlier runs recorded these as unfetchable.
- 🆕 new-angle: **the Golden Rule — an ambiguous reply may NEVER be classified NOT_INTERESTED; it goes to UNCLEAR.** Worked examples of replies that read negative but are not: "We're good right now", "Thanks for reaching out", "Let me think about it", and one-word "Thanks"/"Ok". Tie-break rule: when torn between two categories, always take the less negative one. gtm-master's `campaign-ops/tasks/analyze-replies.md` has a "Needs follow-up" bucket for ambiguity but no rule forbidding the negative default, and `score-meeting-intent.md` sends "not an opportunity" straight to no-further-outreach. This is a fail-closed classification gate on an irreversible action (dropping a lead from sequence) and it is the sharpest thing in this block.
- 🆕 new-angle: **7 categories vs gtm-master's 5**, splitting TIMING and REFERRAL out as first-class. gtm-master's analyze-replies runs Interested / Not interested / Out of office / No reply needed / Needs follow-up; janskuba adds TIMING (carrying "set a follow-up reminder for the mentioned date" so a future date becomes a scheduled action, not a note) and REFERRAL (carrying "reach out to the referred person within 24h MENTIONING the referral"). gtm-master's `handle-objection.md` covers wrong-person replies but the reply-analysis task has no timing bucket at all.
- 🆕 new-angle: each category ships a bound next-action SLA (INTERESTED 2h, OBJECTION 24h, REFERRAL 24h, AUTO_REPLY resume after return date) alongside sentiment and urgency as separate axes from category — so a negative-sentiment INTERESTED reply and a neutral one route the same but read differently.
- ✅ supports [`objections/tasks/handle-objection.md:76,82`]: reply length capped at 60 words, tone-matched to the inbound register, never defensive on objections, and "no guilt-tripping" on NOT_INTERESTED — the same acknowledge-and-leave discipline gtm-master states as "'Not interested' with new pitch — never."
Review: additive
Status: holding
