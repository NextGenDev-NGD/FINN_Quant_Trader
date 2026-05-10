# FINN — Release Notes
## Financial Intelligence & Navigation Network

> Audience: developers, prospective students, and curriculum partners evaluating FINN as a course product.
> For internal session history and file-level changes, see `CHANGELOG.md`.

---

## v0.4 — Embedded Knowledge Base
**Released:** May 10, 2026

All 26 infographics, 6 handbook parts, and the glossary are now wired into the curriculum at the exact moment students need them — not in a separate reference tab, but as inline callouts inside session scripts.

**What this unlocks:**
- A student in a Python workshop on volume analysis sees the volume patterns infographic at the exact step where it's first used — not in a sidebar, not in a separate document
- Every concept in the curriculum now has a complete reference path: session script → callout → handbook section or infographic → glossary term
- Instructors don't need to manage "additional reading" — it's embedded in the delivery layer

**Coverage:** All monthly files (Month 01–06), all weekly files (W01–W24), daily scripts D001–D015. Daily scripts D016+ integrate callouts on creation.

---

## v0.3 — Student Resource Library
**Released:** May 8–9, 2026

Complete student-facing reference library built from scratch alongside the curriculum — not adapted from third-party materials.

**What this includes:**
- **FINN Glossary** — ~72 terms defined with first-use week and cross-references to handbook and infographics
- **Student Handbook — 6 parts:**
  - P1 Getting Started — trade types, TradingView, Webull, Finviz, broker comparison
  - P2 Chart Reading — candlesticks, S&R, trendlines, chart patterns, gap types, Heikin Ashi
  - P3 Order Execution — 16 order types, short selling, PFOF, slippage, best execution decision matrix
  - P4 Market Context — daily routine, information sources, reading the open, day types, market traps
  - P5 Trading Psychology — emotions, cognitive biases, pre/post-trade checklists, emotional journal fields
  - P6 Market Reference — Fibonacci, volume guide, MTF analysis, sentiment indicators, Heikin Ashi advanced
- **26 Infographics** — self-contained HTML files, FINN dark theme, print-ready, zero external dependencies
- **Resource Index** — master navigation map linking every curriculum topic to its reference material

**Why it matters:** Most trading courses point students to YouTube or Investopedia for supplementary reading. FINN's resource library is purpose-built for the course — every definition, diagram, and example is calibrated to what students encounter in sessions.

---

## v0.2 — Live Delivery Layer
**Released:** April–May 2026

Teleprompter-grade session scripts for the first 5 weeks of live delivery, plus tooling for daily live market context.

**What this includes:**
- **Daily scripts D001–D015** (Weeks 1–5) — teleprompter format with AM/PM splits, exact timestamp transitions, student cold-call prompts, deliberate mistake patterns for teaching moments, and seed questions for cold opens
- **Session launcher** (`finn_launch.py`) — pulls live market data (ES/NQ/YM futures, VIX, SPY, QQQ, BTC, 10-yr yield, all 11 sector ETFs) and writes a session context file before each class
- **Python environment guide** — complete Windows 11 setup: Python 3.11, `finnenv` venv, all course packages, known issues + resolutions table
- **Annotated Jupyter transcript** — full walkthrough of the first Python session (D002) with actual student output, teaching annotations, and key concept callouts

**Why it matters:** Weekly files plan sessions. Daily files run them. The gap between "lesson planned" and "lesson delivered" is where most instructors improvise — and where consistency breaks down. D-files close that gap.

---

## v0.1 — Full Curriculum
**Released:** April 8, 2026

Complete 24-week quantitative trading course — every session fully scripted before the first student walked in.

**What this includes:**
- **24 weekly lesson files** (W01–W24) — each covering Mon/Wed/Fri: DMB blocks, theory sessions, guided Python builds, Socratic questions, deliverables, and instructor checklists
- **6 monthly lesson plans** — higher-level arc for each 4-week phase with milestone prep
- **Core reference files:** FINN_Soul.md (instructor persona), FINN_Context.md (course parameters), FINN_Curriculum_Wiki.md (full knowledge reference), FINN_CurriculumIndex.md (24-week scheduling map)
- **4 student milestones** — oral assessment (M1), strategy presentation (M2), paper trading review (M3), capstone presentation + written report (M4)
- **CLAUDE.md** — operating guide for AI-assisted curriculum work: task playbooks, token budget, naming and code conventions

**Why it matters:** FINN is not a slide deck. It is a fully scripted, practitioner-led course with Python workshops every week, paper trading from Month 3, and a capstone project in Month 6. v0.1 is the complete blueprint — delivered before day one of class.

---

## What's Next

- **Daily scripts D016+** — written as the course runs; each integrates knowledge base callouts on creation
- **FINN Skills** — `/finn-resume`, `/finn-weekly`, `/finn-daily`, `/finn-resource` slash commands for faster AI-assisted session work
- **Student distribution layer** — packaging the resource library for direct student access

---

*For internal session logs and file-level change history, see `CHANGELOG.md`.*
