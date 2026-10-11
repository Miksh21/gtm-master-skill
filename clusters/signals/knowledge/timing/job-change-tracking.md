# Job Change Tracking

## Overview

Monitor job changes of your contacts as buying signals.

## Two Methods in Clay

### 1. Monitor Existing Table
- Actions > Monitor for Job Changes
- Specify the LinkedIn URL column
- Save and run

### 2. Create New Tracking Table
- +Create New > Table > Track Job Changes
- Or copy a template

- **Self-refreshing alternative (2026-10-11):** Clay Audiences auto-add contacts as they match criteria, with no 50k table row cap, so a new-in-role list keeps itself current; sync to Supabase (optionally a Vercel page) for a free always-current job-change feed. [#869]

## Historical vs Future Tracking

### Historical
- Include "Company LinkedIn URL"
- Checks if the contact has changed companies

### Future
- Only "Person LinkedIn URL"
- Monitors future changes

## Behavior

- New row created for each detected change
- Complete history maintained
- Delay from a few minutes to several hours depending on volume

## Signal Value

- 3x higher response rate vs cold
- Timing, one rule: relationship touch within the first weeks (acknowledgment, no pitch); sell from day 14-45 (peak engagement); re-check at 90-180 days for budget (updated 2026-10-11: was "Peak engagement: days 14-45 after change", creator-radar review L3-10)
- They're actively building their stack
- Vendor amnesty period (new leadership willing to try new tools)

## Best Trigger Template

```
As you're taking over {{department}} at {{company}}, curious how
you're currently handling {{relevant_problem}}?

We helped {{similar_company}} with exactly that.
```
(updated 2026-10-11: was "Hey congrats on the new role at {{company}}." as the opener, creator-radar review L3-04)
