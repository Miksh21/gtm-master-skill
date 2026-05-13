# Tiered Routing Template — The Workflows.io House Style

A signature pattern observed across 10+ workflows.io playbooks. This is the **canonical 3-tier routing** for any signal-qualified contact list: Tier 1 gets multichannel high-touch, Tier 2/3 get automated.

## When to load

- "What's the right way to route Tier 1 vs Tier 2/3 leads?"
- "Set up multichannel outreach from this signal-qualified list"
- "We have an enriched + scored contact list — what's the routing pattern?"
- Designing any post-signal-capture activation flow

---

## The canonical template

```
Tier 1 (Strong fit + high intent):
├─ Email from C-LEVEL profile  → Instantly
├─ LinkedIn from AE profile     → HeyReach
├─ Connection requests from supporting profiles → HeyReach
└─ Slack alert to team

Tier 2 (Good fit + medium intent):
├─ Email automated               → Instantly
└─ LinkedIn automated            → HeyReach

Tier 3 (Lower fit / lower intent):
└─ Email nurture only            → Instantly drip
```

## The variations by signal source

The template is a starting point. Adjust based on signal intensity and prospect's prior familiarity:

### Variation 1 — High-intent on-content engagement (workflow 32)

When the signal is **engagement on YOUR OWN content**, Tier 1 routes to **cold-calling** (not email), because the person already recognizes you — the call interrupts in a warm way.

```
Tier 1 (engaged with own content):
├─ Cold call (BetterContact for phone)
├─ Personal LinkedIn DM from C-LEVEL  → HeyReach
└─ Slack alert
```

### Variation 2 — Website deanon (workflow 37)

When the signal is **a Tier 1 account visiting your website**, the play emphasizes **stakeholder expansion** before outreach (since the deanon often catches a junior employee but the buyer is upstream).

```
Tier 1 deanon visit:
1. Slack immediate alert
2. Expand to decision-makers + champions (Findymail + BetterContact)
3. Multi-channel: cold call + email + LinkedIn
```

### Variation 3 — Inbound signup multi-thread (workflow 22)

When the signal is an **inbound form submission**, Tier 1 = multi-thread the COMPANY, not just the original signup contact:

```
Inbound signup at Tier 1 company:
1. Original contact → personal LinkedIn (HeyReach)
2. Source additional contacts in same company (AI Ark + Clay + Apollo)
3. Engage 2-3 more stakeholders per account
4. Slack alert on any reply
```

### Variation 4 — Customer alumni (workflow 30)

When the signal is **a customer alumni now at a new ICP company**, Tier 1 gets HUMAN-led, not automated, because the warmth is high enough to deserve a personal note (not a sequence):

```
Customer alumni at Tier 1 account:
1. HubSpot task assigned to AE (with full context: prev employer + new role + ICP score reason)
2. AE sends 1:1 LinkedIn DM + email
3. Cold call via BetterContact phone for highest-priority subset
```

---

## Why the template works

### Multi-profile sending = better deliverability + visibility

The "connection requests from supporting profiles" step is what most teams skip. Multiple LinkedIn profiles engaging from the same company creates:
- Higher visibility (multiple notifications)
- Sender deliverability spread (no single profile rate-limited)
- Social proof (prospect sees a *team* engaging, not one person)

### C-level email + AE LinkedIn (not the other way)

The pattern almost always pairs:
- **C-LEVEL profile** sending the EMAIL
- **AE profile** sending the LINKEDIN DM

Why this asymmetry:
- Email from a C-level title has higher open + reply rates (perceived importance)
- LinkedIn DMs from AEs are more authentic (peers reach out on LinkedIn; CEOs reaching out on LinkedIn feels weird unless there's a strong signal)

### Slack alert is non-negotiable

Every Tier 1 routing includes a Slack alert. Why:
- Without it, the sequence is fire-and-forget — replies/responses go to inbox monitoring lag
- Slack alert routes to the specific assigned AE with full context (signal source + score reason + contact details)
- This is the "human-in-the-loop" for high-priority signals

---

## Choosing between Variations

| Signal type | Variation | Why |
|---|---|---|
| Engagement on YOUR content | Variation 1 (cold call Tier 1) | Prospect already recognizes you — warm call lands |
| Website deanon | Variation 2 (stakeholder expansion first) | Deanon often catches wrong-level contact |
| Inbound signup | Variation 3 (multi-thread company) | Signup = company signal, not just contact signal |
| Customer alumni | Variation 4 (1:1 AE-led, not sequence) | Warmth is too high for automated sequence |
| External engagement (competitor follower, influencer engager, brand mention engager) | Canonical template | Standard tiering applies |
| Cold ICP outreach with no signal | Canonical template, but most flow to Tier 2/3 (Tier 1 reserved for signal-qualified) | No signal = no Tier 1 |

---

## Tools

- **Instantly** — email sequencer (multi-mailbox, warmup, deliverability monitoring)
- **HeyReach** — LinkedIn automation (multi-profile DMs, connection requests, follow-ups)
- **BetterContact** — phone waterfall for Tier 1 cold-calling
- **Slack** — Tier 1 alerts (CRM owner → Slack user ID mapping required)
- **HubSpot** (or Salesforce) — task assignment for AE-led Tier 1 motions
- **Lemlist** — appears as alternative to Instantly in one workflows.io playbook; functional equivalent

---

## Slack alert payload (canonical)

When routing alerts on Tier 1 signals, include:
- **Contact name + role** (so AE knows who to follow up with)
- **Company + ICP tier**
- **Signal source + context** (which signal triggered this — "Commented on competitor's pricing post" vs "Pricing page visit 3x in 48h")
- **Reply text** (if this is a reply-routing alert)
- **Recommended next action** (specific, not generic — "Send case study X, follow up in 24h")

Avoid generic "follow up with John Smith." Specificity drives action.

---

## Common failures

- **Treating all signals as Tier 1** — burns the team's bandwidth, no actual prioritization
- **No supporting-profile connection requests** — single LinkedIn profile gets rate-limited; multi-profile spreads load
- **Tier 1 = email only** — ignoring LinkedIn (or vice-versa) misses 30-50% of reachable prospects
- **No Slack alert** — automated routing without human escalation = leads fall through
- **Same copy across tiers** — Tier 1 deserves personalized opener; Tier 2/3 can use modular templates

---

## Cross-references

- Where this fits in the master outbound system: `clusters/campaign-ops/knowledge/outbound-master-system.md` (Step 6-7)
- Per-stage activation (awareness-stage-based routing): `clusters/lead-scoring/knowledge/awareness-stage-model.md`
- Buying committee multi-thread (for inbound signup expansion): `clusters/personas/knowledge/buying-committee-5-roles.md`
- Multi-channel sequence design recipe: `clusters/sequences/tasks/design-multi-channel.md`

## Source

Pattern observed across workflows.io workflows 1, 6, 14, 15, 22, 27, 30, 32, 35, 37, 38 (the "house-style template"). 2026-05-13 crawl. Variations distilled from per-workflow nuances.
