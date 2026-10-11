# Creator-Radar Sequences — 2026 Cadence & Channel Tactics

## When to load
Designing multichannel cadences, channel-by-tier assignment, warm-calling stacks, nurture drips, LinkedIn DM plays, send-day/inbox-provider optimization. Triggers: "which channel per tier", "warm calling", "case study drip", "internal referral DM", "best send day", "Gmail vs Outlook open rate".

## Channel-by-tier assignment
- **Pick channel by account value, not preference.** Cold email for T2/T3 volume; LinkedIn precision for T1; cold calling reserved for T1 (closer-led). Set explicit daily volume caps and a tool stack per channel so it's executable. [#70]
- **Warm-calling stack:** 6 signal sources → Clay enrich/tier → HubSpot sync → Nooks parallel dialer with AI account plans. Parallel-dial efficiency + warm-signal prioritization across 6 owned audiences removes cold-call friction while holding volume. [#36]
- **Cold call baseline per 100 dials:** 13 answered, 70 no answer, 17 bad numbers; 6 attempts per lead lifts contact rate up to 70%. Budget 6 attempts before calling a lead dead. [Douablin #381]
- **Calls amplify email:** Gong 300M-call study, email reply 3.44% when a call was also placed vs 1.81% email-only, even when nobody picked up. Dial Tier 1 even with low pickup. [Vacca #1485]
- **Channel stacking ROI model:** (SmartReach H1 2026) meetings per 1K prospects: LinkedIn alone 4, plus email 14, plus calls 21. Use it to justify adding each channel. [Vacca #1486]

## LinkedIn DM plays
- **Internal-referral DM:** research who owns the relevant initiative, ask the founder/exec to route you to them. Reframes the ask from "buy from me" → "help me reach the right person" — lower friction for busy execs; scale via Clay "find person" signal-stacking. [#44]
- **1st-degree connection mining:** Claude Code scans Sales Nav 1st-degree connections, tags ICP matches, then sends personalized case-study DMs at scale — combines a concrete asset with automated ICP-matching against people you can already reach. [#15]
- **"Free insight, not free work":** send a 5-min specific audit (e.g. "23% checkout drop-off") with 3 fixes, no strings. Specific insight is rare vs generic free-consult offers; demonstrates expertise and triggers reciprocity without an ask. [#45]
- **AI hyperpersonalization underperforms:** Expandi H2 2026 same-account test (13.2M requests), AI-personalized connection messages were accepted 12% less than human templates, replies flat. [Waxman #2039]
- **Counter-view (2026-10-11):** disputes the gtm-master hard rule "Never promise a deliverable you cannot actually fulfil" (SKILL.md step 6). LinkedIn opener lift vs baseline: proprietary benchmark offer +27.1%, job change +21.5%, social selling +19.3%, trigger +18.2%. The benchmark opener promises a deliverable: use it only if the benchmark already exists. Gate: only where the sender can actually deliver; never for a client under the value-CTA ban. [Lieben #1088]

## Demo-show-rate manufacturing
- **Fake-assistant intercept ("Rachael"):** a second email address posing as the founder's assistant manufactures social proof + scarcity + urgency, lifting demo show rates and on-time attendance. Signals founder status and scarcity at once; prospects self-select into urgency without being pushed. [#112]
  - **Conflict (2026-10-11):** a fake assistant persona breaks the "Truthful framing only" house flag in `clusters/cold-email/tasks/reframe-offer.md` (the framing must be literally true of the sender's business). Do not use as written.

## Nurture / drip
- **Plain-text bi-weekly case-study drip** to all email subscribers beats designed emails in B2B nurture — one case study per send (via Loops/HubSpot). Plain text signals a human sender; single-study focus avoids cognitive overload while reinforcing ROI on cadence. [#116]
- **Low reply is timing, not verdict:** ~5% of a market is buying now, so 0.2% reply means retry, not drop. Re-touch the same list at 6 weeks and again at 3 months with a new angle. [Waxman #1657]
- Evidence (2026-10-11) for `objections/tasks/handle-objection.md` "Not the right time: offer a specific future date": a Future Reach Out sequence stores buyer-stated timing from replies and notes and re-engages on their date; 33% reply, about half to demos. First-party timing beats bought intent. [Waxman #1934]

## Send-timing & inbox-provider signals (SmartLead, n=16.6M sends)
- **Gmail inboxes get ~2x the open rate of Outlook.** Weight/prioritize Gmail addresses higher in sending queues. [#155]
- **Sunday performs as well as Monday** for cold email — an underused, low-competition send window vs the default Monday bias. [#156]

## Organic+paid sprint layered on outbound
- **Connection campaign (60-80/wk) + Thought-Leader ads boosting top posts + signal tracking** to confirm specific target accounts actually saw the content — closes the "algorithm gap" instead of hoping organic reach lands on the right accounts. [#4]

## In-call social proof (objection pre-handling)
- **Drop a case-study link in chat live during discovery:** "We just shipped this. Very similar use case." In-call proof cuts abstraction at the highest-attention moment, no formal asset send required. [#118]

## Source
creator-radar 2026-06; card ids in [#70 #36 #44 #15 #45 #112 #116 #155 #156 #4 #118].

## Creator-radar 2026-10-11
- **Route before you write:** classify every contact into 4-5 tracks (prospect, champion, partner, investor, do not pursue) and block drafting until a track is set, so champions and investors never get cold pitches. [#1651]
- **Hand-test rule:** a campaign must work manually for 25 people before it is automated to 5,000; manual reps reveal the language levers worth templating. [Vacca #1594, Lieben #1467]
- **Audit execution before results:** if the sequence called for 10-15 touches and the rep did 3, stop; no message insight can be drawn from an under-executed sequence. [Reynolds #1907]
- **Counter-view (2026-10-11):** disputes `enrichment` `clay-operations-templates.md` "Slack alerts for hot prospects, speed to lead matters". Contact days beat speed: leads touched on 1/2/3+ distinct days in week one won ~5/11/17% vs 3% untouched, while speed to lead was flat (~7%). Coach for a second and third contact day. [Crawford #1786]
- **No-ask exec note:** after discovery with a buyer's team, a matched-seniority exec (your CEO to their CRO) sends four lines in their language and asks for nothing except "anyone else we should talk to?". [Buonassisi #1899, #1865]
- **Pre-created account reactivation:** (single-case: Atlas Privacy, PLG) reactivate dead leads by pre-creating their account so one click lands inside the product; 8-12.5% of 160,000 converted. [Orbach #2065]

Source: creator-radar review 2026-10-11, cards from Supabase insight_cards.
