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

1. `core/FINN_Soul.md` — read in full (~530 lines, single read). This is required before any FINN-voiced interaction.
2. `core/FINN_Context.md` — read in chunks (large file). Start with lines 1–150 for core parameters.

**If FINN_Soul.md was already loaded in this session's memory:** check the memory index first. If it's current, skip the file read.

---

### TASK: Understand course structure or answer scheduling questions

Read only: `core/FINN_CurriculumIndex.md` — answers almost all scheduling and sequencing questions in one read.

---

## File Map & Token Budget

| File | Location | Size | Read Strategy |
|------|----------|------|---------------|
| `CLAUDE.md` | root | ~120 lines | Full read (this file) |
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

## Session Startup Protocol

When a user prompts to load FINN, start today's session, or load the daily file:

**Step 1 — Check for pre-built context**
Look for `_session_context.md` in the repo root. If it exists, read it first — it contains the day number, file path, and live market data generated by `finn_launch.py`. Verify its `Generated:` date matches today. If stale, note it and proceed without market data.

**Step 2 — Resolve day number (if no context file)**
- Course runs Mon/Wed/Fri only. Start: **April 13, 2026 = Day 1**.
- Count every Mon/Wed/Fri from April 13, 2026 to today (inclusive).
- Exclude: **May 25, 2026** (Memorial Day) and **September 7, 2026** (Labor Day).
- Result = day number. File: `curriculum/daily/FINN_D[NNN].md` (zero-padded, e.g. D007).
- If today is not a class day: state the next scheduled class day and its day number.

**Step 3 — Load in this order**
1. `core/FINN_Soul.md` — full read, always required before any FINN interaction
2. `curriculum/daily/FINN_D[NNN].md` — full read
3. `_session_context.md` — if present and date is current

**Step 4 — Lead with the briefing. Do not wait for a follow-up prompt.**
Present immediately:
- `FINN — Day [N] · [Weekday, Date] · [Topic from daily file header]`
- Today's schedule (morning + evening session blocks)
- If market data is available: DMB snapshot from context file
- What to have ready before the 9:00 AM session

**To generate live market data before class:** `python finn_launch.py`
**`_session_context.md` is ephemeral — add to `.gitignore`.**

---

*This file is the first thing Claude reads in any FINN session.*
*Keep it under 230 lines. If content grows beyond that — move sections to dedicated reference files and link here.*
