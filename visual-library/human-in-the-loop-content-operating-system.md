# Human-in-the-Loop Content Operating System

**What this shows:** A Human + AI content workflow that produces 100+ content pieces every month, moving from ideas through drafting, development, management, and distribution to analytics. Humans own research, writing, design, and video editing while AI tools handle drafting and repurposing at each stage.

```mermaid
flowchart TD
    Ideas["Content Ideas"] --> Researcher["Human Researcher"]

    Researcher --> LI["LinkedIn (favikon)"]
    Researcher --> SC["Sales Calls (sybill)"]
    Researcher --> NL["Newsletters (beehiiv)"]
    Researcher --> SFV["Short Form Videos (sandcastles.ai)"]

    LI --> Drafts["Content Drafts"]
    SC --> Drafts
    NL --> Drafts
    SFV --> Drafts

    Drafts --> MP["MagicPost"]
    Drafts --> CL["Claude"]
    Drafts --> PX["Perplexity"]

    MP --> Dev["Content Development"]
    CL --> Dev
    PX --> Dev

    Dev --> Writer["Human Content Writer"]
    Dev --> Designer["Human Designer (Figma)"]
    Dev --> Video["Human Video Editor (Adobe)"]

    Writer --> Mgmt["Content Management (Notion)"]
    Designer --> Mgmt
    Video --> Mgmt

    Mgmt --> Dist["Distribution"]

    Dist --> LIP["LinkedIn Posts (LinkedIn)"]
    Dist --> EN["Email Newsletter (Beehiiv)"]
    Dist --> Blog["Blog (Webflow)"]
    Dist --> YT["YouTube (Buffer)"]

    LIP --> An["Analytics"]
    EN --> An
    Blog --> An
    YT --> An
```

## Detail notes

Headline claim on the diagram: "100+ content pieces every month".

| Stage | Owner | Sub-components | Tools |
|---|---|---|---|
| Content Ideas | Shared | Entry point of the system | (none shown) |
| Research | Human (Human Researcher) | LinkedIn, Sales Calls, Newsletters, Short Form Videos | favikon (LinkedIn), sybill (Sales Calls), beehiiv (Newsletters), sandcastles.ai (Short Form Videos) |
| Content Drafts | AI | Drafting and repurposing from the research inputs | MagicPost, Claude, Perplexity |
| Content Development | Human | Human Content Writer, Human Designer, Human Video Editor | Figma (design), Adobe (video editing) |
| Content Management | Shared | Central content hub and pipeline tracking | Notion |
| Distribution | Shared | LinkedIn Posts, Email Newsletter, Blog, YouTube | LinkedIn, Beehiiv, Webflow, Buffer |
| Analytics | Shared | Performance feedback on all distributed channels | (none shown) |

Key pattern: humans sit at the top (research) and middle (writing, design, video) of the funnel while AI tools sit in the drafting layer between them; every distribution channel feeds a single analytics stage that closes the loop back to content ideas.
