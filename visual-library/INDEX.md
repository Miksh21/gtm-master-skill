# Visual Library: Agent-Readable Workflow Diagrams

18 GTM workflow diagrams as Mermaid markdown files. Each file captures a complete workflow: steps as nodes, tools at each step, routing logic between stages, plus detail notes for anything that does not fit a diagram (matrices, component lists, per-stage tool stacks).

## How to use

When a knowledge file references a diagram (`visual-library/<name>.md`), Read that file. Every diagram is plain text: Mermaid flowcharts and mindmaps that can be rendered, quoted in deliverables, or reused as a template when designing a new workflow that should follow the same pattern.

---

## Index by category

### Master architectural diagrams (cross-cluster)

| Diagram | What it shows | Cluster link |
|---|---|---|
| [`the-signal-playbook.md`](the-signal-playbook.md) | Radial 3-ring signal taxonomy: 1st/2nd/3rd party signals with 24 signal types mapped to detection tools | `clusters/signals/knowledge/signal-activation-architecture.md` |
| [`gtm-flywheel-playbook.md`](gtm-flywheel-playbook.md) | Full 6-stage GTM flywheel: Traffic Generation (Content/Ads/Outbound/Partnerships with tools per channel) → Lead Capturing → Lead Nurturing (10 approaches) → Conversion → Sales Process → Closed Won | `clusters/campaign-ops/knowledge/abm-operating-system-2026.md` |
| [`icp-modeling-guide.md`](icp-modeling-guide.md) | ICP modeling flow with backtest loops: CRM → Closed Won + Closed Lost analysis → firmographic/technographic data → ICP Report → Scoring Model → Tier 1/2/3 → ICP Model, refine until wins cluster in Tier 1 | `clusters/icp/tasks/build-icp.md` |
| [`complete-outbound-playbook.md`](complete-outbound-playbook.md) | 4-channel outbound architecture: Cold Calling + LinkedIn Automated + LinkedIn Manual + Email Campaigns, with full tool stacks, signals layer, and missed-opportunities recycling | `clusters/campaign-ops/knowledge/outbound-master-system.md` |
| [`inbound-orchestration.md`](inbound-orchestration.md) | Inbound zero-leakage pipeline: form capture → qualification routing → enrichment → CRM/Slack approval → pre-frame emails → meeting prep | `clusters/campaign-ops/knowledge/inbound-orchestration.md` |

### Signal-class workflow diagrams (engagement-on-external-content)

The 5 diagrams below share one skeleton (signal capture → aggregation in Clay → enrichment → AI qualification → tier scoring → tiered routing) with a different signal source at the top. Per-file deviations from the skeleton are noted inside each file.

| Diagram | Signal source |
|---|---|
| [`the-customer-alumni-play.md`](the-customer-alumni-play.md) | Closed Won accounts → find past employees in Clay |
| [`the-founder-connections-playbook.md`](the-founder-connections-playbook.md) | Exported founder LinkedIn connections |
| [`linkedin-brand-mentions-outbound-playbook.md`](linkedin-brand-mentions-outbound-playbook.md) | LinkedIn posts mentioning brand keywords + their engagers |
| [`scrape-influencers-linkedin-engagement-playbook.md`](scrape-influencers-linkedin-engagement-playbook.md) | Influencer post engagement + influencer connections |
| [`track-your-employees-linkedin-engagement-playbook.md`](track-your-employees-linkedin-engagement-playbook.md) | Connections + impressions + engagement across all employee LinkedIn accounts |

All five operationalize the pattern documented in `clusters/signals/knowledge/engagement-on-external-content.md`.

### Specialized workflow diagrams

| Diagram | What it shows | Cluster |
|---|---|---|
| [`outbound-attribution-playbook.md`](outbound-attribution-playbook.md) | Traditional tracking (85% missed attribution) vs complete attribution workflow: OutboundSync + Instantly + HeyReach → HubSpot + Slack with reply and sign-up checkpoints | `clusters/campaign-ops/knowledge/outbound-attribution.md` |
| [`website-visitor-de-anonymization-outbound-playbook.md`](website-visitor-de-anonymization-outbound-playbook.md) | Website visitors → company + contact identification (Warmly) → enrichment (Clay) → scoring (ChatGPT) → tiered outreach | `clusters/enrichment/knowledge/templates/website-deanon-clay-template.md` |
| [`awareness-scoring-playbook.md`](awareness-scoring-playbook.md) | Awareness-stage matrix: companies × stage criteria with OR-condition semantics, recency windows, and the supporting tool stack | `clusters/lead-scoring/knowledge/awareness-stage-model.md` |
| [`linkedin-social-selling-playbook.md`](linkedin-social-selling-playbook.md) | LinkedIn funnel: Audience Building → Warming → TOFU (70%) → MOFU (20%) → BOFU (10%) → Capture → Conversion, with tactics per stage | `linkedin-content` skill |
| [`human-in-the-loop-content-operating-system.md`](human-in-the-loop-content-operating-system.md) | Human + AI content workflow at 100+ pieces/month: ideas → drafts → development → management → distribution → analytics | Content ops (not GTM-master core) |
| [`data-trained-ai-content-engine-playbook.md`](data-trained-ai-content-engine-playbook.md) | AI content engine: scrape top-performing creator posts → clean → analyze → build a trained content engine | Content ops (not GTM-master core) |
| [`vibe-coding-playbook-for-gtm-app-building.md`](vibe-coding-playbook-for-gtm-app-building.md) | Internal GTM tools without code: idea → spec → reference material → prompt engineering → MVP build → version control → AI-assisted iteration | Engineering reference |

### Reference cards (not workflow diagrams)

| Diagram | What it shows | Cluster |
|---|---|---|
| [`the-cold-outreach-message-playbook.md`](the-cold-outreach-message-playbook.md) | Modular cold-outreach message framework: First Line (3 types) + Body (11 components) + CTA (4 types) + optional PS, with selection rules | `clusters/cold-email/knowledge/copywriting-frameworks.md` |

---

## The shared signal-workflow skeleton

```
SOURCE SIGNAL (top)
    ↓
Aggregation in Clay (one row per signal)
    ↓
Enrichment (Clay + Findymail + BetterContact)
    ↓
AI Qualification
    ↓
Tier Scoring (formula)
    ↓
Tiered routing at the bottom:
   ┌─ Tier 1 ─→ Cold call + manual LinkedIn + Slack alert (C-level sender)
   └─ Tier 2/3 ─→ Automated email + LinkedIn sequences (AE sender)
```

The signal-class diagrams all follow this pattern; the source signal at the top is what varies. Some variants merge Tier 2 and Tier 3 into one branch differentiated by sender profile; per-file notes flag this.
