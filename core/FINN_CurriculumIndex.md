# FINN Curriculum Index
## Financial Intelligence & Navigation Network
### Dense Week-by-Week Reference · Read in full (~100 lines)

Use this file instead of reading monthly plans when you only need scheduling, sequencing, or week-level context. For full session content, use the monthly files with offset/limit (see CLAUDE.md).

---

## Month Overview

| Month | Dates | Phase | Milestone | Async Days |
|-------|-------|-------|-----------|------------|
| 1 | Apr 13 – May 9 | Foundation — market literacy, Python basics | **M1: Oral Assessment** May 8 | Memorial Day May 25 (Month 2) |
| 2 | May 11 – Jun 6 | Quant Methods + AI — statistics, backtesting, FinBERT | **M2: Strategy Presentation** Jun 5–6 | None |
| 3 | Jun 8 – Jul 3 | Paper Trading I — live execution, risk framework | M3 prep begins | Jul 4 early close |
| 4 | Jul 6 – Aug 1 | Paper Trading II — automation, multi-position, pipeline | **M3: Mid-Review** Aug 1 | None |
| 5 | Aug 3 – Aug 28 | Optimization + Capstone Design — XGBoost, live sentiment | Capstone LOCKED Aug 28 | None |
| 6 | Aug 31 – Sep 26 | Capstone Execution + Finale — live trading, report, presentations | **M4: Final Capstone** Sep 25–26 | Labor Day Sep 7 |

---

## Week Index

| W# | Dates | Month | Theme | Monday Topic | Workshop Focus | Notebook Name | Key Deliverable |
|----|-------|-------|-------|-------------|----------------|---------------|-----------------|
| W01 | Apr 13–18 | 1 | Market Foundations | Market structure, asset classes, order types | Market data with yfinance — first Python pull | `W01_workshop_market_data` | Hypothesis log started |
| W02 | Apr 20–25 | 1 | Price & Volume Analysis | Candlesticks, OHLCV, volume signals | Technical indicators with pandas_ta | `W02_workshop_technical_indicators` | 3 hypotheses logged |
| W03 | Apr 27–May 2 | 1 | Risk & Probability | R:R ratios, Kelly criterion, expectancy | Risk calculator notebook | `W03_workshop_risk_calculator` | Risk framework documented |
| W04 | May 4–9 | 1 | M1 Prep + Assessment | Market vocabulary synthesis | M1 oral assessment practice | *(no workshop)* | **M1 oral assessment** |
| W05 | May 11–16 | 2 | Statistics for Trading | Distributions, IC, p-values, significance | IC calculator — feature vs. forward return | `W05_workshop_IC_calculator` | Feature IC table |
| W06 | May 18–23 | 2 | Feature Engineering | Alpha factors, feature matrix, signal design | Feature matrix builder — 10+ indicators | `W06_workshop_feature_matrix` | Full feature matrix |
| W07 | May 25–30 | 2 | Backtesting | Walk-forward, OOS, cost models, Sharpe | Backtester v1 — rules-based strategy | `W07_workshop_backtester_v1` | First backtest results |
| W08 | Jun 1–6 | 2 | AI Signals + M2 Prep | FinBERT intro, sentiment as a signal | Sentiment pipeline — FinBERT on headlines | `W08_workshop_sentiment_pipeline` | **M2 strategy presentation** |
| W09 | Jun 8–13 | 3 | Paper Trading Launch | Webull setup, position sizing, first trade | Live trade execution — Webull API | `W09_workshop_live_execution` | First live paper trade |
| W10 | Jun 15–20 | 3 | Risk Management Live | ATR stops, drawdown rules, journal discipline | Portfolio dashboard — equity curve live | `W10_workshop_portfolio_dashboard` | Portfolio dashboard running |
| W11 | Jun 22–27 | 3 | Analytics & Attribution | Sharpe, win rate, regime analysis | Monthly analytics — Month 3 week 3 review | `W11_workshop_monthly_analytics` | Month 3 analytics report |
| W12 | Jun 29–Jul 3 | 3 | Strategy Adaptation | Regime detection, adaptation decision tree | Adaptation framework + regime classifier | `W12_workshop_adaptation_framework` | Adaptation decision tree |
| W13 | Jul 6–11 | 4 | Automated Signal Monitor | Signal pipeline — morning scan automation | Signal monitor v1 — automated daily scan | `W13_workshop_signal_monitor` | Automated daily signal report |
| W14 | Jul 13–18 | 4 | Multi-Position Management | Correlation, portfolio beta, position limits | Multi-position portfolio builder | `W14_workshop_multi_position` | Multi-position framework live |
| W15 | Jul 20–25 | 4 | Advanced Risk + Pipeline | Stop types, circuit breakers, pipeline hardening | Full integrated pipeline — risk layer | `W15_workshop_integrated_pipeline` | Full automated pipeline |
| W16 | Jul 27–Aug 1 | 4 | M3 Review + Month 4 Close | Performance attribution — 2-month review | M3 analytics deep dive | `W16_workshop_M3_analytics` | **M3 mid-review presentation** |
| W17 | Aug 3–8 | 5 | ML Signals | XGBoost theory + feature matrix design | Train first XGBoost signal model | `W17_workshop_xgboost_signal` | XGBoost model trained + saved |
| W18 | Aug 10–15 | 5 | Live Sentiment | Live NewsAPI + FinBERT operational | Full live sentiment + ML pipeline integration | `W18_workshop_live_sentiment` | Live sentiment pipeline running |
| W19 | Aug 17–22 | 5 | Multi-Signal Architecture | Combining signals — gate/scoring/regime | Multi-signal strategy backtest | `W19_workshop_multi_signal` | IC comparison by signal component |
| W20 | Aug 24–29 | 5 | Capstone Design | Capstone architecture + spec document | Capstone specification + final IC validation | `W20_workshop_capstone_spec` | **Capstone hypothesis LOCKED** |
| W21 | Aug 31–Sep 5 | 6 | Capstone Launch | Execution standards + report structure | CapstonePipeline v2.0 — first live trades | `W21_workshop_capstone_launch` | First capstone trades + Report Sec 1 |
| W22 | Sep 7–12 | 6 | Deep Execution + Analytics | ⚠️ Labor Day async (Mon) | Full 4-month analytics notebook | `W22_workshop_full_analytics` | Report Sections 2–4 + equity curve |
| W23 | Sep 14–19 | 6 | Analysis + Writing | Writing limitations, AI contribution, forward plan | 5 capstone report charts | `W23_workshop_report_charts` | All 5 charts + Report Sections 5–7 |
| W24 | Sep 21–26 | 6 | Presentation + Finale | Course synthesis + presentation prep | Dress rehearsal (no notebook) | *(no workshop notebook)* | **M4 capstone presentations** |

---

## Milestone Quick-Reference

| Milestone | Date | Format | Primary Deliverable |
|-----------|------|--------|---------------------|
| M1 | May 8, 2026 | 20-min oral per student | Market vocabulary + first hypothesis analysis |
| M2 | Jun 5–6, 2026 | 15-min presentation + 5-min Q&A | Strategy design with backtest evidence |
| M3 | Aug 1, 2026 | 30-min individual portfolio review | 2-month paper trading performance + attribution |
| M4 | Sep 25–26, 2026 | 20-min presentation + 10-min Q&A + written report | Full capstone strategy + 4-month record |

---

## Async / Holiday Weeks

| Date | Event | Week | Impact | Package Location |
|------|-------|------|--------|-----------------|
| May 25, 2026 | Memorial Day | W07 Monday | Class cancelled | Embedded in `FINN_Month02.md` |
| Jul 3, 2026 | July 4 (early close) | W12 Friday | Short session | Note in `FINN_Month03.md` |
| Sep 7, 2026 | Labor Day | W22 Monday | Class cancelled | Embedded in `FINN_W22.md` |

---

## Content Thread Map (for cross-week edits)

| Thread | First introduced | Extended in | Culminates in |
|--------|----------------|-------------|---------------|
| Feature engineering | W06 | W17 | W20 capstone spec (Section 3) |
| Backtesting | W07 | W11, W16 | W22 full attribution |
| FinBERT / sentiment | W08 | W18 | W21 pipeline + W23 Section 5 |
| Paper trading | W09 | W10–W16 | W22 4-month analytics |
| Signal pipeline automation | W13 | W14, W15 | W21 CapstonePipeline v2.0 |
| XGBoost | W17 | W18, W19 | W20 capstone spec (Section 3) |
| Multi-signal architecture | W19 | W20 | W21 live execution |
| Capstone report | W21 Sec 1 | W22 Sec 2–4, W23 Sec 5–7 | W24 final submission |

---

*FINN_CurriculumIndex.md — Read in full before creating or navigating weekly files.*
*Update this file whenever a week's theme, dates, or notebook name changes.*
