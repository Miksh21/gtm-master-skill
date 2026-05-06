# Task: Audit a LinkedIn Profile for Outbound Readiness

Score a sender's LinkedIn profile so recipients who check after receiving a message see a credible, conversion-optimized profile.

## When to use this

User asks to audit their LinkedIn profile, prep a profile for outbound, improve LinkedIn presence, or troubleshoot low LinkedIn acceptance rate.

## Inputs required

- LinkedIn profile URL (or paste the profile sections)
- Role and ICP context (who this person is selling to)

## The 6 scoring dimensions (max 100)

### Headline (max 20)
- Says what you do AND who you help — not just job title
- Speaks to the ICP's outcome, not your resume
- BAD: "Account Executive at Acme Corp"
- GOOD: "Helping B2B SaaS teams book more meetings without adding headcount"

### Profile photo (max 10)
- Photo present? (No photo = immediate credibility drop)
- Professional + clear?
- Approachable?

### About section (max 20)
- Present? (Missing About = lost conversion)
- Speaks to the buyer, not just sender's career?
- Clear what-you-do + who-for + result?
- CTA at the end?

### Experience (max 15)
- Roles described in outcome language?
- Most recent role clearly described?

### Social proof (max 20)
- Recommendations: 2+ minimum threshold
- Featured section used (case studies, posts, lead magnet)?

### Activity (max 15)
- Recent posts visible? (Posting signals legitimacy)
- Engagement on posts? (Even low > zero)

## Process

1. Review each dimension against criteria
2. Score each 0 to max
3. Sum to total (max 100)
4. Flag top 3 improvements by impact
5. Write suggested copy for: new headline, About-section CTA, one Featured item recommendation if relevant

## Output format

```
LinkedIn profile audit: [name]
Profile: [URL]
Date: [date]

SCORES
Headline:     [n/20] — [one-line note]
Photo:        [n/10] — [one-line note]
About:        [n/20] — [one-line note]
Experience:   [n/15] — [one-line note]
Social proof: [n/20] — [one-line note]
Activity:     [n/15] — [one-line note]

TOTAL: [n/100]
Outbound readiness: [Ready (≥75) / Needs work (50-74) / Not ready (<50)]

TOP 3 IMPROVEMENTS BY IMPACT
1. [Specific change] — [why it matters]
2. [Specific change] — [why it matters]
3. [Specific change] — [why it matters]

SUGGESTED HEADLINE
"[New headline copy]"

SUGGESTED ABOUT CTA
"[Last line of About section — a soft ask, not a hard sell]"
```

## Pass criteria

- Outbound readiness ≥ 75/100 before scaling LinkedIn outbound
- Headline scores ≥ 15/20 (the highest-impact dimension)
- About section present + scoring ≥ 14/20
- At least 2 recommendations live

## Common failures

- **Running LinkedIn outbound at scale with weak profile** — kills acceptance rate; check profile first
- **About section missing** — most-skipped, highest-leverage; rewrite is the cheapest fix
- **Generic headline** ("VP Sales at Acme Corp") — instantly templated-feeling
- **Fake recommendations** — one genuine recommendation > ten generic ones
- **No activity in 6+ months** — profile looks abandoned; post at least monthly

## What to do after

- Score < 75 → fix top 3 BEFORE running `clusters/sequences/tasks/write-linkedin-sequence.md` at scale
- Acceptance rate < 25% on a campaign → re-run this audit; profile is usually the cause
- Re-audit quarterly (jobs change, photos go stale)
