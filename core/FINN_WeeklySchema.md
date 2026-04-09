# FINN Weekly File Schema
## Exact Template for Creating or Auditing Weekly Lesson Files
### Read this instead of reading an existing weekly file for format reference.

This file is the authoritative format specification for all `FINN_W[##].md` files.
When creating a new week or auditing structure, use this — not W20 or any other weekly file.

---

## File Header (lines 1–6)

```markdown
# FINN — Week [##]: [Short Title]
## [Full Month Theme] | [Month Name]: [Month Phase]
**Dates:** [Mon Day] – [Mon Day], [Year]
**Week Number:** [##] of 24

---
```

Example:
```
# FINN — Week 21: Capstone Launch
## Capstone Execution, Final Analysis & Milestone 4 | Month 6: Capstone Execution
**Dates:** August 31 – September 5, 2026
**Week Number:** 21 of 24
```

For holiday weeks, add after the header and before the first `---`:
```markdown
> **NOTE:** [Day Month Date] is [Holiday] ([type]). Class is cancelled.
> Async package distributed [Day before]. See [Day] section below.
```

---

## WEEK OVERVIEW Section

```markdown
## WEEK OVERVIEW

### Theme
[2–3 sentences describing what the week accomplishes, why it matters at this point in the course, and what Monday/Wednesday/Friday each contribute.]

### Learning Objectives
By the end of this week, students will be able to:
- [Specific, measurable, verb-led objective]
- [6–8 total objectives, matching the week's content]

### Materials Needed
- `finnenv` environment — [list specific packages if new ones are introduced]
- [Prior notebook or output they need to bring]
- [External data or account requirement]
- Starter notebook: `W[##]_workshop_[topic]_starter.ipynb`

### Pre-Week Checklist (Instructor)
- [ ] Push `W[##]_workshop_[topic]_starter.ipynb` to GitHub
- [ ] [Other prep tasks — 4–6 items]
- [ ] Assign DMB rotation for Monday, Wednesday, Friday
```

---

## MONDAY Section

```markdown
## MONDAY — [Full Date, Year]
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** [Brief description of what portfolio context is relevant this week]

#### Block 1 — Pre-Market Scan (9:00–9:15 AM)
[Optional — only include if there's a specific pre-market focus beyond standard. Usually omit Block 1 from DMB header and go straight to Block 4.]

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "[Specific, actionable observation task that connects to tonight's theory session. Written as FINN speaking directly.]"

---

### EVENING: Theory Session (8:00–9:30 PM EST)
**Topic:** [Topic Name — Subtitle]
**Curriculum Source:** [Wiki section reference or "All prior content — synthesis"]

#### Pre-Session Setup
- [ ] [Student preparation item — 3–5 items]

#### Block 1 — Day Review & [Context Frame] (8:00–8:15 PM) | 15 min

"[FINN voice — opening framing. Usually starts with a question or observation from the day's market. Sets up what tonight covers and why it matters now.]"

[Instructor action or round-table prompt if applicable.]

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 min

[Content organized into Topic A / Topic B / Topic C if the session covers multiple threads. Each topic: 10–20 min. Written in FINN voice with direct quotes. Includes specific Socratic questions to ask.]

**Topic A: [Name] ([X] min)**
"[Content in FINN voice. Every claim has a number. Every assertion is testable.]"

**Topic B: [Name] ([X] min)**
"[Content continues. Push for specificity. Flag failure modes.]"

#### Block 3 — [Activity: Workshop / Peer Review / Writing / Independent Work] (8:55–9:15 PM) | 20 min

[Description of what students do. Instructor action. What to flag or coach.]

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 min

**Wednesday workshop:**
"[Preview of what Wednesday covers. Mention the starter notebook. State what students need to prepare/bring.]"

**[Pre-reading / Pre-work assignment]:** [Specific task before Wednesday.]

**Closing reflection:**
*"[Fill-in-the-blank statement in italics.]"*
```

---

## WEDNESDAY Section

```markdown
## WEDNESDAY — [Full Date, Year]
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** [Brief context on portfolio state at mid-week.]

#### Block 4 — Observation Assignment (9:50–10:00 AM)
"[Specific prep task that feeds directly into tonight's workshop. Students must do this before class.]"

---

### EVENING: Workshop Session (8:00–9:30 PM EST)
**Workshop:** W[##] — [Workshop Title]
**Notebook:** `W[##]_workshop_[topic]_[initials].ipynb`
**Curriculum Source:** [Reference to wiki section or prior notebooks]

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 min

"[Tonight we do X things. State them explicitly. Connect to Monday. Tell students what they'll have by end of session.]"

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 min

[Opening import block first:]
```python
import pandas as pd
import numpy as np
# ... [all imports for this workshop]
```

**Step 1 — [Description] ([X] min)**
```python
# [Code block — always use real code, never pseudocode]
```

**Step 2 — [Description] ([X] min)**
```python
# [Code block]
```

**Step 3 — [Description] ([X] min)**
```python
# [Code block]
```

[3–4 steps typical. Each step is a function or logical unit. Steps are labeled with timing.]

#### Block 3 — Independent / Pair Work (8:50–9:15 PM) | 25 min

[What students do on their own. What instructor does (circulates, gives 1:1 feedback). Coaching questions to ask each student.]

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 min

**Share-out ([X] min):**
"[What students share. Usually: one result, one finding, or one question from independent work.]"

**Muddiest Point (5 min):**
> *"[Fill-in-the-blank muddiest point statement.]"*

**Notebook submission:** `W[##]_workshop_[topic]_[initials].ipynb` → GitHub.
```

---

## FRIDAY Section

```markdown
## FRIDAY — [Full Date, Year]
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Portfolio Pulse:** [Full account snapshot context for end of week.]

#### Block 4 — Observation Assignment (9:50–10:00 AM)
"[Weekend prep or report-related task. Students should complete before Friday evening.]"

---

### EVENING: Review & Market Session (8:00–9:30 PM EST)
**Topic:** Week [##] Review + [Specific Focus] + [Deliverable or Next Week Preview]

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 min

[4–6 numbered Socratic questions in FINN voice. Questions review the week's content and apply it to live trading results. No leading questions — push for specific, evidence-backed answers.]

1. "[Question.]"

2. "[Question.]"

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 min

[Standard structure: SPY, QQQ, VIX review. Sector scan. Open positions check. Add a week-specific focus question connecting market conditions to the capstone or current strategy theme.]

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 min
Standard checklist. [Add any week-specific note if applicable.]

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 min

**[Deliverable collection if any:]**
"[What gets pushed to GitHub tonight and when.]"

**Assign reading for next week:**
- [Specific resource or notebook to review before Monday]

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*
```

---

## WEEKLY DELIVERABLES SUMMARY

```markdown
---

## WEEKLY DELIVERABLES SUMMARY

| Deliverable | Due | Format |
|-------------|-----|--------|
| [Workshop notebook] | [Day] [time] | `.ipynb` pushed to GitHub |
| [Report section or output] | [Day] [time] | `[filename_format]` |
| [Trading journal] | Friday 11:59 PM | Updated `.csv` or `.md` |
```

Standard deliverables every week:
- Workshop notebook: Wednesday 11:59 PM
- Trading journal: Friday 11:59 PM
- Any report section: specified deadline

---

## INSTRUCTOR NOTES

```markdown
---

## INSTRUCTOR NOTES FOR WEEK [##]

**[Bolded topic/challenge headline]:** [2–4 sentences of coaching guidance. What to watch for. What to do when it happens. Written as practical, specific advice — not abstract principles.]

**[Second challenge]:** [Same format.]

**[Third challenge — typically: the most common student failure mode this week]:** [Specific failure mode + specific corrective response.]

[4–6 notes total per week. Each one addresses a predictable friction point.]
```

---

## WEEKLY RESOURCES

```markdown
---

## WEEKLY RESOURCES

> Resources are labeled **[Pre-session]** (review before class) or **[Homework]** (explore after). [Add any week-specific note about the resource theme.]

---

### Monday — [Topic]

- **[Type | Timing]** [Title](URL) — Source. [1–2 sentence description of how it connects to Monday's session.]

---

### Wednesday — [Topic]

- **[Type | Timing]** [Resource] — [Connection to workshop.]

---

### Friday — [Topic]

- **[Type | Timing]** [Resource] — [Connection to Friday session or next week.]
```

Resource types: `[Article]`, `[Video]`, `[Book]`, `[Tool]`, `[Reference]`, `[Community]`
Timing labels: `[Pre-session]`, `[Homework]`, `[Reference]`

---

## File Footer

```markdown
---

*FINN Week [##] — [Short Title] | Part of FINN_Month[##].md*
```

For the final file in the course:
```markdown
---

*FINN Week 24 — Presentation, Finale & Course Close | Part of FINN_Month06.md*
*This is the final weekly lesson file in the FINN curriculum.*
*Course dates: April 6 – September 26, 2026.*
```

---

## Async / Holiday Day Format

When a class day is cancelled, replace the full day section with:

```markdown
## [DAY] — [Full Date, Year]
## [HOLIDAY NAME] — CLASS CANCELLED
### ASYNC FALLBACK PACKAGE — Week [##] [Day]
**Original Session Date:** [Day, Month Date, Year]
**Topic:** [What the session would have covered]
**Estimated Completion Time:** 90 minutes
**Due:** [Day Month Date], 11:59 PM

---

#### Context
[2–3 sentences: what the session would have covered, why the async matters for the following session.]

#### Required Reading
- [Specific reading task — 3–4 items]

#### Guided Notes — Answer These in Writing
1. "[Question with specific, calculable answer.]"
2. "[Question.]"
3. "[Question.]"
4. "[Question.]"
5. "[Question.]"

#### Self-Study Exercise
[Single focused task: draft a report section, build a calculation, or complete a notebook.]

#### Submission
- [ ] [File]: `[filename]` → GitHub
- [ ] [File]: `[filename]` → GitHub
```

---

## Timing Quick-Reference

| Block | Monday Theory | Wednesday Workshop | Friday Review |
|-------|-------------|-------------------|---------------|
| Block 1 | 8:00–8:15 (15 min) | 8:00–8:10 (10 min) | 8:00–8:30 (30 min) |
| Block 2 | 8:15–8:55 (40 min) | 8:10–8:50 (40 min) | 8:30–9:05 (35 min) |
| Block 3 | 8:55–9:15 (20 min) | 8:50–9:15 (25 min) | 9:05–9:20 (15 min) |
| Block 4 | 9:15–9:30 (15 min) | 9:15–9:30 (15 min) | 9:20–9:30 (10 min) |

---

*FINN_WeeklySchema.md — Format reference for creating and auditing weekly files.*
*Read this file instead of reading existing weekly files for format guidance.*
*Update this file if the weekly format changes — do not update individual weekly files for format-only changes.*
