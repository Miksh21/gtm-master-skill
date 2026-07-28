> Source: swan-gtm/gtm-skills (ivan-falco / brianne-thomas) · MIT · imported 2026-07-28 · external content, unreviewed

# Ads x Outbound Interplay: Engagement as Intent Signal

ABM ads are not just demand generation, they are a **signal detection layer**. Run targeted ads to known accounts, track which engage, and you identify intent BEFORE anyone fills a form: ads create awareness -> engagement reveals intent -> intent triggers outbound -> outbound is personalized by WHAT they engaged with. This is inbound-led outbound powered by ad engagement. Signal-based outreach to ad-engaged accounts replies at a meaningful multiple of cold baseline; stacked engagement signals lift it further. Always measure the lift against your own cold baseline.

## The Signal Pipeline

```
LinkedIn Campaign Manager (ads running)
  -> connector (Fibbler/ZenABM: engagement per account per campaign)
  -> CRM company properties (quantitative + qualitative intent)
  -> active lists (accounts segmented by stage + intent)
  -> BDR Slack alert + lead with intent tags
  -> personalized outreach based on what they engaged with
```

Two data types: **quantitative** (impression/engagement/click counts -> stage progression Identified -> Aware -> Interested) and **qualitative** (WHICH campaigns they engaged with -> intent detection + personalization). Qualitative is the gold: an account clicking the "Analytics vs Competitor X" campaign tells the BDR exactly which pain to lead with.

## Campaign Names Encode Intent

Structure campaigns so engagement data reveals intent: campaign group = intent/JTBD, campaign = `[Intent] - [Ad type] - [Stage]` (e.g. "Analytics-Competitor-Switch - Image - Awareness"). When the connector pushes engagement to the CRM, a workflow parses the campaign name: contains "Analytics" -> check Analytics in the ABM Intent multi-checkbox; contains "Competitor-Switch" -> check Competitor Displacement; engaged with multiple intents -> hot multi-need buyer. Properties: `ABM Intent` (multi-checkbox), `Primary Intent` (most-engaged campaign group), `Intent Source` (group generating most clicks). Copy intents from company to associated contacts so BDRs see tags while prospecting.

**LinkedIn API obfuscation:** engagement data is hidden when fewer than 3 members of an account engaged or fewer than 3 total engagements/clicks in the window. Workarounds: group campaigns by intent (not persona) so engagements roll up; use 30/90-day cumulative windows, not 7-day; connectors aggregate at campaign-group level.

## When to Trigger Outreach

**Do not hand off early.** Outreach to Aware-stage accounts feels cold and burns BDR time.

| Stage | BDR action |
|---|---|
| Identified | None |
| Aware (50+ impressions) | None, usually |
| **Interested (5+ clicks OR 10+ engagements)** | **Trigger outreach** |
| Considering (demo/trial) | Priority outreach + sales |
| Selecting (open deal) | AE owns, BDR supports |

**The BDR alert** (Slack, on Interested): company + LinkedIn URL, ICP score + tier, intent tags, click trend ("7 clicks last 30 days, up from 2"), which campaign group, key contacts found (name, title, email), suggested angle, company context. The alert should let the BDR act without opening five tools.

## Personalizing the Outreach

| Intent signal | Opening angle | Content to send |
|---|---|---|
| Competitor-comparison ads | "I noticed your team is evaluating [category]. Here's how we compare to [competitor]" | Comparison one-pager, case study |
| Feature-specific ads | "Given your team's focus on [feature area]" | Feature deep-dive, demo |
| Event/webinar TLAs | "Your colleagues seemed interested in [topic]" | Recording, related content |
| Case-study ads | "Companies like yours in [industry] are seeing [result]" | Full case study, ROI data |
| Multiple intents | "Your team has been exploring [intent 1] and [intent 2]" | Tailored multi-solution pitch |

Email skeleton: subject `[Company] + [product], quick thought on [intent area]`; line 1 references the TOPIC they showed interest in; 1-2 sentences on how you solve exactly that; social proof with a number; soft 15-minute CTA.

**Hard rules:** never say "I saw you clicked our ad", that is creepy; reference the topic, never the channel or tracking; lead with their pain, not the product; keep it short, the ad already warmed them. Multi-touch cadence: personalized email day 1; blank-ish LinkedIn connection day 1-2; LinkedIn message with content day 3-5; different-angle email day 5-7; warm call day 7-10.

## Timeline and Feedback Loop

Weeks 1-4: awareness ads run, NO outbound, let ads warm. Weeks 4-8: accounts hit Interested, alerts fire, personalized outreach begins, ads shift to solution content. Weeks 8-12: Considering accounts emerge, BDR + AE joint motion, ads shift to case studies/ROI. Week 12+: measure pipeline per dollar and which intents produced pipeline.

Feed BDR learnings BACK into ads: recurring pain point in calls -> new campaign group around it; competitor keeps appearing -> displacement campaign; category confusion -> more educational awareness; pricing objections cluster -> ROI-justification content; one persona replies more -> shift budget.

## Signal Quality Measurement

| Metric | Target |
|---|---|
| Reply rate, ABM-warmed vs cold | Measure the lift; meaningfully above cold baseline |
| Meeting book rate vs cold | 2-3x |
| Interested -> demo time | < 14 days |
| Intent prediction accuracy ("yes, that's exactly what we need") | > 60% |

Reading responses: "that's exactly what we need" = detection works. "Never heard of you" = accidental clicks or wrong persona. High engagement, no replies = try a different contact at the account. Multiple people engaging = buying committee forming, excellent.

## CTR-as-Signal: The Daily Loop (brianne-thomas)

A daily automation turning LinkedIn Ads analytics into prioritized, pre-drafted outbound. Premise: a company clicking your ads at an unusually high rate is paying attention RIGHT NOW.

1. **Company-level analytics:** last 7 days pivoted by company: impressions + clicks per company (the raw signal).
2. **Creative-level analytics in parallel:** CTR per creative, rank by clicks, take the top 5 creatives with their headline/intro/theme. This ranked ad-theme context informs every draft (which angles are landing this week). If a creative resolves only to a post reference, infer the theme from the campaign name.
3. **Filter:** CTR = clicks/impressions x 100; keep companies with **CTR >= 2% and impressions > 0** (impressions check kills one-click flukes).
4. **Suppression, checked per company before any draft:** skip if processed in the last 30 days (memory note "Last CTR signal processed: date"), tagged suppress-alerts, a current customer, or in an open deal. Write the processed-timestamp for every company touched OR skipped; the ledger is what keeps tomorrow's run clean.
5. **Draft per company:** research the company, draft outreach whose angle quietly mirrors the currently-winning ad themes. Never reference ads, clicks, tracking, or targeting in the message. **Everything lands as drafts for human review; nothing auto-sends.**

Failure modes to avoid: alerting on flukes (no impressions floor), drafting to customers/open deals, re-drafting daily (no timestamps), and outreach leaning on ad data so hard it reads as surveillance.

## Ads-Side Habits That Feed Outbound

- Sales reaches out within 48 hours of an engagement spike; the message uses the campaign's problem/solution angle without mentioning the ad.
- Weekly engagement report shared with sales; track whether ads+outreach accounts convert above outreach-only.
- Per-company engagement report (company-list campaigns) doubles as a call-prioritization list.
- Profile-visitor play: ads and TLAs trigger profile visits; check visitors daily, send blank connection requests to ICP-fit visitors (acceptance far above cold), nurture via feed, converse after a few touchpoints.
- Suppress ads to accounts in active sales conversations; resume on stall.
- Deals appearing on accounts your ads never touched = coverage gap; add those accounts to the target list.
