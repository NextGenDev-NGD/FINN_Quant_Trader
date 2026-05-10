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

### [2026-05-10] — Slash Command Skills — 7 Skills Built

**Files created:**
- `.claude/commands/finn-design.md` — `/finn-design [file]`: UIX/Frontend build mode for infographic upgrades; loads design system v2 spec, enforces social media mode, animation system, component patterns, self-contained HTML constraint
- `.claude/commands/finn-research.md` — `/finn-research [target]`: structured research mode; frames questions from planning doc first, separates observation from interpretation, resolves Open Decisions after research completes
- `.claude/commands/finn-marketing.md` — `/finn-marketing [type]`: marketing mode; FINN brand context, platform specs (Twitter/X, LinkedIn, Instagram), copy rules, output formats for posts/copy/briefs
- `.claude/commands/finn-resume.md` — `/finn-resume`: session startup briefing; reads ProjectStatus + planning doc, outputs structured scope/files/context summary
- `.claude/commands/finn-weekly.md` — `/finn-weekly [W##]`: creates complete weekly file from CurriculumIndex + WeeklySchema + monthly section (offset/limit); updates CHANGELOG after writing
- `.claude/commands/finn-daily.md` — `/finn-daily [D###]`: load mode if file exists (FINN persona briefing), create mode if not (derives from weekly file, adds resource callouts)
- `.claude/commands/finn-resource.md` — `/finn-resource [topic]`: looks up handbook section + infographic + glossary entry, surfaces curriculum week where topic first appears

**Files modified:**
- `FINN_RepoIndex.md` — commands folder map updated, Skills table updated (all 7 marked ✅ Built)
- `.gitignore` — added `.claude/settings.local.json` (personal overrides should not be committed)

**Status:** Full slash command suite complete. Three build/research/marketing skills for the Infographics Upgrade project. Four curriculum operation skills for day-to-day FINN session work.

---

### [2026-05-10] — Infographics Upgrade — Architecture Plan + Project Initialized

**Files created:**
- `research/planning/finn_infographics_upgrade_plan.md` — full project architecture: current state inventory (26 files, T1/T2/T3 social tiers), design system v2 spec (CSS variables, social media mode at 1200×675px, animation system, component patterns), content upgrade sequence (8 T1 → 11 T2 → 7 T3), 6 net-new social-first files, 16-session phase plan (A–F), 7 open decisions, success criteria per phase
- `FINN_ReleaseNotes.md` — audience-facing product history (v0.1–v0.4): versioned by capability milestone for developer/student/partner comms; separate from CHANGELOG (internal) — written for keynotes and sales context

**Files modified:**
- `FINN_ProjectStatus.md` — Infographics Upgrade added as active project; Phase A Session A1 scoped (competitor audit)
- `FINN_RepoIndex.md` — FINN_ReleaseNotes.md added to folder map and Key Root Files table; resources/ pending markers updated to ✅ Complete; Active Build Project section updated
- `CLAUDE.md` — FINN_ReleaseNotes.md added to File Map & Token Budget table

**Status:** Architecture locked. Next session: `/finn-research competitors` to begin Phase A.

---

### [2026-05-10] — Knowledge Base Session F2 — Daily File Resource Callouts (D013–D015) + KB Build Complete

**Files modified:**
- `curriculum/daily/FINN_D013.md` — 1 callout: ig_performance_metrics (before CONCEPT DELIVERY Part B — after IC definition and Type I/II block)
- `curriculum/daily/FINN_D014.md` — 2 callouts: ig_quant_workflow (after FRAMING close — workflow step mapping), ig_performance_metrics (before Step 5 Rolling IC — after Step 4 IC code block)
- `curriculum/daily/FINN_D015.md` — 1 callout: ig_candlestick_patterns (NEXT WEEK PREVIEW — after Wiki 5.2 candlestick reading assignment)
- `FINN_ProjectStatus.md` — F2 complete; progress 19/19; KB Build project marked complete

**Total callouts added:** 4 across 3 files.
**Status:** Session F2 complete. Knowledge Base Build — Gap Integration (Tier 1 + Tier 2) project fully done. D001–D015 (Weeks 1–5) have targeted resource callouts at point-of-use. Daily files D016+ not yet created; no integration needed until they are written.

---

### [2026-05-10] — Knowledge Base Session F1 — Daily File Resource Callouts (D001–D012)

**Files modified:**
- `curriculum/daily/FINN_D001.md` — 4 callouts: HB P1 pre-reading (PREP block), ig_platform_tradingview (PRE-MARKET SCAN TradingView show), ig_market_open (end of PRE-MARKET SCAN), ig_trade_types (end of ASSET CLASSES section)
- `curriculum/daily/FINN_D002.md` — 1 callout: ig_platform_tradingview (after SHARE-OUT — watchlist config task)
- `curriculum/daily/FINN_D003.md` — 1 callout: HB 2.2 + ig_support_resistance (OBSERVATION ASSIGNMENT — S&R zone identification task)
- `curriculum/daily/FINN_D004.md` — 1 callout: ig_order_types (after MOO/MOC — full taxonomy reference)
- `curriculum/daily/FINN_D005.md` — 3 callouts: ig_gap_types (after Step 1 range/gap commentary), ig_volume_analysis (after Step 2 rolling NaN note), HB 2.3 (OBSERVATION ASSIGNMENT — trendline drawing task)
- `curriculum/daily/FINN_D006.md` — 2 callouts: ig_gap_types (PRE-MARKET SCAN gap day note), ig_volume_analysis (CHART REVIEW high-impact day analysis)
- `curriculum/daily/FINN_D007.md` — 2 callouts: ig_quant_workflow (after 9-step workflow [ASK] block), ig_performance_metrics (after Expectancy definition)
- `curriculum/daily/FINN_D008.md` — 2 callouts: ig_performance_metrics (end of FRAMING — metrics reference card), HB 2.1 (OBSERVATION ASSIGNMENT — candlestick identification task)
- `curriculum/daily/FINN_D009.md` — 2 callouts: ig_quant_workflow (after RETROSPECTIVE workflow question), ig_performance_metrics (MARKET AUTOPSY metrics applied section)
- `curriculum/daily/FINN_D010.md` — 3 callouts: ig_gap_types (OBSERVATION ASSIGNMENT), ig_performance_metrics (after Lightning Round metrics bullet), HB P1–5 (review checklist — full M1 scope reference)
- `curriculum/daily/FINN_D011.md` — 2 callouts: ig_performance_metrics (after "Milestone 1 artifact" framing), HB P1–5 (after MUDDIEST POINT — pre-assessment review prompt)
- `curriculum/daily/FINN_D012.md` — 3 callouts: ig_quant_workflow + ig_performance_metrics (after Part 1 sample questions), HB P1–6 archive note (after Month 2 preview)
- `FINN_ProjectStatus.md` — F1 complete; progress 18/19; F2 scoped

**Total callouts added:** 25 across 12 files.
**Status:** Session F1 complete. D-phase and E-phase (monthly + weekly) integration fully done. F1 (W01–W04 daily) integration done. One session remaining: F2 (D013–D072).

---

### [2026-05-09] — Knowledge Base Session E4 — Weekly File Resource Callouts (W13–W24)

**Files modified:**
- `curriculum/weekly/FINN_W13.md` — 1 resource callout added: ig_quant_workflow (after End-of-Day Summary step 4 of automated workflow, before Topic B signal pipeline — automation pipeline context, new use vs. W01–W12)
- `curriculum/weekly/FINN_W14.md` — 1 resource callout added: ig_risk_rules (after Rule 5 weekly rebalancing, before Topic C hedging — multi-position extension of the 6 non-negotiable rules)
- `curriculum/weekly/FINN_W15.md` — 1 resource callout added: ig_performance_metrics (after insufficient data outcome category in the 4-outcome framework, before Topic B versioning — V1.0/V1.1 comparison context)
- `curriculum/weekly/FINN_W19.md` — 1 resource callout added: ig_multi_signal (after Architecture 2 scoring system explanation / "Month 6 extension" sentence, before Topic C multi-agent AI concept — the multi-signal architecture itself)
- `curriculum/weekly/FINN_W23.md` — 1 resource callout added: ig_performance_metrics (before Chart 2 rolling Sharpe build in capstone report charts workshop — capstone analytics context)
- `FINN_ProjectStatus.md` — E4 complete; progress 17/19; F1 scoped
- `resources/FINN_ResourceIndex.md` — E4 marked ✅ Done

**Not modified:** W16 (milestone prep — all resources introduced), W17–W18 (ML/sentiment — already placed in W15/W08), W20–W22 (capstone design/launch/analytics — no new callout point of higher value), W24 (presentation-only, no new technical content)

**Status:** Session E4 complete. 5 callouts added across 5 weekly files. E-phase (W01–W24) integration fully done.

---

### [2026-05-09] — Knowledge Base Session E3 — Weekly File Resource Callouts (W09–W12)

**Files modified:**
- `curriculum/weekly/FINN_W09.md` — 3 resource callouts added: ig_trading_psychology + HB P5 §5.1–5.3 (after Topic A psychology closing statement — "Use that feeling. It is training for when the money is real."); ig_risk_rules (after Rule 6 uncorrelated positions — Monday evening Block 2); ig_platform_webull + HB P1 §1.3 (after Webull MFA note, Wednesday Step 1 SDK connection)
- `curriculum/weekly/FINN_W10.md` — 2 resource callouts added: ig_risk_rules (after Equal Weight baseline comparison, Monday Topic A four sizing models); ig_performance_metrics (after Rolling Sharpe threshold statement, Monday Topic B portfolio risk metrics)
- `curriculum/weekly/FINN_W11.md` — 1 resource callout added: ig_multi_signal (after Topic B mismatched regime closing statement, before Topic C three questions framework)
- `curriculum/weekly/FINN_W12.md` — 1 resource callout added: ig_performance_metrics (before Wednesday Block 3 Independent Work, after generate_month3_summary() guided build)
- `FINN_ProjectStatus.md` — E3 complete; progress 16/19; E4 scoped
- `resources/FINN_ResourceIndex.md` — E3 marked ✅ Done

**Status:** Session E3 complete. 7 callouts added across 4 weekly files. E-phase W09–W12 integration done.

---

### [2026-05-09] — Knowledge Base Session E2 — Weekly File Resource Callouts (W05–W08)

**Files modified:**
- `curriculum/weekly/FINN_W05.md` — 1 resource callout added: ig_quant_workflow (after IC benchmark description, Monday Topic A — Step 4 statistical testing context)
- `curriculum/weekly/FINN_W06.md` — 3 resource callouts added: ig_volume_analysis + HB P6 §6.2 (after OBV feature usage line, Monday Topic B); ig_chart_patterns_continuation + ig_chart_patterns_reversal + ig_heikin_ashi + HB P2 §2.4–2.7 (after Topic C candlestick pattern encoding); ig_fibonacci + ig_mtf_analysis + HB P6 §6.1 & §6.3 (after Friday chart review indicator states)
- `curriculum/weekly/FINN_W07.md` — 1 resource callout added: ig_performance_metrics (before Block 3 Independent Work, after QuantStats Step 4 tear sheet)
- `curriculum/weekly/FINN_W08.md` — 1 resource callout added: ig_sentiment_indicators + HB P6 §6.4 (after Topic A signal universe expansion, contrasting non-AI vs. AI sentiment)
- `FINN_ProjectStatus.md` — E2 complete; progress 15/19; E3 scoped
- `resources/FINN_ResourceIndex.md` — E2 marked ✅ Done

**Status:** Session E2 complete. 6 callouts added across 4 weekly files. E-phase W05–W08 integration done.

---

### [2026-05-09] — Knowledge Base Session E1 — Weekly File Resource Callouts (W01–W04)

**Files modified:**
- `curriculum/weekly/FINN_W01.md` — 5 resource callouts added: ig_trade_types + HB P1 §1.1 (after scope reminder, Topic A asset classes); ig_info_sources + HB P4 §4.2 (after BTC/ETH checklist item, Monday DMB Block 1); ig_platform_tradingview + HB P1 §1.2 (after Level 2 TradingView mention, Topic B Market Structure); ig_platform_finviz + HB P1 §1.4 (before Finviz heatmap, Friday Block 2 Step 3 Sector Rotation); ig_market_open + HB P4 §4.3 (after Derivatives Window tell-students line, Friday Block 3)
- `curriculum/weekly/FINN_W02.md` — 4 resource callouts added: ig_order_types + HB P3 §3.1 (after MOO/MOC volume spikes statement, Monday Topic A); ig_market_traps + HB P4 §4.5 (after stop hunt expected direction note, Monday Block 3 Socratic Q2); ig_volume_analysis + HB P6 §6.2 (after Wednesday Step 2 deliberate mistake note); ig_gap_types + HB P2 §2.6 (before Wednesday Step 4, after Step 3 gap flag code)
- `curriculum/weekly/FINN_W03.md` — 2 resource callouts added: ig_quant_workflow (after Steps 5–9 loop emphasis statement, Topic A); ig_performance_metrics (after Expectancy definition, closing Topic B Performance Metrics)
- `curriculum/weekly/FINN_W04.md` — 3 resource callouts added: ig_performance_metrics (before Block 3 Share-Out, after integration notebook independent work section); ig_quant_workflow (after Part 3 integration question in Friday assessment format); HB P1–P4 full reference (after Friday review checklist, before file footer)
- `FINN_ProjectStatus.md` — E1 complete; progress 14/19; E2 scoped
- `resources/FINN_ResourceIndex.md` — E1 marked ✅ Done

**Status:** Session E1 complete. 14 callouts added across 4 weekly files. E-phase W01–W04 integration done.

---

### [2026-05-09] — Knowledge Base Session D2 — Monthly File Resource Callouts (Month 3–6)

**Files modified:**
- `curriculum/monthly/FINN_Month03.md` — 7 resource callouts added: W9 — ig_trading_psychology + HB P5 §5.1–5.3 (after psychology section), ig_risk_rules (after Rule 6), HB P5 §5.5 (after journal whiteboard demo), ig_platform_webull + HB P1 §1.3 (after Webull SDK Step 1 MFA note); W10 — ig_risk_rules (after Equal Weight sizing), ig_performance_metrics (after Rolling Sharpe); W11 — ig_multi_signal (after IC test / three questions framework)
- `curriculum/monthly/FINN_Month04.md` — 2 resource callouts added: W13 — ig_quant_workflow (after automated trading workflow diagram); W14 — ig_risk_rules (after multi-position rules)
- `curriculum/monthly/FINN_Month05.md` — 4 resource callouts added: W17 — ig_multi_signal (after ML entry rule statement); W19 — ig_multi_signal (after ensemble stacking explanation), ig_performance_metrics (after regime-conditional architecture); W20 — full handbook reference (before capstone spec Block 4)
- `curriculum/monthly/FINN_Month06.md` — 2 resource callouts added: W21 — HB P6 + glossary (after report writing standards); W22 async — ig_performance_metrics (before guided notes)
- `FINN_ProjectStatus.md` — D2 complete; progress 13/19; E1 scoped

**Status:** Session D2 complete. 15 callouts added across 4 files. All D-phase monthly file integration done.

---

### [2026-05-09] — Knowledge Base Session D1 — Monthly File Resource Callouts (Month 1 + 2)

**Files modified:**
- `curriculum/monthly/FINN_Month01.md` — 14 resource callouts added across Weeks 1–4: pre-reading note for HB P1, trade types (ig_trade_types + HB P1§1.1), Finviz + info sources (ig_platform_finviz + ig_info_sources), info sources + market open + daily routine (ig_info_sources + ig_market_open + HB P4§4.1), TradingView observation (ig_platform_tradingview), chart review (ig_platform_tradingview + ig_candlestick_patterns + HB P2§2.1), Finviz sector rotation (ig_platform_finviz), order types (ig_order_types + HB P3§3.1), market traps / stop hunt (ig_market_traps + HB P4§4.5), gap types (ig_gap_types + HB P2§2.6), volume analysis (ig_volume_analysis + HB P6§6.2), quant workflow (ig_quant_workflow), performance metrics (ig_performance_metrics), handbook review W4
- `curriculum/monthly/FINN_Month02.md` — 5 resource callouts added across Weeks 6–8: quant workflow / feature engineering framing (ig_quant_workflow), volume/OBV section (ig_volume_analysis + HB P6§6.2), chart patterns / candlestick cluster (ig_candlestick_patterns + ig_chart_patterns_continuation + ig_chart_patterns_reversal + ig_fibonacci + ig_heikin_ashi + ig_mtf_analysis + HB P2), backtest quant workflow Step 5–6 (ig_quant_workflow), non-AI sentiment (ig_sentiment_indicators + HB P6§6.4)
- `FINN_ProjectStatus.md` — D1 complete; progress 12/19; D2 scoped

**Status:** Session D1 complete. No new files created. All existing library files now referenced at point-of-use in Month 1–2 curriculum.

---

### [2026-05-08] — Knowledge Base Sessions B2, B3, C1 — Handbook Parts 3–6 + 4 Infographics

**Context:** Sessions delivered in atomized sub-sessions (B2.a/b, B3.a/b, C1.a/b) to avoid context overflow. Each sub-session writes one file; parent session completes on ResourceIndex + ProjectStatus update.

---

**Session B2 — Handbook Parts 3 + 4**

**Files created:**
- `resources/handbook/FINN_HB_P3_OrderExecution.md` — 3-section order execution reference: §3.1 complete order type taxonomy (9 core types + 7 conditional/advanced types, price guarantee matrix, gap risk on stop orders), §3.2 short selling basics (mechanics, long vs. short P&L math, margin requirements, borrow fees, uptick rule, 4 FINN short setups), §3.3 order routing and best execution (PFOF, ECNs, dark pools, bid-ask spread table by stock type, slippage sources + reduction strategies, best execution decision matrix)
- `resources/handbook/FINN_HB_P4_MarketContext.md` — 5-section market context reference: §4.1 trader's daily routine (pre-market 6–9:30 AM table, active session by time block, post-market checklist), §4.2 information sources map (5 categories × 20+ sources with cost + FINN use notes, information hierarchy), §4.3 reading the market open (pre-open gap analysis, 4 opening types framework, first-30-min rule, Asia-Europe range), §4.4 types of trading days (trending, rotational, news-driven — each with identification signals, best strategies, what to avoid + decision tree), §4.5 market traps (bull trap, bear trap, stop hunt, false breakout from consolidation — each with mechanics, identification, protection + 5-question trap checklist)

**Files modified:**
- `resources/FINN_ResourceIndex.md` — HB P3 and HB P4 marked ✅ Built (B2); B2 build status row updated
- `FINN_ProjectStatus.md` — B2 complete; progress 4/19; B3 scoped

**Gaps addressed:** #29 (order types), #36 (market open), #35 (day types), #23 (market traps), #43 (daily routine), #44 (info sources)

---

**Session B3 — Handbook Parts 5 + 6**

**Files created:**
- `resources/handbook/FINN_HB_P5_Psychology.md` — 5-section trading psychology reference: §5.1 psychology primer (System 1 vs. System 2, performance curve, journal as mirror), §5.2 the 3 dangerous emotions (fear, greed, revenge — each with manifestations, dollar cost, and countermeasures table), §5.3 cognitive biases (9 biases with trading manifestation, dollar cost, and countermeasure; monthly bias audit protocol), §5.4 pre/post trade emotional check (5-question pre-trade checklist with action thresholds, 4-question post-trade protocol), §5.5 FINN emotional journal fields (required entry/exit fields with format and examples, 4 monthly aggregate metrics)
- `resources/handbook/FINN_HB_P6_MarketReference.md` — 5-section market reference: §6.1 Fibonacci retracements (6 key levels, drawing steps for uptrend/downtrend, FINN rules, extensions table), §6.2 volume reading guide (breakout/reversal/OBV/climactic patterns, FINN backtest code), §6.3 MTF analysis (4-timeframe top-down framework with step-by-step decision process, MTF rules), §6.4 sentiment indicators non-AI (VIX levels table + FINN code, Fear & Greed index, AAII survey thresholds, Put/Call ratio — all with contrarian signal guidelines), §6.5 Heikin Ashi extended (advanced trend/transition/reversal signals, HA as strategy filter with code, practical limitations)

**Files modified:**
- `resources/FINN_ResourceIndex.md` — HB P5 and HB P6 marked ✅ Built (B3); B3 build status row updated
- `FINN_ProjectStatus.md` — B3 complete; progress 5/19; C1 scoped. Phase B — Handbook — fully complete.

**Gaps addressed:** #31 (trading psychology), #32 (emotional journal), #13 (Fibonacci), #14 (volume), #34 (MTF analysis), #45 (sentiment indicators), #18 (Heikin Ashi extended)

---

**Session C1 — Infographics: Candlestick Patterns, S&R, Trendlines, Gap Types**

**Files created:**
- `resources/infographics/ig_candlestick_patterns.html` — dark-theme HTML reference: anatomy section with CSS candle visuals, 10 single-candle patterns, 6 two-candle patterns, 4 three-candle patterns — all with signal badges, conditions, and context rules; FINN application rules block
- `resources/infographics/ig_support_resistance.html` — dark-theme HTML reference: core definitions (support/resistance/zone distinction), ASCII price lifecycle diagram, zone strength factors table, test/retest/invalidation/role reversal cards, FINN rules and common-mistake warning
- `resources/infographics/ig_trendlines.html` — dark-theme HTML reference: uptrend/downtrend/channel ASCII diagrams, 4-step drawing guide table, confirmed vs. false break comparison cards, angle validity table, FINN rules
- `resources/infographics/ig_gap_types.html` — dark-theme HTML reference: gap anatomy diagram, 4 gap type cards (Common/Breakaway/Runaway/Exhaustion each with size, volume, fill probability, signal value), identification matrix table, FINN gap detection code block

All 4 infographics: self-contained CSS + HTML (no external dependencies), FINN dark theme (#0d1117 background), print-friendly `@media print` styles included, max-width 1200px centered layout.

**Files modified:**
- `resources/FINN_ResourceIndex.md` — all 4 C1 infographics marked ✅ Built (C1); C1 build status row updated
- `FINN_ProjectStatus.md` — C1 complete; progress 6/19; C2 scoped (ig_trade_types, ig_order_types, ig_broker_comparison)

**Gaps addressed:** #1 (candlestick visual guide), #4 (S&R), #3 (trendlines), #15 (gap types)

---

**Session delivery note:** All sessions in this commit used atomized sub-session delivery (one file per sub-session) after diagnosing that multi-file sessions were causing context overflow crashes. Sub-session naming convention (B2.a, B2.b, etc.) adopted going forward.

**Status:** Sessions B2 + B3 + C1 complete. 6 / 19 sessions done. Phase B (Handbook, 6 parts) fully complete. Phase C (Infographics) in progress — C1 of 6 done.

---

### [2026-05-08] — Knowledge Base Session B1 — Handbook Part 2

**Files created:**
- `resources/handbook/FINN_HB_P2_ChartReading.md` — 7-section chart reading reference: §2.1 candlestick patterns (anatomy, 10 single-candle, 6 two-candle, 4 three-candle patterns; interpretation rules), §2.2 S&R (types, how to draw zones, strength indicators, invalidation), §2.3 trendlines (drawing method, channels, valid breaks, false breaks), §2.4 continuation patterns (flag, pennant, ascending/descending/symmetrical triangle, rectangle, rising/falling wedge), §2.5 reversal patterns (double top/bottom, H&S/inverse, cup and handle, rounding bottom), §2.6 gap types (common, breakaway, runaway, exhaustion + gap fill concept + FINN code reference), §2.7 Heikin Ashi (formula, visual properties, when to use/not use)

**Files modified:**
- `resources/FINN_ResourceIndex.md` — HB P2 marked ✅ Built (B1); build status updated
- `FINN_ProjectStatus.md` — Session B1 marked complete; Session B2 defined as next

**Gaps addressed:** #1 (candlesticks), #3 (trendlines), #4 (S&R), #5/#6 (chart patterns), #15 (gaps), #18 (Heikin Ashi)
**Status:** Session B1 complete. 3 / 19 sessions done.

---

### [2026-05-08] — Knowledge Base Session A2 — Handbook Part 1

**Files created:**
- `resources/handbook/FINN_HB_P1_GettingStarted.md` — 5-section student reference covering: §1.1 trade type taxonomy (8 styles, FINN recommendation), §1.2 TradingView setup (chart config, indicators, watchlists, alerts, templates), §1.3 Webull paper trading setup (account, order entry, stop-loss, OCO, P&L), §1.4 Finviz DMB workflow (home page, heatmap, screener, news, futures), §1.5 broker comparison (6 brokers × 8 criteria + notes)

**Files modified:**
- `resources/FINN_ResourceIndex.md` — HB P1 marked ✅ Built (A2); build status table updated
- `FINN_ProjectStatus.md` — Session A2 marked complete; Session B1 defined as next

**Gaps addressed:** #1 (trade types), #38 (TradingView), #39 (Webull), #40 (Finviz), #42 (broker comparison)
**Status:** Session A2 complete. Phase A — Foundation is fully done.

---

### [2026-05-08] — Knowledge Base Session A1 — ResourceIndex + Glossary

**Files created:**
- `resources/FINN_ResourceIndex.md` — master navigation index: 29-topic coverage map, all 33 resource files listed with build status, phase tracker
- `resources/FINN_Glossary.md` — complete terminology reference: ~72 terms, alphabetical, each with definition + first FINN week + cross-reference to handbook/infographic

**Files modified:**
- `CLAUDE.md` — added `FINN_ResourceIndex.md`, `FINN_Glossary.md`, and `FINN_HB_P[1-6].md` rows to the file map table; updated CLAUDE.md line count
- `FINN_ProjectStatus.md` — Session A1 marked complete; Session A2 defined as next

**Status:** Session A1 complete. Session A2 (Handbook Part 1) is next.

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
