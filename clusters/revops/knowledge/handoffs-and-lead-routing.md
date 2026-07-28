> Source: swan-gtm/gtm-skills (rutger-katz) · MIT · imported 2026-07-28 · external content, unreviewed

# Revenue Handoffs and Lead Routing

Handoffs are where revenue leaks. Standardized handoff protocols improve implementation success ~45% and cut first-year churn 35-40%. Every handoff node needs: an owner, a context packet, an SLA (time + quality), a trigger, and measurement.

The bow tie has four handoff points (five with implementation partners): Marketing → Sales → Partner/Implementation → CS → Sales (expansion), with lifecycle marketing looping back.

## Speed-to-Lead (the evidence)

| Finding | Source |
|---|---|
| 1-minute response: 391% conversion boost | Velocify |
| Within 5 min: 21x more likely to qualify vs 30 min | Oldroyd, MIT Sloan (15,000+ leads) |
| <5 min response: 32% close rate, 2.6x higher than 24+ h | LeanData / Optifai |
| 10-minute hand-raiser SLA: +40% lead-to-opp conversion | Norris, RevOps FM |
| Instant booking: 66.7% conversion vs ~30% average | Chili Piper (4M submissions) |
| Reality: average B2B response 42 hours; 23% never respond | HBR |

Decay is steep in the first 5-10 minutes; the difference between 10 and 30 minutes matters more than between 1 and 4 hours.

Response SLAs by lead type: hand-raisers (demo/pricing) <5 min, bypass scoring entirely; paid ads <3 min; organic inbound <10 min; partner referral <30 min; content/webinar downloads: nurture 3-4 days first, premature outreach damages trust.

## Routing Decision Tree (answer in order)

```
0. Marketing objection / GDPR Art. 21 opt-out?  → no-outreach queue (keep record, zero contact)
1. Known account?          → route to Account Owner (never rotation). Customer contact → CSM. Churned account re-engaging → win-back priority.
2. Matches ICP threshold?  → below: nurture. Above: continue.
3. Which territory?        → geography / industry / size / product interest
4. Which rep?              → round-robin, weighted, skills-based, or load-balanced
5. Rep available?          → yes: assign + notify. No: backup or queue with SLA escalation.
```

## Routing Models

| Model | Best for | Watch out |
|---|---|---|
| Geographic | Field sales with territories | Unbalanced market density |
| Named account | ABM, enterprise | New accounts fall through |
| Round-robin | Inside sales, equal territories | Ignores capacity |
| Weighted round-robin | Mixed-tenure teams | Maintenance |
| Skills-based (product, language, vertical) | Multi-product, multi-lingual | Specialist bottlenecks |
| Load-balanced | High volume | Needs real-time capacity data |
| Hybrid (territory → round-robin within) | Most B2B SaaS | More rules to maintain |

Round-robin mechanics: rotate through the rep list by counter; weighted = expand the rotation list proportionally (senior 3 slots, ramping 1); add availability checks before assignment (OOO skip, daily cap skip, working hours or queue-for-next-business-hour). EU teams: route by language of form submission as a first-pass filter.

Common failures: cherry-picking (route directly to owner, never a shared pick-queue), queue rot (SLA timer + auto-reassignment), uneven distribution (audit counter and filters), new-rep flooding (weight down during ramp), timezone gaps (time-aware or follow-the-sun).

## Speed-to-Lead SLA Framework

| Tier | Definition | First-touch SLA | Escalation |
|---|---|---|---|
| 1 Hot | High fit + high engagement; demo/pricing request | 5 min | 15 min alert manager; 30 min reassign |
| 2 Warm | Good fit + moderate engagement; content download | 1 hour | 2 h alert manager; 4 h reassign |
| 3 Nurture | Low fit or low engagement | 24 hours | 48 h return to marketing, alert ops |

Tracking fields: Routed_At, First_Touched_At, SLA_Minutes (formula), SLA_Status (met/warning/breached), SLA_Tier. Escalation workflow: at threshold with no activity → alert rep; at 2x → alert manager + task; at 4x → reassign to backup, alert RevOps, log SLA_Breached for reporting. Most CRMs lack native speed-to-lead measurement; create the timestamp fields yourself.

Marketing-sales SLA is two-sided: marketing commits qualified volume and pipeline contribution at target coverage; sales commits response within SLA, 5-10 follow-up attempts, and CRM disposition by deadline. Enforce with auto-escalation, 24 h auto-reassignment, weekly compliance reporting.

**Context packet with every routed lead:** firmographics, full engagement history, score breakdown (fit vs intent), buying-group context (other contacts from the account), qualification data if SDR-qualified. Auto-enrich BEFORE routing to eliminate research delay.

Build vs buy: <500 leads/month + simple territories = native CRM automation; 500-5,000 = evaluate a routing tool vs strong CRM admin; >5,000 or complex territories = dedicated tool, justified by speed-to-lead lift × conversion × deal value. Predictive/AI routing (assignment by rep's historical conversion on similar accounts + live capacity) claims ~30% conversion lift vs plain round-robin but requires 90%+ field population; below that, routing misfires on 10%+ of leads. If using AI assignment: log top-3 decision factors per assignment, run monthly fairness audits across reps, track manual overrides, and roll back if SLA compliance drops.

## Sales → Implementation/Onboarding

Customer excitement peaks at signature then collapses if nothing happens.

Context packet (7 elements): deal history and origin; customer goals with MEASURABLE success criteria; full stakeholder map (champion, EB, end users, detractors); every commitment the AE made, explicit and implicit; known risks and internal politics; technical requirements (integrations, migration, compliance); customer timeline with critical events.

SLAs: internal AE → implementation briefing 24-48 h post-signature; customer introduction within the first week; kickoff scheduled 48-72 h post-signing; first implementation meeting 2-7 days. Involvement model by segment: warm overlay (default; AE at kickoff then steps back, CC'd 2 weeks), pre-sale CS (enterprise: CSM joins late-stage calls), clean break (small deals: automated handoff). Partners get the full brief + promises log, the AE attends the partner kickoff, and hypercare (2-4 weeks post go-live) bridges to CS.

## Implementation → CS

Least standardized, most consequential; early value realization within 30 days correlates with higher lifetime value. Packet: scope/configuration, training completion + gaps, outstanding issues with workarounds, customer sentiment during implementation, updated stakeholder map, initial adoption metrics. Go-live readiness = all five true: tasks work end-to-end, people trained, data migrated, support plan in place, rollback plan exists. Start health scoring here, not at steady state: milestone completion, stakeholder engagement, responsiveness, admin login frequency, training attendance.

## CS → Sales (Expansion)

Expansion costs ~$0.27 per $1 ACV vs ~$1.16 for new logos; 50-60% of new ARR at mature SaaS comes from expansion.

**Three expansion types (critical distinction):**

| Type | Buying group | Pipeline | Discovery |
|---|---|---|---|
| Upsell | Same champion, same budget | Short: Identified → Proposal → Won | Qualification refresh |
| Cross-sell (warm) | Partial overlap, champion introduces | Standard stages | Partial new discovery |
| Cross-sell (new buying group) | Completely new group | Full discovery stages | Full new qualification, mandatory |

A cross-sell into a completely new buying group is a new-logo sale inside a known company; trust sits with the account, not the group. Forcing it into the short pipeline poisons win-rate and velocity data. Litmus test: "Would losing the contract in unit A affect closing in unit B?" If no, treat as new logo with a customer-referral source.

Ownership by ACV (define thresholds in governance; ambiguity = nobody closes): small deals CSM closes end-to-end; mid deals AM/AE closes with CSM in the room; large deals AE runs the full cycle, CSM introduces and advises.

Expansion signals: usage (80%+ of seat limits, new feature adoption, rising DAU), relationship (champion promoted, new stakeholder, strong NPS), commercial (headcount growth, new budget cycle, cross-functional interest), outcomes (value ahead of schedule, ROI exceeded, new use cases). Handback flow: CSM flags signal → workflow creates deal → assigns AE → CSM prepares brief (health, usage, stakeholders, whitespace) → joint meeting → clear rules of engagement.

Post-sale lifecycle marketing: onboarding education → adoption content → retention (ROI reports, QBR materials) → expansion (usage-triggered nudges) → advocacy (case studies, reviews). Renewal-focused ABM starts 90-120 days pre-renewal with customer-specific ROI evidence.

## Measurement

| Handoff | Key metrics | Targets |
|---|---|---|
| Marketing → Sales | Speed-to-lead, MQL→SQL conversion, unworked rate | <5 min hand-raisers; 25-35%; <5% unworked |
| Sales → Implementation | Time-to-kickoff, info completeness, quality score | <7 days; >90%; ≥4.0/5 |
| Implementation → CS | Time-to-first-value, go-live rate, onboarding churn | segment-dependent; >85%; <3% |
| CS → Sales | Expansion pipeline from CS, handoff time, expansion win rate, NRR | growing QoQ; <48 h; >40% upsell / >20% new-group; 110%+ |

Leading indicators of failure: unworked leads rising >10% (SDR overload or routing failure); MQL rejection rising (ICP misalignment); time-to-kickoff >14 days (sales-CS bottleneck); onboarding completion declining (capacity/complexity); shrinking CS-sourced expansion pipeline (signals not being surfaced). Quality scorecard: the receiving team rates every handoff 1-5 on information completeness, promise alignment, sentiment continuity, context transfer, stakeholder mapping; review weekly in the operating cadence.

## Quarterly Routing Audit

1. Coverage: any rule that produces no owner? (leads falling through)
2. Balance: distribution within ±10% across same-segment reps?
3. Speed: median and P90 speed-to-lead (target <5 min median Tier 1)?
4. SLA compliance: % touched within SLA (>90%)?
5. Reassignment rate: >15% = routing logic issues.
6. Conversion by routing path: broken paths convert visibly worse.
7. Queue health: zero leads sitting >1 hour.
8. Availability: any uncovered time windows?
