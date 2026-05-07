# HTTP API — Clay Integration

Clay's HTTP API action connects to any external system with an API — regardless of whether Clay has a native integration for it.

**Supported HTTP methods:** GET, POST, PUT, DELETE

---

## Two Primary Use Cases

### 1. HTTP API Enrichment *(most common)*
Process data row-by-row to enrich existing Clay table records with data from an external API. Map Clay columns to API parameters and write the response back into the table.

### 2. HTTP API as Source
Import a dataset directly from an API to create a new Clay table.

**Important limitation:** HTTP API as source does **not support pagination** — only a single API response is retrieved.

---

## Setup Methods

### AI-Assisted Setup — Sculptor *(recommended)*
Clay's "Sculptor" feature. Describe your goal in plain English (optionally with a link to the API documentation) and Sculptor automatically generates the full HTTP API configuration — endpoint, parameters, authentication, and field mapping.

Use this first. Only switch to manual if Sculptor gets it wrong.

### Manual Configuration
Configure each component individually:
- Endpoint URL
- Query string parameters
- JSON request body
- Header fields (authentication credentials)
- Field paths to extract specific parts of the response
- Rate limiting parameters

---

## Authentication & Credential Storage

Store authentication credentials as **HTTP API (Headers) accounts** at the workspace level. Credentials are encrypted and reusable across multiple enrichment columns.

**Common header formats:**
```
Authorization: Bearer YOUR_TOKEN
X-API-Key: YOUR_API_KEY
Content-Type: application/json
```

---

## JSON Body Formatting Rules

| Value type | Format | Example |
|---|---|---|
| String (static) | Requires quotes | `"name": "Sam"` |
| Number / Boolean (static) | No quotes | `"age": 30`, `"active": true` |
| Dynamic column ref (string) | Requires quotes around the reference | `"email": "/Email Column"` |
| Dynamic column ref (number) | No quotes | `"count": /Score Column` |

**Exception:** Numbers with trailing zeros (e.g. `0004`) must be wrapped in quotes.

---

## Advanced Configuration

**Conditional Runs** — Only execute when specific conditions are met. Use the "Only run if" field in Run Settings.

**Field Path Filtering** — Extract specific nested fields using dot notation:
`data.user.email` — retrieves only the email field from nested response.

**Rate Limiting** — Configure request limits to match what the API provider allows (e.g. 100 requests per 60 seconds). Always check API docs for rate limits before running at scale.

**Remove Empty Fields** — Toggle to exclude null/undefined fields from the request body.

---

## Best Practices

1. Read the API documentation before configuring
2. Use Sculptor (AI-assisted) first — only go manual if needed
3. Test with a **single row** before running the full table
4. Store credentials in workspace-level HTTP API accounts — never hardcode inline
5. Configure rate limits based on the API docs
6. Use field paths to extract only needed data from response
7. Set conditional runs to avoid burning credits on rows that don't need the call

---

## Common Errors & Fixes

**Body Parse Error (400):**
JSON formatting issue. Common causes:
- Missing quotation marks around string variables
- Missing commas between properties
- Hidden/invisible characters copied from API documentation

Fix: paste the JSON body into a plain text editor first to reveal hidden characters, then re-enter.

**Wrong API Key:**
Some providers (e.g. Apollo) use different API keys for different endpoints. Verify you are using the key for the specific endpoint being called.
