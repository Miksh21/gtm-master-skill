# External takes — cold-email (ColdIQ radar, UNREVIEWED)

## Campaign Angle Finder — l3mpire/claude-skills/campaign-angle-finder  ·  filed 2026-07-20
Source: https://github.com/l3mpire/claude-skills · cluster: cold-email
- 🆕 new-angle: generate exactly THREE distinct campaign angles per persona before writing any copy, each with a fixed schema — core tension (1 sentence, "why now") / why it works / pain focus in their language / 10-20 word hook / 2-word subject / 3-5 email arc (hook → deepen → proof → stakeholder shift → breakup) / "best used when" signal conditions / "avoid" traps. gtm-master routes persona → copy directly; it has no angle-generation step that produces competing angles as testable units.
- 🆕 new-angle: opening line must NEVER be a question (tension-first instead). gtm-master's question rule is about the CTA (soft question wins); it takes no position on the opener being interrogative.
- 🆕 new-angle: rigid "exactly 2 words, lowercase, internal-email tone" subject rule. Compatible with gtm-master's "under 6 words" ceiling but far stricter; the stated test is "would someone send this internally?".
- ✅ supports [campaign-ops/tasks/run-ab-test.md significance table]: "test each angle across 50+ sends before eliminating" matches gtm-master's <50 sends = inconclusive floor.
- ✅ supports [campaign-ops/tasks/run-ab-test.md + weekly-report.md]: reply rate per angle is the primary signal, NOT open rate; sentiment secondary.
- ✅ supports [copywriting-principles.md]: forbidden list — "I believe", feature lists, fabricated metrics, emojis, stacked problems; peer-to-peer tone, never apologetic.
Review: additive
Status: promoted-unvalidated

## Copywriting First Touch — l3mpire/claude-skills/copywriting-first-touch  ·  filed 2026-07-20
Source: https://github.com/l3mpire/claude-skills · cluster: cold-email
- 🆕 new-angle: the "3-second rule" — the read/delete decision is made on subject line → SENDER NAME → first line only. gtm-master optimizes subject and opener but never treats the sender-name string as a copy decision.
- 🆕 new-angle: single stated job for email 1 = "earn the right to a second message" (not to pitch, not to book). Everything else is judged against that one purpose.
- 🆕 new-angle: three named opener archetypes with templates — tension/irony ("when [dept] scales, [thing] breaks first, every time"), signal-based ("[Company] just [signal]. That usually means [challenge] moves to priority"), insight-based ("[assumption] is X. The reality is Y", for analytical personas).
- 🆕 new-angle: optional closing "sequence setup" line that pre-frames the next touch ("sending something relevant next week, worth keeping an eye out"). gtm-master's write-followup assumes no forward-reference was planted in email 1.
- ✅ supports [atl-btl-messaging.md]: seniority calibration maps cleanly to gtm-master's ATL/BTL — VP/C = strategic/board-quarter tension; Manager = operational friction, low-risk CTA; IC = daily frustration, peer framing, curiosity CTA.
- ✅ supports [copywriting-principles.md]: no opening compliments (reads as salesperson), don't open with "I", no feature mention before trust, one ask only.
Review: additive
Status: promoted-unvalidated

## Copywriting IC Sequence — l3mpire/claude-skills/copywriting-ic-sequence  ·  filed 2026-07-20
Source: https://github.com/l3mpire/claude-skills · cluster: cold-email
- 🆕 new-angle: the IC email's goal is NOT conversion but internal championing — E3 explicitly reframes the ask around career recognition (positioning the IC as the person who spotted and solved the problem for their manager). gtm-master's BTL guidance calibrates tone for ICs but keeps the same book-a-meeting objective.
- 🆕 new-angle: stated premise that ICs are the MOST skeptical segment (no budget authority + daily exposure to generic pain claims), so generic pain lines get deleted faster at IC level than at VP level. gtm-master's ATL/BTL model treats BTL as the more receptive, context-tolerant audience.
- 🆕 new-angle: role-literal pain vocabulary requirement — write the actual job moment, not the category (SDR = "low reply rates", Account Manager = "renewal risk", RevOps analyst = "manual data work").
- ✅ supports [atl-btl-messaging.md + write-followup.md]: 3-email arc = specific daily frustration (no product) → structural root cause + resource PS → champion reframe + clean breakup; 50-100 word bodies; "you"-centred, never "I"; escalating CTA friction (curiosity → direct → recognition); no fabricated metrics or case studies.
Review: additive
Status: promoted-unvalidated

## Hook Writer — janskuba/outbound-agents#hook-writer  ·  filed 2026-09-07
Source: https://github.com/janskuba/outbound-agents (`.claude/agents/hook-writer.md`) · cluster: cold-email
Note: the Outbound Agents rows ship as Claude Code subagent definitions, not `SKILL.md` files. Extraction used the agent file at the path above; earlier runs recorded these as unfetchable.
- ⚠️ contradicts [`copywriting-frameworks.md:337-343` first-line type menu + `email-templates-library.md:53,83` + `campaign-playbooks.md:128` + `cold-email-mastery.md:119`]: Hook Writer hard-bans four openers — "I saw…", "I noticed…", "Congrats on…", "Hope you're well…" — as evidence of a templated email. gtm-master bans only the last one (plus "quick question", "I came across your profile", "saw your post" — `tasks/write-first-email.md:27`, `tasks/personalize-at-scale.md:75`) and actively PRESCRIBES the other three: its Observation first-line type is exemplified as "Saw your team just hired 3 SDRs…" and its Recency type as "Congrats on the Series B yesterday…", with "I noticed you worked with Intercom…" and "Congrats on {{years}} years at {{company}}" in the template library. Both sides — gtm-master: the opener type is what matters, the verb is neutral; janskuba: those four verbs are themselves the tell, find another angle. NOTE this also touches gtm-master's own unresolved internal conflict (`copywriting-principles.md:221` lists "Congratulations" as a spam-trigger word, flagged 2026-08-10).
- ⚠️ contradicts [`copywriting-frameworks.md:337-343`]: the first-line type menus disagree. gtm-master: pick ONE of 3 — Relevancy / Observation / Recency. janskuba: pick ONE of 4 — SIGNAL / INSIGHT / PATTERN / CHALLENGE, with SIGNAL preferred and INSIGHT/PATTERN as the explicit weak-data fallback. gtm-master's menu has no fallback rung for accounts with no signal; janskuba's has two, plus CHALLENGE (pose a question about a likely pain) which gtm-master files under body component 3 "poke the bear", never as a first line.
- 🆕 new-angle: a **fail-closed confidence gate on generated copy**. Every line carries a 1-10 confidence score; below 6 the agent writes the literal string `NEEDS_REVIEW` into the `first_line` column and sets `review_flag=TRUE` rather than emitting a weak line, with the rubric's own warning that "inflated scores waste rep time". gtm-master's `personalize-at-scale.md:75` has a post-hoc QA checklist but nothing that withholds output; nothing in the cluster makes a model's self-assessment gate the artifact.
- 🆕 new-angle: a **hard 120-character cap on the opening line specifically**, counted including spaces and punctuation. gtm-master caps the whole message (60-90 words BTL / 40-70 ATL; "under 70-80 words total" in the Workflows.io framework) and caps a LinkedIn *post* hook at 140 characters, but sets no length constraint on a cold email's first line.
Review: contradicts
Status: promoted
