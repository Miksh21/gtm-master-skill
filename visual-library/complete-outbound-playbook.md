# Four-Channel Outbound Architecture

**What this shows:** A quarterly outbound plan built on four coordinated channels: Cold Calling, LinkedIn Automated Outreach, LinkedIn Manual Prospecting, and Email Campaigns. Each channel has its own tool stack and branches into the specific lead sources or tactics it works. Email is the foundation; the signal layer (firmographics, technographics, account-fit) feeds the email motion.

```mermaid
flowchart TD
    subgraph CC["Cold Calling (Clay, HubSpot, Beehiiv, Warmly, BetterContact)"]
        CCH["Cold Calling"]
        CC1["ICP Cold List"]
        CC2["Qualified Newsletter"]
        CC3["Positive Email Campaigns Responses"]
        CC4["Website Visitors"]
        CC5["Missed Opportunities"]
        CC5a["Long Term Prospects"]
        CC5b["No-Shows"]
        CC5c["Closed lost over 3 months ago"]
        CC5d["Partial Submissions"]
        CCH --> CC1
        CCH --> CC2
        CCH --> CC3
        CCH --> CC4
        CCH --> CC5
        CC5 --> CC5a
        CC5 --> CC5b
        CC5 --> CC5c
        CC5 --> CC5d
    end

    subgraph LA["LinkedIn Automated Outreach (Clay, Trigify, HeyReach, Teamfluence)"]
        LAH["LinkedIn Automated Outreach"]
        LA1["Qualified LinkedIn Profile Visitors"]
        LA2["Social Listening"]
        LA3["Positive Email Campaigns Responses"]
        LA4["Inbound Demo Multithreading"]
        LAH --> LA1
        LAH --> LA2
        LAH --> LA3
        LAH --> LA4
    end

    subgraph LM["LinkedIn Manual Prospecting (LinkedIn, HeyReach)"]
        LMH["LinkedIn Manual Prospecting"]
        LM1["1hr/day"]
        LMH --> LM1
    end

    subgraph EC["Email Campaigns (FindyMail, Instantly)"]
        ECH["Email campaigns"]
        EC1["Website Visitors"]
        EC2["Evergreen trigger-based"]
        EC3["Cold outreach"]
        SIG["Signals"]
        SF["Firmographics (LinkedIn, Apollo, Clay, Ocean, DiscoLike)"]
        ST["Technographics (Apollo, Apify, BuiltWith, ZenRows)"]
        SA["Account-Fit (Clay, n8n, Perplexity, Claude)"]
        ECH --> EC1
        ECH --> EC2
        ECH --> EC3
        EC2 --> SIG
        EC3 --> SIG
        SIG --> SF
        SIG --> ST
        SIG --> SA
    end
```

## Detail notes

### Channel stacks

| Channel | Tools | Lead sources / tactics |
|---|---|---|
| Cold Calling | Clay, HubSpot, Beehiiv, Warmly, BetterContact | ICP Cold List, Qualified Newsletter subscribers, Positive Email Campaigns Responses, Website Visitors, Missed Opportunities |
| LinkedIn Automated Outreach | Clay, Trigify, HeyReach, Teamfluence | Qualified LinkedIn Profile Visitors, Social Listening, Positive Email Campaigns Responses, Inbound Demo Multithreading |
| LinkedIn Manual Prospecting | LinkedIn, HeyReach | Time-boxed at 1hr/day |
| Email Campaigns | FindyMail (email finding), Instantly (sending) | Website Visitors follow-ups, Evergreen trigger-based sequences, Cold outreach |

### Missed Opportunities breakdown (cold calling targets)

Missed Opportunities branch into four recyclable segments:

- Long Term Prospects
- No-Shows
- Closed lost more than 3 months ago (shown as "Closed lost > 3 months")
- Partial Submissions (incomplete form fills)

### Signal layer feeding email

Both the evergreen trigger-based sequences and cold outreach draw on a shared Signals layer with three signal categories:

| Signal category | Tools |
|---|---|
| Firmographics | LinkedIn, Apollo, Clay, Ocean, DiscoLike |
| Technographics | Apollo, Apify, BuiltWith, ZenRows |
| Account-Fit | Clay, n8n, Perplexity, Claude |

### Operating principles (from the accompanying notes)

- Use email as the foundation for scalable outbound, run through Instantly.
- Run automated follow-ups for website visitors.
- Maintain four evergreen, trigger-based sequences.
- Execute cold outreach using three core signal categories: firmographics, technographics, and account-fit signals.
- Cross-channel recycling is deliberate: positive email replies feed both cold calling and LinkedIn automated outreach; website visitors feed both cold calling and email.
