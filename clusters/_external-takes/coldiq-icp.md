# External takes — icp (ColdIQ radar, UNREVIEWED)

## ICP Definer — l3mpire/claude-skills/icp-definer  ·  filed 2026-07-13
Source: https://github.com/l3mpire/claude-skills · cluster: icp
- ✅ supports [icp/tasks/build-icp.md narrowing rule]: trigger/pain-based ICP beats demographics ("Series A SaaS hiring first SDR, using HubSpot" > "tech startups"); narrow via funding-stage + specific trigger + buyer-role until actionable.
- 🆕 new-angle: quantified list-building test — a valid ICP resolves to 500-5,000 LinkedIn/Apollo contacts; "millions" = too broad, "dozens" = over-narrowed. gtm-master build-icp says "narrow until 3 verticals/signals" but gives no contact-count band.
- 🆕 new-angle: ICP scoring matrix (1-5 each, max 20) — pain intensity, budget authority, reachability, timing/urgency — to rank 3-5 hypotheses, then build full cards for the top 2 only. (Same rubric the Persona Definer applies at contact level.)
Review: additive
Status: holding

## Lead Research Assistant — ComposioHQ/awesome-claude-skills/lead-research-assistant  ·  filed 2026-07-20
Source: https://github.com/ComposioHQ/awesome-claude-skills · cluster: icp
- 🆕 new-angle: derives the ICP from the user's own CODEBASE (reads the repo/product to infer value prop and problems solved) before defining targets. gtm-master's build-icp starts from customers, wins, and market hypotheses; product-artifact-as-ICP-input is a dev-tools motion it doesn't cover.
- 🆕 new-angle: GitHub repository activity used as a qualification signal alongside job posts, tech stack, and funding. Not present in gtm-master's signal inventory.
- 🆕 new-angle: flat 1-10 priority score across five factors (ICP alignment, evidence of immediate need, budget-availability indicators, competitive positioning, timing signals). This is a THIRD scoring scheme next to gtm-master's two — validate-against-icp's 4-dimension /12 fit score and lead-scoring's 100-point model. Redundant rather than contradictory; if promoted, reconcile to one rubric instead of adding a third.
- 🆕 new-angle: per-lead output bundles the research WITH the outreach starter — fit rationale, target contact role, personalized value prop, conversation starters grounded in company context, LinkedIn URL — as a single artifact. gtm-master keeps research (icp) and copy (cold-email) as separate cluster outputs.
- ✅ supports [icp/tasks/validate-against-icp.md]: fit must carry a written justification per company, not a bare score; timing/recent-announcement evidence is a scored input, not a tiebreak.
- ⚠️ contradicts [icp/tasks/validate-against-icp.md:23,53 negative ICP]: this skill has NO disqualifier concept — nothing can veto a high score. gtm-master is explicit that "a 10/12 fit with a disqualifier is still a skip". Both sides — gtm-master: negative-ICP triggers are an automatic skip regardless of score; Lead Research Assistant: score is the sole gate, so a well-scoring bad-fit account passes.
Review: contradicts
Status: holding

## Deep Company Analyser — l3mpire/claude-skills/deep-company-analyser  ·  filed 2026-07-31
Source: https://github.com/l3mpire/claude-skills · cluster: icp
- 🆕 new-angle: runs BEFORE ICP/persona definition and derives the ICP from the seller's own customer evidence — case studies, G2/Capterra/TrustRadius reviews, website — rather than from market hypotheses. Explicit source-quality hierarchy: verbatim customer quotes > customer-generated metrics > company website claims > competitor mentions in reviews; **when sources conflict, trust customer voices over company marketing.** gtm-master's build-icp starts from won customers and market hypotheses but specifies no review-mining step and no conflict rule.
- 🆕 new-angle: 4-layer pain ladder — surface ("outreach was manual") → business ("2% reply rates, empty pipeline") → personal ("working weekends and still missing quota") → career ("I was about to lose my job") — each ranked with a severity X/10 AND a frequency % (share of case studies/reviews mentioning it). gtm-master ranks pain qualitatively per persona; frequency-weighted evidence is not part of it.
- 🆕 new-angle: "customer language library" as a named deliverable — pain / outcome / emotional ("finally", "lifesaver") / comparison phrasing lifted verbatim for reuse in copy, plus a "last straw" quote bank capturing the trigger moment that ended the status quo. Wires icp research directly into cold-email personalization inputs.
- 🆕 new-angle: failed-alternatives table (what they tried before, why it failed, verbatim quote) and a mandatory honest acknowledged-weaknesses section pulled from review cons, flagged deal-breaker vs minor — used for competitive positioning and objection pre-handling. gtm-master's icp cluster has no competitive or loss-side artifact.
- ✅ supports [icp/tasks/build-icp.md + validate-against-icp.md]: the trigger moment ("what made them finally look for a solution") is the ICP-defining variable, not firmographics; every insight must carry a verbatim source; metrics quoted as ranges with source counts, never "improved"; the output must be usable by a rep to write a personalized cold email the same day.
Review: additive
Status: holding

## Account Research — explorium-ai/gtm-skills#account-research  ·  filed 2026-09-14
Source: https://github.com/explorium-ai/gtm-skills (`skills/account-research/SKILL.md`) · cluster: icp
Note: produces a purpose-anchored company brief (TL;DR, snapshot, funding, workforce, tech, events, peer cohort), not a fit score — overlaps `icp/tasks/validate-against-icp.md` on the research step, not the verdict. Vendor-steered (Explorium enrichment names), but the verification rules are tool-agnostic.
- 🆕 new-angle: **anchor every brief on a stated purpose** and let it pick the enrichment bundle — Tier A spine always (firmographics, hierarchies, funding, workforce trends, LinkedIn posts, 90-day events); Tier B by purpose: competitive eval → technographics / webstack / competitive landscape; QBR or renewal → ratings / challenges / strategic insights; cold outbound → website changes + website keywords tied to your offering; investor / M&A → financial metrics. Anything skipped or null is printed as a one-line note inside its section so the reader can tell absent data from absent investigation.
- 🆕 new-angle: **shell-entity sanity check on company match** — if a major-brand input resolves to 1-50 employees and a "Corporate Managing Offices" category, the match routed to a holding shell; retry on the alternate domain / name string, and surface ambiguity instead of guessing. Extends `validate-against-icp.md:51` ("public website often understates team size") to the data-vendor side.
- 🆕 new-angle: **per-event cross-attribution verification is non-optional** — industry-wide headlines get attributed to every company in the sector; tag each event "target named in headline" / "target inferred from body" / "industry-wide: excluded", list the excluded count in a trailer, and treat business events as canonical over the funding enrichment when they show a more recent round (flag the enrichment lag).
- 🆕 new-angle: **peer cohort rules** — derive the sub-category from the brief purpose, not the industry label (a "Software Development" label routes Google/Amazon into a small-tech cohort); manually include any competitor named in the prompt even if filters exclude it, labelled as such; **suppress the table under 5 confident matches** and replace it with a recommendation line. gtm-master's only lookalike guidance is a tool pointer (Ocean.io) in `list-building/knowledge/templates/qualification-workflow.md:147,154`.
- 🆕 new-angle: **data-freshness caveats by source class** — filings-derived "challenges / strategic insights" are null for private companies and 12-18 months stale for public ones; current state must come from events, funding, workforce trends and LinkedIn posts. For public companies the funding section leads with ticker + one-line financial posture (verify-tagged) instead of a raise history.
- ✅ supports [`clusters/signals/tasks/score-multi-signal.md` stacking]: "new CTO + webstack change + engineering hiring = a clear timing signal" — cross-referencing signals is the synthesis step, and the TL;DR must answer "why this brief, now".
Review: additive
Status: holding
