> Source: swan-gtm/gtm-skills (yahav-fuchs) · MIT · imported 2026-07-28 · external content, unreviewed

# Task: Research Subreddits

Find and vet the Reddit communities a brand belongs in. Produces a vetted shortlist with evidence, not a keyword dump.

## When to use this

User asks "which subreddits should we be in", "is r/X worth targeting", "research communities for this product", or an AEO citation hit-list surfaced Reddit threads worth a presence (see `clusters/aeo-reddit/tasks/run-aeo-audit.md`).

## Inputs required

- **Product and category** context, plus the problems it solves in buyer words
- **Adjacent niches**: who else has this problem, what do they call it
- Optional: **candidate subreddits** the user already suspects
- Optional: **posting account karma tier**, to flag shortlist entries the account cannot post in yet (higher-tier subs unlock ~50 karma, standard eligibility ~100)

## Process

1. **Search wide.** Query by three term families, not just the product category. The communities where buyers ask questions rarely carry the category name:
   - Topic terms: what the product is about
   - Problem language: what breaks, what people complain about, "how do I", "what should I use for"
   - Adjacent niches: the roles, workflows, and tools that surround the problem
2. **Inspect each candidate:**
   - Subscriber count
   - Community type: restricted or private → drop it immediately
   - Posting rules, in full
   - What the top posts this week actually look like
3. **Judge fit from content, not size.** Browse top and rising posts: is anyone asking the questions this product answers? A 40k-subscriber community with daily buying questions beats a 2M-subscriber meme feed.
4. **Check the wiki and traffic** for posting norms (flair requirements, self-promo windows, karma minimums) and activity trends. Many subreddits keep their real rules in the wiki, not the sidebar.
5. **Work in batches of 5.** Vet five candidates at a time, one line of verdict each, then continue. Do not dump twenty at once.
6. **Deliver the shortlist** and let the user choose what gets added to campaign tracking.

## Inspection primitives (tool-agnostic)

Whatever the stack (native Reddit search and about pages, old.reddit JSON endpoints, or a vendor CLI), the research surface is the same. All of it is read-only; none of it needs the posting account:

| Primitive | What it answers |
|---|---|
| Subreddit search by query | Candidate discovery per term family |
| About page | Size, community type (restricted/private = stop) |
| Rules list | The stated constraints |
| Wiki index + pages | The real constraints (flair, promo windows, karma and age minimums) |
| Posts by hot / new / top / rising, per time window | Whether buyer questions actually appear, and how often |
| Comments feed | Community tone, how answers get received |
| Traffic / activity trend | Alive or decaying |
| Cross-Reddit post search | Where a topic's questions concentrate |
| Author profile and history | Whether a frequent answerer is a mod, a vendor, or a genuine user |

## Prioritize with the AEO lens

When the shortlist feeds an AEO motion, sort it by two extra signals before handing it over:

1. **The community already appears in the AI citation mix** for target prompts (check the audit hit-list from `clusters/aeo-reddit/tasks/run-aeo-audit.md`). Highest priority: the citation is earnable where engines already look.
2. **Threads from the community rank in ordinary search** for buyer queries. Posts there compound beyond Reddit.

A community scoring on neither can still matter for direct pipeline, but for a brand building AI visibility, the cited communities come first.

Re-run the research quarterly. Rules change, communities decay, new ones rise. A shortlist older than a quarter is a hypothesis, not a target list.

## Output format

```
Subreddit research: [product]
Searched: [topic terms / problem terms / adjacent terms]

SHORTLIST (3-7 communities)
r/[name] | [size] | [type]
Why it fits: [one line + link or quote of a sample thread proving buyer intent]
Constraining rules: [the rule that shapes posting there, e.g. "no self-promo outside Saturday thread", karma minimum, flair requirement]

REJECTED (one line each)
r/[name] | [reason: restricted/private, no buyer intent in content, rules ban the play, dead traffic]

RECOMMENDED NEXT: [which 2-3 to start with and why]
```

## Pass criteria

- Every shortlisted community has rules and community type inspected
- Every shortlisted community has a sample thread proving buyer intent, quoted or linked
- The constraining rule is named per community
- Shortlist is 3-7 communities, not a subscriber-count ranking
- Restricted and private communities never appear on the shortlist

## Common failures

- **Ranking by subscriber count**: size is the weakest fit signal. Content is the evidence.
- **Searching only the category name**: buyers ask in problem language; the best communities rarely carry the category term.
- **Missing the community type**: posting to a restricted sub fails silently. Check before recommending.
- **Missing rule nuance**: most subreddits allow helpful answers but ban link-dropping. That changes the content plan, not the target list.
- **Skipping the wiki**: karma and account-age minimums and per-flair rules hide there.

## What to do after

- Add chosen communities to the campaign: `clusters/aeo-reddit/tasks/launch-reddit-campaign.md`
- Before the first post in any of them, run the four-check pre-post gate: `clusters/aeo-reddit/knowledge/reddit-account-safety.md` section 4
- Verify the posting account's karma tier covers the chosen communities: `clusters/aeo-reddit/knowledge/reddit-account-safety.md` (milestones: ~50 karma for higher-tier subs, ~100 for standard eligibility)
