# External takes — icp (ColdIQ radar, UNREVIEWED)

## ICP Definer — l3mpire/claude-skills/icp-definer  ·  filed 2026-07-13
Source: https://github.com/l3mpire/claude-skills · cluster: icp
- ✅ supports [icp/tasks/build-icp.md narrowing rule]: trigger/pain-based ICP beats demographics ("Series A SaaS hiring first SDR, using HubSpot" > "tech startups"); narrow via funding-stage + specific trigger + buyer-role until actionable.
- 🆕 new-angle: quantified list-building test — a valid ICP resolves to 500-5,000 LinkedIn/Apollo contacts; "millions" = too broad, "dozens" = over-narrowed. gtm-master build-icp says "narrow until 3 verticals/signals" but gives no contact-count band.
- 🆕 new-angle: ICP scoring matrix (1-5 each, max 20) — pain intensity, budget authority, reachability, timing/urgency — to rank 3-5 hypotheses, then build full cards for the top 2 only. (Same rubric the Persona Definer applies at contact level.)
Status: holding

## Lead Research Assistant — ComposioHQ/awesome-claude-skills/lead-research-assistant  ·  filed 2026-07-20
Source: https://github.com/ComposioHQ/awesome-claude-skills · cluster: icp
- 🆕 new-angle: derives the ICP from the user's own CODEBASE (reads the repo/product to infer value prop and problems solved) before defining targets. gtm-master's build-icp starts from customers, wins, and market hypotheses; product-artifact-as-ICP-input is a dev-tools motion it doesn't cover.
- 🆕 new-angle: GitHub repository activity used as a qualification signal alongside job posts, tech stack, and funding. Not present in gtm-master's signal inventory.
- 🆕 new-angle: flat 1-10 priority score across five factors (ICP alignment, evidence of immediate need, budget-availability indicators, competitive positioning, timing signals). This is a THIRD scoring scheme next to gtm-master's two — validate-against-icp's 4-dimension /12 fit score and lead-scoring's 100-point model. Redundant rather than contradictory; if promoted, reconcile to one rubric instead of adding a third.
- 🆕 new-angle: per-lead output bundles the research WITH the outreach starter — fit rationale, target contact role, personalized value prop, conversation starters grounded in company context, LinkedIn URL — as a single artifact. gtm-master keeps research (icp) and copy (cold-email) as separate cluster outputs.
- ✅ supports [icp/tasks/validate-against-icp.md]: fit must carry a written justification per company, not a bare score; timing/recent-announcement evidence is a scored input, not a tiebreak.
- ⚠️ contradicts [icp/tasks/validate-against-icp.md:23,53 negative ICP]: this skill has NO disqualifier concept — nothing can veto a high score. gtm-master is explicit that "a 10/12 fit with a disqualifier is still a skip". Both sides — gtm-master: negative-ICP triggers are an automatic skip regardless of score; Lead Research Assistant: score is the sole gate, so a well-scoring bad-fit account passes.
Status: holding
