# gtm-master

A GTM engineering operating system for Claude Code. Single source of truth for B2B outbound work: cold email, buying signals, list building, Clay enrichment, ICP, personas, lead scoring, objection handling, multi-channel sequences, and campaign ops.

**10 clusters · 40 runnable tasks · 70+ knowledge files · 8 architectural references · 18 Mermaid workflow diagrams.** Continuously updated (last sync: 2026-07-07).

Built for **Claude Code** (filesystem skill), also usable in **Claude.ai** (Settings → Skills upload) and via the **Claude API** (Files API).

## Structure

```
gtm-master/
├── SKILL.md                    Master router (always loaded)
├── philosophy.md               GTM fundamentals: BIPSY, multi-channel mindsets, benchmarks
├── reference/                  8 architectural references (see below)
├── visual-library/             18 agent-readable Mermaid diagrams (signal taxonomy, GTM flywheel, ABM OS...)
├── clusters/
│   ├── cold-email/             8 tasks · copywriting frameworks, deliverability, infra
│   ├── signals/                4 tasks · signal taxonomy, scoring, activation architecture
│   ├── list-building/          2 tasks · Sales Nav, data sources, ABM account selection
│   ├── enrichment/             5 tasks · end-to-end Clay workflow building
│   │   └── clay-engineer/      6 phases + platform mechanics + 13 provider docs
│   ├── icp/                    2 tasks · ICP build with backtest validation
│   ├── personas/               1 task  · buying committee, JTBD, per-role messaging
│   ├── lead-scoring/           1 task  · scoring + awareness-stage model
│   ├── objections/             1 task  · objection playbooks
│   ├── sequences/              2 tasks · multi-channel + LinkedIn, tiered routing
│   └── campaign-ops/           14 tasks · TAM, hypothesis matrices, audits, reporting
└── shared/                     Cross-cluster references
```

Each cluster has:
- `tasks/` runnable recipes (~50-100 lines each, lazy-loaded)
- `knowledge/` deep references (loaded only when a task points there)
- `reference/` quick lookups (tool comparisons, benchmarks)

## How routing works

`SKILL.md` is the always-loaded entry point. When a GTM request comes in, Claude:

0. For strategy requests, diagnoses the funnel bottleneck first (Demand Gen → Capture → Conversion → Closing; fix the slowest machine) via `reference/funnel-bottleneck-diagnosis.md`
1. Matches the request to a cluster via the cluster index
2. Picks the right `tasks/<name>.md` from that cluster's routing table
3. Loads that file (~2-3K tokens), not the full cluster
4. Follows the task's pointers into `knowledge/` only when depth is needed

**Token cost:** router ~8K tokens always loaded. Typical chain (router + task) ~10K. Worst case (router + task + knowledge) ~22K.

## Architectural references

The `reference/` directory holds the strategic layer:

- `claude-code-gtm-architecture.md` · the 4-layer operating model (input → rules → skills → memory), 7-gate qualification, feedback loops, and the code-based GTM infra stack
- `gtm-engineer-role.md` · what one GTM Engineer replaces and how to hire one
- `funnel-bottleneck-diagnosis.md` · the 4-machine factory model for routing strategy work
- `2026-tool-stack-and-mcps.md` · current tool stack + 8 sales MCPs for Claude Code
- `case-studies-and-benchmarks.md` · published campaign results with defensible numbers
- `coldiq-skills-directory.md` · 196 GTM skills for Claude Code, ranked
- `aeo-and-ai-buyer-discovery.md` · answer-engine optimization for AI-mediated buying
- `lemlist-dynamic-personalization.md` · Liquid conditionals, per-sender personalization rules

## How it stays current

A weekly creator-radar pipeline scrapes 20 GTM practitioners, extracts insight cards, and merges human-approved cards into the relevant cluster knowledge files (`creator-radar-*.md` files carry the per-cluster deltas). Field patterns from real engagements are folded back into tasks and references as they prove out.

## Installation

### Claude Code (filesystem)

```bash
git clone https://github.com/Miksh21/gtm-master-skill.git ~/.agents/skills/gtm-master
ln -s ../../.agents/skills/gtm-master ~/.claude/skills/gtm-master
```

### Claude.ai (web app)

```bash
zip -r gtm-master.zip . -x '.git/*'
```

Upload in Claude.ai → Settings → Capabilities → Skills.

### Claude API

Upload via Files API; reference in the `tools` parameter as a Skills resource.

## Source materials

Consolidates and extends:
- Custom skills built across real engagements (signal-sourcer, list-building, clay, cold-email)
- [Growth.Band Outbound Skills](https://github.com/ilya-a11y/growthband-outbound-skills) · 30 outbound skills
- [clay-engineer](https://github.com/mariosworkflows/clay-engineer) (MIT) · imported into `clusters/enrichment/clay-engineer/`: phase orchestration, 13 provider docs, formula syntax, table mechanics, and the 8 Clay global rules (Sending Gate, gates-before-credits, free-before-paid)
- Published GTM playbooks and conference material (2026), synthesized into references, cluster knowledge, and the Mermaid visual library
- Weekly creator-radar insight merges from 20 GTM practitioners

Originals remain unmodified at their source paths.

## Maintenance

- All file references use `{SKILL_BASE}/...` so the structure can move; `SKILL_BASE` resolves dynamically via Glob, no hardcoded paths
- New task: drop a `.md` into `clusters/<x>/tasks/` and add a row to that cluster's routing table in `SKILL.md`
- New cluster: create the directory with tasks/knowledge/reference subdirs, add a section and table to `SKILL.md`
- Re-sync clay-engineer upstream: clone the source repo and copy `phases/`, `providers/`, and platform docs into `clusters/enrichment/clay-engineer/`, then manually re-merge `knowledge/waterfall-enrichment.md` and `knowledge/prompts/claygent-guide.md` if upstream changed

## Author

[Jan Mikeš](https://www.linkedin.com/in/jan-mikes21) · GTM Engineer & RevOps · Prague · me@mikesjan.cz
