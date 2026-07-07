# GTM Flywheel: Traffic to Retention

**What this shows:** A six-stage GTM flywheel drawn as vertical swim-lanes: Traffic Generation (four channel families with sub-channels), Lead Capturing, Lead Nurturing, Conversion, Qualification, and Retention and Expansion. Every traffic sub-channel feeds the capture mechanisms, all nurturing paths converge on the website, and the funnel narrows to Meeting Booked or Free Trial, then Sales Process, then Closed Won.

```mermaid
flowchart TD
    subgraph TG["Stage 1: Traffic Generation"]
        subgraph CONTENT["Content"]
            C1["Podcasts"]
            C2["LinkedIn"]
            C3["X"]
            C4["Facebook"]
            C5["Instagram"]
            C6["YouTube"]
            C7["TikTok"]
            C8["SEO and AI SEO"]
        end
        subgraph ADS["Ads"]
            A1["Google Ads"]
            A2["LinkedIn Ads"]
            A3["Directories"]
            A4["Billboards/TV"]
            A5["Meta Ads"]
            A6["Reddit Ads"]
            A7["Event Sponsorships"]
        end
        subgraph OUT["Outbound"]
            O1["LinkedIn DMs"]
            O2["Warm Outbound"]
            O3["Cold Email"]
            O4["Cold Call"]
            O5["Conferences"]
        end
        subgraph PART["Partnerships"]
            P1["Agency Programs"]
            P2["White-label"]
            P3["Influencer Marketing"]
            P4["Platforms"]
            P5["Integrations"]
            P6["Referrals"]
            P7["Press Features"]
            P8["Affiliates"]
        end
    end

    subgraph LC["Stage 2: Lead Capturing"]
        LC1["Social Followers"]
        LC2["Social Engagement"]
        LC3["Lead Magnets"]
        LC4["Landing Page Form"]
    end

    subgraph LN["Stage 3: Lead Nurturing"]
        N1["SDR Touchpoints"]
        N2["Retargeting Ads"]
        N3["Content"]
        N4["Newsletter"]
        N5["Community"]
        N6["Webinar"]
        N7["Dinner Invites"]
        N8["In-Person Events"]
        N9["Email Flows"]
        N10["Gifts"]
    end

    WEB["Website"]

    subgraph CONV["Stage 4: Conversion"]
        V1["Video Demo"]
        V2["Testimonials"]
        V3["Case Studies"]
        V4["Product Marketing"]
        V5["Resources"]
        V6["Free Tools"]
        MB["Meeting Booked"]
        FT["Free Trial"]
    end

    subgraph QUAL["Stage 5: Qualification"]
        SP["Sales Process"]
    end

    subgraph RET["Stage 6: Retention and Expansion"]
        CW["Closed Won"]
    end

    CONTENT --> LC
    ADS --> LC
    OUT --> LC
    PART --> LC

    LC1 --> LN
    LC2 --> LN
    LC3 --> LN
    LC4 --> LN

    LN --> WEB
    WEB --> V1
    WEB --> V2
    WEB --> V3
    WEB --> V4
    WEB --> V5
    WEB --> V6

    V1 --> MB
    V2 --> MB
    V3 --> MB
    V4 --> FT
    V5 --> FT
    V6 --> FT

    MB --> SP
    FT --> SP
    SP --> CW
```

## Detail notes

### Stage 1: Traffic Generation channel families

| Channel family | Sub-channels |
|---|---|
| Content | Podcasts, LinkedIn, X, Facebook, Instagram, YouTube, TikTok, SEO and AI SEO (Google) |
| Ads | Google Ads, LinkedIn Ads, Directories, Billboards/TV, Meta Ads, Reddit Ads, Event Sponsorships |
| Outbound | LinkedIn DMs, Warm Outbound (WhatsApp icon), Cold Email (Gmail icon), Cold Call (WhatsApp icon), Conferences |
| Partnerships | Agency Programs, White-label, Influencer Marketing, Platforms (Product Hunt icon), Integrations, Referrals, Press Features (TechCrunch icon), Affiliates |

Each channel family header also carries a small toolbar of production tools (design, AI, and editing tools by logo, including what appear to be Figma, ChatGPT, Canva, and CapCut for Content; most logos are too small to identify reliably).

### Stage 2: Lead Capturing

Four capture mechanisms sit between traffic and nurturing: Social Followers, Social Engagement, Lead Magnets, Landing Page Form. In the original layout every traffic sub-channel connects into this row (many-to-many), so the diagram above links the channel groups to the stage as a whole.

### Stage 3: Lead Nurturing approaches and tools

| Nurturing approach | Tool shown (by logo) |
|---|---|
| SDR Touchpoints | Gmail |
| Retargeting Ads | Meta |
| Content | LinkedIn |
| Newsletter | Beehiiv |
| Community | Slack |
| Webinar | Luma |
| Dinner Invites | WhatsApp |
| In-Person Events | (handshake icon, no tool) |
| Email Flows | Customer.io |
| Gifts | (logo not identifiable, gifting platform) |

### Stages 4-6: Conversion, Qualification, Retention

- Website is the central convergence point (all nurturing leads back to it).
- Conversion assets on the website: Video Demo, Testimonials, Case Studies, Product Marketing, Resources, Free Tools.
- Two conversion outcomes: Meeting Booked (scheduling tools shown by logo, not identifiable) and Free Trial (product-analytics tools shown by logo, not identifiable).
- Both outcomes feed a single Sales Process (Qualification stage), which ends in Closed Won (HubSpot and Salesforce logos), the Retention and Expansion stage.
