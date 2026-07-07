# Track Your Employees' LinkedIn Engagement Playbook

**What this shows:** An outbound workflow that captures three signal streams from your own team's founder-led and employee-led LinkedIn content (connections, profile impressions/visitors, and post engagement), consolidates them in Clay, AI-qualifies with an existing-client lookup, and routes into tiered multi-channel outreach.

**Pattern:** Signal capture, enrich, AI qualify, tier score, tier routing (Tier 1 vs Tier 2 and 3). Unique signal source: Connections + Impressions + Engagement harvested across all employee LinkedIn accounts.

```mermaid
flowchart TD
    A["Founder-led and employee-led content"] --> B["Connections"]
    A --> C["Impressions"]
    A --> D["Engagement (Trigify)"]
    B --> B1["Manual Monthly CSV Download (LinkedIn)"]
    C --> C1["Profile Visitors (Teamfluence)"]
    D --> D1["Likes"]
    D --> D2["Comments"]
    D --> D3["Reposts"]
    B1 --> E["Data Routing (Clay)"]
    C1 --> E
    D1 --> E
    D2 --> E
    D3 --> E
    E -.-> N["3 Clay Tables: Connections, Impression, Engagement"]
    E --> F["Company Enrichment (Clay)"]
    E --> G["Contact Enrichment (Clay)"]
    F --> H["AI Qualification (lookup if existing client)"]
    G --> H
    H --> Q["Qualified"]
    H --> DQ["Disqualified"]
    DQ --> END["End"]
    Q --> I["Lead Scoring"]
    I --> T1["Tier 1"]
    I --> T23["Tier 2 and 3"]
    T1 --> T1A["Email Outreach from C-level Profile (HeyReach)"]
    T1 --> T1B["LI Outreach from AE's Profile (HeyReach)"]
    T1 --> T1C["Connection Request from other profiles (HeyReach)"]
    T1 --> T1D["Slack Notifications (Slack)"]
    T1A --> E1["Email 1"] --> E2["Email 2"]
    T1B --> DM1["DM 1"] --> DM2["DM 2"]
    T23 --> T23A["Email and LinkedIn Outreach from AE's Profile (HeyReach)"]
```

## Detail notes
- Three parallel signal streams from team content:

| Stream | Capture method | Tool |
|---|---|---|
| Connections | Manual monthly CSV download | LinkedIn native export |
| Impressions | Profile visitors tracking | Teamfluence |
| Engagement | Likes, Comments, Reposts on posts | Trigify |

- Data routing consolidates into 3 Clay tables labeled Connections, Impression, and Engagement (one row per signal).
- AI Qualification carries an explicit annotation: "lookup if existing client", i.e. suppress or divert leads that are already customers before outreach.
- Disqualified leads hit an explicit End state; Qualified leads pass through Lead Scoring before tier routing.
- Tier 1 treatment: email outreach from a C-level profile, LinkedIn DMs from an AE's profile, connection requests from other team profiles, and Slack notifications. Sequences are short: Email 1 then Email 2, DM 1 then DM 2.
- Tier 2 and Tier 3 merge into one lower-touch branch: email and LinkedIn outreach from an AE's profile.
- Deviations from the shared skeleton: the diagram shows HeyReach as the tool label on all outreach boxes here, including the email steps (Instantly is not shown in this variant); no Findymail or BetterContact enrichment appears; and Tiers 2 and 3 are collapsed into one branch differentiated by sender seniority.
