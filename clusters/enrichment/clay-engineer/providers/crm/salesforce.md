# Salesforce — Clay Integration

## Salesforce Actions in Clay

8 actions available:
1. **Find Account** — by domain/website
2. **Find Contact** — by email or name
3. **Create Account** — new company record
4. **Create Contact** — new contact record
5. **Update Account** — update existing company
6. **Update Contact** — update existing contact
7. **Upsert** — create or update in one step
8. **Import records from a Salesforce list** — pull records from an existing Salesforce list/report into Clay

**Notes:** Salesforce field API names use underscores — always use API names, not labels (e.g. `Website__c` not "Website"). Required fields must be mapped or create/update will fail.

---

## Core Workflow Pattern

**Company Level:**
1. Find Account by domain
2. If found → Update Account, set relevant fields
3. If not found → qualify the company
   - If not qualified → stop
   - If qualified → Create Account

**Contact Level:**
4. Find Contact by email or name
5. If found → Update Contact, set relevant fields
6. If not found → Create Contact

---

## Match Keys — Priority Order

| For | Match key | Notes |
|---|---|---|
| Account lookup | Domain / Website URL | Always use domain — never company name alone |
| Contact — work email available | Work email | Most reliable |
| Contact — LinkedIn available | Name + LinkedIn URL | Second most reliable |
| Contact — name + company only | Name + Company | Use when no email or LinkedIn |

---

## Conditional Run Formulas

**Account Lookup:**
```
Run if Company Domain is not empty
```

**Contact Lookup:**
```
Run if CRM Account Result is not empty
```
(Domain already validated in account lookup — no need to check again)

**Update existing record:**
```
Run if CRM Contact Result is not empty
```

**Create new record:**
```
Run if CRM Contact Result is empty
```

---

## Last Source Field

Always set Last Source (or equivalent custom field) on every CRM create and update. See hubspot.md for the full mapping table.

---

## Import records from a Salesforce list

Use the standard **Import records from a Salesforce list** action to pull records into Clay. Point it at an existing Salesforce list view or report and Clay imports the records as rows.

**Do not use SOQL Import.** The standard list import is the correct path for all Salesforce → Clay imports — including live data refreshes (see Salesforce Live List as Signal Hub below).

---

## Salesforce Live List as Signal Hub

For multi-signal campaigns, Salesforce can serve as the signal coordination layer:
- Salesforce stores all contact records with signal fields
- Clay syncs from Salesforce on a schedule (minimum 1 day)
- Use **Net New** import + **Keep newest row** auto-dedupe combination
- Each sync brings in updated records as "new" rows — deduplication handles the rest
- Formula columns recompute from updated source fields
- Paid steps only run when their output column is empty — once per contact

**See phases/04-table-architecture.md for the full Keep newest row + Keep existing results pattern.**

---

## Other CRM Options (Reference)

| CRM | Actions | Notes |
|---|---|---|
| **Pipedrive** | Find/Create/Update Organization + Person | "Organizations" = companies, "Persons" = contacts. Common with smaller teams. |
| **Close CRM** | Create/Update/Find Lead + Contact | Combines CRM + sequencer. SMB-focused. |
| **Microsoft Dynamics 365** | Create/Update/Find Account + Contact | Complex Azure OAuth setup. Enterprise only. |
| **Attio** | Lookup/Create/Update/Upsert Record | Modern CRM. See providers/other/ for full Attio docs. |
