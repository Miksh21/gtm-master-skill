# n8n + Claude Code Workflows for GTM

## When to load
Building GTM automations that pair **n8n** (orchestration/cron/webhooks) with **Claude Code / LLMs** (reasoning). Reply-ops, enrichment chains, classifier pipelines. Complements `reference/claude-code-gtm-architecture.md` (CC-only stack) and `reference/2026-tool-stack-and-mcps.md`.

## ColdIQ's 13 n8n+CC workflows ($7M ARR agency) [#53]
Public, copyable. Notable architectures:
- **GTM Flywheel** — `domain in → ICP + strategy` chaining 3 Claude calls (domain → ICP → strategy). Compound automation, not single-shot.
- **Phone waterfall** (Prospeo → FullEnrich → …), **email waterfall**, **lookalike finder**, **AI reply classifier**, **sentiment tracker**.
- Stack referenced: Prospeo, FullEnrich, PredictLeads, Instantly, lemlist.
Use as ready node-graph templates rather than building from scratch.

## Reply-ops stack [#38]
End-to-end inbound-reply handling at ~10k outbound/mo:
```
n8n webhook (ESP reply) → Supabase/Clay (store) → frontier-model sentiment (4 tags)
   → interactive Slack buttons (human action) → OOO auto-re-enroll
```
- **4-tag sentiment taxonomy** drives routing; a 5% mis-tag rate has real revenue impact → keep a human-confirm button rather than full auto.
- **OOO auto-re-enroll** and **Slack action buttons** are the reusable ops primitives.

## HubSpot CLI + Claude Code [#33]
The HubSpot CLI + Claude Code auto-wires complex multi-node workflows from client docs + CRM context — ~80% of RevOps admin (properties, segments, workflows) drops from hours to minutes. Shifts the valuable skill to strategy. Use for client onboarding / RevOps delivery at scale.

## Sources
creator-radar 2026-06. Michel Lieben (ColdIQ): #53 · Dan Rosenthal (Workflows.io): #33 #38. Full URLs in creator-radar Supabase by card id.
