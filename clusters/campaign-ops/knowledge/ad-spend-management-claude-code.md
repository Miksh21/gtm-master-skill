# Managing Paid Ads via Claude Code — Google + Meta + LinkedIn at $300K/mo Scale

How ColdIQ manages **$300,000+/month in ad spend** across Google, Meta, and LinkedIn Ads entirely from the terminal using custom Claude Code skills. Based on Ivan Falco's setup that achieves consistent **4× ROAS+** on $1M+ total spend.

## When to load

- "How should we structure paid ad operations?"
- "We're spending $X/mo on ads and can't find waste — what's the system?"
- Building a multi-platform ad management workflow
- Comparing manual dashboard work vs terminal/skill-based ad ops

## The core insight

> "The campaigns did not change. The strategy did not change. The execution layer got faster and more reliable. **That is what let us double our output.**"

The shift from dashboard-based to terminal-based ad management changes three things:

1. **Speed.** Tasks that took 2-3 hours per client now take 15-20 minutes. Across a portfolio, this compounds into days saved per week.
2. **Consistency.** Skills execute the same checks every time. No steps get skipped because someone was rushing before a meeting.
3. **Scale.** Adding a new client account doesn't proportionally increase workload. Same skills run on one account or twenty. **Marginal cost of additional spend → zero.**

---

## The 12 skills (3 platforms × 4 skills each)

### Google Ads — eliminating wasted spend

#### 1. Keyword Analyzer
Audits quality scores across the entire account and uncovers keyword gaps. Surfaces underperforming keywords + missing ones competitors are bidding on. **Replaces "a full morning per client" of manual review with minutes.**

#### 2. Negative Keywords
Reviews every search term triggering your ads, eliminates the budget-burners. Catches:
- Irrelevant queries
- Near-miss keywords that look relevant but convert at 0%
- Broad-match terms that drifted far from intent

Running this weekly across all client accounts used to require a dedicated analyst — now a single command.

#### 3. Performance Auditor
Compares performance across time periods, surfaces what shifted. Did CPAs spike? Did a campaign that was printing leads suddenly slow? Did a new ad group outperform the rest? Tell Claude the date ranges, it delivers analysis + specific recommendations.

#### 4. Search Terms Analyzer (the highest-ROI skill)
Identifies queries actively burning budget with zero conversions. Quantifies exactly how much each underperforming query cost. Recommends exclude / pause / restructure.

**Reported savings: $3,000–$8,000 in monthly waste hiding in search term reports on $50K+/mo accounts.** That's a 6-16% spend recovery.

### Meta Ads — catching fatigue before it kills performance

Meta degrades differently from Google. **Creative fatigue is the silent killer.** Ads work brilliantly for 2 weeks → frequency climbs, CTR drops, CPAs double. By the time you notice, you've wasted a week of spend.

#### 5. Audience Builder
Converts CRM lists into Meta custom audiences directly from terminal. Upload CSV → custom audience ready for targeting or lookalike expansion. Eliminates the export → format → upload via Business Manager → wait for match rate loop.

#### 6. Creative Fatigue Analyzer (highest Meta-side ROI)
Monitors CTR trends across all active creatives. Flags creatives showing **early signs of fatigue before the performance cliff hits**. Recommends pause / refresh / let-run based on spend + conversion data. Prevents the classic mistake of running winning creatives into the ground.

#### 7. Fatigue Monitor (audience-side)
While #6 watches individual ads, this watches **audience saturation**. Flags when your target audience has been exposed too many times → reach is capped + costs rising. Especially critical for LinkedIn-retargeting audiences on Meta (small pools, fast saturation).

#### 8. Spend Tracker
Real-time budget pacing across all Meta campaigns. Catches overspend before it happens. Identifies under-pacing campaigns so you can redistribute budget to what's working. **On accounts managing 20+ campaigns simultaneously, manual budget tracking breaks down. This skill keeps every dollar accountable.**

### LinkedIn Ads — scaling without the manual grind

LinkedIn is the most powerful B2B ad platform AND the most tedious to manage at scale. Everything requires more clicks than it should.

#### 9. Audience Builder
Generates targeting audiences at scale. Feed it a list of companies, job titles, or LinkedIn profile URLs → builds audiences directly through API. For ABM campaigns where you need separate audiences per tier / vertical / signal type, turns hours of manual work into one batch operation.

#### 10. Bid Optimizer
LinkedIn bidding is notoriously expensive and opaque. Adjusts bids across campaigns in bulk based on performance. Identifies which are over-bidding relative to conversion rates and which are under-bidding and missing impression share. **Running this daily keeps LinkedIn CPL from creeping up — which is the default behavior on the platform if left unattended.**

#### 11. Bulk Editor (the workhorse)
Mass edits to campaigns, ads, and naming conventions in seconds:
- Rename 50 campaigns to match a new taxonomy → done
- Pause all campaigns in a specific region → done
- Update UTM parameters across every active ad → done

**LinkedIn's native interface was not designed for bulk operations. This skill fills the gap completely.**

#### 12. Creative Builder
Produces ad creatives from brand specs. Feed it brand guidelines + value propositions + target personas → generates ad copy, headlines, descriptions ready to launch. **Does NOT replace creative strategy.** Eliminates the bottleneck of producing 20 variations of the same ad for A/B testing.

---

## How the skills compose

The skills work **independently or chained**. Example chain command:

> "Run the negative keyword analysis, then check creative fatigue on Meta, then pull the LinkedIn bid optimization report."

Claude Code executes sequentially. You get everything in one session — what used to be 3 different platforms + 3 different cadences becomes 3 minutes of terminal output.

---

## Operational rhythm

Suggested cadence based on what's actually breaking on each platform:

| Cadence | Platform | What to run |
|---|---|---|
| Daily | LinkedIn | Bid Optimizer (CPL creep prevention) |
| Daily | Meta | Spend Tracker (budget pacing) + Creative Fatigue Analyzer |
| Weekly | Google | Negative Keywords + Search Terms Analyzer (waste recovery) |
| Weekly | Google | Performance Auditor (period-over-period analysis) |
| Weekly | Meta | Fatigue Monitor (audience saturation) |
| As-needed | All | Audience Builders (new campaigns) + Creative Builder (test variants) + Bulk Editor (taxonomy changes) |

---

## Setup mechanics

```bash
# 1. Drop skills into your Claude Code project directory
# 2. Connect ad accounts via API
#    - Google Ads: OAuth + customer ID + developer token
#    - Meta: Business Manager + Marketing API token
#    - LinkedIn: OAuth + ad-account ID
# 3. Tell Claude Code what you need in plain English
```

Example invocation:
> "Audit my Google Ads search terms from the last 30 days and flag anything spending over $100 with zero conversions."

Claude Code reads the relevant skill, connects to the Google Ads API, pulls the data, delivers the analysis.

---

## Reported results

ColdIQ's own numbers:
- **$300,000+/month managed ad spend** across Google + Meta + LinkedIn
- **4× ROAS+ consistent** on more than $1M total tracked spend
- **Doubled ad operations output** without sacrificing quality
- **15-20 min/client vs 2-3 hours/client** for the same operational tasks

---

## When NOT to use this approach

- **Single-platform, <$10K/mo total spend** — overhead of building skills > savings
- **Team lacks API setup capability** — first install requires wiring credentials for 3+ APIs
- **One-time campaign** — skill ROI only kicks in with repeated execution
- **No data hygiene** — skills surface issues but don't fix structural problems with your conversion tracking, attribution, or pixel setup

---

## Cross-references

- Underlying architecture (4-layer Claude Code OS): `reference/claude-code-gtm-architecture.md`
- Tool stack + MCPs: `reference/2026-tool-stack-and-mcps.md`
- Outbound attribution (capture downstream signups from ad-influenced visitors): `clusters/campaign-ops/knowledge/outbound-attribution.md`

## Source

ColdIQ blog "How We Manage $300K/Month in Ad Spend With Claude Code" (Ivan Falco, Head of Growth at ColdIQ, based on 300+ hours running paid campaigns for 70+ clients). 2026-04-16 publish date, 2026-05-13 crawl.
