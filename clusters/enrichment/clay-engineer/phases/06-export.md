# Phase 6 — Export

Getting data out of Clay into CRM and sequencers. Always the last step. Always gated.

---

## Export Order

Export is always last in every workflow:
1. Free gates → cheap enrichment → expensive enrichment → **Export**

Never push to a sequencer or CRM until:
- The contact has passed ICP qualification
- The work email has been found and validated
- All personalisation variables are built
- The Sending Gate formula column has been created and inspected

---

## The Sending Gate Formula Column — Non-Negotiable

**Never put complex conditional logic directly in a sending enrichment's conditional run field.**

Why: if you make a mistake in a multi-condition formula on a sending step (Instantly, HeyReach, HubSpot create), you can't test it without actually running the cells — which means data gets sent incorrectly. You can't undo a contact being pushed to a campaign.

**The correct approach:**
1. Create a dedicated **free formula column** (e.g. "Ready to Send")
2. Put all conditions in that formula column — outputs TRUE or FALSE
3. Inspect every row to verify logic is correct before anything gets exported
4. The sending enrichment has one simple conditional run: `Run if Ready to Send = TRUE`

**Example Sending Gate formula:**
```
IF ICP Qualified is not "No"
AND Work Email is not empty
AND Email Validation Status is "valid"
AND CRM Contact Result is empty (not already in CRM — first-time create)
THEN TRUE
OTHERWISE FALSE
```

This is testable, visible, and reversible. You can see exactly which rows will be sent before committing.

---

## Instantly — Email Outbound Export

**Required before pushing:**
- Campaign created in Instantly first — Clay cannot create campaigns
- Work email mapped to Email field
- Custom Variables section expanded — each Clay personalisation column mapped to exact `{{variable_name}}` in copy
- "Skip if Lead is in Workspace" toggle = ON (always)

**Conditional run:** `Run if Ready to Send = TRUE`

**Multiple sending steps (sub-industry routing):**
- Step 1 → Campaign A: `Run if ICP Qualification is "Sub-industry A" OR ICP Qualification is "Sub-industry A & B"`
- Step 2 → Campaign B: `Run if ICP Qualification is "Sub-industry B" OR ICP Qualification is "Sub-industry A & B"`

A contact tagged as both sub-industries pushes to both campaigns. Each campaign-specific personalisation enrichment carries the same conditional run as its corresponding sending step.

---

## HeyReach — LinkedIn Outbound Export

**Required inputs:** LinkedIn URL (primary identifier), Campaign ID
**Conditional run:** `Run if LinkedIn URL is not empty AND Ready to Send = TRUE`

LinkedIn URL must be present for every row pushed to HeyReach. If LinkedIn URL is missing for some rows, HeyReach cannot push them. Decide upfront: is HeyReach gated on having a LinkedIn URL, or does the campaign still proceed to Instantly for contacts where only email is available?

---

## CRM Export — Standard Pattern

**Company Level:**
1. CRM Company Lookup (Run if Domain is not empty)
2. CRM Company Create (Run if CRM Company Result is empty AND ICP Qualified is not "No")
3. CRM Company Update (Run if CRM Company Result is not empty)

**Contact Level:**
4. CRM Contact Lookup (Run if CRM Company Result is not empty)
5. CRM Contact Create (Run if CRM Contact Result is empty)
   - Always try to create even if email is missing — LinkedIn URL alone is enough
6. CRM Contact Update (Run if CRM Contact Result is not empty)

**Match keys:** Company = Domain. Contact = Work email (primary) → LinkedIn URL (secondary) → Name + Company (last resort).

**Source / attribution fields:** If the CRM has a "Lead Source" or equivalent attribution field, set it on every create and update so you can track which campaign or list a record came from.

---

## Blocklist Management

Before pushing to any sequencer, check against existing sequences and CRM records to prevent contacting people who are already being worked.

**For CRM blocklist:** Run CRM Contact Lookup before the sending step. If CRM Contact Result is not empty → do not push (they are already in the system).

**For Instantly blocklist:** The "Skip if Lead is in Workspace" toggle handles this automatically — toggle must always be ON.

**For HeyReach blocklist:** HeyReach has built-in duplicate prevention per workspace — same mechanism as Instantly.

---

## Google Sheets Export

Use when there is no CRM. Always use "Lookup, Add or Update Row" (upsert) instead of "Add Row" — prevents duplicates on re-runs.

Match column: Company Domain (or Work Email for contacts).

**When to use Google Sheets vs CRM:**
- No CRM → Google Sheets
- CRM exists → always CRM, even if it requires more setup
- Google Sheets is a stepping stone, not a long-term destination

