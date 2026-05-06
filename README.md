# gtm-master

Master skill for B2B GTM / outbound work. Single source of truth for cold email, signals, list building, enrichment, ICP, personas, lead scoring, objections, sequences, and campaign ops.

Built for use with **Claude Code** (filesystem skill), **Claude.ai** (Settings → Skills upload), and **Claude API** (Files API).

## Structure

```
gtm-master/
├── SKILL.md                    Master router (always loaded)
├── clusters/
│   ├── cold-email/             Email writing, follow-ups, subject lines, deliverability
│   ├── signals/                Buying signals, intent data, signal scoring
│   ├── list-building/          Sales Nav, ICP search, list hygiene
│   ├── enrichment/             Clay, waterfalls, Claygent
│   ├── icp/                    ICP definition + validation
│   ├── personas/               Buyer personas, JTBD
│   ├── lead-scoring/           Score + prioritize leads
│   ├── objections/             Objection handling
│   ├── sequences/              Multi-channel + LinkedIn sequences
│   └── campaign-ops/           Planning, audits, analytics, ops (13 tasks)
└── shared/                     Cross-cluster references
```

Each cluster has:
- `tasks/` — runnable recipes (~50-100 lines each, lazy-loaded)
- `knowledge/` — deep references (lazy-loaded only when a task points there)
- `reference/` — quick lookups (tool comparisons, benchmarks)

## How auto-routing works

`SKILL.md` is the always-loaded entry point. It contains routing tables for all 10 clusters. When a user asks a GTM question, Claude:
1. Matches the question to a cluster via the cluster index
2. Picks the right `tasks/<name>.md` file from that cluster's table
3. Loads that file (~2-3K tokens) — NOT the full cluster knowledge
4. If the task points to `knowledge/...` for depth, loads that file too

**Token cost:** Master router ~7-8K tokens always-loaded. Best-case full chain (router + task) ~10K tokens. Worst case (router + task + knowledge) ~22K tokens.

## Installation

### Claude Code (filesystem)

```bash
git clone https://github.com/Miksh21/gtm-master-skill.git ~/agents-repos/gtm-master-skill
ln -s ~/agents-repos/gtm-master-skill/gtm-master ~/.claude/skills/gtm-master
```

Or use the `~/.agents/skills/` convention if you have one.

### Claude.ai (web app)

```bash
cd gtm-master
zip -r gtm-master.zip .
```

Upload `gtm-master.zip` in Claude.ai → Settings → Capabilities → Skills.

### Claude API

Upload via Files API; reference in `tools` parameter as a Skills resource.

## Source materials

This skill consolidates content from:
- Custom skills (signal-sourcer, list-building, clay, cold-email)
- [Growth.Band Outbound Skills](https://github.com/ilya-a11y/growthband-outbound-skills) — 30 outbound skills
- Equivalent anthropic-skills:* (intent-signals, lead-prioritization, persona-development, etc.) — content absorbed; the originals can be disabled via settings.json to avoid trigger competition

Originals remain unmodified at their source paths.

## Maintenance

- All file references use `{SKILL_BASE}/clusters/<cluster>/...` so the structure can move
- Setup section uses Glob to dynamically resolve `SKILL_BASE` — no hardcoded paths
- To add a new task: drop a `.md` into the right `clusters/<x>/tasks/` and add a row to that cluster's routing table in `SKILL.md`
- To add a new cluster: create the directory + tasks/knowledge/reference subdirs, add a section + table to `SKILL.md`
