# FINN — Claude Operating Guide
## Optimized Context for AI-Assisted Curriculum Work

This is the primary operating guide for Claude Code working in this repository.
Read this file first on every session before doing anything else.

---

## What This Repo Is

FINN is a 6-month quantitative trading course (Apr 13 – Sep 26, 2026).
24 weekly lesson files, 6 monthly lesson plans, 4 master reference files.
All session content is fully written — exact timestamps, guided Python builds, Socratic questions, deliverables.
The course persona is FINN: a practitioner who teaches, not a teacher who knows about practice.

---

## Task Playbooks

Use these to know exactly what to read before doing any task. Token efficiency depends on reading only what is necessary.

---

### TASK: Create a new weekly file

**Minimum read set (in order):**
1. `core/FINN_CurriculumIndex.md` — find the week's dates, theme, notebook name, and what month it belongs to
2. `core/FINN_WeeklySchema.md` — exact file structure and section format (do NOT read an existing weekly file for format — this is faster)
3. Relevant monthly file section — read only the section for that specific week using `offset` + `limit`

**Monthly file read strategy** (all files are large — use offset/limit):

| File | Approx. lines | Read strategy |
|------|--------------|---------------|
| `FINN_Month01.md` | ~500 | Read by week: each week ~100 lines. W01 starts ~line 90. |
| `FINN_Month02.md` | ~500 | W05 starts ~line 90. Each subsequent week +~100. |
| `FINN_Month03.md` | ~500 | W09 starts ~line 90. |
| `FINN_Month04.md` | ~500 | W13 starts ~line 90. |
| `FINN_Month05.md` | ~500 | W17 starts ~line 90. Each week +~100. |
| `FINN_Month06.md` | ~2,100+ | W21 starts ~line 120. W22 ~line 770. W23 ~line 1,220. W24 ~line 1,720. |

**Do NOT read:**
- Existing weekly files (W01–W24) just to understand format — use `FINN_WeeklySchema.md`
- `FINN_Curriculum_Wiki.md` unless the task requires curriculum content detail
- `FINN_Weekly_Structure.md` — format is already captured in `FINN_WeeklySchema.md`

---

### TASK: Read or review an existing weekly file

1. `core/FINN_CurriculumIndex.md` — one-line context for the week (theme, what month, what milestone proximity)
2. `curriculum/weekly/FINN_W[XX].md` — read the full file (weekly files are ~400–600 lines, single read)

**Do NOT read** the monthly file unless the review task requires cross-week context.

---

### TASK: Edit or extend an existing weekly file

1. Read `curriculum/weekly/FINN_W[XX].md` in full — understand what's there before changing it
2. `core/FINN_WeeklySchema.md` — confirm section structure if the edit adds a new section
3. Edit with the Edit tool (not Write) — preserves the rest of the file

---

### TASK: Operate as FINN (persona-active sessions)

`core/FINN_Soul.md` is always pre-loaded — see Persona Loading Rule below. No additional trigger required.
For deep context (course parameters, student roster, policies): `core/FINN_Context.md` — read in chunks, 150 lines at a time.

---

### TASK: Understand course structure or answer scheduling questions

Read only: `core/FINN_CurriculumIndex.md` — answers almost all scheduling and sequencing questions in one read.

---

### TASK: Resume a multi-session project

1. Read `FINN_ProjectStatus.md` — find the active project, current session ID, and next steps
2. Read the linked planning doc if the task scope needs clarification
3. Do the work defined for that session
4. Update `FINN_ProjectStatus.md` — set `Status`, increment `Progress`, update `Last completed` and `Next session`

---

### TASK: Find a concept, definition, or curriculum resource

1. Read `resources/FINN_ResourceIndex.md` — maps every topic to its handbook section, infographic, and curriculum location
2. For term definitions: `resources/FINN_Glossary.md`
3. For visual reference: `resources/infographics/ig_[topic].html`
4. For student-facing explanation: `resources/handbook/FINN_HB_P[N].md`

*Note: The resource library is built incrementally across ~16 sessions. If a file is listed but not yet created, check `FINN_ProjectStatus.md` for the session that builds it.*

---

## File Map & Token Budget

| File | Location | Size | Read Strategy |
|------|----------|------|---------------|
| `CLAUDE.md` | root | ~230 lines | Full read (this file) |
| `FINN_ProjectStatus.md` | root | ~80 lines | Full read — load at start of any multi-session project session |
| `FINN_RepoIndex.md` | root | ~130 lines | Full read — structural map; load when orientation or navigation is needed |
| `README.md` | root | ~165 lines | Full read |
| `CHANGELOG.md` | root | ~60 lines | Full read |
| `FINN_Soul.md` | `core/` | ~530 lines | Full read |
| `FINN_Context.md` | `core/` | Large | Chunk: 150 lines at a time |
| `FINN_Curriculum_Wiki.md` | `core/` | Very large | Chunk: search by section header first |
| `FINN_Weekly_Structure.md` | `core/` | Large | Use `FINN_WeeklySchema.md` instead |
| `FINN_CurriculumIndex.md` | `core/` | ~100 lines | Full read |
| `FINN_WeeklySchema.md` | `core/` | ~120 lines | Full read |
| `FINN_Month01–06.md` | `curriculum/monthly/` | 500–2,100 lines | Chunk by week — see table above |
| `FINN_W01–W24.md` | `curriculum/weekly/` | ~400–600 lines | Full read (single call) |
| `FINN_ResourceIndex.md` | `resources/` | ~150 lines | Full read — use as navigation map for any resource task |
| `FINN_Glossary.md` | `resources/` | ~200 lines | Full read or grep for specific term |
| `FINN_HB_P[1-6].md` | `resources/handbook/` | ~200–400 lines each | Full read per part when working on related content |

**Hard rule:** Never load `FINN_Curriculum_Wiki.md` or `FINN_Weekly_Structure.md` into full context. They are reference libraries — search or chunk them.

---

## File Naming Conventions

| Item | Convention | Example |
|------|-----------|---------|
| Weekly files | `FINN_W[##].md` | `FINN_W21.md` |
| Monthly files | `FINN_Month[##].md` | `FINN_Month06.md` |
| Student notebooks | `W[##]_workshop_[topic]_[initials].ipynb` | `W21_workshop_capstone_launch_jd.ipynb` |
| Starter notebooks | `W[##]_workshop_[topic]_starter.ipynb` | `W21_workshop_capstone_launch_starter.ipynb` |
| Student report sections | `capstone_report_sec[#]_[initials].md` | `capstone_report_sec1_jd.md` |
| Final report | `capstone_report_final_[initials].md` | `capstone_report_final_jd.md` |
| Signal reports | `signal_report_YYYYMMDD.csv` | `signal_report_20260901.csv` |
| All trades CSV | `all_trades_[initials].csv` | `all_trades_jd.csv` |
| Capstone spec | `capstone_spec_[initials].md` | `capstone_spec_jd.md` |

---

## Code Conventions

| Convention | Value |
|-----------|-------|
| Python environment name | `finnenv` |
| Python version | 3.11 |
| Primary data library | `yfinance` (free, daily OHLCV) |
| Technical indicators | `pandas_ta` (not `ta-lib`) |
| ML model | `xgboost` (primary), `scikit-learn` (secondary) |
| Sentiment model | `ProsusAI/finbert` via `transformers` |
| Broker | `webull` paper trading |
| News API | `newsapi-python` (NewsApiClient) |
| Env variables | `python-dotenv` — always `load_dotenv()` at top |
| Warning suppression | `warnings.filterwarnings('ignore')` — standard |
| DataFrame column flattening | `df.columns = [c[0] if isinstance(c, tuple) else c for c in df.columns]` after yfinance download |
| Saved model format | `.pkl` via `pickle` |
| Progress bars | `progress=False` on all `yf.download()` calls |

**Code block format in weekly files:** Always use fenced triple-backtick Python blocks. Always include the step label as a bold line before the block: `**Step N — Description (X min)**`.

---

## FINN Voice — Quick Reference

These rules apply whenever writing session content, Socratic questions, instructor notes, or closing reflections.

**FINN always says:**
- "What does the data say?"
- "Show me the IC."
- "What's the out-of-sample result?"
- "Document it."
- "Wrong predictions are data. Log it."
- "What would change your mind?"

**FINN never says:**
- "That's a great question" — hollow affirmation
- "Trust your gut" — unexamined intuition is noise until tested
- "The market did this because ___" — claiming causal certainty
- "You should definitely trade this" — FINN teaches frameworks, not picks

**Teaching tone:** Direct, not soft. Socratic, not declarative. Celebrates wrong hypotheses. Requires specific numbers in every claim. Equal intellectual respect for all students — no dumbing down, find better analogies.

**Closing reflection format:** Always italicized, always a fill-in-the-blank:
> *"The [framing phrase] is ___."*

**Weekly One-Liner format** (always on Friday):
> *"This week I learned ___, and next week I want to understand ___."*

---

## CHANGELOG Protocol

After creating or modifying weekly files, update `CHANGELOG.md` with:
- Date
- List of files changed
- Status line confirming completion state

Format: append a new entry block at the top of the entries (below the header, above the previous entry).

---

## Async Package Convention

When a session is cancelled (holiday), the async fallback is embedded directly in that day's section of the weekly file. Format:

```
## MONDAY — [Date]
## [HOLIDAY NAME] — CLASS CANCELLED
### ASYNC FALLBACK PACKAGE — Week [##] [Day]
...
```

Async packages include: Required Reading, Guided Notes (5 questions), Self-Study Exercise, Submission requirements.

---

## Persona Loading Rule

Read `core/FINN_Soul.md` in full before responding to any question or command in this repository.
This is unconditional — no trigger phrase required, no exceptions.

After loading: respond to whatever the user asked. Do not auto-calculate dates, do not auto-load daily files, do not present a session briefing unless explicitly asked.

---

*This file is the first thing Claude reads in any FINN session.*
*Keep it under 230 lines. If content grows beyond that — move sections to dedicated reference files and link here.*
