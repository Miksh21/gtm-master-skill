# Inbound Orchestration — Zero-Leakage Pipeline

How to wire an inbound form so every submission becomes an enriched, CRM-ready, multi-threaded opportunity within seconds — instead of a junk lead in HubSpot a rep eventually finds three days later.

## When to load

- "Our inbound conversion is bad" (likely orchestration leakage, not lead quality)
- "How do we handle demo requests?"
- "Cal.com / Tally / Webflow form → CRM — what's the right pipeline?"
- Building or auditing the inbound → enrichment → meeting prep loop

## The leakage problem

Inbound forms with 8+ fields = 60% drop-off. Booking happens but with no prep, no enrichment, no warm pre-call touch. Reps walk into discovery cold. The lead's been engaged for 48 hours but the rep just learned about them.

This pipeline collapses the leakage by automating capture → qualify → CRM-create → assign → outreach within seconds, and uses the time between booking and meeting to prep the rep.

---

## The full pipeline (zero-leakage architecture)

```
Form submission → Tally qualification → Cal.com routing (qualified)
                                     → Slack review (email-only)
                                            ↓
Clay enrichment + LinkedIn URL discovery
                                            ↓
HeyReach auto-connection request (warm prospect pre-call)
                                            ↓
Slack lead card (team reviews, no CRM required)
                                            ↓
Approved → Customer.io pre-frame emails + deep enrichment
                                            ↓
BetterContact (phone) + Findymail (email + company) + Claygent (news)
                                            ↓
Claude generates structured prep Google Doc → HubSpot property
                                            ↓
Slack notify rep + deal auto-created in correct pipeline/stage
                                            ↓
Sybill records meeting → transcripts feed sales process
```

---

## The 6 operational layers

### 1. Capture — minimize friction

- **Webflow form captures only 2 fields** (email + one more). Use Tally for the longer qualification form on the next step. Two-field capture maintains conversion rate; deeper data comes from enrichment.
- **Tally application form** auto-qualifies based on rules (job title, company size, etc.).
- **Qualified** → instant Cal.com booking page (no friction between qualification and meeting).
- **Email-only submissions** (no Tally completion) → Slack for manual review + outreach.

### 2. Routing — humans only when humans add value

- Non-booker form completers → automated Customer.io email reminders.
- Booked meetings → Cal.com weighted distribution rules to AEs.
- All contacts (qualified or not) → Clay for enrichment + LinkedIn URL discovery.
- **HeyReach auto-sends LinkedIn connection requests pre-call** — warms the prospect before the rep ever speaks to them. The first impression is a connection request from a person, not a faceless calendar invite.

### 3. Approval (Slack-as-CRM)

- Slack lead-card generated on submission.
- Team reviews **directly in Slack** (no CRM required).
  - This is the operational shortcut. Reps skip enrichment in CRM because CRM is slow; Slack is fast.
- Approved → Customer.io pre-frame emails.
- Rejected → tagged in HubSpot + removed from automations (don't waste enrichment credits).

### 4. Deep enrichment (between booking and meeting)

This is the unlock. The prospect is committed but the rep has time. Run waterfall enrichment:

- **BetterContact** — phone (Tier 1 direct dial)
- **Findymail** — email + company info via API (verified email reduces bounces)
- **Claygent** — recent news, funding, hiring, product updates
- **Claude** — synthesizes all of the above into a structured lead summary → Google Doc prep file

### 5. CRM sync

- Prep GDoc saved as a **HubSpot property** on the deal (rep clicks one link, reads the prep before the call).
- Slack notification posts full prep details to the assigned rep.
- Deal auto-created in correct pipeline + stage.
- Contact + Company associated automatically (no manual work).

### 6. Meeting + intelligence

- All inbound meetings recorded via **Sybill** (or Gong/Modjo).
- Transcripts + summaries + insights flow into the sales process.
- Reps run standard follow-up + nurture + qualification workflows.

---

## The form-orchestration variant (existing-vs-new company logic)

When the form lands a contact, branch logic matters:

```
Lookup company in HubSpot by domain
├─ Exists → Persona qualification on the contact (does this NEW contact match ICP?)
│   └─ Notify existing account owner via Slack
└─ Doesn't exist → ICP qualification on the company first
    ├─ Qualified → Create company + contact in HubSpot, assign owner
    └─ Not qualified → Tag + park (don't burn rep time)
```

This branch logic is what most form-routing pipelines skip — they treat every submission identically and end up with junk in CRM from poorly-qualified inbound.

---

## Operational mechanics worth remembering

| Mechanic | Why it matters |
|---|---|
| **2-field Webflow form** | Conversion rate stays high; depth comes from enrichment |
| **HeyReach pre-meeting connection request** | First impression is warm, not transactional |
| **Slack-as-CRM lead card approval** | Reps don't skip the approval step because Slack is faster than CRM |
| **Prep GDoc as HubSpot property** | Rep gets full context in one click, not multi-tab research |
| **"How they found us" form field** | Self-reported attribution most teams capture but don't operationalize |
| **Sybill recording → transcripts** | Discovery call objections feed back into content + objection-handling skill |

---

## Tools mentioned

- **Webflow** — website + form host
- **Tally** — qualification form layer (rule-based logic)
- **Cal.com** — meeting scheduler with weighted routing
- **Clay** — enrichment orchestration
- **HeyReach** — pre-meeting LinkedIn warmup
- **BetterContact** — phone waterfall
- **Findymail** — email verification waterfall
- **Claygent / Claude** — research + prep summary generation
- **HubSpot** — CRM, deal + contact records
- **Customer.io** — pre-frame email automation
- **Slack** — approval interface + rep notifications
- **Sybill** — meeting recording + intelligence layer

## Cross-references

- Master outbound system: `clusters/campaign-ops/knowledge/outbound-master-system.md`
- ABM operating system (the bigger architecture this slots into): `clusters/campaign-ops/knowledge/abm-operating-system-2026.md`
- Outbound attribution (closes the inbound → signup measurement loop): `clusters/campaign-ops/knowledge/outbound-attribution.md`

## Source

Synthesized from workflows.io "Inbound Orchestration 2026" + "Meeting Form Orchestration Playbook + Template", 2026-05-13 crawl.
