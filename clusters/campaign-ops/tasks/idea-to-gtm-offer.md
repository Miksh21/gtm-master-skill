# Task: Idea to GTM and Offer (Keller method)

Turn any idea, product or client into a GTM plan and a first cold offer: research → business problem → relevancy strategy → audience → timing signals → angles → email → feedback loop. Works the same for a client's product and for our own new-company idea (then "the company" = us).

> Source: Mitchell Keller (LeadGrow), filed 2026-11-03 at Jan's request as a reusable procedure.
> [keller-live] "Building a Random Y Combinator Company An Outbound Strategy Without AI (LIVE)" youtube.com/watch?v=CjJH7fpCg-g (2026-09-14, 55 min; worked example Vorelios, physics foundation model for aerospace) ·
> [keller-psych] "The Psychology Behind Generating $726K With Boring Cold Emails" youtu.be/ULU0CCE-5Io (2026-08-12; worked example coherence, netcode for Unity studios, 14% reply, acquisition) ·
> [keller-27] "Brutally Ranking 27 Outbound Offers" youtube.com/watch?v=KsZo0G0Vx_U (already digested in `clusters/cold-email/knowledge/offer-design-keller.md`).

## When to use this
"Make a GTM for this idea", "how would we sell X", "which of these business ideas can we scale through outbound", "build the outbound strategy for <client/product>", "z nápadu GTM a offer", new-client kickoff before any list or copy.
Not for: a single email on a known offer (`cold-email/tasks/write-first-email.md`), ranking offer types only (`offer-design-keller.md`).

## Inputs
- The idea or company: homepage / pitch / one paragraph.
- Who can deliver what (team, capacity), and the deal size or lifetime value of one customer.
- Optional: existing customers, sales call notes, replies.

## Process

### Phase 1. Research prompt (one AI run, then read it yourself) [keller-live]
Run one research prompt that returns a document with these sections, each with source links:
1. Value proposition from homepage, founder research and PR; fill gaps with domain-level research.
2. Target industries and personas inferred from evidence.
3. Market maturity: old way vs new way, are people already buying something, why the new way is better.
4. **Real problems in prospect language**, from reviews (G2, GetApp, Capterra), forums, subreddits, alternatives pages; quote them with links.
5. Alternatives and competitor battle cards (search "alternatives to X"): where we win, where we lose.
6. **Insider language**: the terms only this market uses. This is the ONLY place to break the plain, low reading-level style.
7. Public databases and directories that list the market (registries, certification lists, industry directories).
8. Live RFPs / tenders / solicitations, awards (who already got funded), other public signals.
Then read it like an operator: Google the terms you do not understand (Keller: "understand the idea yourself instead of having AI make these decisions"). Mark the superseded version; re-run the prompt if a section is missing.

### Phase 2. Find the business problem [keller-live]
- Distil a time-saving pitch into a **make-money outcome** (faster design → win the contract, not "save hours").
- Ask: what is the **most expensive segment of the job**, and what positive downstream outcome makes them money if you remove it or reach it faster?
- Where does the pressure come from (buyers, regulators, internal)?
- List **pre-objection handles** the buyer will raise before the call (data security: "we store nothing, SOC 2"; "do I need new hardware/software?": "no, plugs into your current workflow"). These become "without" statements.
- **Trust gap check**: no case studies yet? Build proof without them: a benchmark on a public dataset, a test on their legacy data under NDA, a short demo of the product doing the job. "Can we show the product in an email?"

### Phase 3. Relevancy strategy: sound like an insider [keller-live]
- Decide what per-company research makes each email relevant (what they make, design only vs design and manufacture, which components, which certifications).
- Write how you will find each fact (ISO/certification on site, key language, directory listings).
- Turn each fact into a specific claim ("measures X based on <insider metric> in minutes"). This is worldview alignment from `offer-design-keller.md` §2.
- **Segment by what they do (types of products, parts, customers) before persona.** Persona-level pain comes only after a segment and an offer are proven.

### Phase 4. Build the audience [keller-live] [keller-psych]
- **Roles only they would have**: search people by a title or keyword that exists only inside the ICP (e.g. CFD engineer), narrow by role to cut noise, then reverse-engineer the companies those people work at.
- Exclude obvious noise (freelance marketplaces, schools, vendors).
- Lookalikes from 3-10 reference companies (DiscoLike or similar) once seeds exist; lookalikes of the client's customers if known.
- **Scrape public directories** (industry directories, certification registers, trade-show exhibitor lists). When no database covers the market, building it IS the edge (coherence: names pulled from game credits).
- Qualify each company on its website with an AI prompt: R&D / design keywords, certifications, components, team structure (e.g. has aerodynamicists). See `enrichment/knowledge/prompts/qualification-prompt-framework.md`.

### Phase 5. Timing signals [keller-live]
- Tenders / RFPs (gov APIs, procurement portals) prioritised by the hardest components or the biggest pain.
- Company filings (annual reports, SEC/EDGAR, registry filings) for stated goals; condense with AI.
- Hiring patterns from careers pages (ATS like Ashby/Greenhouse): roles that imply the pain (e.g. validation engineers offshore).
- Patents, certifications, grants, awards.
- Each signal becomes its own campaign; signal campaigns can run on a scrape cadence nearly autonomously once the messaging is defined. Map with `signals/tasks/map-signals-to-icp.md`.

### Phase 6. Campaign angles as snippets [keller-live]
Keep a snippet bank per campaign, then assemble emails from it:
- **Signal snippet** (usually the hook; put a specific signal in the subject line; generic signals like "hiring" stay out of the subject).
- **Segment line**: the one sentence you swap per sub-segment.
- **Unique mechanism**: why the outcome is possible (no workflow change, plugs into your loop, one model across disciplines).
- **Outcome**: a business outcome, then make it "punchy": "bring time to working <prototype> down to days without changing your current workflow".
- **Offer** (pick the type from `offer-design-keller.md` §5; intro offer for strangers, §4).
- **PS proof** (benchmark, recognisable peer, dataset result with a number).
Subject lines should read like an internal email from their manager ("FEM validation timeline"). Specific component or term > generic benefit.

### Phase 7. Write the email [keller-live]
Rules: reads like an internal email; includes social proof; speaks their language; written like you talk in a bar; **SSS = specific problem, specific person, specific way**.
Shape: question on their specific process → the current workaround and why it fails for them → who we are + mechanism + outcome + "without" statement → low-friction CTA ("No need for a call, can I share the benchmark?") → PS proof.
Offer ladder across the sequence: email 1 share a benchmark/asset; email 2 run it on one old piece of their own data under NDA and show a direct comparison; then a short demo of the product doing the job. Run the readability check, then `cold-email/knowledge/human-voice.md` and `cold-email/tasks/stress-test-sequence.md`.

### Phase 8. Psychology layer (apply to every offer) [keller-psych]
1. **Reciprocity**: give something useful before asking. For high ticket, give away expensive work (free prototype). Size it: what one customer is worth over their lifetime vs what the free work costs; a tiny market plus a big contract value is what makes the math work.
2. **Scarcity as a qualification gate said out loud**: "before we do this, we check whether it is worth it for you first". Reject non-fits for real; it protects delivery capacity and raises perceived value.
3. **Conformity proof**: name a peer or product they recognise; instead of a PDF case study, host a teardown near the industry's event and invite peers; reuse the closed session ("limited slots next month") to re-engage old leads.
4. **Hidden veto**: when deals stall after a good first call with polite reasons (budget, timing, next quarter), find the silent blocker (coherence: the publisher, not the studio) and build a second offer aimed at that person.

### Phase 9. Feedback loop [keller-live]
After launch: which signal triggered the positive replies → that becomes the next campaign. Extracted objections → new "without" statements, pre-objection handles, or the step-2 email. Mine technologies from job posts to position against competitors and update segment lines. Test what the market cares about (idle time vs downtime vs scrap rate) instead of guessing. Feeds `campaign-ops/tasks/analyze-replies.md` and `tier-campaigns.md`.

## Variant: scoring several business ideas (new-company mode)
Run Phases 1-2 lightly per idea, then score each on: public list of the target exists (registry, directory) / public timing signal exists / an intro offer can carry finished work in email 1 / delivery can be mostly automated by the actual team / recurring revenue / exit path (PE buys EBITDA or ARR multiples; buy-and-build in a fragmented market raises the multiple). Pick one, run a 4-week test with an explicit go/no-go reply and payment threshold. Worked example: `~/clients/growth/work/nova-firma-napady/navrhy.md` (2026-11-03).

## Output format
One doc per idea/client: research summary with links → business problem + pre-objection handles + trust asset → relevancy strategy → audience sources and qualification rules → signals → snippet bank → email 1 draft + offer ladder → test plan and feedback metrics.

## Pass criteria
- Every claim in copy has a mechanism and an insider fact behind it.
- Audience is built from at least one source competitors cannot buy off the shelf (`signals/knowledge/go-to-market-alpha.md`).
- The offer is one specific result, not the whole service; a qualification gate is stated.
- Trust gap is closed by an asset that exists today.
- Client rules (e.g. a value-CTA ban) override any offer type here.

## What to do after
`icp/tasks/build-icp.md` (formalise) → `list-building/tasks/build-prospect-list.md` → `cold-email/tasks/write-first-email.md` → `cold-email/tasks/stress-test-sequence.md` → `campaign-ops/tasks/setup-campaign-platform.md`.
