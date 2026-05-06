# Task: Audit Deliverability Infrastructure

Audit sending infrastructure end-to-end. Pass/fail verdict on every dimension. Specific fixes for failures.

## When to use this

User asks to check deliverability, audit sending infrastructure, investigate spam issues, set up domains/mailboxes correctly, or prepare for cold-email scale-up.

## Inputs required

- Sending domain(s) and mailbox addresses
- Sending platform being used (Instantly, Smartlead, Lemlist, Apollo)
- Current send volume per mailbox per day
- How long the domains/mailboxes have been active

## Audit checklist (run all 4 sections)

### Domain setup
- [ ] SPF record configured correctly
- [ ] DKIM record configured and active
- [ ] DMARC policy set (`p=none` minimum, `p=quarantine` recommended)
- [ ] MX records pointing to correct mail server
- [ ] Domain not on major blacklists (MXToolbox check)

### Mailbox setup
- [ ] Real-person mailbox name (not "info@" or "sales@")
- [ ] Profile photo set
- [ ] Email signature with real name + role + website
- [ ] Mailbox ≥ 14 days old before first cold campaign send
- [ ] Warm-up active (Instantly / Mailreach / equivalent)

### Sending behavior
- [ ] Max sends per mailbox: 30-40/day for new, up to 50/day for established
- [ ] Send window: business hours in recipient timezone (8am-6pm)
- [ ] Sending days: Mon-Thu only for cold outbound
- [ ] Delay between sends: 3-5 minutes minimum
- [ ] Unsubscribe link present in every email

### Warm-up status
- [ ] Warm-up tool active
- [ ] ≥ 14-day warm-up before cold send
- [ ] ≥ 30-50 warm-up emails/day per mailbox
- [ ] Inbox placement rate > 90% on warm-up reports

## Process

1. Request domain + mailbox details
2. Check DNS records via MXToolbox (or equivalent)
3. Check blacklist status for all sending domains (MXToolbox + Spamhaus)
4. Review platform settings against checklist
5. Pass/fail every dimension
6. Return remediation list ordered by severity

## Output format

```
Deliverability audit: [domain(s)]
Date: [date]

DOMAIN SETUP
SPF:              [PASS / FAIL] — [detail]
DKIM:             [PASS / FAIL] — [detail]
DMARC:            [PASS / FAIL] — [policy + detail]
Blacklist status: [CLEAN / LISTED on: [which lists]]

MAILBOX SETUP
[mailbox@domain] — [pass-count]/[total-checks] — [list of failures]
[Repeat per mailbox]

SENDING BEHAVIOR
Daily volume:     [SAFE / HIGH / CRITICAL]
Send window:     [PASS / FAIL]
Warm-up:         [ACTIVE / INACTIVE / NOT CONFIGURED]

VERDICT
Infrastructure ready to send: [YES / NO / WITH FIXES]

REMEDIATION (ordered by severity)
1. [Critical fix — do immediately] — e.g. "DKIM not active. Add DKIM record now, wait 24h to propagate."
2. [Important — this week] — e.g. "Warm-up tool inactive. Enable warm-up + wait 14 days before cold."
3. [Nice-to-have] — e.g. "Add profile photo to mailbox X"
```

## Pass criteria

- All four DNS records (SPF/DKIM/DMARC/MX) PASS before any cold sending
- Zero blacklist entries
- All mailboxes ≥ 14 days old + warmed
- Daily volume ≤ 50/mailbox

## Common failures

- **Sending cold from main company domain** — never. Always 3-5 dedicated outreach domains.
- **No DMARC** — even `p=none` for monitoring is required these days; without it, deliverability erodes
- **30+ days inactive but listed on a minor blacklist** — investigate cause before delisting (fixing symptom not problem)
- **50+ emails/day on a 21-day-old mailbox** — too aggressive; ramp to 30 first, then up

## What to do after

- All PASS → safe to launch via `tasks/setup-campaign-platform.md`
- Critical failures → fix, wait propagation period (24h for DNS), re-audit
- Schedule recurring audit weekly during scale-up, monthly after stable

## Deeper knowledge

- Email infrastructure full setup guide → `clusters/cold-email/knowledge/email-infra/email-infra-guide.md`
- Step-by-step with video tutorials → `clusters/cold-email/knowledge/email-infra/email-infra-step-by-step.md`
- Blacklist recovery + troubleshooting → `clusters/cold-email/knowledge/email-infra/email-infra-troubleshooting.md`
- Deliverability theory deep guide → `clusters/cold-email/knowledge/deliverability-guide.md`
