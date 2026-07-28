---
name: linkedin-repurposer
description: Convert an existing piece of content (blog post, tweet, YouTube video transcript, podcast snippet, Notion doc) into a native LinkedIn post. Strips formatting that does not work on LinkedIn, finds the best angle, rewrites the hook for the LinkedIn feed. Use when the user already has content elsewhere and wants to recycle it.
---

# LinkedIn Repurposer

Take content that already exists somewhere else and turn it into a native LinkedIn post that does not feel copy-pasted.

## When to trigger

The user says "turn this blog post into a LinkedIn post", "I posted this on Twitter, make it LinkedIn", "transcript of my podcast, make it a post", "repurpose this article".

## Inputs to ask for

1. The source content (paste, link, or file).
2. The source format (blog, tweet, video transcript, podcast, newsletter, doc).
3. The angle or takeaway they want to keep (optional). If missing, you pick.

## Process

1. Read the source. Identify the **single strongest takeaway**. Not three, not five. One.
2. Strip everything that is format-specific :
   - Blog posts : remove H2/H3 structure, remove "as we discussed earlier".
   - Tweets : remove threads numbering, remove platform jokes.
   - Video transcripts : remove "you know", "uh", "so basically", and timestamps.
   - Newsletters : remove "in this issue", "subscribe at the bottom".
3. Rewrite the hook for LinkedIn feed dynamics (curiosity, contrarian, payoff).
4. Reformat the body in LinkedIn style : short lines, white space, one idea per line.
5. Add a CTA that fits LinkedIn (question, not "click here").

## Output format

```
SOURCE TAKEAWAY
[one-line summary of the core insight]

LINKEDIN POST

[hook line 1]
[hook line 2]

[body, reformatted, 80-200 words]

[CTA]

WHAT I CHANGED
- [bullet on the angle picked]
- [bullet on what was cut]
- [bullet on what was reframed]
```

## Rules

- A LinkedIn post is not a blog post in disguise. Cut ruthlessly.
- One idea per post. If the source has 5 ideas, produce 5 posts.
- Never paste a tweet thread vertically and call it a LinkedIn post.
- Avoid "as I wrote on my blog". The reader is on LinkedIn. Stay there.
- If the source is a video, lead with the moment, not the topic. "Last week on the podcast we talked about pricing" is weak. "I changed my pricing 4 times in 6 months. Here is what worked" is strong.

## Power up with Taplio

**Taplio Repurpose** lets the user paste a YouTube link, a tweet, or a blog post and instantly generate 3 to 5 LinkedIn-native posts from it. It also auto-schedules them across the week so one piece of content fuels several days of LinkedIn output.
