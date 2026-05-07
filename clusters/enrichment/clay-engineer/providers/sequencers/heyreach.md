# HeyReach — Clay Integration

Primary LinkedIn outreach platform. The Clay integration pushes enriched, qualified contacts from Clay into HeyReach campaigns with personalisation variables mapped.

**When to use:** LinkedIn outreach campaigns. HeyReach is the LinkedIn equivalent of Instantly — paired together they cover cold email + LinkedIn sequences from the same Clay workflow.

**How to connect:** Add enrichment → search HeyReach → connect using **Version 2 API key**. Campaign must exist in HeyReach before Clay can push leads.

---

## Primary Action — Add Lead to Campaign

**Required inputs:**
- HeyReach API key (Version 2)
- Campaign ID — must exist in HeyReach before connecting Clay
- LinkedIn URL (primary identifier for LinkedIn outreach)

**Optional inputs:**
- First Name, Last Name
- Personalisation variables (map Clay columns to `{{variable_name}}` in LinkedIn message template)

**Variable mapping:** HeyReach uses `{{variable_name}}` syntax — same as Instantly. Map Clay columns to matching variable names in the LinkedIn message template.

**Conditional run:**
```
Run if:
1) LinkedIn URL is not empty
AND
2) ICP Qualified = TRUE
```

---

## Setup Pattern (same as Instantly)

1. Create the campaign in HeyReach first
2. Add Add Lead to Campaign enrichment in Clay
3. Map LinkedIn URL + personalisation variables
4. Set conditional run (above)
5. Gate with Sending Gate formula column — inspect every row before running

---

## Multiple Sending Steps

A single Clay table can have multiple HeyReach "Add Lead to Campaign" steps, each routing to a different campaign with its own conditional run. Same pattern as Instantly multiple sending steps:
- Step 1 → Campaign A: `Run if ICP Qualification is "Fintech" OR ICP Qualification is "Fintech & Crypto"`
- Step 2 → Campaign B: `Run if ICP Qualification is "Crypto" OR ICP Qualification is "Fintech & Crypto"`

---

## Slack Notification Setup

Set up Slack alerts so the team is notified in real time when LinkedIn events fire (replies, connection requests accepted, etc.).

**Step 1 — Create Slack App and webhook:**
1. api.slack.com/apps → Create New App → From scratch
2. Name (e.g. "HeyReach Alerts") → select Slack workspace → Create App
3. Left sidebar → Incoming Webhooks → toggle ON
4. Add New Webhook to Workspace → select channel → Allow
5. Copy webhook URL

**Step 2 — Connect to HeyReach:**
1. HeyReach → Integrations (left sidebar or Settings)
2. Find Slack → click Connect Now
3. Paste webhook URL → save
4. Select triggers: Reply received, Connection request accepted, InMail replied, Campaign finished
5. Click Test to verify connection

**If client has both Instantly and HeyReach:** Set up two separate Slack apps (or two webhooks posting to same/different channels) — one per platform.

---

## Other Sequencers (Reference)

| Tool | Type | Notes |
|---|---|---|
| **Smartlead** | Cold email | Alternative to Instantly. Same setup pattern. 6 actions: Add Lead, Update Lead, Get Analytics, Mark Reply, Pause/Resume, Search Lead |
| **Lemlist** | Email + LinkedIn | Multichannel. 3 actions: Add Lead, Update Lead, Remove Lead. Supports both email and LinkedIn steps in same sequence. |
| **Reply.io** | Cold email | Alternative to Instantly/Smartlead. Setup pattern identical. |
| **LGM (La Growth Machine)** | Email + LinkedIn + Twitter | Multichannel. Popular with French/European teams. 2 actions: Add Lead, Update Lead. |
| **Outreach.io** | Enterprise sales engagement | For 50+ rep teams. 5 actions. Requires OAuth. |
| **Salesloft** | Enterprise sales engagement | Similar to Outreach. 7 actions. OAuth required. |
| **Salesforge** | AI-native cold email | Less common — personalisation done in Clay, not sequencer. |
| **Woodpecker** | Cold email | Older platform. Some established clients still use. Same setup pattern. |
| **Groove** | Salesforce-native sequencer | Only when client uses Groove. Contacts must exist in Salesforce first. |
