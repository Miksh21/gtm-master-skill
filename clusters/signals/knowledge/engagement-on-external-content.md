# Engagement-on-External-Content Signal Class

A meta-pattern: harvest people who **publicly engage** with content that isn't yours but matches your category. The engagers are pre-qualified by category interest — they've self-declared.

This isn't one play. It's a *class* of plays with 6 specific surfaces.

## When to load

- "What's the highest-leverage signal source we're not using?"
- "We have no signal data — where do we start?"
- "How do we operationalize 'people engaging with [competitor / influencer / our content]'?"
- Building cold-list ICP-aligned signal layer when you don't have first-party intent data yet

---

**Visual references for the workflow pattern (all share the same skeleton):**
- `visual-library/the-customer-alumni-play.md` — closed-won → past employees → qualify new company → score → 3-tier routing
- `visual-library/the-founder-connections-playbook.md` — export LinkedIn connections → qualify → 3-tier
- `visual-library/linkedin-brand-mentions-outbound-playbook.md` — brand mention engagers tree
- `visual-library/scrape-influencers-linkedin-engagement-playbook.md` — influencer engagement
- `visual-library/track-your-employees-linkedin-engagement-playbook.md` — multi-employee LinkedIn signals (Connections + Impressions + Engagement)

All five visualize the same pattern in different sources. Load any one via Read tool to see the canonical Workflows.io flowchart structure.

## The unifying principle

**Public engagement = pre-qualified intent.** The person publicly associated themselves with category-relevant content. That's a stronger signal than firmographic match alone.

Tiered by intent strength:
1. **Like** — minimal weight, often passive
2. **Comment** — much higher weight (they took the time to write)
3. **Repost / Share** — highest weight (public endorsement)

Plus: even passive **following** of category accounts is a self-selected category interest signal.

---

## The 6 surfaces

### Surface 1 — Competitor LinkedIn company page followers
- **Mechanism:** Apify (LinkedIn company-page follower scraper) → followers of competitor pages.
- **Why it works:** Self-selected category interest. They cared enough to click "follow" on a competitor's brand.
- **Source:** Workflow 6 (Competitor Company Page Followers Playbook).

### Surface 2 — Brand mention engagement (in LinkedIn posts)
- **Mechanism:** Clay captures posts mentioning your brand keywords (company name + product + variations + misspellings) → enriches the **engagers** on those posts (likers, commenters, reposters), not just the original poster.
- **Why it works:** The original poster is the obvious lead; the engagers are the hidden value — they're publicly associating with your brand.
- **Source:** Workflow 15 (LinkedIn Brand Mentions Outbound Playbook).

### Surface 3 — Influencer post engagement + influencer connections
- **Mechanism:** Trigify monitors influencer posts → captures engagers. Sales Nav + Findymail scrape influencer's connections.
- **Why it works:** Influencer audiences are pre-qualified by category interest. Active engagement layers a second signal on top.
- **Engagement-type tiering:** Score Tier 1/2/3 by engagement type (comments > reposts > likes) + influencer relevance + company fit.
- **Source:** Workflow 27 (Scrape Influencers' LinkedIn Engagement Playbook).

### Surface 4 — Buyer-language keyword monitoring (social listening)
- **Mechanism:** Pick 5-10 keywords — category terms ("workflow automation"), competitor names ("Clay", "Apollo", "HubSpot sequences"), buyer-pain phrases ("go-to-market ops"). Clay + Trigify monitor LinkedIn for posts matching. RB2B captures engagers.
- **Why it works:** Buyers using *their own words* to describe pain is the highest-conviction signal in this class. They've articulated the problem your product solves.
- **Filter:** Commenters only (higher intent than likers). Last 14 days (recency).
- **Reported benchmark:** 3-6x reply rate vs cold list outbound.
- **Source:** Workflow 34 + Blog 16 (The Social Listening Playbook).

### Surface 5 — Engagement on YOUR OWN content
- **Mechanism:** Trigify (engagement: likes/comments/reposts) + Teamfluence (profile visits) on YOUR posts → all signals into Clay → enrich + AI qualify.
- **Why it works:** Even higher conviction than Surfaces 1-4 — the engager consumed YOUR specific content. They're the highest-intent layer.
- **Routing nuance:** Tier 1 engagers route to **cold-calling** via BetterContact (not just email/LinkedIn), because the person already recognizes you — the call interrupts in a warm way.
- **Source:** Workflow 32 (The LinkedIn Content Engagement Playbook).

### Surface 6 — Cross-team employee engagement
- **Mechanism:** Surface 5 but scaled across ALL employees, not just C-level/founder. Export each team member's LinkedIn connections + Teamfluence profile visits + Trigify post engagement → three Clay tables (Connections / Impressions / Engagement).
- **Why it works:** 10x signal surface area. 10 employees × LinkedIn activity = 10x the signal volume of just the founder.
- **Source:** Workflow 35 (Track Your Employees' LinkedIn Engagement Playbook).

---

## Composite scoring across surfaces

When the same person appears on multiple surfaces, stack the score:

| Combination | Inferred intent |
|---|---|
| Follower of competitor + engager on your content | High — actively comparing vendors |
| Brand mention engager + buyer-keyword commenter | Very High — articulating pain + associating with you |
| Employee LinkedIn visit + influencer-post commenter | Medium-High — researching the category |
| Influencer connection + brand mention reposter | High — category insider |

This is the same pattern as multi-signal stacking in `signal-scoring.md`, applied to this signal class.

---

## Shared mechanics across all 6 surfaces

### Tools
- **Apify** — LinkedIn company-page follower scrape (Surface 1)
- **Trigify** — engagement monitoring on LinkedIn posts (Surfaces 2, 3, 5)
- **Jungler** — LinkedIn engagement intelligence (similar role to Trigify)
- **Teamfluence** — profile-visit tracking (Surfaces 5, 6)
- **RB2B** — engagement capture (Surface 4)
- **Sales Nav + Findymail** — connection scraping (Surface 3)
- **Clay** — orchestration table for all surfaces
- **Findymail / BetterContact** — enrichment + verification
- **Instantly + HeyReach** — activation (email + LinkedIn)

### Workflow skeleton (all 6 surfaces share this)
```
1. Capture engagers from the surface
2. Route to Clay (one table per surface, or unified with source-tag column)
3. Enrich company + contact (industry, size, role, seniority)
4. AI qualify in Clay (ChatGPT 4o-mini): company fit + role + ICP + existing customer check
5. Score by engagement type + frequency + company fit → Tier 1/2/3
6. Tier 1 → multi-channel high-touch (cold call for Surface 5, manual outreach for others)
7. Tier 2/3 → automated Instantly + HeyReach
```

### Filter discipline
- **Commenters > likers > reposters** (in intent ranking, though all three are valuable)
- **Recency:** last 14 days is the standard window (longer = stale, shorter = thin data)
- **Existing customer check** — strip current clients before activating outreach (HubSpot lookup)
- **Closed-lost check** — also strip closed-lost deals (already shown disinterest)

---

## What this class is NOT

- **Not** a substitute for first-party signals (website deanon, product usage). Those are higher-conviction.
- **Not** the same as content marketing (that's distribution; this is intent capture).
- **Not** a replacement for outbound to cold lists — it's a layer ON TOP of cold outbound, capturing the ~5-10% of ICP showing live signal.

Use this class to *augment* your signal architecture, not replace cold outbound entirely.

---

## Cross-references

- Signal architecture (where this class fits): `clusters/signals/knowledge/signal-activation-architecture.md`
- Signal weights + tiers: `clusters/signals/knowledge/signal-scoring.md`
- Customer alumni play (different 3rd-party signal class): `clusters/signals/tasks/customer-alumni-play.md`
- 137-trigger taxonomy (master encyclopedia): `clusters/signals/knowledge/signal-taxonomy.md`

## Source

Synthesized from 6 workflows.io workflows + 1 blog:
- Workflow 6 (Competitor Company Page Followers)
- Workflow 15 (LinkedIn Brand Mentions Outbound)
- Workflow 27 (Scrape Influencers' LinkedIn Engagement)
- Workflow 32 (The LinkedIn Content Engagement Playbook)
- Workflow 34 + Blog 16 (The Social Listening Playbook)
- Workflow 35 (Track Your Employees' LinkedIn Engagement)
