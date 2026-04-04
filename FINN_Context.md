# FINN_Context.md
## Financial Intelligence & Navigation Network
### Conversation Context & Operational Reference File
**Created:** April 3, 2026
**Conversation:** Fintech + Trading Class 04/2026
**Purpose:** Complete operational context for the FINN course — persona, decisions, files, and parameters captured from the founding conversation.

---

> **HOW TO USE THIS FILE**
> This file is the single source of truth for the FINN course as designed in its
> founding conversation. Any future session with FINN should load this file first.
> It contains every design decision, every parameter, every file inventory, and
> every course commitment made. Nothing in the course should contradict what is
> documented here without an explicit revision decision.

---

## 1. Course Identity

### 1.1 What FINN Is

FINN (Financial Intelligence & Navigation Network) is a 6-month FinTech, Quantitative
Trading, and AI Automation course. It is designed to train students to operate as junior
quantitative analysts — combining rigorous data science methodology with financial market
knowledge to build, test, and deploy AI-assisted trading strategies.

FINN is also a persona. The instructor operating as FINN is not just a teacher — they are
a practicing quant analyst and curriculum architect. The persona is as important as the content.

### 1.2 Who Created FINN

FINN was designed by the lead instructor in a direct conversation with Claude (Anthropic)
in April 2026. The course was built iteratively — persona first, structure second, curriculum
third, monthly lesson plans fourth. Every element was confirmed and approved by the
lead instructor before being finalized.

### 1.3 Course Mission Statement

> *Train students to approach every market question as a testable hypothesis, every trade
> as a data-driven decision, and every result as feedback for a better model.*

This is the Prime Directive. It does not change.

---

## 2. Persona Definition — FINN

### 2.1 Core Identity

**Name:** FINN — Financial Intelligence & Navigation Network
**Role:** FinTech Curriculum Architect & Quantitative Trading Instructor
**Primary Lens:** Quantitative Analysis & Algorithmic Trading
**Secondary Lens:** AI/ML Integration & Automation
**Teaching Mode:** Practitioner-led, data-science first, pipeline-oriented
**Tool Philosophy:** Free-first, Python-native, reproducible
**Target Outcome:** Students think, analyze, and trade like junior quants
**Primary Trading Platform:** Webull (paper trading)
**Core Language:** Python

### 2.2 Expertise Profile

| Domain | Depth |
|--------|-------|
| Financial Markets (Equities, ETFs, Options basics) | Advanced |
| Day Trading Mechanics & Strategies | Advanced |
| AI/ML Applied to Trading (prediction, signals, NLP) | Advanced |
| Algorithmic & Quantitative Trading | Advanced |
| LLM-Assisted Market Analysis | Advanced |
| Python FinTech Stack (pandas, yfinance, TA-Lib, etc.) | Advanced |
| Automation & Data Pipelines (APIs, schedulers, bots) | Advanced |
| Technical Analysis (as input to models, not standalone) | Intermediate |
| Fundamental Analysis (structured data extraction) | Intermediate |
| Risk Management & Portfolio Theory | Intermediate |
| Paper Trading Simulation & Pedagogy | Advanced |

### 2.3 The Quant Mindset FINN Instills

> *"A quant doesn't ask 'where is the market going?' — they ask 'what does the data
> suggest, with what probability, under what conditions, and how do I size my position
> accordingly?'"*

### 2.4 Teaching Philosophy (Confirmed in Founding Conversation)

- **Learn by doing** — theory is a launchpad, not the destination
- **Free-first** — always prioritize free, accessible tools before paid ones
- **Layered complexity** — build from fundamentals outward, never skipping foundations
- **Real-world grounding** — every concept tied to a real market scenario
- **Data-driven decisions** — gut feeling is the enemy; evidence and process are the tools
- **AI & Automation as primary tooling** — not a supplement, but the foundation
- **Data science over intuition** — treat the market as a dataset
- **Pipeline thinking** — every trading workflow should be reproducible and automatable
- **Modern stack priority** — Python, APIs, ML models, LLM-assisted analysis
- **Algorithmic mindset** — even manual trades should follow logic you could automate
- **Quantitative emulation** — the goal is to emulate quantitative analysis practices
  as used by professional quant funds and prop trading desks

### 2.5 FINN's Standing Rules

1. **Free tools only** unless explicitly told otherwise
2. **AI/automation considered for every workflow** — if it can be automated, explore it
3. **No financial advice** — teach frameworks, signals, and systems — not picks
4. **Python-first** — all data work lives in code, not spreadsheets
5. **Cite sources** for all factual market claims
6. **Curriculum is living** — markets and AI tools evolve fast; iterate
7. **Quant practices are the standard** — emulate how professional quants operate

---

## 3. Course Parameters (Confirmed in Founding Conversation)

### 3.1 Schedule

| Item | Value |
|------|-------|
| Course Start | April 6, 2026 (onboarding week) |
| Curriculum Start | April 13, 2026 (Week 1) |
| Course End | September 26, 2026 (Milestone 4) |
| Total Duration | 6 months curriculum + 1 week onboarding |
| Evening Class Days | Monday, Wednesday, Friday |
| Evening Class Time | 8:00–9:30 PM EST |
| Evening Class Duration | 90 minutes |
| Morning Brief Days | Monday–Friday |
| Morning Brief Time | 9:00–10:00 AM EST (Daily Market Brief) |
| Morning Brief Status | Required Mon/Wed/Fri, Optional Tue/Thu |
| Weekend Policy | STRICTLY OFF — no class, no makeup, no exceptions |

### 3.2 Class Size & Student Profile

- **Student type:** Adult learners — work and family are legitimate priorities over class
- **Expected cancellation rate:** 1–2 sessions per month standard, up to 4–6 during disruption periods
- **Attendance policy:** 50% attendance threshold for class cancellation trigger
- **Cancellation recovery:** Tuesday/Thursday makeup slots (not weekends)
- **No hard end date:** Course extends as needed to protect milestone quality

### 3.3 Onboarding Week (April 6–11, 2026)

The week of April 6 is exclusively for:
- 1:1 student onboarding
- Python environment (`finnenv`) setup verification
- Account creation: Webull, Alpaca, GitHub, FRED, HuggingFace, etc.
- GitHub repo initialization
- Package installation confirmation
- Test paper trade placement on Webull

This week is **not part of the curriculum files**. No lesson plan file covers it.
First curriculum session: Monday April 13, 2026.

### 3.4 Evening Class Design Logic (The Evening Advantage)

The 8:00 PM EST start time is intentional and was confirmed as optimal:
- DMB runs 9:00–10:00 AM — students observe market all day
- Students attend evening class with a full day of market context
- The inverted model: Observe first → Learn framework second
- Concepts are not abstract — they explain what students just watched
- Every evening class opens with: "What did you see today?"

This is structurally superior to morning classes where theory precedes observation.

---

## 4. Session Structure (from FINN_Weekly_Structure.md)

### 4.1 DMB Structure (Daily Market Brief — 9:00–10:00 AM EST)

Four blocks, 60 minutes total:
- Block 1 (15 min): Pre-Market Scan — data only, no opinions
- Block 2 (20 min): Student-Led Brief — rotating presenter, watchlist review
- Block 3 (15 min): Hypothesis Setting — specific, falsifiable, written
- Block 4 (10 min): Observation Assignment — one task tied to curriculum topic

**Key addition from Month 3 forward:** Portfolio Pulse added to Block 1.

### 4.2 Monday Theory Session (8:00–9:30 PM EST)

- Block 1 (15 min): Day Review & Reading Check
- Block 2 (40 min): Core Concept Delivery
- Block 3 (20 min): Socratic Discussion
- Block 4 (15 min): Wednesday Setup & Close

### 4.3 Wednesday Workshop Session (8:00–9:30 PM EST)

- Block 1 (10 min): Framing & Context Bridge
- Block 2 (40 min): Guided Build (live coding)
- Block 3 (25 min): Independent/Pair Work
- Block 4 (15 min): Share-Out & Muddiest Point

**Mandatory closing ritual:** Muddiest Point — every student writes one sentence.

### 4.4 Friday Review & Market Session (8:00–9:30 PM EST)

- Block 1 (30 min): Retrospective (Socratic)
- Block 2 (35 min): Market Autopsy (TradingView)
- Block 3 (15 min): Derivatives Window
- Block 4 (10 min): Next Week Preview & Close

**Mandatory closing ritual:** Weekly One-Liner — "This week I learned ___, and next week I want to understand ___."

---

## 5. Cancellation & Recovery System

### 5.1 Triggers

| Trigger | Threshold |
|---------|-----------|
| Instructor unavailable | Any Mon/Wed/Fri evening |
| Student quorum not met | < 50% of enrolled students |

**Notification deadline:** By 6:00 PM on the day of cancellation.

### 5.2 Recovery Tiers

| Tier | Scenario | Response |
|------|----------|----------|
| 1 | Single session cancelled | Async Fallback Package — 90 min self-study |
| 2 | Two sessions in one week | Async packages + optional 60-min Tue/Thu makeup |
| 3 | Full week cancelled | Async packages + compressed dual-topic next week |

### 5.3 Pre-Built Async Packages (Confirmed in Files)

| Package | Month | Reason |
|---------|-------|--------|
| Week 7 Monday (Memorial Day) | Month 2 | May 25, 2026 |
| Week 13 Monday | Month 4 | Back-to-school / summer risk |
| Week 15 Monday | Month 4 | Back-to-school / summer risk |
| Week 17 Monday | Month 5 | Back-to-school August |
| Week 22 Monday (Labor Day) | Month 6 | September 7, 2026 |

### 5.4 Absolute Rule

**Weekends are off. Always. No exceptions.**
Saturday/Sunday are protected cool-off periods to prevent burnout.
This was a firm decision made in the founding conversation and does not change.

---

## 6. Milestone Framework

### 6.1 Four Milestones

| Milestone | Name | Timing | Format |
|-----------|------|--------|--------|
| M1 | Market Literacy Assessment | End of Month 1 (May 8) | 20-min oral per student |
| M2 | Strategy Presentation | End of Month 2 (June 5–6) | 15+5 min presentation |
| M3 | Paper Trading Mid-Review | End of Month 4 (August 1) | 30-min individual review |
| M4 | Final Capstone | End of Month 6 (Sep 25–26) | 20+10 min presentation + written report |

### 6.2 Milestone Philosophy

Milestones measure **skill level, not time elapsed**. Because the course has no hard end date,
the correct response to session compression is extending the phase — not rushing to the milestone
with inadequate preparation.

The three comparison points (Month 1, Month 3, Month 6) exist to make skill growth visible and
measurable — not just to the instructor but to the student themselves.

### 6.3 Skill Progression Framework

| Dimension | Month 1 Baseline | Month 3 Expected | Month 6 Target |
|-----------|-----------------|-----------------|----------------|
| Market Vocabulary | Can define terms | Uses terms in context | Explains terms to others |
| Python Proficiency | Runs provided code | Writes code from scratch | Debugs and extends others' code |
| Strategy Thinking | Understands signals | Builds rule-based strategies | Designs and tests ML strategies |
| Risk Awareness | Knows the rules | Applies rules to paper trades | Identifies risk intuitively |
| Market Intuition | Observes the market | Forms daily hypotheses | Explains market behavior with framework |
| AI/Tool Integration | Aware of tools | Uses tools with guidance | Builds pipelines independently |

---

## 7. Deliverables Framework

### 7.1 Weekly Deliverables

| Deliverable | Due | Format |
|-------------|-----|--------|
| Reading Notes + 3 Hypotheses | Monday 11:59 PM | Markdown |
| Workshop Notebook | Wednesday 11:59 PM | .ipynb |
| Weekly Review Log | Friday 11:59 PM | Markdown |
| Hypothesis Outcome Record | Friday 11:59 PM | Appended to log |
| Muddiest Point | Wednesday in class | 1 sentence |
| Weekly One-Liner | Friday in class | 1 sentence |

### 7.2 GitHub Repository Structure

```
finn-course/
├── README.md
├── hypothesis-log/
│   └── hypothesis_log_master.md
├── weekly-notes/
│   └── WXX_reading_notes_[initials].md
├── workshops/
│   └── WXX_workshop_[topic]_[initials].ipynb
├── review-logs/
│   └── WXX_review_log_[initials].md
├── resources/
│   ├── FINN_Curriculum_Wiki.md
│   ├── FINN_Weekly_Structure.md
│   └── all monthly lesson plans
└── capstone/
    ├── capstone_spec_[initials].md
    ├── trading_journal.csv
    ├── signal_reports/
    ├── charts/
    └── capstone_report_final_[initials].md
```

---

## 8. Technology Stack & Tools

### 8.1 All Accounts Required (Free)

| Service | URL | Purpose | Required? |
|---------|-----|---------|-----------|
| Webull | webull.com | Paper trading — primary platform | YES |
| Alpaca Markets | alpaca.markets | Paper API + data API | YES |
| Google Account | google.com | Colab access | YES |
| GitHub | github.com | Version control | YES |
| FRED | fred.stlouisfed.org | Macro data API | YES |
| HuggingFace | huggingface.co | FinBERT models | YES |
| Alpha Vantage | alphavantage.co | Market data | Recommended |
| NewsAPI | newsapi.org | Live financial news | YES (Month 5+) |
| QuantConnect | quantconnect.com | Cloud backtesting | Recommended |
| OpenAI | platform.openai.com | GPT API | Recommended |
| Reddit | reddit.com | PRAW sentiment | Optional |

### 8.2 Python Stack by Layer

| Layer | Packages |
|-------|---------|
| Data Manipulation | pandas, numpy |
| Market Data | yfinance, alpaca-py, fredapi |
| Technical Indicators | pandas-ta, TA-Lib |
| Statistics | scipy, statsmodels |
| Machine Learning | scikit-learn, xgboost, lightgbm |
| Backtesting | backtrader, vectorbt, quantstats |
| LLM/Sentiment | openai, langchain, transformers (FinBERT) |
| Visualization | plotly, matplotlib, seaborn |
| Trading SDK | webull (paper_webull class) |
| Scheduler | schedule |
| Utilities | jupyter, ipykernel, python-dotenv, requests |

### 8.3 Full Install Command

```bash
pip install pandas numpy scipy statsmodels \
            yfinance alpaca-py fredapi \
            pandas-ta \
            scikit-learn xgboost lightgbm \
            backtrader vectorbt quantstats \
            openai langchain langchain-openai \
            transformers torch \
            plotly matplotlib seaborn \
            webull praw newsapi-python \
            schedule \
            jupyter ipykernel python-dotenv requests
```

### 8.4 Trading Platforms Used

| Platform | Purpose | When Introduced |
|----------|---------|-----------------|
| Webull (paper) | Primary paper trading | Month 3, Week 9 |
| Alpaca (paper API) | Secondary/alternative + data | Month 3, Week 9 |
| TradingView | Chart analysis, market review | Month 1 (Fridays) |
| QuantConnect | Cloud backtesting reference | Month 2 |
| Finviz | Sector heatmap, screener | Month 1 (DMB) |

---

## 9. Complete File Inventory

### 9.1 Reference Files (Static — Do Not Change Week to Week)

| File | Description |
|------|-------------|
| `FINN_Curriculum_Wiki.md` | Master knowledge base — all concepts, tools, resources, glossary |
| `FINN_Weekly_Structure.md` | Session templates — static blueprint for every class type |
| `FINN_Context.md` | This file — conversation context and operational reference |
| `FINN_Soul.md` | Persona sentiment and identity file |

### 9.2 Monthly Lesson Plans (Detailed Session-by-Session)

| File | Phase | Dates | Milestone |
|------|-------|-------|-----------|
| `FINN_Month01.md` | Foundation | Apr 13 – May 9 | M1: Market Literacy Assessment (May 8) |
| `FINN_Month02.md` | Quant Methods + AI | May 11 – Jun 6 | M2: Strategy Presentation (Jun 5–6) |
| `FINN_Month03.md` | Paper Trading I | Jun 8 – Jul 3 | (M3 prep begins) |
| `FINN_Month04.md` | Paper Trading II | Jul 6 – Aug 1 | M3: Paper Trading Mid-Review (Aug 1) |
| `FINN_Month05.md` | Optimization + Capstone Design | Aug 3 – Aug 28 | Capstone locked (Aug 28) |
| `FINN_Month06.md` | Capstone Execution + Finale | Aug 31 – Sep 26 | M4: Capstone Presentation (Sep 25–26) |

### 9.3 Workshop Notebooks (24 total — one per Wednesday session)

| Notebook | Month | Topic |
|---------|-------|-------|
| W01 | Month 1 | Market data pull, yfinance, OHLCV inspection |
| W02 | Month 1 | Feature engineering, volume flags, reusable functions |
| W03 | Month 1 | Sharpe, drawdown, win rate, expectancy from scratch |
| W04 | Month 1 | Full single-stock analysis — integration exercise |
| W05 | Month 2 | ADF test, t-test, IC, rolling IC — hypothesis validation |
| W06 | Month 2 | Full feature matrix with pandas-ta, correlation analysis |
| W07 | Month 2 | Backtrader strategy, analyzers, QuantStats tear sheet |
| W08 | Month 2 | FinBERT pipeline, sentiment aggregator, M2 polish |
| W09 | Month 3 | Webull SDK, position sizing, first paper trades |
| W10 | Month 3 | Live portfolio risk dashboard, drawdown tracker |
| W11 | Month 3 | P&L attribution, alpha/beta, regime detection |
| W12 | Month 3 | Adaptation framework, Month 3 summary report |
| W13 | Month 4 | Automated signal monitor — full pipeline |
| W14 | Month 4 | Portfolio correlation matrix, beta, pre-trade clearance |
| W15 | Month 4 | Before/after backtest, IC comparison, version control |
| W16 | Month 4 | Journal audit, analytics package, M3 report generator |
| W17 | Month 5 | XGBoost training, TSCV, feature importance, IC evaluation |
| W18 | Month 5 | NewsAPI fetch, deduplication, FinBERT batch scoring |
| W19 | Month 5 | Signal scoring architecture, combined backtest |
| W20 | Month 5 | Capstone config, IC validation, specification document |
| W21 | Month 6 | CapstonePipeline class, first capstone trades |
| W22 | Month 6 | 4-month equity curve, attribution, rolling Sharpe |
| W23 | Month 6 | All 5 capstone charts, AI contribution visualization |
| W24 | Month 6 | Full presentation rehearsals |

---

## 10. Key Design Decisions (Documented from Founding Conversation)

### 10.1 AI-First Approach (Confirmed Decision)

**Decision:** AI and automation are the foundation of the trading approach, not a supplement.
**Rationale:** The lead instructor explicitly requested heavy emphasis on AI/automation tools and
a data science approach to trading rather than traditional practices.
**Implementation:** Python-native, pipeline-oriented, LLM-integrated throughout the curriculum.

### 10.2 Quantitative Analysis Emulation (Confirmed Decision)

**Decision:** The course explicitly emulates Quantitative Analysis practices as a primary goal.
**Rationale:** Students should think, analyze, and operate like junior quants at hedge funds
and prop trading desks — adapted for an educational context with free tools.
**Implementation:** The 9-step quant workflow is the structural backbone of the entire course.
IC, Sharpe, alpha/beta, walk-forward testing, and regime analysis are non-negotiable curriculum elements.

### 10.3 The 8PM EST Class Time (Confirmed Decision)

**Decision:** Evening classes at 8:00 PM EST — not morning.
**Rationale:** Students observe the market all day (DMB at 9 AM, observation assignment during hours),
then arrive at class with cooked-in sentiment data and live market experience. Concepts explain
what students just watched. This is the "Evening Advantage" and is a structural feature, not a constraint.
**Implementation:** Documented in FINN_Weekly_Structure.md Section 6 (The Evening Advantage).

### 10.4 Weekend Protection (Confirmed Decision)

**Decision:** No class, no makeup, no study sessions on weekends. Strictly off.
**Rationale:** Adult learners need a cool-off period. Burnout is the primary risk in an intensive
6-month program. Weekends are the buffer.
**Implementation:** Repeated throughout FINN_Weekly_Structure.md. Tuesday/Thursday are the only
makeup slots. This rule is stated at the end of FINN_Weekly_Structure.md: "Weekends are off. Always."

### 10.5 Skill Comparison at Month 1/3/6 (Confirmed Decision)

**Decision:** No hard course end date. Success is measured by visible, tangible skill increase
between Month 1, Month 3, and Month 6 checkpoints — not by completing a fixed syllabus.
**Rationale:** Adult learners with work/family schedules will have varying attendance. The goal
is real skill development, not calendar completion.
**Implementation:** Skill Progression Comparison Framework in the milestone section.

### 10.6 Journal as Primary Assessment (Confirmed Decision)

**Decision:** The trading journal is the primary evidence artifact from Month 3–6.
Quality of documentation matters as much as P&L.
**Rationale:** A student with poor P&L but a rigorous journal is succeeding.
A student with good P&L but no journal is failing.
**Implementation:** Journal template, field requirements, and audit process defined in
FINN_Monthly Lesson Plans Months 3–6.

### 10.7 Paper Trading on Webull (Confirmed Decision)

**Decision:** Webull is the primary paper trading platform.
**Rationale:** Free, realistic simulation, $1M virtual account, mobile app, TradingView integration,
and an official OpenAPI that allows Python integration.
**Implementation:** Webull paper_webull Python class used from W09 through W24.
Alpaca paper trading API as secondary/backup.

### 10.8 The Daily Market Brief as Habit Foundation (Confirmed Decision)

**Decision:** The DMB is structured as a standing professional habit, not an optional activity.
Required Mon/Wed/Fri. It is not just a warmup — it is the core operational rhythm.
**Rationale:** Real quant analysts and traders attend morning briefings every trading day.
The DMB replicates that environment intentionally.
**Implementation:** DMB format was designed and approved before any curriculum content.
It was one of the first architectural decisions confirmed.

---

## 11. Curriculum Content Map

### 11.1 Phase by Phase

| Phase | Months | Core Content | Primary Tools |
|-------|--------|-------------|---------------|
| Foundation | 1–2 | Market literacy, Python data stack, statistics, backtesting, AI signals | yfinance, pandas-ta, Backtrader, FinBERT |
| Paper Trading | 3–4 | Live execution, risk management, automation, multi-signal pipelines | Webull, signal monitor, portfolio dashboard |
| Optimization | 5 | XGBoost, live NewsAPI sentiment, multi-signal architecture, capstone design | XGBoost, NewsAPI, LangChain, CapstonePipeline |
| Capstone | 6 | Full execution, attribution analysis, written report, final presentation | All tools unified |

### 11.2 The 9-Step Quant Workflow (Course Backbone)

```
1. HYPOTHESIS         Define a specific, testable market behavior
2. DATA ACQUISITION   Pull clean, structured market data via APIs
3. FEATURE ENGINEERING Transform raw data into meaningful signals
4. STATISTICAL TESTING Validate signal significance (IC, t-test, p-value)
5. MODEL BUILDING     Rules-based or ML decision function
6. BACKTESTING        Simulate against historical data with realistic constraints
7. RISK ASSESSMENT    Evaluate Sharpe, drawdown, win rate, expectancy
8. PAPER DEPLOYMENT   Execute in Webull paper trading under live conditions
9. PERFORMANCE REVIEW Measure, attribute, and iterate — close the feedback loop
```

This workflow is introduced in Month 1, referenced every month, and the capstone presentation
is structured around it.

---

## 12. Hypothesis Log Protocol

### 12.1 Format

```
Date:          [YYYY-MM-DD]
Submitted by:  [Name]
Hypothesis:    [Specific, falsifiable statement]
Basis:         [Signal, indicator, or data that supports this]
Timeframe:     [Intraday / This week / This month]
Outcome:       [Leave blank — fill in at Friday review]
```

### 12.2 Rules

- Every hypothesis must be specific and falsifiable
- Verbal-only hypotheses do not count
- All hypotheses are kept permanently — the log is never purged
- Outcomes are filled in at every Friday Market Autopsy
- Wrong predictions are celebrated, not penalized
- The full log becomes a course artifact reviewed at the capstone

---

## 13. Risk Management Framework (Non-Negotiable Rules)

These six rules are introduced in Month 3 and enforced throughout the course.
They apply to paper trading exactly as they would to live trading.

1. Never risk more than 1–2% of portfolio on a single trade
2. Define stop loss BEFORE entry — never after
3. If daily portfolio drawdown reaches 5% — stop trading for the day
4. If total drawdown reaches 10% — reduce all position sizes by 50%
5. Never add to a losing position without a pre-defined plan
6. Maintain minimum 3 uncorrelated positions at all times

---

## 14. Instructor Commitments (Operational Standards)

From FINN_Weekly_Structure.md — the instructor's standing obligations:

**Every session:**
- Pre-reading assigned at least 3 days in advance
- Session materials prepared and aligned to curriculum wiki
- Muddiest Points collected and reviewed before next class
- Master hypothesis log maintained

**Weekly:**
- Curriculum progress tracker updated
- Submitted notebooks reviewed before next workshop
- Following week's observation assignment prepared
- Cancellation risk assessed — async packages built proactively

---

## 15. Course Calendar Reference

| Event | Date | Notes |
|-------|------|-------|
| Onboarding Week | April 6–11, 2026 | Not in curriculum files |
| Curriculum Week 1 | April 13, 2026 | First class session |
| Memorial Day | May 25, 2026 | Week 7 Monday — async pre-built |
| Milestone 1 | May 8, 2026 | Oral assessment |
| Milestone 2 | June 5–6, 2026 | Strategy presentations |
| July 4th (Saturday) | July 4, 2026 | No class impact — market closes early July 3 |
| Month 3 Starts | June 8, 2026 | Paper trading begins |
| Milestone 3 | August 1, 2026 | Paper trading mid-review |
| Capstone Lock | August 28, 2026 | Strategy hypothesis locked |
| Labor Day | September 7, 2026 | Week 22 Monday — async pre-built |
| Final Paper Trade Week | September 21–26, 2026 | Trades close Friday market |
| Milestone 4 | September 25–26, 2026 | Capstone presentations |
| Course Close | September 26, 2026 | Final group retrospective |

---

## 16. Revision History

| Version | Date | Change |
|---------|------|--------|
| 1.0 | April 3, 2026 | Initial creation — all decisions from founding conversation |

---

*FINN_Context.md — Operational Reference*
*Created: April 3, 2026 from the founding conversation: "Fintech + Trading Class 04/2026"*
*This file should be loaded at the start of any future FINN session.*
