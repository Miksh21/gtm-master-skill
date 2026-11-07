# External takes — sequences (Web radar, UNREVIEWED)

## Tier routing in 2026 H2 plays — workflows.io  ·  filed 2026-11-07
Source: https://www.workflows.io/workflows/job-change-tracking-signal + https://www.workflows.io/workflows/linkedin-post-engagement-scraping-signal + https://www.workflows.io/workflows/competitor-mentions-tracking-signal + https://www.workflows.io/workflows/the-employee-led-content-playbook (2026-08 to 2026-11) · cluster: sequences
- ⚠️ contradicts [sequences/knowledge/tiered-routing-template.md:14]: the "house style" template. Both sides — gtm-master (from the 2026-05 crawl): T1 = email from a C-level profile + LinkedIn from an AE profile + connection requests from supporting profiles + Slack, T2 = automated email + automated LinkedIn; workflows.io plays published since 2026-08: T1 = HeyReach DMs (sometimes + Instantly email or a Nooks call), T2 and T3 = Instantly email only; the C-level sender and supporting-profile connection requests are gone.
- 🆕 new-angle: paid media enters as a tier channel: employee-led routing gives T2 email + LinkedIn ads and T3 retargeting ads + nurture instead of any outbound.
- 🆕 new-angle: SEO-led outbound routes T1 to LinkedIn Ads + DMs + cold email, T2 DMs + email, T3 email only (https://www.workflows.io/workflows/seo-led-outbound, 2026-10-23).
Review: contradicts
Status: holding

## LinkedIn Ads Playbook (ads + outbound in lockstep) — workflows.io  ·  filed 2026-11-07
Source: https://www.workflows.io/workflows/linkedin-ads-playbook (2026-06-25) + https://www.workflows.io/blog/the-linkedin-ads-guide-for-b2b-saas (2026-07-16, Bogdan Liutic) · cluster: sequences
- 🆕 new-angle: outbound timed against an ad layer on the same accounts: weeks 1-8 awareness (founder post boosts, 15-30s video), weeks 4-8 consideration plus HeyReach connection requests to the same list, from week 6 conversion ads plus DMs and emails that reference the value prop the prospect saw in the ad.
- 🆕 new-angle: automation trigger: account reaches 5+ ad impressions → flagged in Clay → added to a HeyReach sequence (n8n).
- 🆕 new-angle: entry gates: ACV above $10k, ICP present on LinkedIn, TAM of 200+ accounts; matched audience of 500+ contacts for a 60-80% match rate (below 50% means bad email data, re-enrich first).
- Claims, unverified: outbound reply rates on ad-primed accounts 1.5-2x cold; retargeted audiences 40-60% cheaper; lead gen forms beat landing pages ~80% of the time.
Review: additive
Status: holding

## Warm Calling Playbook — workflows.io  ·  filed 2026-11-07
Source: https://www.workflows.io/workflows/warm-calling-playbook (2026-06-30) · cluster: sequences
- 🆕 new-angle: one call list fed from six warm sources (lead magnet downloads, de-anonymised visitors, content engagers, LinkedIn connections, inbound demo forms including partial fills, reopened closed-lost), each tagged by source and deduped across sources in Clay.
- 🆕 new-angle: T3 is explicitly removed from calling; source pushed as a HubSpot custom event so call outcomes report per source.
Review: additive
Status: holding


## How to Do LinkedIn Outreach in 2026, 100K+ DMs (Kenny Damian, upd. 2026-10-15) — frontal.so  ·  filed 2026-11-07
Source: https://frontal.so/blog/how-to-do-linkedin-outreach · cluster: sequences
- ✅ supports [sequences/tasks/write-linkedin-sequence.md:34]: under 150 characters (+22%) and 3 to 5 steps beating single messages (+42%). Same Expandi dataset already cited there; not new evidence.
- ✅ supports [sequences/tasks/write-linkedin-sequence.md:27]: warm-up visit -> like -> follow -> connect -> message, +30.2% acceptance (same source).
- ⚠️ contradicts [cold-email/tasks/write-first-email.md:30]: no trigger-naming or congrats openers for commodity events. Both sides — gtm-master: consequence-led, at most one clause; frontal.so: ranked openers include a job-change hook asking how the first month in the new company is going (+21.5%) and a hiring-trigger hook (+18.2%), both naming the event.
- 🆕 new-angle: peer-comparison CTA (offer to share what others in their space do) ranked top at +27.1%; best structure 2 warm-up steps + 2 DMs + 1 fallback email that references the LinkedIn attempt; wait 1 to 2 days after acceptance before the first DM.
- 🆕 new-angle: benchmarks acceptance 40 to 55%, reply 18 to 27%, positive reply 8 to 12%, errors under 3%; diagnosis matrix (low acceptance + ok reply = fix warm-up/targeting; high acceptance + low reply = fix opener; high reply + low positive = fix offer/CTA); over 100 requests a week claimed 4.7x more restrictions than under 50. All numbers are Expandi's data, not Frontal's. Provenance: Frontal = former ColdIQ Agency (same operators as the coldiq-* holding files), so agreement with coldiq takes is NOT independent corroboration.
Review: contradicts
Status: holding

## Multi-thread timing pattern across plays 34, 35, 36 — frontal.so  ·  filed 2026-11-07
Source: https://frontal.so/plays/closed-lost-revival · cluster: sequences
- 🆕 new-angle: recurring pattern: the person who showed the signal gets a LinkedIn message on day 0 (where they already saw the topic), the rest of the buying committee gets the same angle by email on day 2 to 3, the owner calls the champion; for exec posts, a human comment comes first and the message about 2 days later.
- 🆕 new-angle: closed-lost revival window set per loss reason (timing/budget sooner, lost-to-competitor aligned with their renewal); opener names the change and ties it to why they said no, never a check-in; no change found = back to the queue, not to outreach. Provenance: Frontal = former ColdIQ Agency (same operators as the coldiq-* holding files), so agreement with coldiq takes is NOT independent corroboration.
Review: additive
Status: holding
