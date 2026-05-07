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

### [2026-05-06] — Technical Analysis Cheat Sheet (HTML Infographic)

**Time:** May 6, 2026 — Day 11 session

**Files created:**
- `market research/May/05062026/technical_analysis_cheat_sheet.html`

**Source material:**
- `market research/May/05062026/Ranking Technical Analysis Tools from Expert Day Trader.md` — video summary (tier list, 15-year day trader)
- `market research/May/05062026/TierList_image.png` — reference image

**Contents:**
- Single-file HTML infographic — opens in any browser, no build step, dark trading theme
- Sticky navigation across 7 sections
- Annotated candlestick anatomy diagrams (bullish + bearish, labeled with leader lines)
- 8 candlestick patterns with hand-drawn inline SVGs: Bullish Engulfing, Bearish Engulfing, Hammer, Shooting Star, Doji, Pin Bar, Inside Bar, Morning Star — each with practical rules and confirmation criteria
- Full S–F tier list (18 tools) with color-coded cards: S-Tier (Price Action, Volume Profile, Footprint), A–F tiers with ranked explanations
- Market Structure diagram — annotated SVG price path showing HH/HL uptrend → LH warning → BOS → CHoCH with labeled swing points
- Volume Profile diagram — horizontal bar chart with POC, VAH/VAL, HVN/LVN labeled; includes 70% value area rule and Naked POC explanation
- Supply & Demand Zones diagram — SVG price path showing Drop-Base-Rally with zone bands; covers RBR/DBD/RBD/DBR zone types and freshness criteria
- ATR section — True Range formula, 1×/1.5×/2× stop sizing, position sizing formula with worked examples, volatility filter use cases
- Quick reference footer — 4 rule-of-thumb cards (Price Action, Volume, Structure, Risk)

**Research basis:** Deep research agent pull covering quantitative thresholds — pin bar wick ratios, inside bar breakout rates (70–80% with trend), VWAP standard deviation bands (±1 SD = 68%, ±2 SD = 95%), naked POC revisit rate (~80% within 10 sessions), Value Area 70% rule, zone quality scoring (max 7), ATR multiplier standards.

**Context:** New material not previously in the FINN curriculum. These tools (price action patterns, Volume Profile, Market Structure BOS/CHoCH, Supply & Demand zones) supplement the existing quant/systematic framework as discretionary-layer concepts. No curriculum files modified.

**Status:** Complete. Static reference file — no update triggers.

---

### [2026-05-04] — Daily Class Files D010–D015 (Weeks 4–5)

**Time:** May 4, 2026

**Files created:**
- `curriculum/daily/FINN_D010.md` — Monday May 4 (W04): Month 1 Integration Review — Lightning Round, Concept Pairs, Milestone Simulation
- `curriculum/daily/FINN_D011.md` — Wednesday May 6 (W04): Workshop — Full Single-Stock Analysis Notebook (no guided build)
- `curriculum/daily/FINN_D012.md` — Friday May 8 (W04): Milestone 1 Oral Assessment + Month 1 Close + Month 2 Preview
- `curriculum/daily/FINN_D013.md` — Monday May 11 (W05): Statistics Theory — Hypothesis Testing, IC, Stationarity, Autocorrelation
- `curriculum/daily/FINN_D014.md` — Wednesday May 13 (W05): Workshop — ADF Test, t-Test, IC & Rolling IC on Real Market Data
- `curriculum/daily/FINN_D015.md` — Friday May 15 (W05): Market Autopsy through a Statistical Lens + Week 6 Preview

**Status:** D001–D015 complete. Weeks 1–5 fully covered. D016 onward (Week 6) pending.

---

### [2026-04-29] — May 2026 Market Intelligence Dashboard (HTML Infographic)

**Time:** April 29, 2026

**Files created:**
- `market research/May/May_2026_Market_Dashboard.html`

**Contents:**
- Single-file HTML infographic (1,065 lines) — opens in any browser, no build step
- Stack: Tailwind CSS CDN + Chart.js CDN + vanilla JS
- 7 sections with sticky navigation:
  1. **Command Header** — macro pill strip (Fed rate, VIX, 10-yr yield, PCE, Oil 2D move, unemployment)
  2. **FOMC Regime Snapshot** — rate/inflation/Warsh transition cards + visual May key-dates timeline (May 1 · May 5–7 earnings · May 8 BLS · May 12 CPI · May 15 Warsh)
  3. **Q1 Earnings Scorecard** — 4 KPI cards (EPS 15.1%, Rev 10.3%, Margin 13.4% record, Beat Rate 84%) + horizontal Chart.js sector EPS bar + sector performance table
  4. **Live Market Heatmap** — color-coded grid, all 23 instruments grouped by category, magnitude-scaled green/red cells, Apr 28 open → Apr 29 close 2D returns
  5. **Ticker Deep Dive** — all 23 tickers with RSI visual gauge, 2D/5D/30D returns, SMA20 position, volume ratio, per-ticker strategy lean callout; organized by group (Mag 7, Semis, Financials, Energy, Airlines, Crypto/Commodities)
  6. **Cross-Asset Divergences** — 6 "Expected → Actual → Why" behavioral signal cards (gold/oil, GS selloff, NVDA/INTC, crypto decoupling, TSLA/INTC, no defensive rotation)
  7. **May Week 1 Strategy Scorecard** — full table with direction badges, options structure, key trigger, primary risk for all 20 tickers
  8. **Watch List** — 3-column footer: USO volume confirmation · NVDA/MSFT earnings binary · May 12 CPI repricing event + regime summary paragraph

**Corrections from reference file (`Q1 Earnings InfoPage.html`):**
- INTC corrected from Bearish → Mean Revert Risk (actual: +16.57% 2D, RSI 87.3, earnings re-rating event)
- GS corrected from Bullish → Cautious Bull at SMA20 (actual: −3.79% 2D on record earnings)
- PG corrected from "Defensive Stronghold" → Neutral/No Trade (actual: below SMA50, no defensive rotation occurring)
- Added 17 tickers not in reference: NVDA, MSFT, GOOGL, TSLA, SMH, SOXL, XLE, USO, BTC, ETH, GLD, QQQ, XLF, SPY, VIX, 10-Yr Yield

**Data source:** `market research/May/May_2026_Market_Context.md` (compiled same session)  
**Status:** Complete. Static snapshot — data locked to April 29, 2026 close.

---

### [2026-04-29] — May 2026 Market Context File Created

**Time:** April 29, 2026

**Files created:**
- `market research/May/May_2026_Market_Context.md`

**Contents:**
- Full macro environment snapshot: FOMC hold at 3.5–3.75%, PCE 3.5%, Powell final press conference, Warsh transition (May 15)
- Q1 2026 S&P 500 earnings scorecard: 15.1% blended EPS growth, record 13.4% net margin
- Live yfinance data pull — Apr 28 open → Apr 29 close — for 23 instruments across all major groups: Mag 7 (AMZN, META, MSFT, GOOGL, NVDA, TSLA, INTC), ETFs (SPY, QQQ, XLF, SOXL, SMH, XLE), macro (VIX, 10-yr yield), energy (USO), crypto (BTC, ETH), gold (GLD), airlines (LUV, ALK)
- 60-day RSI, SMA20, SMA50, volume ratio, and momentum analysis per ticker
- Cross-asset divergences identified: gold ignoring oil spike, crypto decoupling from risk-on tech, GS selloff on record earnings, NVDA not following INTC AI narrative
- Per-ticker strategy lean: directional bias, options structure, swing entry/stop levels
- May Week 1 strategy scorecard with trigger conditions and primary risks
- Key date calendar: May 8 BLS, May 12 CPI, May 15 Warsh transition

**Purpose:** Base context file for May 2026 Week 1 options and swing trade strategy development.  
**Status:** Complete. Update triggers: May 8 BLS print + May 12 CPI + May 15 Warsh.

---

### [2026-04-16] — W01 + D002 Code Corrections (venv, warnings, yfinance conventions)

**Time:** April 16, 2026

**Files changed:**
- `curriculum/weekly/FINN_W01.md`
- `curriculum/daily/FINN_D002.md`

**Changes:**
- `FINN_W01.md` — Pre-Session Setup: replaced generic "finnenv activated" with explicit venv activation path (`Activate.ps1` — not conda)
- `FINN_W01.md` — Step 1 code: added `import warnings` and `warnings.filterwarnings('ignore')` (missing from original)
- `FINN_W01.md` — Step 2 code: added `progress=False` to `yf.download()` call and column flattening line (`df.columns = [c[0] if isinstance(c, tuple) else c for c in df.columns]`)
- `FINN_W01.md` — Extension challenge code: added `progress=False` and column flattening before `['Close']` access
- `FINN_D002.md` — Prep line: added explicit venv activation path (`Activate.ps1` — not conda)

**Reason:** Code in W01 and D002 did not match the verified environment documented in `FINN_D002_Install_Guide.md`. Corrections align all files with the actual working setup confirmed during the April 16 live session.

**Status:** All code blocks in W01 and D002 now match verified session output.

---

### [2026-04-16] — D002 Jupyter Session Transcript Created

**Time:** April 16, 2026

**Changes:**
- Created `curriculum/daily/FINN_D002_Jupyter_Session.md` — full annotated transcript of the D002 evening guided build session:
  - Environment activation walkthrough (venv, not conda — PowerShell Activate.ps1)
  - Steps 1–6 complete with actual student output, FINN annotations, and teaching notes
  - Key concepts table: OHLCV, DatetimeIndex, pct_change(), case sensitivity, NaN, volume vs direction
  - Real data observations: SPY 1-year range $508–$701, highest volume day Nov 20, 2025 (165M shares, -1.52%)
  - Institutional behavior explained: accumulation vs distribution, sentiment aggregation
  - Deliverable reminder and muddiest point prompt included
- Intended for class distribution — shareable reference for all students

**Status:** D002 guided build Steps 1–6 complete. Independent work block pending.

---

### [2026-04-16] — D002 Install Guide + finnenv Setup (Windows 11)

**Time:** April 16, 2026

**Changes:**
- Created `curriculum/daily/FINN_D002_Install_Guide.md` — complete Python environment setup guide for Windows 11 fresh install:
  - Full step-by-step install sequence: Python 3.11 via winget → venv → pip install → kernel registration → verification
  - Written in FINN voice, targeted at student + FINN as guide
  - Annotated commands explaining purpose of each install component
  - Known issues + resolutions table covering all blockers hit during live setup
  - Verified package version table (target state reference)
  - Closing summary explaining what each package enables across the 6-month course

**Key decision logged in guide:**
- `pandas_ta` permanently replaced by `ta` (version 0.11.0) — original repo deleted/private, no Python 3.11 PyPI wheel exists. `ta` covers all required indicators. Syntax translation will be handled by FINN at point of first use (Week 3). Decision note embedded in install guide for future reference.

**Environment verified on:** Windows 11 Home · Python 3.11.9 · `finnenv` (venv) · April 16, 2026

**Status:** `finnenv` operational. D002 guided build ready to proceed.

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
