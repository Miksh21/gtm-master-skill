> Source: swan-gtm/gtm-skills (ivan-falco) · MIT · imported 2026-07-28 · external content, unreviewed

# Meta Tracking + Conversions API (setup and audit reference)

Where things live: pixel/events/data sources = Events Manager; campaigns = Ads Manager; domain verification = Business Settings -> Brand Safety -> Domains; event priority = Events Manager -> Pixel -> Settings -> Conversions; CAPI config = same Settings -> Conversions API; Test Events tool = Pixel -> Test Events.

## Pixel

Create: Events Manager -> Data Sources -> Add -> Website -> Meta Pixel. Base code goes on EVERY page (GTM Custom HTML on All Pages is the standard route; manual `<head>` insert or CMS partner integration otherwise). Missing pages = lost remarketing and attribution. Verify via Test Events (PageView within seconds), Meta Pixel Helper extension, and a 24h PageView-vs-traffic sanity check. Cheap insurance: have two independent people verify pixel + events before scaling spend; even experienced buyers miss setup issues, and broken tracking burns thousands.

## Conversion Events

| Event | Fire when | Use |
|---|---|---|
| Lead | Form submit, demo request completes | Primary B2B conversion |
| CompleteRegistration | Webinar/account/event signup | Secondary |
| Schedule | Meeting booked (Calendly confirmation) | High intent |
| PageView | Automatic | Remarketing |

**Fire on actual completion (thank-you page load or success callback), never on button click**; clicks fire on failed validation and inflate counts. One GTM tag per event; never bundle. Meta Lead Gen Forms track the lead automatically, but the site still needs the pixel for remarketing. Set event priority (Lead > CompleteRegistration > Schedule > ViewContent > PageView) so multi-event pages optimize for the right one.

## Domain Verification

Verify every root domain used in ads (landing pages, thank-you pages, redirects) BEFORE scaling: Business Settings -> Brand Safety -> Domains -> Add; DNS TXT, meta tag, or HTML upload; propagation up to 72h; TXT record at root level, not subdomain. Third-party platforms serving your pixel must also be added to the pixel's Traffic Permissions allow list.

## Conversions API (CAPI)

Browser tracking loses events to iOS ATT, ad blockers, cookie limits; B2B volumes are small so a 10-20% loss really hurts optimization. Run pixel (browser) AND CAPI (server) for the same events with deduplication.

**Best B2B pattern: CRM -> CAPI.** Source of truth = CRM lifecycle stages, not just the site Lead. Send one CAPI event per stage: `Lead` (form/demo), `marketingqualifiedlead`, `opportunity` (strong optimization target), `customer` (best for value optimization). The pixel only sees the initial conversion; CAPI carries downstream stage changes back to Meta days or weeks later, which is what makes Meta optimize toward pipeline instead of form fills.

**Integration choice, in order:** 1) CRM-native integration (e.g. HubSpot -> Meta) with data sharing (email, phone, click ID) on for ALL lifecycle events; acceptable when EMQ >= 6/10 and one destination suffices. 2) Middleware (n8n, Segment, custom) when EMQ stays low, multi-destination is needed (Meta + LinkedIn + Google), custom filtering (only deals > X, only paid-source contacts), or you need the same event_id across pixel + CAPI; middleware gives full normalize+hash control and better compliance (hash before sending, never ship plain PII). 3) Custom server-side only at high volume with engineering.

**Required/recommended parameters:** event_name, event_time (unix), action_source (`website` or `crm`), event_source_url (web); user_data: em (email), ph (phone), fn/ln, external_id (CRM id), client_user_agent, fbc (click id cookie), fbp (browser id cookie); event_id required for dedup. Send real-time on stage change, or at worst daily.

## Deduplication

Meta merges duplicates when pixel and CAPI send the SAME `event_id` + `event_name`. Generate the id at pixel fire (`fbq('track','Lead',{},{eventID: id})`), pass it to the server via hidden field/cookie/URL param, send the same id from CAPI. CRM-only events (became MQL/opportunity) have no pixel twin: no dedup needed. Fallback dedup: external_id + fbp (less reliable).

## Event Match Quality (EMQ)

EMQ = how well Meta matches CAPI events to users. Check per event in Events Manager. 8-10 excellent, 6-7 good (target), 4-5 fair (add parameters), 1-3 critical (fix now). Impact ranking of additions: hashed email (highest), hashed phone, fbc, fbp, hashed name, geo fields, hashed external_id.

**Hashing rules (SHA-256, lowercase hex output):** email lowercase+trim; phone E.164; names lowercase+trim; city lowercase no punctuation; state/country two-letter lowercase codes. Node: `crypto.createHash('sha256').update(str).digest('hex')`. CRM-native: enable Data Sharing fields instead. Middleware: normalize then hash exactly per spec.

## Off-Domain Conversions (webinars, events)

When signup completes on a third-party platform (Luma, Hopin, Zoom), the pixel never fires. Two fixes: 1) **pixel in the platform** (best; e.g. Luma Plus: Calendar -> Settings -> Options -> Meta Tracking Pixel sends PageView/CompleteRegistration/Purchase; add the platform domain to Traffic Permissions); 2) **thank-you page redirect** to your domain firing Lead/CompleteRegistration (fallback).

**UTM passthrough:** the platform never sees the UTMs of the page the user clicked from. Append `window.location.search` to the platform registration link via JS so attribution and platform reporting survive the redirect.

## UTM Strategy

utm_source=meta, utm_medium=paid-social, utm_campaign={{campaign.name}}, utm_content={{ad.name}}, utm_term={{adset.name}}. Dynamic parameters auto-populate from the naming convention. **API gotcha: `url_tags` set at ad-set creation cannot be updated afterward; set them right the first time.**

## Troubleshooting Quick Table

| Symptom | Likely cause | Fix |
|---|---|---|
| No events at all | Pixel not installed / wrong pages | Pixel Helper; base code in head; GTM All Pages |
| PageView yes, conversions no | Event code missing on thank-you page or bad trigger | Test the submit flow |
| Helper shows events, Events Manager empty | Ad blocker / privacy tool | Incognito test; CAPI as fallback |
| Duplicate conversions | Missing/mismatched event_id | Same id from pixel and CAPI |
| EMQ < 4 | Missing or badly hashed user data | Follow hashing rules; add email+phone+ids |
| CAPI events delayed | Batched CRM triggers | Real-time triggers on stage change |
| Verification pending | DNS propagation | Wait up to 72h; check the TXT record |
| No webinar conversions | No platform pixel / domain not allowed | Platform pixel + Traffic Permissions |

## Pre-Launch Tracking Checklist

- Pixel installed on all relevant pages and verified firing
- At least one conversion event firing on completion, not click
- Event priority set
- All ad domains verified
- CAPI configured with deduplication; EMQ >= 6/10
- Third-party domains in Traffic Permissions where used
- UTMs on all ad URLs
- Test conversion visible in Events Manager AND in the CRM
- Remarketing audiences building (30d, 90d visitors)
- Employee/competitor exclusion audiences created
