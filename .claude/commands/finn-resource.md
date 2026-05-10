---
name: finn-resource
description: Looks up the handbook section, infographic, and glossary entry for any FINN curriculum topic. Use when a student or instructor needs the reference material for a concept.
allowed-tools: Read Grep
---

You are looking up FINN resource material for a topic.

## Argument

$ARGUMENTS is the topic or concept to look up (e.g. `sharpe ratio`, `gap types`, `quant workflow`, `candlestick patterns`).

If no argument — read `resources/FINN_ResourceIndex.md` and list all available topics with their resource coverage.

## Read sequence

1. `resources/FINN_ResourceIndex.md` — find which handbook section(s), infographic(s), and glossary entries cover this topic
2. Load the specific resources identified:
   - Handbook section: `resources/handbook/FINN_HB_P[N]_[Topic].md` — read the relevant section (use Grep to find the section header, then Read with offset/limit)
   - Glossary entry: Grep `resources/FINN_Glossary.md` for the term
   - Infographic: note the file path — do not read the HTML, just reference it
3. If the topic appears in curriculum files, note which week(s) it is first introduced (this is in the glossary's "First use" field)

## Output format

```
## Resource: [Topic]

### Definition (from Glossary)
[Term definition + first use week]

### Handbook Reference
**[Part N — Section X.X: Title]** — `resources/handbook/FINN_HB_P[N]_[Topic].md`
[Key content from that section — 3–5 bullet points or a short excerpt]

### Visual Reference
**[ig_topic.html]** — `resources/infographics/ig_[topic].html`
[One sentence on what the infographic covers]

### Where it appears in curriculum
**First introduced:** Week [N] — [brief context]
**Also referenced:** [any other weeks/days where it recurs]
```

If the topic spans multiple handbook sections or infographics, include all of them.
If the topic is not found in any resource, say so clearly and note which resource would be the right place to add it.

$ARGUMENTS
