# Creator-Radar Cold Email — 2026 Copy & Deliverability Tactics

## When to load
Cold-email copy hooks, fast spam-placement fixes via copy, no-LinkedIn cold-contact sourcing + personalization stacking, PLG deliverability. Triggers: "analogy hook", "spam placement subject line", "Google Maps emails", "personalization layers reply rate", "primary domain deliverability", "transactional email warmup".

## Copy hook
- **Analogy frame:** "It's like X, but built specifically for your industry." Collapses cognitive load for non-technical buyers → instant product comprehension where attention is scarce. [#25]
- **Unique mechanism beats offer novelty:** sophisticated prospects ignore familiar plays, so lead with the method they have not heard of (tactic, loophole, data source), even when the offer itself is generic. [Nowoslawski #605]
- **Offer shape filter before copy:** every B2B offer is make money, save money, save time or reduce risk; for cold traffic anchor on make money, since buyers have made peace with inefficiency costs. [Nowoslawski #608, #604]
- **PS as a choice:** name a second specific piece of evidence and let them pick ("if Karen's review was fair, Brian's said overpriced; which should we go after?"). Turns a dismissed hook into a reply trigger. [Nowoslawski #617]
- **Product proof in the subject line:** show your output instead of claiming it (FullEnrich put the prospect's own phone number as the subject). Data or enrichment vendors get the claim verified before a word is read. [Lieben #1354, #1463]
- **Creator gap question:** Claude Code reads a person's public corpus, lists what they have NOT addressed versus your problem, outputs one complex gap-closing question citing their exact quotes. Earns detailed replies from creators. [Crawford #1411, #1410]
- **Permissionless value prop:** the email IS the value, proven with evidence and no ask (drone photo of unattended propane tanks = OSHA risk). Find it with "what data would a prospect steal from your systems?" [Crawford #1886, #1740]
- **Size the claim at the parent:** write to the PE firm or holding and aggregate across the portfolio (12 companies, $38M spend, likely overpaying $1.3M) so silence reads as ignoring a big number. [Crawford #1887]
- **Physical sampling:** (single-case: physical product brand) offer a free sample, ask only for a shipping address, sales follows up 7 days after delivery; reported to beat Facebook Ads CPL. Gate: only where the sender can actually deliver; never for a client under the value-CTA ban. [Nowoslawski #606]

## Deliverability via copy (not just domain)
- **Subject-line variation (spintax) fixes spam placement before the domain gets blacklisted.** Copy — especially subject line, signature, unsub language — triggers spam filters first; changing it is a fast, reversible fix with measurable bounce/reply impact in 24h. (Demoed: identical sends May 21 vs 22, only subject lines changed.) [#79]
  - Evidence (2026-10-11): a high bounce on a validated list means Google refuses at send by text fingerprint, not bad addresses. Fix: 20+ spintax variants on subject and unsubscribe line; 40% fixed instantly. [Nowoslawski #762]
- **Reply rate dies overnight:** (1) check spam-trap hits from the last day and pull those domains at once; (2) check content fingerprinting from identical text across sends, then vary copy. [#1386]
- Evidence (2026-10-11) for `email-infra/email-infra-guide.md` "Disable open tracking, improves inbox placement": the open-tracking pixel makes Gmail/Outlook show "Images hidden, mark as spam?" even when inboxed; same copy/list/day test, 4.8% reply without tracking vs 0.8% with (~5x). Keep tracking off. [#324]

## No-LinkedIn cold contacts + stacked personalization
- **Scrape Google Maps + mine websites for emails** to reach inboxes that LinkedIn-sourced lists ignore (less competition). Stack 3 personalization layers — Google-review pain proof + role-based messaging + PS referral name-drop — to prove prior pain before sending. Result cited: **~1 positive reply per 90 fully-cold contacts.** [#80]

## PLG deliverability
- **Send cold email from your primary domain** if you run a PLG product with enough transactional volume — that volume builds authentic domain reputation and effectively acts as warmup, so cold email flies under the radar and dodges the subdomain trust gap that plagues standard warmup. [#195]

## Source
creator-radar 2026-06; card ids in [#25 #79 #80 #195].

## Creator-radar 2026-10-11
- **Send size:** Hunter data on 31M emails, 21-50 recipients reply at 6.2% vs 2.4% for 500+; personalized 17-18% vs generic 7-9%. Default to tight 40-60 account lists with research first. [Reynolds #1791, Vacca #1234]
- **Segment expansion:** write and get approval on ONE segment's sequence with its A/B variants, then have Claude expand it across all segments (1 approved template to 16). The approval bottleneck is paid once. [Rosenthal #724]
- **Counter-view (2026-10-11):** disputes the gtm-master hard rule "Never promise a deliverable you cannot actually fulfil" (SKILL.md step 6, client-scoped value-CTA ban). Risk reversal stacked on a revenue outcome with a deadline ("outlier ad in 21 days or you do not pay"). Gate: only where the sender can actually deliver; never for a client under the value-CTA ban. [Nowoslawski #609]
- **Counter-view (2026-10-11):** disputes the same hard rule. Already-made free work: ask "what is the first thing I would do for them as a client, and what stops me doing it now?", then send it done, unprompted; never promise it in advance. Gate: only where the sender can actually deliver; never for a client under the value-CTA ban. [Lieben #1465]
- **Counter-view (2026-10-11):** disputes `email-infra/email-infra-guide.md` "Maximum 2 mailboxes per domain. Limits blast radius". Counter-architecture: 1 domain, 100 Microsoft Azure mailboxes, 2 sends per mailbox per day; claimed 1 interested lead per 100-315 emails. Concentrates blast radius on one domain; test on a spare domain only. [Saruggia #1124]

Source: creator-radar review 2026-10-11, cards from Supabase insight_cards.
