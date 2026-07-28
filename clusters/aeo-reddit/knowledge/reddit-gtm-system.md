> Source: swan-gtm/gtm-skills (yahav-fuchs) · MIT · imported 2026-07-28 · external content, unreviewed

# Reddit GTM System: Campaigns, Mention Triage, Attribution

The operating model for running Reddit as a B2B growth channel: campaign structure, advocate personas, the human approval loop, brand-mention triage, and honest attribution.

**Prerequisite:** account standing is the scarce asset on Reddit. Read `clusters/aeo-reddit/knowledge/reddit-account-safety.md` before running anything here. A banned account ends the whole motion.

## 1. Why Reddit is an AEO surface

AI answer engines cite Reddit threads heavily for commercial prompts ("best X for Y", "X vs Z"). Citation mining (see `knowledge/aeo-measurement-system.md`) routinely lands on Reddit URLs as top cited sources. Being genuinely present in the threads buyers and engines read is how a brand earns those citations. Reddit work therefore compounds twice: direct (buyers in the thread) and indirect (AI answers trained on and citing the thread).

The boundary that keeps this legitimate: value-first participation with disclosure where the community expects it, every post human-reviewed. Undisclosed astroturfing is both a ban risk and exactly the LLM-manipulation behavior Google's AI-search guidance says to ignore (see `reference/aeo-and-ai-buyer-discovery.md`). The system below enforces the legitimate side.

## 2. The operating model

```
subreddit research → campaign (product + mention framing)
→ advocate persona (capped drafts) → human approval loop → posted content
→ mention triage (continuous) → attribution readout
```

Every stage has a human gate. Nothing auto-posts.

## 3. Campaign setup

1. **Create the campaign** with the product name, URL, and how the brand should be mentioned. The mention framing shapes every draft, so get it from the operator, not scraped from the website title. Capture use cases and talking points at the same time.
2. **Attach target subreddits, vetted first.** Community fit is its own discipline: run `clusters/aeo-reddit/tasks/research-subreddits.md`. Never add every keyword match.
3. **One campaign per product.** Keeps drafting-time knowledge retrieval clean (see `reference/advocate-voice-tuning.md`).

## 4. Advocate personas

An advocate is the persona that drafts comments: name, role (user or employee), tone, and a daily-draft cap.

- **Start the cap at 3 drafts per day.** Raise it only after draft quality proves out over multiple review sessions.
- The overlooked trap: raising the cap before the voice is right floods the queue with mediocre drafts and burns reviewer attention.
- NEVER present an advocate as unaffiliated where the community requires disclosure. Role and disclosure style are part of the persona definition, not an afterthought.
- Tune the voice with `reference/advocate-voice-tuning.md` before scaling anything.

## 5. The approval loop

Drafts are the product. Review each one against three questions:

1. Does it sound like a knowledgeable community member?
2. Does it follow that subreddit's rules?
3. Does it disclose affiliation where the community expects it?

Approve individually. Skip anything that reads like an ad. Before any draft posts, it must also pass the six-point safety check and the four-check pre-post gate, both in `knowledge/reddit-account-safety.md` (sections 3 and 4).

**Rules:**
- MUST review drafts individually. Never bulk-approve unread.
- MUST verify each target subreddit's rules before its first post.
- Check remaining tool credits or quota before batch operations.

Success is accepted posts and thread engagement, not drafts generated. A great campaign is a handful of well-chosen communities, an advocate voice tuned to each, and a 100% human-reviewed draft stream.

## 6. Brand-mention triage

### Setup (once per brand)

Add each domain worth watching: the product, and optionally competitors. Attach a brand description, search keywords, and negative keywords to cut false positives. **Tune negative keywords early.** A noisy monitor gets ignored within a week, and an ignored monitor is worse than none.

### The triage loop

1. List new mentions. Filter by domain, sentiment, or intent when the queue is long. Take 20 at a time.
2. For each: read the full mention AND the live Reddit thread. The excerpt routinely misreads tone, and the thread shows whether the community already answered.
3. Verdict per mention, one line each (sentiment, key point, verdict):
   - **reply**: a genuine question or a fixable complaint
   - **ignore**: drive-by noise
   - **escalate**: churn risk, security claim, or a thread gaining velocity
4. Mark reviewed mentions handled so the queue stays clean.
5. Close with the stats view: mention volume and sentiment trend over the period.

### Triage judgment calls

- **Velocity changes the verdict.** A negative mention in a thread still gaining comments escalates even if the content alone would not.
- **Competitor-comparison threads are the highest-value reply targets on Reddit.** Never skim past them.
- Replies belong to a human or an approval-gated draft. NEVER auto-post into a live thread.
- NEVER mark a mention handled without a recorded verdict.

Great triage catches the two mentions that matter (the churn-risk complaint and the high-intent "what should I use for X" thread) within hours, with thread context read before any verdict. Mediocre triage skims excerpts and marks everything handled.

## 7. Attribution

Reddit gives no native click or conversion tracking on comments. Attribution is assembled from tagged links, analytics, and correlation. Report it honestly, gaps included.

### Tag every link

Standardize one UTM scheme and bake it into the drafting instructions (advocate instructions or knowledge base) so every posted link carries it:

```
?utm_source=reddit&utm_medium=comment&utm_campaign=<campaign>&utm_content=<subreddit>
```

`utm_content=<subreddit>` is what makes per-community ROI readable later. Put the rule where drafts are generated. Retrofitting tags on live comments is impossible.

### Read it in analytics

Filter sessions by source `reddit.com`, segment by campaign to isolate tagged traffic. **The redirect trap:** Reddit routes outbound clicks through intermediaries (`out.reddit.com`, `redd.it`). Verify the UTM parameters survive the redirect chain into the analytics tool before trusting any number. Stripped UTMs silently zero the numbers.

### Connect to pipeline

On form submissions landing in the CRM, stamp a source field from the UTM and carry the subreddit through. Deal-level "came from r/X" is what makes the case to leadership. For multi-touch reality (a buyer reads a comment, converts weeks later via direct visit), first-party-cookie attribution tools reconstruct the journey a last-touch UTM misses. Judging a comment channel on last-touch only structurally undercounts Reddit.

### Where measurement ends, correlate

Comment clicks, native Reddit analytics, and view-through conversions are not directly trackable. Use the proxy: overlay brand-mention dates and comment-performance data (views, upvotes) on traffic spikes and signup timing. Correlation honestly labeled beats fabricated precision.

**Rules:**
- MUST verify UTM survival through Reddit's redirect chain before reporting.
- MUST label correlation-based findings as such.
- NEVER claim view-through conversions as measured.

A great readout shows tagged-session volume per subreddit, pipeline touched, and a correlation chart for the untrackable rest, with the measurement gaps stated plainly. Target end state: the team can name which communities produce pipeline and defend the number.

## 8. Channel success metrics

| Metric | Why it is the right one |
|---|---|
| Accepted posts and replies earned | Volume of drafts generated means nothing |
| Comment survival rate | Removals measure pattern and rule failures |
| Mentions triaged within hours, queue at zero | An ignored monitor is worse than none |
| Tagged sessions and pipeline per subreddit | Community-level ROI drives where effort goes next |
| Brand appearing in AI-answer citations for target prompts | The AEO compounding effect, measured via `knowledge/aeo-measurement-system.md` |

## 9. Tooling note

The source workflows ran on a vendor CLI (ReddGrow: campaigns, tracked subreddits, advocates, draft queue, brand monitor). The model is tool-agnostic: any monitoring stack that surfaces mentions with thread links supports the triage loop, and the campaign, approval, and attribution disciplines are process, not product. Whatever the stack, the invariants are the human approval gate, the UTM scheme at draft time, and per-mention verdicts on record.
