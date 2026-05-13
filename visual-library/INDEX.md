# Visual Library — Workflow Diagrams

18 workflow diagrams extracted from Workflows.io playbook PDFs. Each diagram visualizes a complete GTM workflow with tools at each node and the routing logic between stages.

These diagrams are **referenced by name from cluster knowledge files** when a visual is more useful than prose. Load the PNG directly with the Read tool to see the diagram in vision.

## How to use

When a knowledge file references "(see diagram: `visual-library/X.png`)", that's a workflow diagram you can vision-read. The diagrams are dense — they show:
- Workflow steps as nodes
- Tools at each step (small icons)
- Routing logic (branches → Tier 1 / Tier 2 / Tier 3)
- Data flow direction (arrows)

Use them when explaining a workflow architecture to someone visually, or when designing a new workflow that should follow the same pattern.

---

## Index by category

### Master architectural diagrams (cross-cluster)

| Diagram | What it shows | Cluster link |
|---|---|---|
| [`the-signal-playbook.png`](the-signal-playbook.png) | **RADIAL 3-ring signal taxonomy** — 1st/2nd/3rd party signals as concentric rings, with 16+ specific signal types around the perimeter (Funding Announcements, Search Analytics, Web Data, LinkedIn Engagement, Marketing Events, CRM Data, Webinar Attendance, Outreach Replies, Website Visitor, Product Usage, Warm Intros, Champion Tracking, Social Signals, Review Sites, Job Openings, etc.) | `clusters/signals/knowledge/signal-activation-architecture.md` |
| [`gtm-flywheel-playbook.png`](gtm-flywheel-playbook.png) | **Full 6-stage GTM flywheel infographic** — vertical swim-lane: Traffic Generation (Content/Ads/Outbound/Partnerships with full tool icons per channel) → Lead Capturing (Social Followers / Engagement / Lead Magnets / Landing Pages) → Lead Nurturing (10+ approaches inc. SDR Touchpoints / Retargeting / Newsletter / Community / Webinar / Dinner Invites / In-Person / Email Flows / Gifts) → Conversion (Website demos / testimonials / case studies / product marketing) → Qualification → Retention/Expansion | `clusters/campaign-ops/knowledge/abm-operating-system-2026.md` |
| [`icp-modeling-guide.png`](icp-modeling-guide.png) | **ICP modeling flow with backtest loops** — CRM (HubSpot/Salesforce/Attio) → Closed Won (analyze highest spend / interview AEs+CSMs) + Closed Lost (look for commonalities) → Find firmographic + technographic data → ICP Report → Scoring Model → Tier 1/2/3 → ICP Model. **Backtest loops drawn on both sides** (refine until wins cluster in Tier 1, losses in Tier 3). | `clusters/icp/tasks/build-icp.md` |
| [`complete-outbound-playbook.png`](complete-outbound-playbook.png) | **4-channel outbound architecture** — Cold Calling + LinkedIn Automated Outreach + LinkedIn Manual Prospecting + Email Campaigns, each with tool icons, branching into specific tactics (warmup, sequences, signal-based plays). | `clusters/campaign-ops/knowledge/outbound-master-system.md` |
| [`inbound-orchestration.png`](inbound-orchestration.png) | **Inbound zero-leakage pipeline** — complex multi-branch tree showing form capture → qualification routing → enrichment waterfall → CRM/Slack alerts → meeting prep flow. | `clusters/campaign-ops/knowledge/inbound-orchestration.md` |

### Signal-class workflow diagrams (engagement-on-external-content)

The 5 diagrams below share the same skeleton (signal capture → enrichment → AI qualification → tier-score → Tier 1/2/3 routing) but with different signal sources at the top.

| Diagram | Signal source |
|---|---|
| [`the-customer-alumni-play.png`](the-customer-alumni-play.png) | Closed Won Accounts → Find past employees in Clay |
| [`the-founder-connections-playbook.png`](the-founder-connections-playbook.png) | Export Founder LinkedIn Connections |
| [`linkedin-brand-mentions-outbound-playbook.png`](linkedin-brand-mentions-outbound-playbook.png) | LinkedIn posts mentioning brand keywords |
| [`scrape-influencers-linkedin-engagement-playbook.png`](scrape-influencers-linkedin-engagement-playbook.png) | Influencer post engagement + influencer connections |
| [`track-your-employees-linkedin-engagement-playbook.png`](track-your-employees-linkedin-engagement-playbook.png) | Connections + Impressions + Engagement across all employee LinkedIn accounts |

All five operationalize the same pattern documented in `clusters/signals/knowledge/engagement-on-external-content.md`. **The canonical 5-element routing footer is visible in all of them: Cold Calling / Manual Outreach / Auto Email+LinkedIn / Auto Email Only / Slack alert.**

### Specialized workflow diagrams

| Diagram | What it shows | Cluster |
|---|---|---|
| [`outbound-attribution-playbook.png`](outbound-attribution-playbook.png) | **Traditional Tracking vs Complete Attribution Workflow** — top half shows the broken "85% Missed Attribution" pattern; bottom half shows the OutboundSync + Instantly + HeyReach → HubSpot + Slack architecture with `Outbound Campaign` and `Sign Up` checkpoints. | `clusters/campaign-ops/knowledge/outbound-attribution.md` |
| [`website-visitor-de-anonymization-outbound-playbook.png`](website-visitor-de-anonymization-outbound-playbook.png) | **Website deanon outbound workflow** — Website Visitors → Company-Level + Contact-Level ID (Warmly) → Data Enrichment (Clay) → Lead Scoring + Qualification (ChatGPT) → Tier 1 (Slack Notification + Find more people + Cold Calling + Auto Email+LinkedIn) / Tier 2&3 (Auto Email Outreach). | `clusters/enrichment/knowledge/templates/website-deanon-clay-template.md` |
| [`awareness-scoring-playbook.png`](awareness-scoring-playbook.png) | **Awareness Stages matrix** — companies listed on left axis (Clay, Parabola, Userpilot, etc.) × 5 stages on top (Identified → Aware → Interested → Considering → Selecting) with specific signal criteria per cell. | `clusters/lead-scoring/knowledge/awareness-stage-model.md` |
| [`linkedin-social-selling-playbook.png`](linkedin-social-selling-playbook.png) | **LinkedIn 7-step funnel** — Audience Building → Warming → TOFU → MOFU → BOFU → Capture → Conversion → Retention. Each row shows specific tactics + tools. | `linkedin-content` skill |
| [`human-in-the-loop-content-operating-system.png`](human-in-the-loop-content-operating-system.png) | **Human + AI Content Workflow** — Content Ideas → Content Drafts → Content Development → Content Management → Distribution → Analytics. Shows where humans + AI each contribute. | Content ops (not GTM-master core) |
| [`data-trained-ai-content-engine-playbook.png`](data-trained-ai-content-engine-playbook.png) | **AI Content Engine** — Pick top niche creators → scrape posts → clean → analyze → build Custom AI Content Engine trained on real high-performing posts. | Content ops (not GTM-master core) |
| [`vibe-coding-playbook-for-gtm-app-building.png`](vibe-coding-playbook-for-gtm-app-building.png) | **Build internal GTM tools without code** — vertical workflow: GTM App Idea → Define App Spec → Reference Material → Prompt Engineering → Lovable (Build MVP) → Version Control → AI-assisted iteration (Cursor/Claude Code) → Internal GTM App ready. | (Not GTM-master core — engineering reference) |

### Reference cards (not workflow diagrams)

| Diagram | What it shows | Cluster |
|---|---|---|
| [`the-cold-outreach-message-playbook.png`](the-cold-outreach-message-playbook.png) | **Cold Outreach Components reference card** — visual menu of the modular framework: First Line (3 types) + Body (11 components) + CTA (4 types) + PS (optional). Useful as a copy-pastable visual cheatsheet. | `clusters/cold-email/knowledge/copywriting-frameworks.md` |

---

## Common visual patterns to recognize

When you see a Workflows.io workflow diagram, the standard structure is:

```
SOURCE SIGNAL (top)
    ↓
Aggregation in Clay (one row per signal)
    ↓
Enrichment (Clay + Findymail + BetterContact)
    ↓
AI Qualification (Clay "Use AI" + ChatGPT)
    ↓
Tier Scoring (formula)
    ↓
3-way fork at the bottom:
   ┌─ Tier 1 ─→ Cold Call (BetterContact) + Manual LinkedIn (HeyReach) + Slack alert
   ├─ Tier 2 ─→ Auto Email (Instantly) + Auto LinkedIn (HeyReach)
   └─ Tier 3 ─→ Auto Email only (Instantly)
```

The signal-class diagrams (5 of them) all follow this pattern; the source signal at the top is what varies.

## Source

PNGs extracted from PDF playbooks at workflows.io via `pdftoppm -r 150`. Source PDFs: see `~/workflows-io-extraction-2026-05-13.md` for the full URL list. 2026-05-13 crawl.

Diagram resolution: 150 DPI — readable at full screen, sufficient to see tool icons and node labels.
