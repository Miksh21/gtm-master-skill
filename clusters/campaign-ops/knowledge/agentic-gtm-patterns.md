# Agentic GTM Patterns — Building Self-Running Loops in Claude Code

## When to load
Building GTM workflows that RUN as agents (not one-shot prompts): eval/feedback loops, human-in-the-loop gates, prompt/context architecture, Skill design, agent data modeling. Complements `reference/claude-code-gtm-architecture.md` (the 4-layer OS) with the engineering patterns that make loops reliable. Triggers: "agentic loop", "eval loop", "human in the loop", "context pipeline", "how do I structure Claude Code skills".

## The frontier: eval loops
Agent creates → measures → iterates to a quality threshold → hands the final 5-10% to a human. Cuts human effort 50-75%. The hard part is not generation — it's defining PASS/FAIL, because quality is subjective. [#97]

## 1. Where the loop stops — intervention tiers
Classify every human checkpoint so the loop knows continue vs halt:
| Tier | Type | Loop behavior |
|---|---|---|
| 1 | Deterministic (schema, dedup, length — code-checkable) | Agent self-checks; no human |
| 2 | Subjective-blocking (must be right before send) | LLM-judge gates; escalate only on fail |
| 3 | Subjective-advisory (taste, angle, offer) | Human reviews; agent proceeds with a flag |
Run autonomously through tiers 1–2; humans touch only tier 3. [#92]
Same split for compliance: code-detectable → deterministic post-processing; taste-based → prompting. Don't confuse them. [#101]

## 2. Self-grading eval gate
Before any human touchpoint the orchestrator runs a 3-gate LLM-judge on its own output: (1) is it broken? (2) did it follow instructions? (3) is it actually good? Loop on fail. A parallel cost-cap skill halts at a budget wall — the agent returns only to approve something good or because it hit the wall. [#89]
**Goals + loops** (Jordan Crawford): a *goal* = an achievable yes/no check ("do this until Haiku says the goal is met"); a *loop* monitors progress, rewrites its own instructions, and self-kills if stalled. Use for enrichment/validation (e.g. multi-source company verification), no babysitting. [#106]

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

## 7. Bootstrapping a context repo
Parallel-scrape public sources → seed repo → analyze sales calls one-by-one (HITL) → **threshold-gated** updates (a context earns its file only after N occurrences) → generate sequence permutations → prod. Empirically grounded, not assumption-based. [#96]

## 8. Identity as a join entity (agent data modeling)
Most "bad data" is bad *identity*. Model person↔company as a JOIN row: LinkedIn URN = person id; work email = id for the *job* row, NOT the person. Tracks a champion across job changes without data loss. [#98]

## 9. Brief the agent: voice-note → Goal Mode
Per task, record a ~30-min note defining (a) the task, (b) what good looks like, (c) the done-state, before handing to an agent (Codex Goal Mode / Claude Code). The explicit done-state is what makes unattended multi-task runs reliable. [#75]

## 10. Post-discovery agent stack
5 modular post-call agents, ~30 min saved/call: SPICED Analyzer · ICP Scorer · Follow-Up Writer · GTM Ideator · Account Brief. [#62]

## Sources
creator-radar capture 2026-06. Joe Rhew (The Workflow Co): #89 #91 #92 #93 #95 #96 #97 #98 #99 #100 #101 #103 · Alex Vacca (ColdIQ): #62 #64 · Jordan Crawford (Blueprint): #105 #106 · Eric Nowoslawski (Growth Engine X): #75. Full post URLs in creator-radar Supabase by card id.
