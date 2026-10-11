# Swan external takes — campaign-ops (Unvalidated)

## When to load
Only on a request for alternatives, a pushback on a canonical campaign-ops position, or a deliberate second-opinion check (gtm-master SKILL.md step 5). Topics: meeting prep briefs, post-meeting execution (BANT on evidence, follow-up grounding), multi-threading live deals, pipeline hygiene review, executive account briefs, conference selection. Always attribute; never present as gtm-master doctrine.

## Unvalidated — external, not yet run by Jan
> Filed by the Swan radar from third-party skills. Attributed; NOT gtm-master doctrine.
> A bullet moves into the body above only after it has been run in a real campaign and worked.

### Meeting prep
- Brief shape follows meeting type (sales/discovery, partnership, investor, internal...): value positioning only for external commercial types, sales briefs add a "Qualification signals" section, internal meetings skip company research; no type signal in the request = ask, never guess. [alon-goldenberg/meeting-prep]
- Keep a running file per person and company with freshness tiers: <24h offer reuse, <30d load as known facts and research only the delta, >30d full refresh; pass known facts into research threads so they are not re-reported; open items from earlier meetings are the highest-value content of the brief. [alon-goldenberg/meeting-prep]
- Fixed research budget of ~7 searches per attendee in two parallel groups (identity: name+company, LinkedIn site search, "interview OR podcast OR talk"; recency: X past month, github/medium/substack, conference/panel), max 2 page extractions; under 3 hits, drop the date filter and try name variants. [alon-goldenberg/meeting-prep]
- Person identity: search "[first] [last] [invite-email-domain]" on linkedin.com, since the domain disambiguates far better than the name; with several same-name candidates, stop and let the user pick; nothing found = write "could not confirm role, ask for their LinkedIn URL", never "Role Unknown" filler. [alon-goldenberg/meeting-prep]
- Value positioning is grounded or cut: every line reads "They [sourced finding] -> your [capability]"; integration hooks only when confirmed on both sides; a displacement angle needs evidence they use the competitor; omit a reference customer rather than force a weak match. [alon-goldenberg/meeting-prep]

### After the meeting
- BANT scored met/not-met on transcript evidence only (budget = actual budget referenced; authority = decision-maker in the room; need = defined use cases AND stated trial desire; timeline = stated date or compelling event); 2+ of 4 creates a deal RECOMMENDATION with evidence for the owner to accept, never a deal; override below 2/4 needs exec authority in the room + exceptional use-case fit + structural growth pressure, all three. [jeremy-hurst/post-meeting-execution]
- False-history guards: deals are often auto-created when a demo is booked, so an open deal created the same day as the meeting = first touch; CRM meeting engagements count only within 6 months; first-demo date = booking date, never overwritten. A meeting outcome never sets a product-driven trial stage; only the product event does. [jeremy-hurst/post-meeting-execution]
- Follow-up draft grounding: every bullet, link and reference traces to something said or committed in THIS call ("not in the transcript, not in the email"); owner sends from own inbox to keep threading; next step is one line <150 chars and only a hard blocker or path to signature. [jeremy-hurst/post-meeting-execution]
- Resilience: enrichment/CRM/memory write failures are logged and non-blocking (only a missing meeting record blocks); metrics writes get read-after-write with one retry and a visible "manual entry required" on failure; must-happen steps run as their own action so an earlier error cannot silently drop them. [jeremy-hurst/post-meeting-execution]

### Live deals
- Thread thinness on active engagement, not contact count: contacts engaged in the last 30 days, 1 = critical, 2 = thin, 3+ = OK; name the missing committee personas per deal. Default motion = engaged champion's intro; cold direct only when no champion route exists; never cold the economic buyer in a late-stage deal that has a champion. Single-threaded AND silent = stalled-deal revival, not threading. [ido-goldberg/multi-thread-deals]
- Pipeline review flags with cheap evidence: stalled = no activity >21 days (respect per-stage SLAs), regressed stage, <3 distinct contacts in 30 days, champion gone, amount missing late-stage, close date past or >90 days out on a this-quarter deal. One action per flag, lightest first; fresh-signal lookup only for flagged deals; cap at 10-15 recommendations per review ("bigger lists won't get acted on"); approval before any CRM task. [ido-goldberg/pipeline-review]
- Executive account brief, one page: 3-sentence picture (what they want, why now, why us); committee with one-word sentiment backed by a quote or behaviour, never invented; where we are; 3-5 risks each cited to a source; explicit asks ("a brief without an ask is a status update"). Empty section says "no current risk"; CRM-vs-reality gaps are findings. [ido-goldberg/brief]

### Events
- Conference scoring 100 + bonus: relevance 40, decision-maker accessibility 40 (density and structural reach: meeting infrastructure, side events), engagement mode 20; +10 only for organizer-run matchmaking (hosted buyers, curated 1:1s), not self-serve apps. P1 >=80, P2 70-79, P3 excluded. Budget noted, never scored. [dave-engel/conference-recommendation]
- Lock buyer position first: selling to marketing/sales = booth-driven, score the exhibitor floor; selling to CISO/CFO/engineering = audience-driven, score session tracks. Fight famous-event bias by searching six categories (flagship, vertical, regional, free one-day vendor events, emerging years 1-3, side events); a list that would fit another client too is too generic. Recalibrate on actual buyer-conversation yield per event. [dave-engel/conference-recommendation]

## Source
swan-gtm/gtm-skills (alon-goldenberg, jeremy-hurst, ido-goldberg, dave-engel) · MIT · filed 2026-07-28 / 2026-09-28 · reviewed 2026-10-01
