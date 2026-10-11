# Agentic GTM Patterns — Building Self-Running Loops in Claude Code

## When to load
Building GTM workflows that RUN as agents (not one-shot prompts): eval/feedback loops, human-in-the-loop gates, prompt/context architecture, Skill design, agent data modeling. Complements `reference/claude-code-gtm-architecture.md` (the 4-layer OS) with the engineering patterns that make loops reliable. Triggers: "agentic loop", "eval loop", "human in the loop", "context pipeline", "how do I structure Claude Code skills".

## The frontier: eval loops
Agent creates → measures → iterates to a quality threshold → hands the final 5-10% to a human. Cuts human effort 50-75%. The hard part is not generation — it's defining PASS/FAIL, because quality is subjective. [#97]
- Evidence (2026-10-11): before letting an agent label failures, hand-annotate ~10 real traces yourself; criteria drift, so you only learn what good means from data. Then the agent pre-annotates and you accept or reject. [#1709]

## 1. Where the loop stops — intervention tiers
Classify every human checkpoint so the loop knows continue vs halt:
| Tier | Type | Loop behavior |
|---|---|---|
| 1 | Deterministic (schema, dedup, length — code-checkable) | Agent self-checks; no human |
| 2 | Subjective-blocking (must be right before send) | LLM-judge gates; escalate only on fail |
| 3 | Subjective-advisory (taste, angle, offer) | Human reviews; agent proceeds with a flag |
Run autonomously through tiers 1–2; humans touch only tier 3. [#92]
Same split for compliance: code-detectable → deterministic post-processing; taste-based → prompting. Don't confuse them. [#101]
- Evidence (2026-10-11): the LLM judges meaning only from declared named fields; code owns dates, counting, matching and tier math. Every question keeps an escape answer (unknown, unclear, not_stated) so the model never infers missing facts. [#2018]

## 2. Self-grading eval gate
Before any human touchpoint the orchestrator runs a 3-gate LLM-judge on its own output: (1) is it broken? (2) did it follow instructions? (3) is it actually good? Loop on fail. A parallel cost-cap skill halts at a budget wall — the agent returns only to approve something good or because it hit the wall. [#89]
**Counter-view (2026-10-11):** a writer model checking its own draft shares its blind spots. Use separate post-draft critic agents, one per question (AI-sounding, voice, facts), or cross-model review (Claude vs Codex, #1986); a prompt is a suggestion, not a gate. [#1717]
**Goals + loops** (Jordan Crawford): a *goal* = an achievable yes/no check ("do this until Haiku says the goal is met"); a *loop* monitors progress, rewrites its own instructions, and self-kills if stalled. Use for enrichment/validation (e.g. multi-source company verification), no babysitting. [#106]
- Evidence (2026-10-11): self-stopping prompt-tuning loop: the model rewrites the prompt and re-runs the eval set until 2 consecutive clean rounds pass, then stops; used for ICP scoring and custom variables with no human prompt engineering (Eric Nowoslawski). [#323]

## 3. The 10-80-10 split
Humans own the first 10% (ICP, angle) + the last 10% (quality review); AI runs the 80% between (research, drafts, follow-ups). Where to spend human judgment vs automation. [#64]

## 4. Execution layer before intent layer
Encode execution primitives (nodes, context graph, what makes a campaign make/break) MANUALLY first. Only move to intent-layer instructions ("hypothesize angles, infer signals") after the patterns are validated. Leaping to the higher abstraction before understanding make/break patterns is the default mistake. [#99]

## 5. Prompt & context architecture
- **Composable prompts, not monoliths.** Split by the axis each part controls — universal rules / brand voice / sequence shape — stitched at runtime. (A 15,157-char cold-email prompt → composable files.) Swap one layer without breaking others. [#91]
- **Route-and-distill, not load-everything.** Sparse context → bottleneck is generation; dense context → bottleneck is routing. Build a **Context Router** (intersect buyer-segments → relevant subset) + **Context Pack Composer** (traverse a reference graph → bundle only relevant fragments). Fixes prompt-dilution at scale. [#93]
- **No-template outbound.** Treat the LLM as a *writer* over a context graph, not smarter variable-fill. Bottleneck moves from copy → context strategy. [#100]
- **Distill to 10% signal.** Prompt: *"if I had to erase 90% and double down on only 10%, what actionable things would a {{title}} want to do with this information?"* Forces information hierarchy in reports/ICP analyses. [#105]

## 6. Skill design — UX for Claude Code Skills at org scale
Minimize Skill count · route via one entry-point Skill · `manifest.json` for long-running agents · deterministic steps as code (not prose) · treat Skills as functions with explicit arguments. Targets discoverability, hallucination, cognitive load. [#103]
- Evidence (2026-10-11): a rule in a prompt holds most of the time; a rule in a Claude Code hook holds every time. Move hard constraints (no send without approval, banned words, enrichment budget cap per run, block sends to any domain already in an open sequence) into hooks that block, fix or ask (ColdIQ). [#1881, #743]

## 7. Bootstrapping a context repo
Parallel-scrape public sources → seed repo → analyze sales calls one-by-one (HITL) → **threshold-gated** updates (a context earns its file only after N occurrences) → generate sequence permutations → prod. Empirically grounded, not assumption-based. [#96]

## 8. Identity as a join entity (agent data modeling)
Most "bad data" is bad *identity*. Model person↔company as a JOIN row: LinkedIn URN = person id; work email = id for the *job* row, NOT the person. Tracks a champion across job changes without data loss. [#98]

## 9. Brief the agent: voice-note → Goal Mode
Per task, record a ~30-min note defining (a) the task, (b) what good looks like, (c) the done-state, before handing to an agent (Codex Goal Mode / Claude Code). The explicit done-state is what makes unattended multi-task runs reliable. [#75]

## 10. Post-discovery agent stack
5 modular post-call agents, ~30 min saved/call: SPICED Analyzer · ICP Scorer · Follow-Up Writer · GTM Ideator · Account Brief. [#62]

## Agent operations and governance (creator-radar 2026-10-11)

### Model routing and cost
- **Route each step to the cheapest tier that holds:** script > rule > Haiku > Sonnet > Opus > human. Rate every step by openness (deterministic vs judgment) and error blast radius; deterministic steps become scripts ($0 suppression), push up only for open-ended steps whose errors propagate downstream (ColdIQ). [#863, #864]
- **Frontier plans, cheap model executes:** Claude/Codex drafts, self-evaluates and tunes the prompt on ~10 sample rows, then the frozen prompt runs at scale on a cheap model (Gemma class), ~90% cost cut (Eric Nowoslawski). Same Cursor task: $1,339 planner-worker vs $10,565 frontier-only. Reserve frontier judgment for segmentation, pricing and qualification design. [#322, #1909]
- **Pick models by replaying real past jobs** across models with a mid-tier AI judge, not public benchmarks; measure human interactions per output to see whether a human is still the rate limiter. [#2045]
- **Test consistency, not just accuracy:** same prompt, same input, 5 runs per model, compare variance. A model that flips labels breaks downstream routing silently. [#1607]
- **Cost control:** smallest capable model (40-85% saved via routing), caching (up to 90% cheaper), hard caps not alerts, trimmed context. One loop burned $47,000 in 11 days. Every prod agent needs a budget, stop rule, escalation path, audit trail and owner. [#1997]

### Permissions and write gates
- **Gates before tools:** free = research, draft, score; confirm once = send, publish; confirm twice = DNS, delete, spend. Same principle as the Sending Gate (`clusters/enrichment/tasks/design-sending-gate.md`). [#1655]
- **Enforce permissions below the prompt:** access bound to the skill, read never implies write, model-written code runs in a sandbox. An environment where the agent cannot touch data beats telling it not to. [#1686]
- **Read-only CRM key by default;** the write key lives in a separate ENV file that needs double confirmation before any write. Prevents mass CRM corruption from enrichment runs. [#1631]
- **CRM write gate:** verify identity, capture before/after state, attach evidence, get approval, check concurrency, ensure idempotency, verify after write. Pair with autonomy earned through acceptance rate. [#1980]
- **Dry-run before spend (Snitcher MCP pattern):** the tool quotes credit cost before spending, and anything that writes, spends or deletes supports dry-run first. [#1765]
- **Deal stages are not agent territory:** never let an agent move a deal to closed-lost; auto close-won only on contract signature, never on conversational signals (backs `swan-campaign-ops.md`: a meeting outcome never sets a trial stage). [#1874]
- **One brain file per agent** with a lane roster and routing rule: if a request belongs to another lane, name that lane and stop. Prevents one overconfident do-everything agent. [#1656]

### Evals, review and prompting
- **Reviewer shows its work:** the flagged phrase and original vs fix side by side (no silent passes); each human rejection of a flag is written into the rubric as a permanent exception. [#1718]
- **Cite or it does not ship:** every transcript-audit finding cites a quote or timestamp, which makes rubrics checkable and kills invented findings (backs BANT-on-transcript-evidence in `swan-campaign-ops.md`; Zime's 41 MIT-licensed skills are forkable). [#1659]
- **Version-control prompts and scoring skills:** branch a change, rerun last week's calls, merge only if better; a nightly Action updates deal notes and commit history explains why scoring changed. [#1942]
- **Two-stage classifier:** broad cheap filter, eyeball 50 random rows before the full run, then deeper scoring; rows under 0.6 confidence go to a Borderline tab for review. [#2019]
- **Max ~3 hard rules per prompt:** 12 of 15 tested models could not hold more than 3; at 8 rules all were met only 5.7% of the time. Draft first, then revise checking one rule at a time. [#2060]
- **Neutral judge prompts:** tag questions ("X is better, right?") make models agree (Cornell Tech, 45 models; one-word endings flip answers). [#2061]
- **State the goal, drop few-shot examples:** one test rose from 74% to 83.8% after deleting them; "think step by step" lost to question plus short role. Single source, re-test on your task. [#2062]

### Learning loops and earned autonomy
- **Earn autonomy with data:** track sent-without-edit rate and reply rate on drafts; CSM edits and dismissed signals feed back into the agent. Automate a draft type only once the unedited-send rate is high. [#1738]
- **Edit-diff learning loop:** capture the diff between the agent draft and what the SDR actually sent (e.g. via Slack) as the training signal; the rep is never asked for feedback (Kramer). [#1643]
- **Own the rep-facing UI** and log clicks, skips, dwell and edits; feed non-actions back so the agent sharpens. Leading behaviour signal vs lagging CRM fields. [#2034]
- **Untouched Lead framework:** give an agent only the leads no human worked (score 1-2, ~75% of volume at Salesforce). No rep collisions; judge on qualified pipeline that did not exist before. [#1898]
- **Onboard an agent by demonstration:** let it record you doing the task (computer use), then convert the recording into a skill. Captures tacit steps and covers tools with no reliable API. [#1734]
- **Skill discovery:** point Claude at the last 30 days of Claude Code sessions or chat history and ask which workflows you keep rebuilding; package the most repeated first. [#1729]

### Context, handoffs and the skill library
- **Owned, versioned context:** each context file has an owner who reviews changes and cuts versioned releases; downstream work declares DEPENDS_ON a release so the system flags work gone stale after an upstream change. [#1882]
- **Handoff packet:** DECISION, WHY, VERIFIED (facts with sources), INFERRED (judgments with evidence), UNKNOWN, RISKS, and a complete NEXT PROMPT that works in a fresh session. [#1654]
- **Multi-agent mailbox:** a shared folder between agents and one writer per file (one agent pulls data, the other scores and delivers). No overwrites, no human clipboard. [#1988]
- **Normalize all customer conversations** (calls, emails, Slack, notes) into interactions + utterances tables; run LLMs on segments cheaply and cite quote+timestamp for every CRM field the agent writes. [#1418]
- **Keep session history:** Claude Code deletes local transcripts after 30 days by default (`cleanupPeriodDays`); raise retention and back up Claude and Codex sessions nightly so learning loops and audits keep their history. [#1989]
- **Skills that maintain the skill library:** build, review with evals, publish, dupe-check, update-from-session, scheduled maintenance, repo stats; plus a monthly context refresh that pings each doc owner in Slack. [#1921]
- **Local first, shared later:** leave one-person builds local; promote to a shared agent only when the use case is big enough and it is easy to use, model-agnostic, traceable and self-improving. Stops orphaned agents when the builder leaves. [#1645]

### Measurement and scheduled jobs
- **Diagnose trusted metrics, never invent new ones:** a net-new metric in an AI report reads as a black box and sinks trust in the whole report. [#1664]
- **Score each AI workflow on five numbers:** adoption, quality, workflow change, operating result, economics net of AI cost. Licences and prompt counts are vanity. [#1679]
- **Cap scheduled AI jobs:** each needs a named owner, a standing meeting slot and a set action or it is killed (BackEngine went from ~200 to ~10). [#2030]
- **Trigger on business events, not a clock** (20 new calls, deal grade change, meeting without follow-up); clock-only summaries become a newsletter nobody reads. [#2032]


## Sources
creator-radar capture 2026-06. Joe Rhew (The Workflow Co): #89 #91 #92 #93 #95 #96 #97 #98 #99 #100 #101 #103 · Alex Vacca (ColdIQ): #62 #64 · Jordan Crawford (Blueprint): #105 #106 · Eric Nowoslawski (Growth Engine X): #75. Full post URLs in creator-radar Supabase by card id.
