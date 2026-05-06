# Task: Set Up a Campaign on the Sequencing Platform

Configure a campaign in PlusVibe / Instantly / Smartlead via MCP — no manual clicking. End state: campaign in draft, ready to launch.

## When to use this

User has a sequence + a list and wants to wire them into the sending platform. Triggers on "set up the campaign", "configure in Instantly", "load into PlusVibe", "launch prep".

## Inputs required

- Campaign name (from `tasks/name-campaigns.md` — convention enforced)
- Outreach sequence (steps, copy, channels, timing) — already stress-tested via `clusters/cold-email/tasks/stress-test-sequence.md`
- Lead list (from `clusters/list-building/tasks/build-prospect-list.md` or `validate-and-cleanup.md`)
- Sending account(s) to assign
- Schedule (days, time windows, timezone)

## Process

1. Confirm ALL inputs present. Do NOT proceed if anything is missing — ask first, don't assume.
2. Create campaign in platform via MCP using the hypothesis name
3. Upload sequence steps in order with correct delays between steps
4. Assign sending accounts (multiple if list > 500 to spread load)
5. Upload or link the lead list
6. Set schedule: sending days (Mon-Thu only for cold), time window (8am-6pm recipient TZ), max emails/day per account (30 for new mailbox, 50 ceiling)
7. **Confirm campaign is in DRAFT — never auto-launch without explicit "launch it" instruction**
8. Return summary

## Output format

```
Campaign created: [hypothesis name]
Platform: [PlusVibe / Instantly / Smartlead]
Status: DRAFT (not launched)

Steps: [n] | Channels: [email / LinkedIn / both]
Leads loaded: [n]
Sending accounts: [list]
Schedule: [days] | [time window] | [timezone]
Max sends/day per account: [n]
Estimated days to send full list: [n]

Pre-launch checks:
☐ Sequence stress-tested ≥ 8.1 (clusters/cold-email/tasks/stress-test-sequence.md)
☐ List validated (clusters/list-building/tasks/validate-and-cleanup.md)
☐ Deliverability audit current (tasks/audit-deliverability.md)
☐ Spintax applied if volume > 500/day (clusters/cold-email/tasks/add-spintax.md)
☐ Sender accounts warmed up ≥ 14 days

Ready to launch: [YES / BLOCKED on: list of failed checks]

Awaiting explicit "launch" instruction before activating.
```

## Pass criteria

- Campaign in draft state (NEVER auto-launched)
- All 5 pre-launch checks complete OR user notified of blockers
- Lead list ≥ 10 contacts (under 10 = test campaign, flag separately)
- Sending accounts have 14+ day warmup history
- Mon-Thu sending window only (cold sending fails on Fri/weekends)

## Common failures

- **Auto-launching** — never. Even if user says "set it up and run it", confirm "launch" once more before activating.
- **Missing copy** — if any sequence step has placeholder text, stop. Do not use lorem ipsum.
- **Under-10 list** — flag, ask if test or production. Don't burn warmup on a 5-contact list.
- **Friday/weekend sending** — kills cold deliverability. Mon-Thu only.
- **One sender account for 1000-lead campaign** — split across 3-5 accounts to stay within 30-50/day per mailbox

## What to do after

- All checks PASS → confirm with user, then explicit launch
- Track first 50 sends manually via `tasks/analyze-replies.md` — early signal whether deliverability is intact
- After Day 7 → `tasks/tier-campaigns.md` to see if hypothesis is working

## Deeper knowledge

- Sequencing tool comparison + which to pick → `clusters/cold-email/reference/sequencing-tools.md`
- Email infrastructure setup → `clusters/cold-email/knowledge/email-infra/email-infra-guide.md`
