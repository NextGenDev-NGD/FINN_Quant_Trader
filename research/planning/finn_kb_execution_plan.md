# FINN Knowledge Base — Integration Execution Plan
## Generated: May 8, 2026
### Source: `finn_gap_analysis.md` (Tier 1 + Tier 2 only — Tier 3 discarded)

---

## Vision

The goal is to build a cohesive knowledge library that functions as a book — every resource interconnected, every concept findable in under 30 seconds, every file useful to both the student and to FINN (Claude) as a context source.

The architecture has five layers:
1. **Index** — the table of contents for the entire library (Claude loads this at session start)
2. **Glossary** — every term defined, alphabetical, linked from anywhere
3. **Handbook** — the student-facing reference book (6 parts, 27+ sections)
4. **Infographics** — HTML visual explainers (22 files, browser-renderable, printable)
5. **Curriculum integration** — monthly → weekly → daily files updated to reference the library

---

## New Folder Structure

The `resources/` folder becomes the library root. All new content lives here.

```
resources/
├── FINN_ResourceIndex.md              ← MASTER INDEX — Claude loads this; students navigate by it
├── FINN_Glossary.md                   ← Complete terminology reference (~65 terms)
│
├── handbook/                          ← Student Reference Handbook (6 parts as a book)
│   ├── FINN_HB_P1_GettingStarted.md   ← Part 1: What kind of trader, platforms, brokers
│   ├── FINN_HB_P2_ChartReading.md     ← Part 2: Candlesticks, S&R, trendlines, patterns, gaps
│   ├── FINN_HB_P3_OrderExecution.md   ← Part 3: Order types, entry/exit mechanics
│   ├── FINN_HB_P4_MarketContext.md    ← Part 4: Daily routine, info sources, opening, day types, traps
│   ├── FINN_HB_P5_Psychology.md       ← Part 5: Trading psychology, emotional check, journal fields
│   └── FINN_HB_P6_MarketReference.md  ← Part 6: MTF analysis, Fibonacci, Heikin Ashi, sentiment gauges
│
├── infographics/                      ← HTML visual reference files (browser + print)
│   ├── ig_trade_types.html
│   ├── ig_broker_comparison.html
│   ├── ig_platform_tradingview.html
│   ├── ig_platform_webull.html
│   ├── ig_platform_finviz.html
│   ├── ig_candlestick_patterns.html
│   ├── ig_support_resistance.html
│   ├── ig_trendlines.html
│   ├── ig_chart_patterns_continuation.html
│   ├── ig_chart_patterns_reversal.html
│   ├── ig_gap_types.html
│   ├── ig_fibonacci.html
│   ├── ig_heikin_ashi.html
│   ├── ig_volume_analysis.html
│   ├── ig_order_types.html
│   ├── ig_info_sources.html
│   ├── ig_market_open.html
│   ├── ig_trading_day_types.html
│   ├── ig_market_traps.html
│   ├── ig_trading_psychology.html
│   ├── ig_sentiment_indicators.html
│   ├── ig_mtf_analysis.html
│   ├── ig_quant_workflow.html         ← FINN-specific
│   ├── ig_performance_metrics.html    ← FINN-specific
│   ├── ig_risk_rules.html             ← FINN-specific
│   └── ig_multi_signal.html           ← FINN-specific
│
└── [existing files — unchanged]
    ├── FINN_D002_Install_Guide.md
    └── FINN_D002_Jupyter_Session.md
```

---

## Full Deliverables List

### Layer 1 — Index (1 file)

| File | Purpose | Gap Items Addressed |
|------|---------|---------------------|
| `FINN_ResourceIndex.md` | Master navigation for all library content. Claude loads this at session start. Students navigate by topic, week, or keyword. Under 200 lines — designed for fast scanning. | All items — points to each file |

### Layer 2 — Glossary (1 file)

| File | Purpose | Gap Items Addressed |
|------|---------|---------------------|
| `FINN_Glossary.md` | ~65 terms defined in plain language. Alphabetical. Each entry includes: term, definition, first FINN week it appears, cross-reference to handbook section or infographic. | Gap #50 (FINN terminology index) |

### Layer 3 — Handbook (6 files)

| File | Sections | Tier 1/2 Gap Items Covered |
|------|---------|---------------------------|
| `FINN_HB_P1_GettingStarted.md` | 1.1 What Kind of Trader Are You · 1.2 TradingView Setup · 1.3 Webull Setup · 1.4 Finviz Setup · 1.5 Broker Comparison | Gaps 1 (trade types), 38 (TradingView), 39 (Webull), 40 (Finviz), 42 (broker comparison) |
| `FINN_HB_P2_ChartReading.md` | 2.1 Candlestick Reference · 2.2 S&R · 2.3 Trendlines · 2.4 Continuation Patterns · 2.5 Reversal Patterns · 2.6 Gap Types · 2.7 Heikin Ashi | Gaps 1 (candlesticks), 3 (trendlines), 4 (S&R), 5/6 (chart patterns), 15 (gaps), 18 (Heikin Ashi) |
| `FINN_HB_P3_OrderExecution.md` | 3.1 Complete Order Type Taxonomy · 3.2 Short Selling Basics · 3.3 Order Routing and Best Execution | Gap 29 (order types) |
| `FINN_HB_P4_MarketContext.md` | 4.1 Trader's Daily Routine · 4.2 Information Sources Map · 4.3 Reading the Market Open · 4.4 Types of Trading Days · 4.5 Market Traps | Gaps 36 (opening), 35 (day types), 23 (traps), 43 (daily routine), 44 (info sources) |
| `FINN_HB_P5_Psychology.md` | 5.1 Psychology Primer · 5.2 The 3 Dangerous Emotions · 5.3 Cognitive Biases · 5.4 Pre/Post Trade Check · 5.5 FINN Emotional Journal Fields | Gaps 31 (psychology), 32 (emotional journal) |
| `FINN_HB_P6_MarketReference.md` | 6.1 Fibonacci Retracements · 6.2 Volume Reading Guide · 6.3 Multi-Timeframe Analysis · 6.4 Sentiment Indicators (Non-AI) · 6.5 Heikin Ashi Extended | Gaps 13 (Fibonacci), 14 (volume), 34 (MTF), 45 (sentiment indicators) |

### Layer 4 — Infographics (26 files)

#### Tier 1 Infographics (gap-critical, must build first)

| File | Topic | Source Gap |
|------|-------|-----------|
| `ig_candlestick_patterns.html` | 15+ patterns — visual description, signal, confirmation needed | Gap #1 |
| `ig_support_resistance.html` | S&R zone drawing, testing, retesting, invalidation | Gap #4 |
| `ig_trendlines.html` | Drawing method, uptrend/downtrend, channels, false breaks | Gap #3 |
| `ig_gap_types.html` | 4 gap types — visual description, signal, FINN code reference | Gap #15 |
| `ig_trade_types.html` | 8 trade styles ranked by difficulty — time horizon, capital, skill level | Gap #41 |
| `ig_broker_comparison.html` | Comparison table — 6 brokers, 8 criteria | Gap #42 |
| `ig_platform_tradingview.html` | TradingView interface guide — chart types, indicators, alerts, layouts | Gap #38 |
| `ig_platform_webull.html` | Webull paper trading — account setup, order entry, P&L view | Gap #39 |
| `ig_platform_finviz.html` | Finviz guide — heatmap, screener, news, futures tabs | Gap #40 |
| `ig_info_sources.html` | Information sources map — 6 categories, 30+ sources | Gap #44 |
| `ig_order_types.html` | Complete order type taxonomy — all 12+ types with use cases | Gap #29 |

#### Tier 2 Infographics (depth enhancements)

| File | Topic | Source Gap |
|------|-------|-----------|
| `ig_chart_patterns_continuation.html` | Triangle, flag, pennant, wedge, rectangle — visual + signal | Gap #5 |
| `ig_chart_patterns_reversal.html` | Double top/bottom, H&S, cup/handle — visual + signal | Gap #6 |
| `ig_fibonacci.html` | Fibonacci retracement — how to draw, levels, trader use, FINN framing | Gap #13 |
| `ig_heikin_ashi.html` | Heikin Ashi vs. standard candles comparison | Gap #18 |
| `ig_volume_analysis.html` | Volume patterns — breakout vol, reversal vol, OBV divergence, climactic vol | Gap #14 |
| `ig_trading_psychology.html` | Emotions + biases table — manifestation in trades, how to counter | Gap #31 |
| `ig_sentiment_indicators.html` | Fear & Greed, AAII, P/C ratio, VIX levels — how to read each | Gap #45 |
| `ig_market_open.html` | Opening types, Asia-Europe range, first-30-min patterns | Gap #36 |
| `ig_trading_day_types.html` | Trending, rotational, news-driven — identification + strategy fit | Gap #35 |
| `ig_market_traps.html` | Bull trap, bear trap, stop hunt, false breakout — identify + protect | Gap #23 |
| `ig_mtf_analysis.html` | Top-down analysis framework — daily → 4hr → 1hr → 15min | Gap #34 |

#### FINN-Specific Infographics (reinforce course differentiators visually)

| File | Topic | Purpose |
|------|-------|---------|
| `ig_quant_workflow.html` | FINN's 9-step quant workflow — visual flowchart | Reinforce FINN's core methodology |
| `ig_performance_metrics.html` | Sharpe, drawdown, win rate, expectancy — visual reference card | Reinforce M1 concepts |
| `ig_risk_rules.html` | The 6 non-negotiable risk rules — visual one-pager | Reinforce M3 concepts |
| `ig_multi_signal.html` | Multi-signal scoring architecture — weighted composite, veto logic | Reinforce M5 concepts |

---

## Session Sequence Plan

Each session is designed to fit within token limits. Sessions are additive — each one produces committed, usable files.

### PHASE A — Foundation (2 sessions)

**Session A1 — Folder Creation + Index Skeleton + Glossary**
- Create `resources/handbook/` and `resources/infographics/` directories
- Create `FINN_ResourceIndex.md` — skeleton with all section headers and file pointers (populated as sessions complete)
- Create `FINN_Glossary.md` — complete glossary (~65 terms)
- Update `CLAUDE.md` — add `FINN_ResourceIndex.md` to the file map table
- Files created: 3 | Files modified: 1

**Session A2 — Handbook Part 1 (Getting Started)**
- Write `FINN_HB_P1_GettingStarted.md` — 5 sections: trade type taxonomy, TradingView guide, Webull guide, Finviz guide, broker comparison
- Update `FINN_ResourceIndex.md` — populate Part 1 pointers
- Files created: 1 | Files modified: 1

---

### PHASE B — Handbook Content (5 sessions)

**Session B1 — Handbook Part 2 (Chart Reading)**
- Write `FINN_HB_P2_ChartReading.md` — 7 sections: candlesticks, S&R, trendlines, continuation patterns, reversal patterns, gap types, Heikin Ashi
- Update index
- Files created: 1 | Files modified: 1

**Session B2 — Handbook Part 3 + Part 4**
- Write `FINN_HB_P3_OrderExecution.md` — 3 sections: complete order taxonomy, short selling basics, order routing
- Write `FINN_HB_P4_MarketContext.md` — 5 sections: daily routine, info sources, market open, day types, market traps
- Update index
- Files created: 2 | Files modified: 1

**Session B3 — Handbook Part 5 + Part 6**
- Write `FINN_HB_P5_Psychology.md` — 5 sections: primer, 3 emotions, cognitive biases, pre/post check, emotional journal fields
- Write `FINN_HB_P6_MarketReference.md` — 5 sections: Fibonacci, volume, MTF analysis, sentiment indicators
- Update index
- Files created: 2 | Files modified: 1

---

### PHASE C — Infographics (6 sessions)

Each infographic is a standalone HTML file with:
- FINN brand styling (dark background, clean typography, color-coded tables/diagrams)
- Print-friendly layout
- No external dependencies (fully self-contained CSS + HTML)

**Session C1 — Tier 1 Infographics: Candlesticks + S&R + Trendlines + Gaps**
- `ig_candlestick_patterns.html`
- `ig_support_resistance.html`
- `ig_trendlines.html`
- `ig_gap_types.html`
- Update index
- Files created: 4 | Files modified: 1

**Session C2 — Tier 1 Infographics: Trade Types + Order Types + Broker Comparison**
- `ig_trade_types.html`
- `ig_order_types.html`
- `ig_broker_comparison.html`
- Update index
- Files created: 3 | Files modified: 1

**Session C3 — Tier 1 Infographics: Platform Guides + Info Sources**
- `ig_platform_tradingview.html`
- `ig_platform_webull.html`
- `ig_platform_finviz.html`
- `ig_info_sources.html`
- Update index
- Files created: 4 | Files modified: 1

**Session C4 — Tier 2 Infographics: Chart Patterns + Fibonacci + Heikin Ashi + Volume**
- `ig_chart_patterns_continuation.html`
- `ig_chart_patterns_reversal.html`
- `ig_fibonacci.html`
- `ig_heikin_ashi.html`
- `ig_volume_analysis.html`
- Update index
- Files created: 5 | Files modified: 1

**Session C5 — Tier 2 Infographics: Psychology + Sentiment + Market Context**
- `ig_trading_psychology.html`
- `ig_sentiment_indicators.html`
- `ig_market_open.html`
- `ig_trading_day_types.html`
- `ig_market_traps.html`
- `ig_mtf_analysis.html`
- Update index
- Files created: 6 | Files modified: 1

**Session C6 — FINN-Specific Infographics**
- `ig_quant_workflow.html`
- `ig_performance_metrics.html`
- `ig_risk_rules.html`
- `ig_multi_signal.html`
- Finalize and complete `FINN_ResourceIndex.md` — all sections populated
- Files created: 4 | Files modified: 1

---

### PHASE D — Monthly File Integration (2 sessions)

**Session D1 — Monthly Files: Month 1 + Month 2**

`FINN_Month01.md` changes:
- Week 1 learning objectives: add "Reference Handbook Part 1 as pre-reading before first session"
- Week 2 Monday theory block: add trendline and S&R teaching segments (15 min each)
- Week 2 workshop: add gap-type classification step after code detection
- All weeks: add `> **Resource:** [Handbook/Infographic reference]` callouts at relevant points

`FINN_Month02.md` changes:
- Week 5 Friday: add "Live Chart Walk" format note (first instance)
- Week 6: add infographic references for all indicator sections
- All weeks: add resource callouts

**Session D2 — Monthly Files: Month 3 through Month 6**

`FINN_Month03.md` changes:
- Week 9 Monday theory: add psychology handbook reference before paper trading begins
- Week 9: update journal template to include 2 emotional check fields
- All weeks: add resource callouts

`FINN_Month04.md` through `FINN_Month06.md` changes:
- Lighter touch — add `> **Resource:**` callouts at key conceptual moments
- Reference the appropriate handbook section for any concept that now has a handbook entry

---

### PHASE E — Weekly File Integration (4 sessions)

**Session E1 — Weekly Files: W01 – W04**

`FINN_W01.md`:
- Monday theory: add 10-min S&R introduction block after order book section
- Monday theory: add resource callout → Handbook 2.2 (S&R) + ig_support_resistance.html
- Pre-reading for Week 1: add Handbook Part 1 (Getting Started) to the pre-reading list
- Observation assignment: add "identify 2 S&R levels on SPY daily chart using Handbook 2.2"

`FINN_W02.md`:
- Monday theory: add 15-min trendline drawing block (after order mechanics)
- Monday theory: add resource callout → Handbook 2.3 + ig_trendlines.html
- Monday theory: expand stop hunt reference into "Market Traps" block (5 min)
- Workshop: after gap detection step — add 5-min gap classification exercise referencing Handbook 2.6
- Workshop: add resource callout → ig_gap_types.html
- Observation assignment: "identify the type of any gaps you see on your watchlist tickers today"

`FINN_W03.md`: No structural changes — performance metrics focus. Add resource callout → ig_performance_metrics.html.

`FINN_W04.md`: No structural changes — M1 prep. Add resource callout → Handbook as review tool.

**Session E2 — Weekly Files: W05 – W08**

`FINN_W05.md`:
- Friday chart review block: add "Live Chart Walk" format segment (15 min) — first instance
  - Format: Instructor annotates a live chart, identifies a setup, explains decision logic, maps to indicators
  - Note: observation only, no trade placed
- Add resource callout → ig_candlestick_patterns.html for the candlestick encoding discussion

`FINN_W06.md`:
- Monday theory: add infographic references for each indicator discussed
- Add chart patterns reference callout after indicator feature discussion
- Add resource callouts → ig_chart_patterns_continuation.html, ig_chart_patterns_reversal.html

`FINN_W07.md`: No structural changes. Add resource callout → ig_quant_workflow.html.

`FINN_W08.md`: No structural changes. Add resource callout → ig_sentiment_indicators.html for contrast with FinBERT.

**Session E3 — Weekly Files: W09 – W12**

`FINN_W09.md`:
- Monday theory: add psychology primer segment (10 min) before paper trading begins → Handbook 5.1
- Update journal template: add Pre-Trade Emotional State field (1–5 + note) and Post-Trade Reflection field
- Add resource callout → ig_trading_psychology.html + Handbook Part 5

`FINN_W10.md`: Add resource callouts → ig_risk_rules.html + ig_performance_metrics.html.

`FINN_W11.md`: Add resource callout → ig_multi_signal.html (foreshadowing Month 5).

`FINN_W12.md`: No structural changes.

**Session E4 — Weekly Files: W13 – W24**

Lighter touch pass across all remaining weekly files:
- Add `> **Resource:** [Handbook section | Infographic]` callouts at key conceptual moments
- No structural session changes
- Specific additions:
  - W13: ig_quant_workflow.html (automation pipeline maps to workflow)
  - W14: ig_risk_rules.html (multi-position risk)
  - W17: ig_multi_signal.html (XGBoost signal introduction)
  - W19: ig_multi_signal.html + ig_performance_metrics.html
  - W20: Full handbook reference as capstone design resource
  - W21–W24: Handbook Part 6 + glossary as capstone writing resources

---

### PHASE F — Daily File Integration (2 sessions)

Daily files get light-touch additions only — observation assignments and pre-market scan enhancements.

**Session F1 — Daily Files: D001 – D012 (Weeks 1–4)**

| File | Addition |
|------|---------|
| D001 | Pre-reading: Handbook Part 1 before first session. Observation: identify your chart platform (TradingView), open it, find SPY. |
| D002 | Already has Install Guide. Add: after setup — open ig_platform_tradingview.html, configure first watchlist. |
| D003 | Observation assignment: identify 2 S&R zones on one watchlist ticker using Handbook 2.2. |
| D005 | Observation assignment: draw a trendline on SPY weekly. Confirm with Handbook 2.3. |
| D008 | Observation assignment: identify the candle type for today's SPY daily bar using Handbook 2.1. |
| D009 | Pre-paper-trading day: complete Webull setup using ig_platform_webull.html before evening session. |
| D010 | Add: identify today's gap type (if any) on watchlist tickers using ig_gap_types.html. |

**Session F2 — Daily Files: D013 – D072 (Weeks 5–24)**

Targeted additions only where a specific handbook section or infographic is directly relevant to that day's content. No session structure changes.

---

## Integration Map Summary

The table below shows which curriculum layers are touched by each gap item.

| Gap Item | Handbook | Infographic | Monthly | Weekly | Daily |
|----------|:--------:|:-----------:|:-------:|:------:|:-----:|
| Support & Resistance | HB P2 §2.2 | ig_support_resistance | M01 W02 | W01 W02 | D003 |
| Trendlines | HB P2 §2.3 | ig_trendlines | M01 W02 | W02 | D005 |
| Gaps — 4 types | HB P2 §2.6 | ig_gap_types | M01 W02 | W02 | D010 |
| Candlestick visual guide | HB P2 §2.1 | ig_candlestick_patterns | M01 W01 | W05 | D008 |
| TradingView setup | HB P1 §1.2 | ig_platform_tradingview | M01 | W01 | D001/D002 |
| Webull setup | HB P1 §1.3 | ig_platform_webull | M03 W09 | W09 | D009 |
| Finviz setup | HB P1 §1.4 | ig_platform_finviz | M01 | W01 | D001 |
| Trade type taxonomy | HB P1 §1.1 | ig_trade_types | M01 | W01 | — |
| Broker comparison | HB P1 §1.5 | ig_broker_comparison | M03 | W09 | — |
| Information sources | HB P4 §4.2 | ig_info_sources | M01 | W01 | — |
| Live chart walk format | — | — | M02 W05 | W05 | W05+ Fridays |
| Chart patterns (cont.) | HB P2 §2.4 | ig_chart_patterns_cont | M02 W06 | W06 | — |
| Chart patterns (rev.) | HB P2 §2.5 | ig_chart_patterns_rev | M02 W06 | W06 | — |
| Fibonacci | HB P6 §6.1 | ig_fibonacci | M02 W06 | W06 | — |
| Heikin Ashi | HB P2 §2.7 / P6 §6.5 | ig_heikin_ashi | M02 | W06 | — |
| Volume (interpretive) | HB P6 §6.2 | ig_volume_analysis | M01 W02 | W02 | — |
| Order types (complete) | HB P3 §3.1 | ig_order_types | M01 W02 | W02 | — |
| Trading psychology | HB P5 §5.1–5.3 | ig_trading_psychology | M03 W09 | W09 | — |
| Emotional journal fields | HB P5 §5.5 | — | M03 W09 | W09 | — |
| Market opening behaviors | HB P4 §4.3 | ig_market_open | M01 W01 | W01 | — |
| Types of trading days | HB P4 §4.4 | ig_trading_day_types | M03 | W09 | — |
| Market traps | HB P4 §4.5 | ig_market_traps | M01 W02 | W02 | — |
| Sentiment gauges (non-AI) | HB P6 §6.4 | ig_sentiment_indicators | M02 W08 | W08 | — |
| Trader's daily routine | HB P4 §4.1 | — | M01 | W01 | D001 |
| MTF analysis | HB P6 §6.3 | ig_mtf_analysis | M02 W06 | W06 | — |
| Glossary | FINN_Glossary.md | — | All | All | — |

---

## CLAUDE.md Updates Required

After Phase A is complete, update `CLAUDE.md`:

1. **File Map table** — add new entries:

| File | Location | Size | Read Strategy |
|------|----------|------|---------------|
| `FINN_ResourceIndex.md` | `resources/` | ~150 lines | Full read — use as navigation map for any resource task |
| `FINN_Glossary.md` | `resources/` | ~200 lines | Full read or grep for specific term |
| `FINN_HB_P[1-6].md` | `resources/handbook/` | ~200–400 lines each | Full read per part when working on related content |

2. **New Task Playbook entry:**

```
### TASK: Find a concept definition or locate curriculum resources

1. Read `resources/FINN_ResourceIndex.md` — answers almost all resource location questions
2. For term definitions: `resources/FINN_Glossary.md`
3. For visual reference: `resources/infographics/ig_[topic].html`
4. For student-facing explanation: `resources/handbook/FINN_HB_P[N].md`
```

---

## Infographic Design Standards

All `.html` infographics follow the same design system:

```
Color system:
  Background:    #0d1117 (near-black)
  Card/panel:    #161b22 (dark gray)
  Border:        #30363d
  Primary text:  #e6edf3 (off-white)
  Accent 1:      #58a6ff (FINN blue — headers, highlights)
  Accent 2:      #3fb950 (green — bullish signals, advantages)
  Accent 3:      #f85149 (red — bearish signals, risks, warnings)
  Accent 4:      #d29922 (amber — neutral/caution)
  Accent 5:      #8b949e (muted gray — secondary text, footnotes)

Typography:
  Body: system-ui, -apple-system, sans-serif
  Code: 'Courier New', monospace

Layout:
  Max-width: 1200px, centered
  Card grid: CSS Grid, 2–4 columns depending on content
  All self-contained (no external CSS/JS/fonts)
  Print-friendly: @media print styles included
  
Header (every file):
  FINN logo text + file title + generated date + version note
```

---

## Completion Tracker

| Phase | Session | Status | Files Created | Files Modified |
|-------|---------|--------|:-------------:|:--------------:|
| A — Foundation | A1: Index + Glossary | ⬜ Pending | 3 | 1 |
| A — Foundation | A2: Handbook Part 1 | ⬜ Pending | 1 | 1 |
| B — Handbook | B1: Parts 2 | ⬜ Pending | 1 | 1 |
| B — Handbook | B2: Parts 3 + 4 | ⬜ Pending | 2 | 1 |
| B — Handbook | B3: Parts 5 + 6 | ⬜ Pending | 2 | 1 |
| C — Infographics | C1: Candlesticks, S&R, Trendlines, Gaps | ⬜ Pending | 4 | 1 |
| C — Infographics | C2: Trade Types, Orders, Brokers | ⬜ Pending | 3 | 1 |
| C — Infographics | C3: Platform Guides, Info Sources | ⬜ Pending | 4 | 1 |
| C — Infographics | C4: Chart Patterns, Fibonacci, Heikin Ashi, Volume | ⬜ Pending | 5 | 1 |
| C — Infographics | C5: Psychology, Sentiment, Market Context | ⬜ Pending | 6 | 1 |
| C — Infographics | C6: FINN-Specific + Index Finalization | ⬜ Pending | 4 | 1 |
| D — Monthly | D1: Month 1 + 2 | ⬜ Pending | 0 | 2 |
| D — Monthly | D2: Month 3–6 | ⬜ Pending | 0 | 4 |
| E — Weekly | E1: W01–W04 | ⬜ Pending | 0 | 4 |
| E — Weekly | E2: W05–W08 | ⬜ Pending | 0 | 4 |
| E — Weekly | E3: W09–W12 | ⬜ Pending | 0 | 4 |
| E — Weekly | E4: W13–W24 | ⬜ Pending | 0 | 12 |
| F — Daily | F1: D001–D012 | ⬜ Pending | 0 | 7 |
| F — Daily | F2: D013–D072 | ⬜ Pending | 0 | ~15 targeted |
| **TOTAL** | **19 sessions** | | **~40 new files** | **~60 file edits** |

---

## Notes

- Each session starts by loading `FINN_ResourceIndex.md` (once built) to navigate efficiently
- CHANGELOG.md should be updated after each phase is complete, not after each session
- The `FINN_ResourceIndex.md` grows incrementally — each session adds its completed pointers
- Infographic HTML files can be opened directly in a browser or attached to student emails
- The "Live Chart Walk" format (added to W05+ Fridays) requires no new file — it's a session format addition only
- Journal template update (W09) modifies the journal template embedded in the weekly file — no separate file needed

---

*Execution plan generated: May 8, 2026*
*Ready to begin: Session A1*
*Source: `finn_gap_analysis.md` — Tier 1 + Tier 2 gaps only*
