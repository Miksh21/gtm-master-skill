# Crunchbase — Clay Integration

**Required inputs:** Company domain or name
**Connect:** Own API key (Crunchbase Pro or Enterprise required)
**Cost:** Own API key pricing

**When to use:** Funding signals, investor identification, executive finding for funded companies. Strong for startup and scale-up targeting where funding context is relevant to the pitch.

---

## 8 Available Actions

1. **Find Company** — funding rounds, investors, HQ, founding year, employee count, description
2. **Find People at Company** — founders, executives with roles
3. **Find Similar Companies** — competitors/alternatives
4. **Funding Rounds detail** — individual round breakdown
5. **Investors detail** — investor profiles and portfolio
6. **Acquisitions** — M&A history
7. **News/press** — recent press coverage
8. **Job Postings count** — headcount signal

---

## Primary Use Cases

**Funding-based campaigns:**
Use Last Funding Date from Crunchbase to gate recently funded companies. Companies that raised in the last 6-12 months have budget to spend and a mandate to grow.

```
Run if Company Domain is not empty
```

Then conditional on result:
```
Run sending step if Crunchbase Funding Date is within 12 months
```

**Investor identification:**
Find who invested in a company — useful when your pitch is "you're portfolio company of [VC firm], we work with X other portfolio companies in your fund."

**Executive finding:**
Find founders and C-suite. Useful when LinkedIn-based contact finding is not sufficient or when you specifically need to identify the CEO/CTO/Founder for direct outreach.

---

## Alternative Funding Tools

| Tool | Notes |
|---|---|
| **Harmonic** | More affordable than PitchBook. Returns employee growth data alongside funding. Good for startup targeting. |
| **Dealroom** | Stronger European startup coverage than Crunchbase. Use for EMEA-focused campaigns. |
| **Owler** | Revenue estimates for private companies. Competitor intelligence and news alerts. |
| **PitchBook** | Enterprise contract — only when client already has subscription. |

**CB Insights — avoid:** Costs 3–16 credits per row with unreliable data accuracy. Use Crunchbase or Harmonic instead.
