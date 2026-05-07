# Task: Push Clay Output to a Sequencer (Instantly / HeyReach)

Recipe for wiring the final Clay step that pushes qualified, enriched, personalized contacts into Instantly (cold email) or HeyReach (LinkedIn). Covers Add Lead to Campaign action setup, variable mapping, multiple campaigns from one table, and the conditional-run rule.

## When to use this

User asks to "push to Instantly", "send leads from Clay to a sequencer", "wire up HeyReach", "set up the Instantly Add Lead step", "map custom variables", or you're at the end of phase 06 of `tasks/build-clay-workflow.md`.

## Inputs required

- Sequencer connected in Clay (Instantly: V2 API key only — V1 deprecated; HeyReach: standard API key)
- **Campaign already created in the sequencer** — Clay cannot create campaigns, only push leads into existing ones
- Sending Gate formula column built (see `tasks/design-sending-gate.md`) — non-negotiable
- List of `{{variable_name}}` placeholders used in the campaign copy (exact names, case-sensitive)

## Process

### 1. Confirm the campaign exists in the sequencer

Open Instantly (or HeyReach), confirm the campaign is set up with the copy that contains the `{{variables}}`. Note every placeholder name exactly as it appears in the copy. Clay's variable mapping is case-sensitive — a mismatch silently sends with empty values.

### 2. Add the sequencer step in Clay

In Table B (the contacts table):
- Add enrichment → Instantly (or HeyReach)
- Action: **Add Lead to Campaign** (this is the primary action — Update Lead is secondary, Verify Email and Find Leads are not used in standard workflows)
- Authenticate with the Version 2 API key for Instantly

### 3. Configure required inputs

**Instantly Add Lead to Campaign:**
- Campaign ID — dropdown from connected account; click Refresh fields if a newly-created campaign doesn't appear
- Email — map to your unified Work Email column (output of the email waterfall)
- Skip if Lead is in Workspace — toggle ON (default). Always leave ON to avoid duplicate sends across campaigns
- First Name, Last Name, Company Name, Website, Phone — map from cleaned columns (use the name normalization Claygent output, not raw)

**HeyReach Add Lead to Campaign:**
- Campaign ID — dropdown
- LinkedIn URL — required; map to the unified LinkedIn URL column (gate the sending step on `LinkedIn URL is not empty`)
- First Name, Last Name, Company Name — same cleaning rule as Instantly

### 4. Map custom variables

Expand the Custom Variables section. For every `{{placeholder}}` in the campaign copy:
- Enter the placeholder name exactly (case-sensitive, no `{{ }}` braces — just the raw name)
- Map it to the matching Clay column

Variable names that fail to map send with empty content. Test on 1-2 leads before scaling.

### 5. Apply the conditional run — Sending Gate only

In Run Settings → Conditional Run:

```
Run if Ready to Send = TRUE
```

That's the only condition. All other logic lives in the Ready to Send formula column (see `tasks/design-sending-gate.md`).

### 6. Multiple campaigns from one table

If the workflow routes to multiple campaigns based on segment, persona, or signal:

- Add **one Add Lead to Campaign step per campaign** — same table
- Each step has its own conditional run referencing its own Ready to Send column (e.g. `Run if Ready to Send — Fintech Campaign = TRUE`)
- Each campaign-specific personalization enrichment must carry the same conditional run as its corresponding sending step — otherwise personalization fires for rows that won't be sent (waste) or doesn't fire for rows that will (empty variables)

### 7. Test before scaling

- Run the sending step on a hand-picked 1-2 rows first
- Open the campaign in Instantly/HeyReach → confirm the lead landed, all variables populated, no `{{}}` placeholders left in the rendered email/message
- Then enable on the full Ready to Send = TRUE set

### 8. Returns / status interpretation

**Instantly response codes:**
- `Added to Campaign` — success
- `Skipped, already in the workspace` — duplicate detected and skipped (expected if Skip if Lead is in Workspace = ON)
- `Missing input` — Email field empty or not mapped → check unification formula

**HeyReach response codes:** similar pattern; main failure is `LinkedIn URL invalid` — usually means a personal profile URL was passed where a public profile URL was expected.

## Output format

```
SEQUENCER PUSH: [Instantly / HeyReach] — [campaign name]

PREREQUISITES
- Campaign exists in sequencer: [Y/N, campaign ID]
- API key version: [Instantly V2 / HeyReach standard]
- Sending Gate column: [Ready to Send (column name)]

ACTION CONFIG
Step: [Instantly / HeyReach] Add Lead to Campaign
Campaign ID: [from dropdown]
Required field mapping:
  - Email: [Clay column name]
  - LinkedIn URL: [Clay column name] (HeyReach only)

CUSTOM VARIABLE MAPPING
| Placeholder in copy | Clay column |
|---|---|
| {{first_name}}     | [column]   |
| {{company_name}}   | [column]   |
| {{[var]}}          | [column]   |

CONDITIONAL RUN
Run if Ready to Send = TRUE
(no other conditions)

MULTI-CAMPAIGN (if applicable)
- Campaign 1: gated on Ready to Send — [Segment 1] = TRUE
- Campaign 2: gated on Ready to Send — [Segment 2] = TRUE
- Each campaign-specific personalization enrichment carries the matching Ready to Send conditional run

TEST PLAN
- [ ] Push 1-2 hand-picked rows
- [ ] Confirm in sequencer: lead present, variables rendered correctly, no {{placeholder}} leftovers
- [ ] Enable on full Ready to Send = TRUE set
```

## Pass criteria

- Conditional run is `Run if Ready to Send = TRUE` only — nothing else
- Every `{{placeholder}}` in the campaign copy has a Custom Variable mapping (case-sensitive exact match)
- Skip if Lead is in Workspace = ON (Instantly)
- Required field mapping uses cleaned/unified columns, not raw enrichment outputs
- Test push to 1-2 leads completed and inspected before full enable
- For multi-campaign: each campaign has its own Ready to Send column AND each campaign-specific personalization enrichment carries the matching conditional run

## Common failures

- **V1 Instantly API key** — deprecated, won't work. Use V2.
- **Campaign created in Clay** — Clay cannot create Instantly/HeyReach campaigns. Always create in the sequencer first.
- **Variable name mismatch** — `{{firstName}}` in copy but mapped as `first_name` in Clay → empty variable in the sent email. Case-sensitive exact match.
- **Skip if Lead is in Workspace = OFF** — same lead lands in 3 campaigns from 3 different table builds. Always ON.
- **Multi-campaign with one shared Ready to Send column** — every row routes to every campaign. Defeats segmentation.
- **Personalization enrichment without matching conditional run** — variables get computed for rows that won't be sent (credit waste) or stay empty for rows that will (broken copy).
- **Mapping raw enrichment columns instead of unified formula columns** — when one source returns "Acme Corp Ltd." and another returns "Acme", downstream rendering is inconsistent.

## What to do after

- Monitor the campaign in Instantly/HeyReach for 24-48h
- For reply analysis once leads land → `clusters/campaign-ops/tasks/analyze-replies.md`
- For meeting-intent scoring on positive replies → `clusters/campaign-ops/tasks/score-meeting-intent.md`
- For weekly campaign reporting → `clusters/campaign-ops/tasks/weekly-report.md`

## Deeper knowledge

- Full Instantly Clay integration (4 actions, conditional patterns) → `clay-engineer/providers/sequencers/instantly.md`
- Full HeyReach Clay integration → `clay-engineer/providers/sequencers/heyreach.md`
- Full export phase → `clay-engineer/phases/06-export.md`
- Sending Gate column construction → `tasks/design-sending-gate.md`
- HubSpot Clay actions (CRM push instead of sequencer) → `clay-engineer/providers/crm/hubspot.md`
- Salesforce Clay actions → `clay-engineer/providers/crm/salesforce.md`
