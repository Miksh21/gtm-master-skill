# Instantly — Clay Integration

Primary cold email outbound platform. The Clay integration pushes enriched, qualified contacts from Clay into Instantly campaigns with all personalisation variables mapped.

**How to connect:** Add enrichment → search Instantly → connect using **Version 2 API key**. Version 1 is deprecated.

**Critical prerequisite:** Campaign must be **created in Instantly first** — Clay cannot create campaigns, only push leads into existing ones. Set up the campaign (including copy with personalisation variable names) before configuring Clay enrichment.

---

## The 4 Actions

| Action | Used? | Purpose |
|---|---|---|
| Add Lead to Campaign | **Yes — primary** | Pushes contact into Instantly campaign with personalisation variables mapped |
| Update Lead | **Yes — secondary** | Updates existing lead's fields; used to fix missed mappings or add new variables |
| Verify Email | Deprioritised | Other providers are cheaper and more accurate |
| Find Leads | Never used | Not part of any standard workflow |

---

## Action 1 — Add Lead to Campaign (Primary)

**Required inputs:**
- **Campaign ID** — dropdown from your connected Instantly account. Use Refresh fields if newly created campaign doesn't appear.
- **Email** — map to your Work Email column (output of email waterfall)

**Optional inputs:**
- First Name, Last Name, Company Name, Website, Phone Number
- **Skip if Lead is in Workspace** — toggle (ON by default). Always leave ON to avoid duplicate sends.
- **Custom Variables** — expand to map each Clay column to the exact `{{variable_name}}` used in Instantly copy

**How variable mapping works:**
- Instantly copy contains `{{subindustry}}`, `{{recent_news}}`, `{{use_case}}` etc.
- In Clay's Custom Variables, map each Clay column to the exact placeholder name
- Variable name must match exactly — case-sensitive

**Returns (status values):**
- `Added to Campaign` — contact successfully pushed
- `Skipped, already in the workspace` — duplicate detected and skipped
- `Missing input` — email field is empty or not mapped

**Run Settings:**
- Set conditional run to only push if work email is not empty and validated
- Use the Sending Gate formula column to gate this step (see formula-syntax.md)

---

## Action 2 — Update Lead (Secondary)

Updates an existing lead's fields in Instantly. Use when:
- A variable column was missed during initial setup
- A field mapping was incorrect and needs correcting
- New personalisation variables were added to the sequence after initial push

**Required:** Email address (used to locate the existing lead)

---

## Full Outbound Workflow Context

Instantly is always the **last step** in a Clay outbound workflow:

1. Build company list (Clay Find Companies or CSV import)
2. Enrich at company level (sub-industry, tech stack, signals)
3. Find contacts (Find People or Apollo people search)
4. Find work email (waterfall enrichment)
5. Build personalisation variables (Claygent or other enrichments)
6. **Push to Instantly** (Add Lead to Campaign, map all columns to variable names)

---

## Campaign Setup Checklist (in Instantly, before connecting Clay)

1. Click **New Campaign**
2. Name: `{Client} - {Campaign Name} - {Date}`
3. Add to appropriate campaign folder
4. Add email sequence with all variants and wait times
5. **Preview with a sample lead** before launching to verify variable rendering
6. Configure sending accounts:
   - Only use warmed accounts (>14 days old)
   - Health score must be green
   - Deliverability score must be >80
   - Balance load across accounts

---

## Sending Capacity Calculator

When a user asks about sending capacity, always ask for these three inputs before calculating:
1. **Number of mailboxes**
2. **Number of sequence steps**
3. **Gap between steps (in days)**

Then provide two outputs:

---

### Output 1 — Long-Run Average

- Daily sends = mailboxes × 10
- Average new contacts/month = (mailboxes × 10 × 20) ÷ number of steps

---

### Output 2 — Exact New Contacts for Months 1, 2, 3

**Hard rules:**
- 10 emails/mailbox/day (never exceed — hard rule)
- 20 sending days/month (hard rule)

**How the blocking model works:**
Each day's 10 sends per mailbox are consumed first by due follow-up steps, then by new Step 1 contacts. In practice this creates a repeating cycle:
- Phase 1: G days of Step 1 sends (all slots go to new contacts)
- Phase 2: G days of Step 2 sends (all slots consumed by follow-ups, 0 new contacts)
- Phase 3: G days of Step 3 sends (if exists) — 0 new contacts
- Then cycle repeats

One full cycle = G × S days. New contacts per cycle = G × (mailboxes × 10).

**To calculate months 1–3:** Simulate the cycle across 60 days (3 × 20). For each 20-day block, count how many days fall in a Step 1 phase. Multiply by daily sends.

**The gap matters for per-month planning** even though the long-run average is the same. A short gap (3 days) produces smooth consistent months. A long gap (18+ days) front-loads month 1 and creates dips in months 2–3.

**Example — 60 mailboxes, 2-step, 3-day gap:**

Cycle = 6 days (3 Step 1, 3 Step 2). Daily sends = 600.

| Month | Days | Step 1 days | New contacts |
|---|---|---|---|
| Month 1 | Days 1–20 | 11 days | 6,600 |
| Month 2 | Days 21–40 | 10 days | 6,000 |
| Month 3 | Days 41–60 | 9 days | 5,400 |
| Long-run average | — | — | **6,000/month** |

**Example — 60 mailboxes, 2-step, 18-day gap:**

Cycle = 36 days. Daily sends = 600.

| Month | Days | Step 1 days | New contacts |
|---|---|---|---|
| Month 1 | Days 1–20 | 18 days | 10,800 |
| Month 2 | Days 21–40 | 2 days | 1,200 |
| Month 3 | Days 41–60 | 10 days | 6,000 |
| Long-run average | — | — | **6,000/month** |

Use these numbers to size list builds correctly per month — not just for the long-run average.

---

## Key Rules

- **Always use Version 2 API keys**
- **Create campaign in Instantly first** — before configuring Clay enrichment
- **Variable names must match exactly** — `{{variable_name}}` in copy must match field name in Clay mapping
- **Standard fields to always map:** Email, First Name, Last Name, Company Name, Title
- **Use Skip if Lead is in Workspace** for any workflow that may re-run or overlap with other campaigns
- **Gate with Sending Gate formula column** — never put multi-condition logic directly in the sending step's conditional run field

---

## Multiple Sending Steps — One Table Routing to Multiple Campaigns

A single Clay table can have multiple Add Lead to Campaign steps, each routing to a different campaign with its own conditional run.

**Example — sub-industry routing:**
- Sending step 1 → Campaign A
  `Run if ICP Qualification is "Fintech" OR ICP Qualification is "Fintech & Crypto"`
- Sending step 2 → Campaign B
  `Run if ICP Qualification is "Crypto" OR ICP Qualification is "Fintech & Crypto"`

A "Fintech & Crypto" contact gets pushed to both campaigns automatically. Flag this with the client upfront.

**Each campaign-specific personalisation enrichment must carry the same conditional run as its corresponding sending step.**

---

## Slack Notification Setup

Set up a Slack alert so the team is notified in real time when a reply comes in. Done once per Instantly workspace.

**Step 1 — Create Slack App and webhook:**
1. api.slack.com/apps → Create New App → From scratch
2. Name (e.g. "Instantly Alerts") → select Slack workspace → Create App
3. Left sidebar → Incoming Webhooks → toggle ON
4. Add New Webhook to Workspace → select channel → Allow
5. Copy generated webhook URL (format: `https://hooks.slack.com/services/...`)

**Step 2 — Connect to Instantly:**
1. Instantly → Settings → Integrations/Notifications
2. Select Slack → paste webhook URL → save
3. Select triggers (Reply Received, Out of Office, Positive Reply)
4. Test the connection
