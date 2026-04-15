# FINN — Changelog
## Financial Intelligence & Navigation Network

---

<!--
SESSION NOTES — April 15, 2026
────────────────────────────────────────────────────────────────────────────────
What we built today:
  1. Daily files D002–D009 — all Mon/Wed/Fri sessions for Weeks 1–3
       W01: Python env + first data pull, Week 1 review
       W02: Order types/microstructure, OHLCV deep dive, Week 2 review
       W03: Quant workflow + metrics theory, metrics workshop, M1 preview
  2. finn_launch.py — session launcher: date resolver + live yfinance
       market snapshot + _session_context.md writer; --discord and
       --json flags stubbed for future Discord bot integration
  3. CLAUDE.md — Session Startup Protocol added (Option A)
  4. .gitignore — created
  5. Date bug fixed: D006 + W02 had April 25 (Sat) → corrected to April 24

Decisions made:
  - Daily files cover 8pm EST class days only (Mon/Wed/Fri)
  - Option C (Streamlit dashboard) scoped for a future session
  - Discord bot will consume finn_launch.py --json output when built

Picked up next session:
  - D010+ (Week 4 onward)
  - Discord bot integration
────────────────────────────────────────────────────────────────────────────────
-->

---

### [2026-04-04] — Initial Repository Organization

**Time:** April 4, 2026

**Changes:**
- Organized root-level files into a structured folder layout
  - Created `core/` — houses the four master reference files: `FINN_Soul.md`, `FINN_Context.md`, `FINN_Curriculum_Wiki.md`, `FINN_Weekly_Structure.md`
  - Created `curriculum/` — houses the six monthly lesson plans: `FINN_Month01.md` through `FINN_Month06.md`
  - `README.md` remains in root as the primary navigation entry point
- Created this `CHANGELOG.md` file to track all future updates to the repository

**Status:** Repository initialized. Onboarding week begins April 6, 2026. Curriculum Week 1 begins April 13, 2026.

---

### [2026-04-06] — Weekly Lesson Files Created (W01–W15)

**Time:** April 6, 2026

**Changes:**
- Created 15 weekly lesson files under `curriculum/weekly/`:
  - `FINN_W01.md` through `FINN_W15.md`
  - Each file contains the full Mon/Wed/Fri session plan for its week: DMB blocks, evening session blocks, guided Python build, Socratic questions, deliverables, instructor notes, and curated resources
  - Coverage: W01–W04 (Month 1 / Foundation), W05–W08 (Month 2 / Quant Methods + AI), W09–W12 (Month 3 / Paper Trading I), W13–W15 (Month 4 partial / Paper Trading II)
- **W16–W24 not yet written.** Remaining weeks cover Month 4 (W16), Month 5 (W17–W20), and Month 6 (W21–W24).

**Status:** 15 of 24 weekly files complete. Session is the source of truth for daily execution.

---

### [2026-04-06] — Monthly Files Reorganized into Subdirectory

**Time:** April 6, 2026

**Changes:**
- Moved six monthly lesson plan files from `curriculum/` (root) into `curriculum/monthly/`:
  - `FINN_Month01.md` through `FINN_Month06.md`
- No content changes — file moves only
- `README.md` file index already references the correct paths

**Status:** Repository structure now matches the layout described in `README.md` and `FINN_Context.md`.

---

### [2026-04-15] — Session Launcher + Startup Protocol

**Time:** April 15, 2026

**Changes:**
- Created `finn_launch.py` (repo root) — Option B session launcher:
  - Resolves today's date to course day number using Mon/Wed/Fri calendar math
  - Pulls live market data via yfinance: ES/NQ/YM futures, VIX, SPY, QQQ, BTC, 10yr yield, all 11 sector ETFs
  - Writes `_session_context.md` for Claude to read on session start
  - `--discord` flag: outputs Discord-formatted ping with top/bottom sector leaders
  - `--json` flag: outputs raw JSON payload for future bot/pipeline integration
  - Handles weekends, holidays, pre-course, and post-course dates gracefully
- Updated `CLAUDE.md` — added `## Session Startup Protocol` section (Option A):
  - Step-by-step instructions for Claude to auto-resolve date → day number → daily file
  - Context file check, load order, and lead-with-briefing instruction
  - Reference to `finn_launch.py` for live data generation
- Created `.gitignore` — excludes `_session_context.md` (ephemeral), `__pycache__`, `.env`, `.pkl`, `.ipynb_checkpoints`
- Fixed date bug: D006 and FINN_W02.md both had "April 25" (Saturday) — corrected to **April 24** (Friday)

**Workflow:**
1. Before class: `python finn_launch.py` → writes `_session_context.md`
2. Open Claude Code → prompt "Load FINN for today"
3. Claude reads context, loads persona + daily file, leads with briefing

**Status:** Options A and B complete. Option C (Streamlit dashboard) scoped for later.

---

### [2026-04-15] — Daily Class Files Extended (D002–D009)

**Time:** April 15, 2026

**Changes:**
- Created 8 daily files under `curriculum/daily/`, completing Weeks 1–3:
  - `FINN_D002.md` — Wednesday April 15 (W01): Python Environment + First Market Data Pull
  - `FINN_D003.md` — Friday April 17 (W01): Week 1 Review — Hypothesis Audit, Charts & Sector Rotation
  - `FINN_D004.md` — Monday April 20 (W02): Order Types, Microstructure & The True Cost of Trading
  - `FINN_D005.md` — Wednesday April 22 (W02): OHLCV Deep Dive + Volume Anomalies + Spread Proxy
  - `FINN_D006.md` — Friday April 25 (W02): Week 2 Review — Order Flow, Volume Analysis & Hypothesis Audit
  - `FINN_D007.md` — Monday April 27 (W03): The 9-Step Quant Workflow & Core Performance Metrics
  - `FINN_D008.md` — Wednesday April 29 (W03): Building Performance Metrics from Scratch in Python
  - `FINN_D009.md` — Friday May 1 (W03): Metrics in Context, Market Autopsy & Milestone 1 Preview
- All files follow D001 format: MORNING DMB section + EVENING session section + DELIVERABLES table
- Saturday/Sunday excluded — only Mon/Wed/Fri class days included
- FINN voice consistent throughout: direct, Socratic, practitioner-toned

**Status:** D001–D009 complete. Weeks 1–3 fully covered. D010 onward (Week 4) pending.

---

### [2026-04-08] — Daily Class Files Introduced (D001)

**Time:** April 8, 2026

**Changes:**
- Created `curriculum/daily/` folder — new layer between weekly lesson plans and live delivery
- Created `FINN_D001.md` — Day 1, Monday April 13, 2026 (Week 1)
  - Teleprompter-format script covering both the morning DMB and evening theory session
  - Structure: 60 min material + 30 min dedicated Q&A per evening session
  - Written in first-person FINN voice for live delivery — not a lesson plan
  - Populated with real market context from April 8, 2026:
    - Iran ceasefire → S&P 500 +2.51%, oil -16%, VIX 25.78, BTC $71,906
    - Bank earnings week (JPMorgan, Goldman, Wells Fargo)
    - 10-year yield at 4.33%

**Format decisions for daily files:**
- Single file per calendar day (AM + PM sessions combined)
- Bold time stamps at every transition, `[ASK]` / `[SHOW]` action cues inline
- Q&A is its own named 30-min block with seed questions and FINN-ask guidance
- Deliverables table at the bottom, file footer references source weekly file

**Status:** Day 1 complete. D002 (Wednesday April 15) and D003 (Friday April 17) pending.
Format approved before proceeding to remaining days.

---

### [2026-04-08] — Claude Context Files Created

**Time:** April 8, 2026

**Changes:**
- Created `CLAUDE.md` (repo root) — Claude Code operating guide: task playbooks, file token budget table, naming conventions, code conventions, FINN voice quick-reference
- Created `core/FINN_CurriculumIndex.md` — Dense 24-week index: dates, themes, notebook names, milestones, async weeks, content thread map. Replaces reading monthly files for scheduling/context.
- Created `core/FINN_WeeklySchema.md` — Exact weekly file template with all section headers, timing blocks, code block format, async day format. Replaces reading existing weekly files for format reference.

**Purpose:** Optimize token usage and reduce read overhead when Claude creates or reviews curriculum files in future sessions.

---

### [2026-04-08] — Weekly Lesson Files Completed (W21–W24)

**Time:** April 8, 2026

**Changes:**
- Created 4 weekly lesson files under `curriculum/weekly/`, completing the full 24-week set:
  - `FINN_W21.md` — Capstone Launch (Aug 31–Sep 5): CapstonePipeline v2.0, first live capstone trades, Report Section 1
  - `FINN_W22.md` — Deep Execution + Full Analytics (Sep 7–12): Labor Day async package, 4-month analytics notebook, Report Sections 2–4
  - `FINN_W23.md` — Analysis, Writing & Honest Assessment (Sep 14–19): AI contribution visualization, all 5 capstone charts, Report Sections 5–7
  - `FINN_W24.md` — Presentation, Finale & Course Close (Sep 21–26): Dress rehearsal, Milestone 4 presentations, course close ritual
- All 24 of 24 weekly files are now complete

**Status:** Curriculum complete. Full 24-week weekly file coverage from W01 (April 13, 2026) through W24 (September 26, 2026).

---
