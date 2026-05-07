# Google Sheets — Clay Integration

## Overview

Google Sheets creates a **live connection** between Clay and a spreadsheet — not a one-time file transfer. Data syncs in real time whenever something happens in Clay.

**Best for:** Early-stage teams without a formal CRM. As the org matures, the next step is a data warehouse or CRM.

**Plan required:** Clay Starter ($149/month minimum). Not available on the free plan.

**Progression path:** CSV export → Google Sheets → CRM / Data Warehouse

---

## The 4 Actions

### 1. Add Row
Inserts a new row into a Google Sheet for every row processed in Clay.
- **Direction:** Clay → Google Sheet (append only)
- **No deduplication** — adds a new row every time it runs, even for the same record
- **Use for:** Building lists, adding new records as they are enriched

### 2. Lookup Row
Checks whether a specific record already exists in a Google Sheet.
- **Lookup is case-insensitive**
- **Works on any Google Sheet you have read access to**, including public ones
- **Returns:** TRUE if a matching row is found, FALSE if not
- **Use for:** Deduplication checks, conditional processing (e.g. only enrich if not already in sheet)

### 3. Lookup, Add or Update Row *(most powerful — recommended default)*
Upsert action. Searches first, then updates or creates in a single step.
- If matching row found → updates it
- If not found → adds a new row
- **Default choice** for any workflow that runs repeatedly on the same dataset
- Equivalent to an **upsert** in database terms

### 4. Update Row(s)
Updates existing rows **by Row ID**.
- **Requires a Row ID** from a previous Lookup Row result
- Does NOT search first and does NOT create new rows
- **Use for:** Targeted updates when you already have the Row ID

---

## Setup — Connecting Your Google Account

1. Actions menu → search **Google Sheets**
2. Click any Google Sheets action
3. Click **Add your account** → sign in to Google
4. **Name your connection** clearly (e.g. `mario-google-sheets`) — important if multiple Google accounts
5. Click **Save**

---

## Add Row — Full Configuration

**Prepare your Google Sheet first:** Create column headers that match the data you want to send. Headers must exist before configuring the Clay action.

1. Actions → Google Sheets → **Add Row**
2. Select your Google account
3. **Google Spreadsheet URL** — click **Select a spreadsheet** to browse. Shows spreadsheet name once selected.
4. **Sheet ID** *(required)* — dropdown for specific tab within spreadsheet (e.g. Sheet1)
5. Use **Refresh fields** if columns don't appear after selecting spreadsheet
6. Clay auto-maps columns where it can — manually fill in any left empty
7. Click **Save and Run**

---

## Lookup, Add or Update Row — Full Configuration

1. Actions → Google Sheets → **Lookup, Add or Update Row**
2. Select your Google account and spreadsheet
3. **Match column** — the column in Google Sheet used to find existing rows (e.g. Company Domain)
4. **Match value** — the Clay column to match against (e.g. `{Domain}`)
5. Map all data fields
6. Clay searches: found → updates / not found → adds new row

---

## Run Settings (applies to all Google Sheets actions)

**Auto-update** — Toggle (default: ON). Re-runs and updates output whenever input data changes.

**Run in batches** *(New feature)* — Toggle (default: OFF). Boosts performance but can impact tools outside Clay connected to Google Sheets. Always test after enabling.

**Only run if** — Conditional formula field. Controls which rows the action runs on.
```
Example — only run if Company Domain is not empty:
{{Company Domain}}

Example — only run if Company Domain is empty (negated):
!{{Company Domain}}
```

**Delay run** — Run immediately (default) or after a specified delay (max 10 minutes).
