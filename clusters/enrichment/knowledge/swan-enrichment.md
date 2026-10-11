# Swan external takes — enrichment (Unvalidated)

## When to load
Only on a request for alternatives, a pushback on a canonical enrichment position, or a deliberate second-opinion check (gtm-master SKILL.md step 5). Topics: single-account research briefs, research depth and stop rules, motion and tech-stack detection, evidence labelling. Always attribute; never present as gtm-master doctrine.

## Unvalidated — external, not yet run by Jan
> Filed by the Swan radar from third-party skills. Attributed; NOT gtm-master doctrine.
> A bullet moves into the body above only after it has been run in a real campaign and worked.

### Single-account briefs
- Seller-ready account brief built around evidence, not description: strategic priorities stated specifically with evidence ("'Grow revenue' is not a priority; 'scale Salesforce-led CX delivery into packaged offers' is"), opportunities mapped to them with fit rating (natural / stretch / discovery-needed), a committee map with a role per person (economic buyer / champion / technical / user / blocker, with why), discovery questions that cannot be answered by a Google search, and next actions naming person, asset, why now and timing. Quick mode = summary, committee, questions, actions only; the mode is always announced. [katya-tarapovskaia/account-intelligence-analyst]
- Calibrated confidence: confirmed signals (press release, job post, filing) as fact, inferred ones (content themes, hiring patterns) as inference, speculation labelled hypothesis, gaps stated plainly ("no public financial data found"); poor fit called honestly. [katya-tarapovskaia/account-intelligence-analyst]
- Uploaded third-party research (Humantic, Clay/Apollo exports) is the richest input but is cross-checked against live data, especially contracts, financials and people, because such reports conflate similarly named companies and carry outdated signals; add an analysis layer, never just reformat. [katya-tarapovskaia/account-intelligence-analyst]
- Data order: connected tools first without asking (company enrichment, contacts by committee titles, CRM), then uploaded files read in full, then ask the user last and only for target, offer, relationship context and the meeting; CRM status (net-new vs in pipeline) always goes in the summary because it changes the whole approach. [katya-tarapovskaia/account-intelligence-analyst]
- Positioning pillars: cluster the company's own description, tagline and specialities into 3-6 named themes, each citing the exact source phrase, so the AE can describe the buyer the way they describe themselves. [amir-baldiga/account-research-brief]
- Cost gate before pulling people data: confirm target titles and the number of employee records with the requester first; skipping it turns a routine brief into a surprise bill. [amir-baldiga/account-research-brief]
- Hiring as direction-of-spend: recent joiners grouped by function show where budget is moving ("four engineers, no marketers last quarter"); a null result is a finding too ("no leadership changes in twelve months"). [amir-baldiga/account-research-brief]
- One run, two outputs: structured data for the next automation step and a short human brief for the AE, because they have different readers and lifespans. [amir-baldiga/account-research-brief]

### Research method
- Route each research ask to ONE primary facet (Company default / Person / AccountTeam / GTM motion / News 30d / Domain / Financial / TechStack / CompetitorMentions). Depth from the phrasing: a 3-5 line brief is the default; a dossier only on explicit depth cues or stakes (board prep, founder intro, exec outreach). Over-researching is the most common failure. [ido-goldberg/research]
- Stop rules: person research stops after 2 empty web fetches (low public profile is itself the finding); a prior brief under 30 days old is the base and only stale parts refresh; "what they do" = homepage H1 + subhead + first product section + top CTA in one sentence, max two fetches. [ido-goldberg/research]
- Provenance: every claim cites its source inline (tool, URL or CRM record); soft numbers carry "est"/"looks like" (headcount x industry average stated as revenue is the named failure); lede first; synthesize, never dump raw payloads; write durable facts (motion, financial state, stack, ICP fit) back to the company record so the next play inherits them. [ido-goldberg/research]
- Motion fingerprint: pricing page = motion (free/trial up front = PLG; no public pricing = enterprise sales-led); job posts reveal the rep org (SDR/BDR + AE openings = outbound + inbound; partner managers = indirect); mixed evidence is reported as mixed, never force-fit. [ido-goldberg/research]
- Tech-stack evidence ladder: existing records -> CRM properties -> job postings (best public signal) -> site script tags and embedded tools -> engineering posts -> paid enrichment last; cite a source per tool; scan only the 2-3 stack categories the play needs. Competitor mentions: build the alias list first, classify mentions (switching / pain / comparison / reference / noise), and read <=3-star reviews from the last 90 days as switch-ready prospects. [ido-goldberg/research]

## Source
github.com/swan-gtm/gtm-skills (MIT). Promoted from `_external-takes/swan-enrichment.md` at /creator-radar-review 2026-10-01.
