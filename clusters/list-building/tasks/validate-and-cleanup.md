# Task: Validate & Clean Up a List

Recipe for hygiene on an existing list — email/phone verification, deduplication, decay management, and bounce-rate protection.

## When to use this

User asks to verify emails, validate a list, fix bounce rate, dedupe, refresh stale data, audit list quality, or prepare a list for re-launch.

## Inputs required

- Existing list (CSV, Clay table, sequencing platform export)
- When the list was last verified (if known)
- Available tools (ZeroBounce, Million Verifier, Clay validation, Hunter)

## The 4 hygiene dimensions

### 1. Email verification (target: 95%+ valid)
- Run all addresses through verifier (ZeroBounce, Million Verifier preferred)
- **Accept:** "valid"
- **Send carefully:** "catch-all" — only on small batches first to test domain deliverability
- **Reject:** "risky", "unknown", "invalid"
- Cross-validate critical addresses against a second tool

### 2. Deduplication
- Dedupe by email primary (case-insensitive)
- Secondary dedupe by LinkedIn URL (catches "name@oldcompany.com" that became "name@newcompany.com")
- Tertiary: by company domain + role title (catches "ceo@acme.com" + "founder@acme.com" same person)

### 3. Decay management
- Email decay: 22-30% annual = re-verify lists older than 30 days
- Job-change check: filter LinkedIn against original company; flag departures
- Departed contacts go into a NEW list under their new company (high-intent — see `clusters/signals/knowledge/timing/job-change-tracking.md`)

### 4. Sender protection
- Bounce rate must stay < 2% (above this, sender reputation drops fast)
- If list bounce-projection > 2%, hold the list — verify again before send
- Pre-launch: send first 50 to a new mailbox or warm-up account, monitor bounce, then scale

## Process

1. Inventory the list (size, last verified date, source)
2. Run dedup (3-pass: email → LinkedIn URL → domain+role)
3. Run email verifier on all unique rows
4. Filter: keep "valid", quarantine "catch-all" for separate batch, drop "risky/unknown/invalid"
5. Cross-check critical Tier 1 contacts against second verifier
6. Run job-change scan: which contacts left their listed company?
7. Output 3 lists: clean (send), catch-all (small-batch test), departed (re-target at new company)

## Output format

```
List validation: [list name]
Date: [date]
Original size: [n]

DEDUP RESULTS
After email dedup: [n removed]
After LinkedIn dedup: [n removed]
After domain+role dedup: [n removed]
Final unique: [n]

EMAIL VERIFICATION
Valid: [n] ([%]) — ready to send
Catch-all: [n] ([%]) — small-batch test first
Risky/Invalid/Unknown: [n] ([%]) — dropped

JOB-CHANGE SCAN
Still at original company: [n]
Departed (re-target at new company): [n] — [list with new companies]

PROJECTED BOUNCE RATE: [%] — [SAFE / WARN / HOLD]

OUTPUT LISTS
- clean-send.csv: [n] contacts
- catch-all-test.csv: [n] contacts
- departed-rebuild.csv: [n] contacts (new sequence required)
```

## Pass criteria

- Final clean list has < 2% projected bounce
- Verification rate ≥ 95% on accepted contacts
- No duplicates remain (test by sorting + scanning)
- Departed contacts captured for re-targeting (not just deleted — they're high-intent at new company)

## Common failures

- **Single-pass dedup** — email-only misses 5-10% duplicates. Three-pass catches them.
- **Sending to "risky"** — single-digit risky % can spike bounce above 2% threshold
- **Skipping job-change scan** — losing the highest-intent leads (job-changers, days 14-45 amnesty window)
- **Re-sending same list 3 months later without re-verifying** — 22-30% annual decay = many invalid addresses now

## What to do after

- Clean list → push to `clusters/campaign-ops/tasks/setup-campaign-platform.md`
- Catch-all batch → small test send (50 contacts) before scaling
- Departed list → `clusters/signals/tasks/score-multi-signal.md` (job change is a Tier 1 signal); then `clusters/cold-email/tasks/write-first-email.md` for new-company opener
- Schedule re-verification: 30 days from now

## Deeper knowledge

- Verifier tool comparison + bounce theory → `knowledge/data-validation.md`
- Job-change tracking deep dive (vendor-amnesty days 14-45) → `clusters/signals/knowledge/timing/job-change-tracking.md`
