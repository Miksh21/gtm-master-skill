# Website Visitor De-Anonymization Outbound Workflow

**What this shows:** An end-to-end workflow that turns anonymous website visitors into tiered outbound targets: identify the company and contact (Warmly), enrich (Clay), score and qualify (ChatGPT), then route Tier 1 to high-touch multi-channel outreach and Tier 2 and 3 to automated email.

```mermaid
flowchart TD
    WV["Website Visitors"] --> CLI["Company-Level Identification (Warmly)"]
    WV --> COI["Contact-Level Identification (Warmly)"]
    CLI --> DE["Data Enrichment (Clay)"]
    COI --> DE
    DE --> LS["Lead Scoring and Qualification (ChatGPT)"]
    LS --> T1["Tier 1"]
    LS --> T23["Tier 2 and 3"]
    T1 --> SN["Slack Notification"]
    T1 --> FMP["Find more people: Decision Makers, Champions (FindyMail)"]
    SN --> CC["Cold Calling (BetterContact)"]
    FMP --> AELO["Automated Email and LinkedIn Outreach (Instantly + HeyReach)"]
    SN --> AELO
    T23 --> AEO["Automated Email Outreach (Instantly)"]
```

## Detail notes

- **Identification (Warmly):** runs at two levels in parallel:
  - Company-Level Identification: which account is visiting.
  - Contact-Level Identification: which person is visiting.
- **Data Enrichment (Clay):** enrich the identified company and contact with firmographic and contact data before scoring.
- **Lead Scoring and Qualification (ChatGPT):** an AI step scores and qualifies each identified visitor, splitting the flow into tiers.
- **Tier 1 (best-fit accounts), high-touch treatment:**
  - Slack Notification to alert the team in real time.
  - Find more people at the account: Decision Makers and Champions, using FindyMail for email discovery.
  - Cold Calling, with phone numbers via BetterContact.
  - Automated Email and LinkedIn Outreach via Instantly (email) and HeyReach (LinkedIn).
- **Tier 2 and 3 (lower-fit accounts), low-touch treatment:**
  - Automated Email Outreach only, via Instantly.
- **Tool roster:** Warmly (de-anonymization), Clay (enrichment), ChatGPT (scoring), FindyMail (contact discovery), BetterContact (phone waterfall), Instantly (email sequencer), HeyReach (LinkedIn sequencer), Slack (alerts).
