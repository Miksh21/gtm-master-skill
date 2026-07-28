> Source: swan-gtm/gtm-skills (yahav-fuchs) · MIT · imported 2026-07-28 · external content, unreviewed

# Task: Launch a Reddit Campaign

Stand up a Reddit growth campaign end to end: vetted communities, an advocate persona with a capped draft queue, attribution wired in from draft one, and a human approval loop. Nothing auto-posts.

## When to use this

User asks to "set up a Reddit campaign", "create an advocate", "start posting about the product on Reddit", or "review our pending Reddit drafts". Also the follow-through when an AEO audit hit-list surfaced Reddit threads worth an earned presence (`clusters/aeo-reddit/tasks/run-aeo-audit.md`).

## Preconditions (blocking)

Check before any campaign work. Full detail: `clusters/aeo-reddit/knowledge/reddit-account-safety.md`.

- [ ] Posting account exists and its karma tier is known
- [ ] Karma ≥ 10 (first promotional drafts unlock at ~10; below that, warmup only, no campaign)
- [ ] Account is past its first 7 days of warmup in target communities
- [ ] Promotional ratio for the tier confirmed (10-49: 10%, 50-99: 20%, 100-499: 33%, 500+: 50% max)
- [ ] No active bans or site-wide suspension on the account
- [ ] Target subreddits vetted via `clusters/aeo-reddit/tasks/research-subreddits.md`

Any box unchecked: fix that first. A campaign on an unwarmed or suspended account burns the account.

## Inputs required

- **Product name, URL, and mention framing**: how the brand should be referred to. Get this from the user, never scraped from the website title; it shapes every draft
- **Use cases and talking points**
- **Vetted subreddit shortlist** with each community's constraining rules
- **Advocate definition**: name, role (user or employee), tone, disclosure style
- **UTM campaign slug**

## Process

1. **Create the campaign** with product name, URL, mention framing, use cases, talking points. One campaign per product.
2. **Attach the vetted subreddits.** Only from the shortlist. Verify each community's rules once more before its first post.
3. **Create the advocate**: name, role, tone, and a daily-draft cap of **3**. Raise the cap only after draft quality proves out across multiple review sessions. Role and disclosure style are part of the persona: NEVER present an advocate as unaffiliated where the community requires disclosure.
4. **Wire attribution now.** Put the UTM scheme into the drafting instructions so every posted link carries it (retrofitting live comments is impossible):
   ```
   ?utm_source=reddit&utm_medium=comment&utm_campaign=<campaign>&utm_content=<subreddit>
   ```
5. **Pull the first pending drafts and review them with the user.** Per draft: does it sound like a knowledgeable community member, does it follow that subreddit's rules, does it disclose where expected. Approve individually; skip anything that reads like an ad.
6. **Gate every approved draft** through the six-point comment check and the four-check pre-post gate (`knowledge/reddit-account-safety.md` sections 3 and 4) before it posts.
7. **Set the operating cadence.** The campaign is a routine, not a launch event:

   | Rhythm | Activity |
   |---|---|
   | Daily | Review pending drafts individually; approve or skip each |
   | Daily | Scan account inbox and modmail; classify any moderation signal (ban / removal / rule note) |
   | Continuous | Mention triage; keep the queue at zero, escalate velocity threads |
   | Weekly | Draft pipeline stats: pending / approved / posted / skipped counts, accepted-post and reply rates |
   | Weekly | Attribution readout: tagged sessions and pipeline per subreddit |
   | Per karma milestone | Re-check the promotional ratio cap and any newly unlocked communities |

8. If drafts miss the voice or get facts wrong, stop scaling and run `clusters/aeo-reddit/reference/advocate-voice-tuning.md` first.

## Draft types in the queue

The queue is not only promo. The source system's taxonomy: promotional, warmup (non-promo community contribution that keeps the ratio healthy), moderator (rule-driven fixes), brand-monitor replies, AEO-citation plays (posts aimed at threads AI engines cite), and thread replies. The promotional-ratio ladder counts promotional drafts against everything else, so a healthy queue is mostly the other types. Sort review by relevance score when the queue backs up, and review promotional drafts with the most care.

## Output format

```
Reddit campaign: [product]
Account: [karma tier] | promo ratio cap [X%] | preconditions [PASS/FAIL per item]

Campaign: [name] | [URL]
Mention framing: [exact phrasing from user]
Communities: r/[a], r/[b], r/[c] | [constraining rule each]
Advocate: [name] | [user/employee] | [tone] | cap 3/day | disclosure: [style]
UTM: [full scheme with campaign slug]

FIRST DRAFT REVIEW
Draft 1: [approve / skip] | [one-line reason]
Draft 2: [approve / skip] | [one-line reason]
Draft 3: [approve / skip] | [one-line reason]

Cadence: [review/triage/health/stats schedule]
```

## Pass criteria

- All preconditions pass before campaign creation
- Mention framing came from the user, not the website
- Every attached community came off the vetted shortlist with its rule named
- Draft cap is 3 at launch
- UTM scheme is in the drafting instructions, not a manual afterthought
- First drafts reviewed individually with the user; zero bulk approvals
- Disclosure style set wherever any target community expects it

## Common failures

- **Raising the draft cap before the voice is right**: floods the queue with mediocre drafts and burns reviewer attention. Quality proves out first, then volume.
- **Bulk-approving drafts**: one ad-sounding comment in a strict community can cost the account. Individually or not at all.
- **Skipping the ratio math**: a campaign pushing promo posts beyond the karma tier's share trips spam filters even when each post is fine.
- **Mention framing scraped from the site**: produces corporate-voice drafts the communities smell instantly.
- **Attribution added later**: live comments cannot be re-tagged; per-community ROI is lost for good.
- **Measuring drafts generated**: success is accepted posts and thread engagement. Check credits or quota before batch operations.

## What to do after

- Start mention triage and the attribution readout: `clusters/aeo-reddit/knowledge/reddit-gtm-system.md` (sections 6-7)
- Tune the advocate on the first batches: `clusters/aeo-reddit/reference/advocate-voice-tuning.md`
- After 2-4 weeks, check whether target-community threads enter the AI citation mix: `clusters/aeo-reddit/tasks/run-aeo-audit.md`
