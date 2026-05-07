# Apify — Clay Integration

Apify is a web scraping marketplace with hundreds of user-created actors (scrapers) for specific data sources — Facebook, Google Maps, LinkedIn, Reddit, TikTok, Instagram, Yellow Pages, job listings, niche forums, and more.

**Why web scraping > database data:** Database records can be stale within 24 hours. Web scraping returns live data at the moment of the run.

**Use when:** No standard database covers the target data source, or fresh real-time data is required.

**Pricing:** Free tier includes $5 compute credits. Some actors have their own subscription costs. Pay-per-use based on memory/compute.

**Account:** Requires own Apify API key (no Clay-managed option). Connect via Settings > Connections or via the enrichment modal.

---

## Two Ways to Use Apify in Clay

### 1. As a Source (new table from Apify output)
Run an Apify actor externally, then use a **webhook** to feed completed results into a new Clay table. Good for large batch scrapes that run independently before a workflow starts.

Setup: Click `+ Add` in a workbook → search Apify → select from results.

### 2. As an Enrichment (row-by-row) *(most common)*
Run an Apify actor against each row in an existing Clay table, using a column value (e.g. Facebook URL) as dynamic input.

Setup: Add enrichment → search **Apify** → select **Run Apify Actor**.

---

## The Single Action: Run Apify Actor

**Required:**
- **Apify Actor** — dropdown populated from your connected Apify account's saved tasks. **The actor must be saved as a task in Apify first** — this is what makes it appear in Clay's dropdown.

**Optional:**
- **Input Data** — JSON format. Pass the actor's configuration with dynamic column references.

---

## Critical Setup Step — Save as Task in Apify First

1. Go to Apify Store → find the actor (filter by rating — use highly-rated ones)
2. Open the actor → click **Create Task**
3. Give it a name
4. Go to the task → click **JSON** tab → copy the full JSON input structure
5. Paste this JSON into Clay's Input Data field

---

## Configuring Input Data in Clay

After selecting the actor, paste the task JSON and **replace relevant static values with Clay column references**:

```json
"key": {Column Name}
```
- Use quoted key, unquoted token (no quotes around the column reference)
- Example: `"url": {Facebook Link}`

**Example — Facebook Page Scraper:**
```json
{
  "startUrls": [{"url": {Facebook Link}}]
}
```

---

## Practical Example — Facebook Page Scraper for SMB Email Extraction

**Use case:** Table of local businesses from Google Maps. Many don't have emails on Google Maps but list them on their Facebook page.

**What the Facebook Page Scraper returns:**
- Email address (if listed)
- Website URL
- Reviews and ratings
- Full page text
- Whether the page is running Facebook ads (useful signal)
- All publicly listed page data

**Workflow:**
1. Build Clay table (e.g. from Google Maps scrape — up to 50k rows)
2. Add enrichment → Run Apify Actor → select Facebook Page Scraper task
3. In Input Data JSON, replace static URL with `{Facebook Link}` column
4. Conditional run: `Run if Facebook Link is not empty AND Email is empty`
5. Run across table → collect fresh emails
6. Validate emails → push to sequencer

---

## Apify Actor Store — Best Practices

- Always check ratings before using an actor — highly-rated ones are more reliable and maintained
- Actors are constantly updated — check for updates if one stops working
- There is likely an actor for almost any scraping use case
- Some actors require their own subscription on top of Apify compute costs — check before building
- Comply with the target website's terms of service

---

## Viewing Apify Results in Clay

After the actor runs, click the **Source Cell** for any enriched row to see all returned data. From there:
- Create new columns referencing specific fields
- Use dot notation for nested values (e.g. `contactInfo.email`)
- Pass data to downstream enrichment steps
