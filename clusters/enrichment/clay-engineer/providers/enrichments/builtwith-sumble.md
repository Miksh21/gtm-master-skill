# Tech Stack Detection — BuiltWith + Sumble

Two tools for detecting what technologies a company uses:
- **BuiltWith** — detects website-facing technologies (scripts, pixels, widgets)
- **Sumble** — detects any technology including internal tools not visible on the website

**Always use BuiltWith first, Sumble as fallback.**

---

## BuiltWith

- **Cost:** 1 credit per row
- **Input:** Company domain + **specific technologies to track** (you must specify which technologies to look for)
- **Account:** Clay-managed or own API key

**When speccing BuiltWith in a workflow, always list the exact technology names the user should input.** Never say "run BuiltWith" without specifying which technologies to track.

**What BuiltWith CAN detect** (leaves a footprint on the public website):
- Analytics & tracking: Google Analytics, GTM, Mixpanel, Amplitude, Heap, Segment, Hotjar, FullStory
- Ad pixels: Meta Pixel, LinkedIn Insight Tag, Twitter Pixel, TikTok Pixel, Google Ads
- CRM tracking scripts: HubSpot, Salesforce Pardot, Marketo, ActiveCampaign, Zoho
- Marketing automation: Klaviyo, Mailchimp, Drip, ConvertKit
- Live chat: Intercom, Drift, Zendesk Chat, Freshchat
- eCommerce: Shopify, WooCommerce, Magento, BigCommerce, Stripe, PayPal
- CMS: WordPress, Webflow, Squarespace, Wix, Framer
- Hosting: AWS, Cloudflare, Vercel, Netlify
- JavaScript frameworks: React, Vue, Angular, Next.js
- Scheduling/forms embedded on website: Calendly, Typeform, HubSpot Forms
- ABM/intent tracking: Demandbase, 6sense, Bombora

---

## Sumble

- **Cost:** 6 credits per technology found (charged per technology, not per row) — **this is expensive. Sumble charges for every single technology it finds, not per company.** A company using 10 tracked tools = 60 credits for that one row.
- **Input:** Company domain + **specific technology names to track** (you must specify which technologies to look for)
- **Account:** Clay-managed — **NEVER connect via own API key** (native Clay integration is cheaper — exception to the standard own-API-key rule)

**CRITICAL: Sumble requires you to specify the exact technologies to track.** It does NOT scan for all technologies automatically. You must input the specific tool/vendor names you want to detect. Only add the technologies that matter for the ICP or campaign — every additional technology increases cost.

**When speccing Sumble in a workflow, always list the exact technology names the user should input.** Never say "run Sumble" without specifying which technologies to track.

**Cost control — Sumble should be the last qualification enrichment when possible.** Because Sumble is expensive (6 cr/tech found), gate it behind all cheaper qualification steps first. Run ICP qualification (Claygent), headcount verification, and any free formula gates BEFORE Sumble. Only run Sumble on rows that have already passed all other qualification checks. Never run Sumble on unqualified rows.

**What Sumble detects** (internal tools BuiltWith cannot):
- Clay, Apollo, ZoomInfo, Lusha, Hunter, Prospeo
- Outreach, Salesloft, Lemlist, Instantly, Smartlead
- Gong, Chorus
- Slack, Notion, Confluence
- LinkedIn Sales Navigator
- n8n, Make, Zapier
- Network infrastructure: Cisco, Palo Alto, Fortinet, Zscaler, VMware, Juniper, SD-WAN products
- Any internal tool with no website integration

**How Sumble works:** Uses job postings and LinkedIn profiles as primary data source. Runs AI-powered Named Entity Recognition (NER) to extract technologies mentioned in job descriptions and profiles. Coverage is deepest for companies actively hiring. Detects 100,000+ technologies.

---

## When to Use Which

| Scenario | Tool |
|---|---|
| Detect HubSpot, Shopify, Intercom, Mixpanel | BuiltWith |
| Detect Salesforce, Outreach, Gong, Slack | Sumble |
| Detect network infra: Cisco, Palo Alto, Fortinet, Zscaler, VMware | Sumble |
| Unknown whether website-facing or internal | Try BuiltWith first, then Sumble if empty |
| Cost is critical | BuiltWith always first — 1cr vs Sumble's 6cr/tech |

## Cost Control — Tech Stack Enrichment Order

**Tech stack detection (BuiltWith + Sumble) should be the LAST qualification enrichment step — after ICP qualification and all free formula gates.** Sumble especially is expensive at 6 cr/tech. Never run tech stack enrichment on unqualified rows.

Correct order:
1. LinkedIn headcount verification + filter (Clay Find Companies only)
2. ICP qualification (Claygent Web Research)
3. Qualification Gate formula (free)
4. **Then** BuiltWith (1 cr/row — cheap, run first)
5. **Then** Sumble (6 cr/tech — expensive, run last, only on qualified rows)

---

## HG Insights (Enterprise Alternative)

For enterprise software detection beyond BuiltWith/Sumble:
- **Input:** Company domain
- **Returns:** Technology stack (installs, confidence, spend signal), company profile, domain finder
- **Cost:** Own API key (HG Insights subscription required)
- **When to use:** When technology stack is a primary ICP qualifier for enterprise — e.g. "companies using SAP." HG Insights tracks procurement data, not just web scraping — higher accuracy for enterprise deployments.
