# Swan external takes — icp (Unvalidated)

## When to load
Only on a request for alternatives, a pushback on a canonical ICP position, or a deliberate second-opinion check (gtm-master SKILL.md step 5). Topics: competitor positioning teardowns, intent overlay on ICP scores, category-of-one positioning, ICP refinement from closed deals, person-level lookalike expansion. Always attribute; never present as gtm-master doctrine.

## Unvalidated — external, not yet run by Jan
> Filed by the Swan radar from third-party skills. Attributed; NOT gtm-master doctrine.
> A bullet moves into the body above only after it has been run in a real campaign and worked.

### Competitor positioning
- Map a competitor's site structure before reading copy (sitemap/crawl up to ~200 URLs): no public pricing page = sales-led/enterprise motion, no blog = not competing on content, a docs. subdomain = developer audience whatever the homepage says; structural changes (pricing page removed, new /enterprise path) show strategy before the blog does. [alon-goldenberg/competitor-positioning]
- Capture your own homepage/features/pricing the same way and put your company as a row in the messaging matrix (Tagline, Primary CTA, Value Props, Target Audience, Pricing Model); without it the comparison collapses into a list. Unextractable page = "page not accessible", never guessed. [alon-goldenberg/competitor-positioning]
- Store competitor copy verbatim with source URL or not at all; keep one snapshot per competitor with an append-only dated History (including "no changes detected") so "when did they pivot?" is answerable; an inaccessible page keeps its prior value marked "not re-verified [date]", never blanked. [alon-goldenberg/competitor-positioning]
- Positioning white space is an absence claim: only state it after a full per-competitor pass. Keep positioning snapshots and business signals (funding, hiring) in separate but cross-linked files, because a raise often explains a messaging shift. [alon-goldenberg/competitor-positioning]
- A battlecard built on a snapshot older than 14 days first triggers a refresh of that one competitor; every recommended action names the competitor claim and the counter-move; more than 4 competitors = group by category and let the user choose scope. [alon-goldenberg/competitor-positioning]

### Scoring and refinement
- Dynamic intent overlay on the static 100-pt ICP score: +10-20 for strong first-party intent (site visits, pricing views, downloads), +5-10 for second/third-party (G2/TrustRadius > Bombora/6sense > LinkedIn-native), so a 65 (Tier C) can move to 75-85 (Tier B). Keep gtm-master's backtest before trusting the base score. [alex-vacca/list-architect]
- ICP refinement floors: never refine on fewer than 10 closed deals; propose 3-5 changes max (more than 5 = re-discovery, not refinement); never rewrite on one contrarian quarter; "no meaningful drift, the ICP holds" is a valid output, and inventing changes to look productive is failure #1. [ido-goldberg/icp]
- Each proposed change cites its win/loss pattern in one line ("tighten to 50-300: wins concentrate there, losses spike above 500"), scanned across five drift classes: too wide, too narrow, missing exclusion, new segment (a wins cluster fitting no segment), persona drift (actual signers diverging from saved personas). [ido-goldberg/icp]
- Personas are refined in the same pass from who actually signed won deals; >20% of deal companies missing firmographics is flagged as a caveat, not enriched away; without a CRM, work from the user's last 5-10 named wins/losses or say refinement is not possible yet. [ido-goldberg/icp]

### Category-of-one positioning
- Diagnose interchangeability with a banned-language list: collect how the user and closest competitors describe themselves, list every shared phrase, ban all of it; bank the user's own raw phrasing word for word instead of polishing it. [luke-shalom/category-of-one-positioning]
- The brokenness interview cannot be skipped: per industry pain, capture verbatim what is broken (with examples), why (cause under the symptom) and what the fix is; skipping it yields a clever tagline that is the old positioning in new words. Never invent the ICP: ask and wait. [luke-shalom/category-of-one-positioning]
- Old way vs new way reframe built from the interview (old way / why it quietly fails / what replaces it); test: the ICP recognises their situation in the old way, and every interchangeable competitor now looks like the old way. Position against the old way, never a named competitor. [luke-shalom/category-of-one-positioning]
- Mechanism before result: map the real step-by-step process before stating the outcome, package it as named IP with one real proof point per step; a new way with no visible mechanism is just a claim. [luke-shalom/category-of-one-positioning]
- Category language test: 5-10 candidate names for problem, mechanism and outcome; keep only phrases that work in a post, a DM and a call without explanation. [luke-shalom/category-of-one-positioning]

### Person-level lookalikes
- Two searches answer two questions: title + employer finds peers inside the same company (committee mapping, expansion in a won account); title only, optionally with geography, finds the same role across the market (net-new list), and needs the employer filter dropped or it returns nothing. [amir-baldiga/icp-lookalike-expansion]
- Build the signature from the seed's CURRENT title and employer, not the headline ("often aspirational or stale"); search the short core role ("Chief executive officer" returns rows, "CEO & Founder | Investor | Speaker" returns zero). [amir-baldiga/icp-lookalike-expansion]
- Recursion depth is a cost dial: depth 1 = seed only, depth 2 = re-search from each found profile (dozens of lookups), depth 3 = hundreds; branch on the top ~10 at most and confirm spend before depth 3; keep one seen-set for the whole run and drop the seed from its own results. [amir-baldiga/icp-lookalike-expansion]
- Widen or tighten one filter at a time: exact title + all skills + city returns zero, which reads as "no market" when the query is just over-narrowed; loosen in order (drop employer, shorten title, remove geo) and log which loosening produced the hit. Output a flat list with the source seed per row. [amir-baldiga/icp-lookalike-expansion]

## Source
github.com/swan-gtm/gtm-skills (MIT). Promoted from `_external-takes/swan-icp.md` at /creator-radar-review 2026-10-01.
