# Clay Formula Columns & Conditional Run Formulas

## Formula Columns

A column that computes a value from existing data. Written in plain text — never as code syntax.

**Format:**
```
IF [condition] THEN output [value]
IF [condition] THEN output [value]
OTHERWISE output [value]
```

**AI Formula Generator:** Describe what you want in plain English — Clay generates the formula code automatically. Useful for complex string manipulation, date calculations, or conditional logic.

---

## Conditional Run Formulas

Control whether an enrichment runs on a given row. Written as plain text.

**Format:** `Run if [condition]`

**AND/OR rules:**
- AND/OR operators always sit on their own line between conditions
- Number conditions only when there are multiple — single conditions need no number

**Example — multi-condition:**
```
Run if:
1. ICP Qualified is "Yes"
AND
2. Work Email is not empty
AND
3. CRM Contact Result is empty
```

**Example — single condition:**
```
Run if ICP Qualified is "Yes"
```

---

## Core Rules

1. Formula columns and conditional run formulas are **always written in plain text** — never as code syntax
2. Formula columns output a value (TRUE/FALSE, a label, a score)
3. Conditional run formulas control whether an enrichment runs
4. Never use generic output field names like "Pass" or "Result" — always descriptive names
5. **Free formula columns always run before paid enrichments** — if a formula can do the job, use it instead of Claygent

---

## Common Formula Patterns

### ICP Qualification Gate (formula column)
```
IF Industry is "Fintech"
AND Employees is between 11 and 200
THEN output TRUE
OTHERWISE output FALSE
```

### Name Split — First Name from Full Name
```
IF Normalised Full Name contains a space THEN output everything before the first space
OTHERWISE output Normalised Full Name
```

### Name Split — Last Name from Full Name
```
IF Normalised Full Name contains a space THEN output everything after the first space
OTHERWISE output empty
```

### Merge First + Last Name
```
Output {First Name} + " " + {Last Name}
```

### Data Unification — Two Sources into One
```
IF LinkedIn URL (from Social URLs) is not empty THEN output LinkedIn URL (from Social URLs)
OTHERWISE output LinkedIn URL (from Web Research)
```

### Sending Gate (Ready to Send)
```
IF ICP Qualified is TRUE
AND Work Email is not empty
AND CRM Contact Result is empty
THEN output TRUE
OTHERWISE output FALSE
```

### Cascade Signal Formula ((multi-source enrichment))
```
IF [Signal A] is not empty THEN output [Signal A value]
IF [Signal B] is not empty THEN output [Signal B value]
IF [Signal C] is not empty THEN output [Signal C value]
OTHERWISE output empty
```

---

## Sending Gate Pattern — Critical Rule

**Never put complex conditional logic directly in the conditional run field of a sending enrichment (Instantly, HeyReach, HubSpot, etc.).**

Why: if you make a mistake, you can't test it without actually running the cells — which means data gets sent incorrectly. You can't undo a contact being pushed to a campaign.

**The correct approach:**
1. Create a dedicated free formula column (e.g. "Ready to Send")
2. Put all conditions in that formula column — outputs TRUE or FALSE
3. Inspect every row to verify logic is correct before anything gets exported
4. The sending enrichment has one simple conditional run: `Run if Ready to Send = TRUE`

This applies to any export step with irreversible consequences: Instantly push, HeyReach push, HubSpot create, Slack message, webhook — anything you can't easily undo at scale.
