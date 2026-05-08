# FINN Curriculum Context
## Internal Reference — May 8, 2026
### Source: All 6 Monthly Lesson Plans (`FINN_Month01.md` – `FINN_Month06.md`)

---

## Course Identity

**Full name:** Financial Intelligence & Navigation Network (FINN)
**Duration:** 6 months — April 13 to September 26, 2026
**Format:** 3 live sessions per week (Mon/Wed/Fri) — Morning DMB + Evening class
**Total sessions:** ~72 (excluding holidays)
**Students:** Adult learners with jobs/families — evening schedule design
**Environment:** Python 3.11 (`finnenv`), all free tools, paper trading on Webull
**Persona:** FINN — a practitioner who teaches, not a teacher who knows about practice

---

## Session Architecture (Every Class Day)

### Morning — Daily Market Brief (DMB): 9:00–10:00 AM EST

| Block | Duration | Content |
|-------|----------|---------|
| Pre-Market Scan | 15 min | ES/NQ/YM futures, VIX, macro calendar, earnings, Finviz heatmap, 10-yr yield, BTC/ETH |
| Student-Led Brief | 20 min | Rotating presenter; ticker watchlist, hypothesis, signal check |
| Hypothesis Setting | 15 min | Daily falsifiable hypothesis logged to master hypothesis log |
| Observation Assignment | 10 min | Specific market observation task for the day |

### Evening Session Structure by Day

| Day | Format | Primary Focus |
|-----|--------|---------------|
| Monday | Theory session (8:00–9:30 PM) | New concept delivery, Socratic discussion |
| Wednesday | Workshop/coding session (8:00–9:30 PM) | Guided Python build + independent work |
| Friday | Review + market autopsy (8:00–9:30 PM) | Hypothesis audit, chart review, derivatives window |

**Recurring Friday elements (every week):**
- Hypothesis audit — close and evaluate every hypothesis from the week
- Chart review — SPY weekly, QQQ daily, VIX, sector rotation (Finviz heatmap)
- Derivatives window — put/call ratio, VIX term structure (observation-only Months 1–2)
- Weekly One-Liner: *"This week I learned ___, and next week I want to understand ___."*

---

## Milestone Structure

| Milestone | Week | Format | What Is Assessed |
|-----------|------|--------|-----------------|
| M1 — Market Literacy Assessment | Week 4 (May 8) | Oral — 20 min per student, no notes | Concepts, applied interpretation, integration question |
| M2 — Strategy Presentation | Week 8 (Jun 5–6) | Presentation — 15 min + 5 min Q&A | Full backtested strategy in 6-section format |
| M3 — Paper Trading Mid-Review | Week 16 (Aug 1) | Full review — journal audit + P&L attribution | 2 months of live performance, strategy adherence, forward plan |
| M4 — Capstone Presentation | Week 24 (Sep 25–26) | Presentation — 20 min + 10 min Q&A + written report | All 4 months of live trading + 7-section written report |

**Pass criteria (M1):** Explain any concept in own words with real-world example — genuine understanding, not memorization.
**Pass criteria (M4):** Honest articulation of what was built, evidence collected, what worked, what didn't, and what to do differently.

---

## Month-by-Month Curriculum

---

### Month 1 — Foundation Phase: Market Literacy & Quant Mindset
**Dates:** April 13 – May 9, 2026
**Weeks:** 1–4

#### Learning Objectives
- Define and use core financial market terminology without reference materials
- Explain market microstructure — how trades execute, who the participants are, what drives price
- Describe all major asset classes; explain the course focus on equities and ETFs
- Recite and explain all 9 steps of the FINN Quant Workflow from memory
- Read and interpret OHLCV data, candlestick charts, and key market indices
- Fetch, inspect, and describe financial data in Python using yfinance
- Identify and explain core performance metrics: Sharpe, drawdown, win rate, expectancy
- Form specific, falsifiable daily market hypotheses and evaluate their outcomes

#### Weekly Breakdown

| Week | Theme | Monday Theory | Wednesday Workshop | Friday Focus |
|------|-------|--------------|-------------------|-------------|
| 1 | Market Structure | Asset classes, exchanges, participants, order book | Python env + yfinance first data pull | Week 1 chart review + market autopsy |
| 2 | How Markets Work | Order types, microstructure, bid-ask, slippage, PFOF | OHLCV deep dive + volume analysis + gap detection | Order flow observation review |
| 3 | Measuring Markets | The 9-step Quant Workflow + performance metrics (Sharpe, MDD, win rate, expectancy) | Performance metrics from scratch in Python | Metrics on real week's data |
| 4 | Integration + M1 | Review and synthesis — no new material | Full single-stock analysis integration notebook | **Milestone 1 Oral Assessment** |

#### Concepts Covered — Month 1

**Markets & Structure:**
- Asset classes: equities, ETFs, options, futures, crypto, forex
- Exchanges, market hours, pre-market/after-hours dynamics
- Order book mechanics — bid/ask, inside market, market impact
- Market participants: retail, institutional, hedge funds, market makers, HFTs
- Payment for order flow (PFOF)
- Market indices: SPY, QQQ, IWM, DIA, VIX

**Order Mechanics:**
- Market, limit, stop, stop-limit, trailing stop, MOO/MOC orders
- Slippage, spread cost as a real transaction cost (even with zero-commission brokers)
- Stop hunt dynamics — why placement matters
- Market impact of large orders

**The Quant Workflow (9 steps memorized):**
1. Hypothesis formation (specific, testable, falsifiable)
2. Data acquisition
3. Feature engineering
4. Statistical testing
5. Model building
6. Backtesting
7. Risk management
8. Paper trading
9. Review and iteration

**Performance Metrics:**
- Total return + annualized return
- Annual volatility (σ × √252)
- Sharpe ratio (excess return / volatility, annualized)
- Maximum drawdown (peak-to-trough)
- Win rate and loss rate
- Expectancy = (Win Rate × Avg Win) − (Loss Rate × Avg Loss)
- R:R ratio
- Calmar ratio (brief), Sortino ratio (brief)

#### Month 1 Workshops

| Workshop | Notebook | Key Skills Built |
|---------|---------|-----------------|
| W01 | `W01_workshop_market_data` | yfinance data pull, OHLCV structure, daily returns, `pct_change()`, basic visualization |
| W02 | `W02_workshop_ohlcv` | Volume ratio flags, gap detection, `flag_notable_days()` reusable function, high-impact day analysis |
| W03 | `W03_workshop_metrics` | Sharpe, drawdown, win rate, expectancy all built from scratch (no libraries) |
| W04 | `W04_workshop_integration` | Full single-stock analysis: data → features → metrics → visualization → 300-word written interpretation |

#### Python Introduced — Month 1
`yfinance`, `pandas`, `numpy`, `matplotlib`, `pct_change()`, `rolling()`, `cummax()`, `cumprod()`

---

### Month 2 — Quant Methods, AI Integration & Strategy Development
**Dates:** May 11 – June 6, 2026
**Weeks:** 5–8
**Note:** Memorial Day May 25 — async package pre-built (Week 7 Monday)

#### Learning Objectives
- Apply statistical hypothesis testing to validate whether a signal has predictive value
- Explain stationarity, autocorrelation, and why they matter for financial time series
- Calculate and interpret technical indicators (RSI, MACD, BB, ATR, VWAP) as data features
- Build a complete feature matrix from raw OHLCV using pandas-ta
- Run a rules-based backtest using Backtrader and interpret results honestly
- Apply walk-forward testing methodology and explain why it matters
- Build a basic ML signal using scikit-learn with time-series cross-validation
- Integrate a sentiment signal using FinBERT on financial news headlines
- Identify and explain 3+ backtesting pitfalls: look-ahead bias, overfitting, survivorship bias
- Present a complete, backtested strategy at Milestone 2

#### Weekly Breakdown

| Week | Theme | Monday Theory | Wednesday Workshop | Friday Focus |
|------|-------|--------------|-------------------|-------------|
| 5 | Statistics for Quants | Hypothesis testing, null hypothesis, p-values, Type I/II errors, ADF test, stationarity, autocorrelation, IC, multiple testing problem | ADF test, t-test on RSI signal, IC calculation, rolling 90-day IC | Statistical thinking on real week's market |
| 6 | Indicators as Features | Reframing TA indicators as engineered features — not crystal balls. Deep walk: RSI, MACD, Bollinger Bands, ATR, EMA/SMA, OBV, VWAP, Stochastic, ADX, candlestick pattern encoding | Full feature matrix with pandas-ta (20+ features), correlation matrix, multicollinearity analysis | Indicator behavior on live charts + Milestone 2 hypothesis lock |
| 7 | Backtesting & Strategy Logic | ⚠️ Memorial Day async — 7 rules of honest backtesting, look-ahead bias, walk-forward testing | First full Backtrader backtest (RSI mean reversion), QuantStats tear sheet, benchmark comparison | Backtest vs. live week comparison |
| 8 | AI Signals + Milestone 2 | FinBERT vs. VADER, LLM as signal source, NLP toolkit for finance, sentiment as a feature in the pipeline | FinBERT sentiment pipeline — batch analysis, daily aggregator, human vs. model rating comparison | **Milestone 2 Strategy Presentations** |

#### Concepts Covered — Month 2

**Statistical Foundations:**
- Null hypothesis (H₀) and alternative hypothesis (H₁)
- p-value interpretation — probability of observing data if H₀ is true
- Two-sample t-test (one-tailed) for signal validation
- Cohen's d for practical effect size
- Type I error (false positive) vs. Type II error (false miss)
- Multiple testing problem (Bonferroni correction framed)
- ADF (Augmented Dickey-Fuller) stationarity test
- Stationarity: prices non-stationary, returns stationary
- Autocorrelation: momentum (positive) vs. mean reversion (negative) implications
- Rolling statistics for regime-aware analysis
- Information Coefficient (IC) — Spearman rank correlation between signal and forward returns
  - IC > 0.05 = modest edge; IC > 0.10 = strong edge
- Rolling IC — detecting signal decay and regime sensitivity

**Technical Indicators (as quantifiable features, not chart-reading tools):**
- RSI (14) — raw value as a feature, not just binary threshold
- MACD (12,26,9) — histogram magnitude as the primary feature
- Bollinger Bands (20, 2σ) — %B as a normalized feature
- ATR (14) — volatility measure for position sizing and stop placement
- EMA/SMA (9, 20, 50, 200) — normalized distance from price to MA
- OBV — cumulative volume, divergence as institutional footprint signal
- VWAP — intraday fair value anchor (rolling proxy for daily data)
- Stochastic %K/%D — %K/%D crossover signals
- ADX — trend strength filter (> 25 = trending regime)
- Candlestick patterns encoded as binary features (doji, hammer, engulfing, morningstar)

**Feature Matrix Architecture:**
- Full `build_feature_matrix()` function: 20+ features per ticker per day
- Feature categories: returns, trend, momentum, volatility, volume, pattern
- Correlation matrix to detect multicollinearity
- Label construction: forward 5-day return direction (binary)
- Importance of never using forward-looking data (`shift(-N)`) as input features

**Backtesting:**
- Backtrader framework: cerebro, Strategy class, `__init__` vs. `next()`
- ATR-based position sizing: `risk_amt / (ATR × multiplier) = position size`
- Commission (0.1%) and slippage (0.1%) modeled in every backtest
- Analyzers: SharpeRatio, DrawDown, TradeAnalyzer, PyFolio
- QuantStats tear sheet with SPY benchmark comparison
- 7 rules of honest backtesting: look-ahead bias, overfitting, survivorship bias, transaction costs, walk-forward
- Walk-forward testing: train window → test window → slide forward → repeat

**AI & Sentiment:**
- Why AI expands the signal universe beyond price/volume
- VADER vs. FinBERT comparison — financial domain specificity matters
- ProsusAI/FinBERT: BERT pre-trained on Reuters, SEC filings, earnings transcripts
  - Three-class output: Positive, Negative, Neutral + confidence score
  - Numeric encoding: label × confidence → [-1, +1] range
- Daily sentiment aggregator: mean score, % positive, % negative per day, aligned with OHLCV
- LLM (GPT-4o-mini, Claude) for complex analysis — earnings call summarization, 10-K extraction
- LangChain pipeline concept for structured prompt → structured output

**Milestone 2 Presentation Rubric (6 sections):**
1. Hypothesis — specific, testable, causally motivated
2. Data & Features — what was used and why
3. Strategy Logic — entry, exit, position sizing
4. Results — Sharpe, MDD, win rate, benchmark comparison
5. What Could Go Wrong — overfitting risk, regime sensitivity
6. What I'd Do Differently — honest self-assessment with evidence

#### Month 2 Workshops

| Workshop | Notebook | Key Skills Built |
|---------|---------|-----------------|
| W05 | `W05_workshop_statistics` | ADF test, t-test for signal validation, Cohen's d, IC (Spearmanr), rolling 90-day IC visualization |
| W06 | `W06_workshop_features` | `build_feature_matrix()` with pandas-ta — all 10 indicators + candlestick patterns, correlation heatmap |
| W07 | `W07_workshop_backtest` | Full Backtrader strategy with ATR position sizing, analyzers, QuantStats HTML tear sheet |
| W08 | `W08_workshop_sentiment` | FinBERT batch analysis, label/score encoding, daily sentiment aggregator, human vs. model comparison |

#### Python Introduced — Month 2
`pandas_ta`, `scipy.stats`, `statsmodels.tsa.stattools`, `backtrader`, `quantstats`, `transformers` (HuggingFace), `torch`

---

### Month 3 — Paper Trading Phase I: Live Strategy Deployment
**Dates:** June 8 – July 4, 2026
**Weeks:** 9–12

#### Learning Objectives
- Execute paper trades on Webull using strategy rules without deviation
- Maintain a complete, honest trading journal for every trade
- Calculate and interpret live paper trading metrics: P&L, Sharpe, win rate, drawdown, benchmark
- Identify the psychological and behavioral differences between backtesting and live trading
- Explain position sizing in terms of portfolio risk % and ATR
- Recognize underperformance due to bad week vs. broken strategy
- Apply a structured weekly performance review process
- Use Webull Python SDK to query positions and order history programmatically
- Connect daily DMB observations to live paper trading decisions

#### Weekly Breakdown

| Week | Theme | Monday Theory | Wednesday Workshop | Friday Focus |
|------|-------|--------------|-------------------|-------------|
| 9 | Going Live | Paper trading psychology, the 3 dangerous emotions, 6 non-negotiable risk rules, journal discipline | First live paper trades on Webull + Python SDK connection | Week 1 trade review + journal audit |
| 10 | Position Sizing & Risk | Kelly Criterion, ATR-based position sizing, portfolio heat, correlation between positions | Position sizing calculator + risk dashboard notebook | Risk metrics on live positions |
| 11 | Reading Live Performance | P&L attribution (alpha vs. beta), strategy performance vs. market performance, regime detection | Portfolio analytics: trade summary, alpha/beta calculator, market regime classifier | Mid-month performance deep dive |
| 12 | Iteration & Adaptation | The adaptation decision framework — when to change, when to hold, when to acknowledge broken strategy | Strategy adjustment framework — adaptation decision tree, V1 vs. V1.1 comparison | ⚠️ Jul 3 low-volume session + Month 3 close |

#### The 6 Non-Negotiable Risk Rules

1. Never risk more than 1–2% of portfolio per trade (not position size — risk)
2. Define the stop BEFORE entry — written in journal before order placed
3. 5% daily portfolio drawdown = stop trading for the day
4. 10% total drawdown = reduce position size by 50%
5. No revenge trading — loss does not justify the next trade
6. No position without a defined exit rule

#### The Trading Journal (mandatory fields, every trade)
```
Date, Ticker, Entry Signal, Entry Price, Stop Level, Position Size, Risk $
Hypothesis, Basis, Target, Actual Exit, Exit Reason, P&L
Rule Adherence (Y/N), If N — why not, Rating 1–5, Notes for Review
```

#### Key Frameworks Introduced — Month 3
- Alpha vs. beta decomposition: `strategy_return = alpha + beta × market_return + epsilon`
- Market regime classifier: BULL_TRENDING / BULL_RANGING / HIGH_VOLATILITY / BEAR_TRENDING / TRANSITIONAL
- Adaptation decision framework: "Is this a bad week or a bad strategy?"
- Portfolio pulse: daily Webull account check becomes permanent DMB item

#### Month 3 Workshops

| Workshop | Notebook | Key Skills Built |
|---------|---------|-----------------|
| W09 | Live Webull session | `webull` Python SDK, paper order placement, position query |
| W10 | `W10_workshop_sizing` | Kelly Criterion implementation, ATR position calculator, risk dashboard |
| W11 | `W11_workshop_analytics` | Trade journal importer, alpha/beta calculator, `detect_market_regime()` function |
| W12 | `W12_workshop_adaptation` | Adaptation decision tree, `run_version_backtest()`, V1 vs. V1.1 OOS comparison |

#### Python Introduced — Month 3
`webull`, `statsmodels.api` (OLS regression for alpha/beta), regime classification logic

---

### Month 4 — Paper Trading Phase II: Iteration, Automation & Milestone 3
**Dates:** July 6 – August 1, 2026
**Weeks:** 13–16

#### Learning Objectives
- Build and run an automated signal alert pipeline monitoring market conditions
- Integrate FinBERT/LLM sentiment into a live daily workflow
- Manage an actively running paper portfolio across 3–5 concurrent positions
- Apply the Month 3 adaptation framework with live evidence
- Conduct a structured weekly performance review independently
- Present a complete 2-month paper trading record at Milestone 3
- Distinguish strategy underperformance due to regime mismatch vs. signal decay
- Use quantitative evidence (IC, rolling Sharpe, attribution) to support all strategy decisions

#### Weekly Breakdown

| Week | Theme | Monday Theory | Wednesday Workshop | Friday Focus |
|------|-------|--------------|-------------------|-------------|
| 13 | Automation Layer | The quant's operating model — pre-market pipeline, intraday monitoring, EOD summary. Signal generation pipeline (Stage 1: data, Stage 2: scoring, Stage 3: alert). ML signal vs. rules-based. | Build automated signal monitor — pipeline that runs on schedule and fires alerts | Live alerts vs. manual observation comparison |
| 14 | Multi-Position Management | Portfolio correlation (why uncorrelated positions matter), hedging concepts, portfolio heat management, drawdown across concurrent positions | Portfolio correlation notebook + multi-position dashboard | Full portfolio review + rebalance session |
| 15 | Strategy Evolution | Applying Month 3 adaptation decisions live — OOS comparison of original vs. adapted strategy, IC comparison across versions | Updated strategy backtest — V1 vs. V1.1 on out-of-sample data + IC comparison | Adapted vs. original strategy live performance |
| 16 | Milestone 3 Prep | Full synthesis — M3 review format walkthrough, journal audit framework, P&L attribution structure | Final journal audit workshop — complete data preparation for M3 | **Milestone 3: Paper Trading Mid-Review** |

#### Automated Trading Pipeline Architecture (built in Month 4)
```
8:00 AM pre-market:
  → Fetch prior day's OHLCV (yfinance / Alpaca)
  → Compute all indicators (pandas-ta)
  → Run sentiment scan on overnight news (FinBERT / NewsAPI)
  → Evaluate entry conditions for all watchlist tickers
  → Generate signal report: [ticker, signal, strength, direction]
  → Send alert if signal fires

9:00 AM DMB:
  → Review automated signal report
  → Validate against live pre-market data
  → Set limit order levels, calculate position size

Market hours (every 15 min):
  → Check stop loss levels
  → Check exit conditions
  → Alert if exit triggered

End of day:
  → Open positions + unrealized P&L
  → Signals missed today
  → Tomorrow's pre-market prep
```

#### Month 4 Workshops

| Workshop | Notebook | Key Skills Built |
|---------|---------|-----------------|
| W13 | Signal monitor | Automated pipeline with email/SMS alert on signal fire |
| W14 | Portfolio management | Multi-position correlation matrix, portfolio heat, hedging concepts |
| W15 | Strategy evolution | `run_version_backtest()` on OOS data, `compare_ic_versions()` |
| W16 | Journal audit | Complete M3 data package — full trade journal, performance attribution, strategy adherence analysis |

---

### Month 5 — Optimization, Deep AI & Capstone Strategy Design
**Dates:** August 3 – August 29, 2026
**Weeks:** 17–20

#### Learning Objectives
- Train, evaluate, and deploy an XGBoost classification model on a live financial feature matrix with proper time-series cross-validation
- Interpret XGBoost feature importance (SHAP values) to identify which signals drive model predictions
- Connect NewsAPI or Alpaca News to the FinBERT pipeline for live daily sentiment scoring
- Evaluate whether ML signal outperforms the rules-based signal using IC and Sharpe
- Architect a multi-signal strategy combining ML predictions, sentiment scores, and technical filters
- Design a complete capstone strategy specification: hypothesis, data sources, features, ML architecture, risk rules, success metrics
- Explain model degradation and describe a monitoring plan for retraining detection
- Apply all Month 5 tools within the live paper trading workflow

#### Weekly Breakdown

| Week | Theme | Monday Theory | Wednesday Workshop | Friday Focus |
|------|-------|--------------|-------------------|-------------|
| 17 | ML Signals | Why rules break and models learn. XGBoost: non-linear relationships, built-in feature importance, SHAP, time-series cross-validation architecture. | Train first XGBoost signal model on feature matrix — SHAP analysis, CV validation, OOS IC comparison vs. rules-based | ML signal vs. rules-based signal IC and Sharpe comparison |
| 18 | Live Sentiment | Live NewsAPI → FinBERT pipeline operational. Building a full daily sentiment feature for any ticker. Signal quality: IC of live sentiment vs. forward returns. | Full live sentiment + ML pipeline integration — wiring NewsAPI, FinBERT, and XGBoost into a single daily output | Combined signal audit on real week's market data |
| 19 | Multi-Signal Architecture | Scoring system architecture: weighted combination of technical + ML + sentiment. Veto logic (extreme sentiment overrides). IC comparison: individual vs. combined signal. Occam's Razor as quant discipline. | `compute_signal_score()` — composite scoring (W_TECH=0.35, W_ML=0.45, W_SENT=0.20) + backtest vs. individual signals | Combined strategy vs. individual signal comparison |
| 20 | Capstone Design | Capstone specification format. All Month 5 tools selected or ruled out. Success metrics defined. Risk rules locked. | Capstone design document workshop — full specification written | **Capstone hypothesis locked** + Month 5 close |

#### Multi-Signal Scoring Architecture (from W19)
```
SIGNAL 1 — Technical Rules:    weight 0.35
SIGNAL 2 — XGBoost ML prob:    weight 0.45
SIGNAL 3 — Sentiment (norm):   weight 0.20
─────────────────────────────────────────
Composite score: weighted sum
Veto: if sentiment < -0.40 → score = 0 (hard override)
Decision thresholds:
  score ≥ 0.60 → BUY
  score ≥ 0.45 → WATCH
  score < 0.45 → PASS
```

#### Month 5 Workshops

| Workshop | Notebook | Key Skills Built |
|---------|---------|-----------------|
| W17 | `W17_workshop_xgboost` | XGBoost training, time-series CV, SHAP feature importance, OOS IC comparison |
| W18 | `W18_workshop_sentiment_live` | NewsAPI → FinBERT → daily sentiment feature, full pipeline integration |
| W19 | `W19_workshop_multisignal` | `compute_signal_score()`, composite scoring, backtest comparison vs. individual signals |
| W20 | `W20_workshop_capstone_design` | Capstone specification document — 7-section strategy blueprint |

#### Python Introduced — Month 5
`xgboost`, `shap`, `newsapi-python` (live API calls), `sklearn.model_selection.TimeSeriesSplit`

---

### Month 6 — Capstone Execution, Final Analysis & Milestone 4
**Dates:** August 31 – September 26, 2026
**Weeks:** 21–24
**Note:** Labor Day September 7 (Week 22 Monday) — async package pre-built

#### Learning Objectives
- Execute locked capstone strategy for 4 consecutive weeks with complete journal documentation
- Produce full performance attribution report covering all 4 months of paper trading
- Write a 5–10 page quantitative strategy report meeting professional standards
- Present a 20-minute capstone strategy review with 10 minutes structured Q&A
- Identify and articulate the difference between strategy failure and execution failure
- Evaluate whether capstone strategy demonstrated genuine alpha or primarily beta-driven performance
- Describe a concrete 3-step improvement plan based on observed live performance

#### Weekly Breakdown

| Week | Theme | Monday Topic | Wednesday Workshop | Friday Focus |
|------|-------|-------------|-------------------|-------------|
| 21 | Capstone Launch | 5 execution standards + capstone report structure. Signal pipeline final configuration. | Signal pipeline locked + first capstone trades placed | First capstone week review — report Sec. 1 due |
| 22 | Deep Execution | ⚠️ Labor Day async. 4-month P&L attribution deep dive. | Full 4-month analytics notebook — complete attribution | Attribution deep dive + report Sec. 2–3 due |
| 23 | Analysis + Writing | Capstone findings analysis — all 4 months synthesized. | Report Sec. 3–5 workshop | Draft review + strategy comparison across class |
| 24 | Presentation + Finale | Final prep + report close. Rehearsal. | Rehearsal workshop — full dry run | **Milestone 4: Capstone Presentations** |

#### Capstone Report Structure (7 Sections)

| Section | Content | Draft Deadline |
|---------|---------|---------------|
| 1 — Executive Summary | One page: hypothesis, key finding, conclusion | Week 21 Friday |
| 2 — Strategy Design | Architecture, features, signals, risk framework | Week 22 Wednesday |
| 3 — Methodology | Backtesting approach, data sources, validation methodology | Week 22 Friday |
| 4 — Live Results | Month 6 paper trading performance + full attribution | Week 23 Monday |
| 5 — AI Integration | How ML and sentiment contributed (or didn't) — with IC evidence | Week 23 Wednesday |
| 6 — Limitations & Failure Modes | Honest analysis of what broke or underperformed — required for top mark | Week 23 Friday |
| 7 — Forward Plan | 3-step improvement roadmap grounded in evidence from Months 3–6 | Week 24 Monday |

**Final report:** All 7 sections integrated and polished — due Week 24 Wednesday

#### Month 6 Workshops

| Workshop | Notebook | Key Skills Built |
|---------|---------|-----------------|
| W21 | Pipeline config + first capstone trade | Final signal pipeline configuration |
| W22 | `W22_workshop_analytics` | Full 4-month analytics notebook — complete P&L attribution |
| W23 | Report writing workshop | Sections 3–5 drafting with evidence from data |
| W24 | Rehearsal workshop | Full dry-run presentation + peer Q&A |

---

## Complete Python Stack (All 6 Months)

| Library | Purpose | Introduced |
|---------|---------|-----------|
| `yfinance` | Primary OHLCV data source (free, daily) | Month 1 |
| `pandas` | Data manipulation, time series | Month 1 |
| `numpy` | Numerical computation | Month 1 |
| `matplotlib` | Visualization | Month 1 |
| `pandas_ta` | Technical indicator computation (RSI, MACD, BB, ATR, ADX, OBV, Stochastic, EMA/SMA, candlestick patterns) | Month 2 |
| `scipy.stats` | t-tests, Spearman correlation (IC) | Month 2 |
| `statsmodels` | ADF test, OLS regression (alpha/beta) | Month 2 |
| `backtrader` | Rules-based backtesting framework | Month 2 |
| `quantstats` | Performance tear sheet vs. benchmark | Month 2 |
| `transformers` | FinBERT (ProsusAI/finbert) sentiment analysis | Month 2 |
| `torch` | GPU inference backend for FinBERT | Month 2 |
| `webull` | Paper trading broker SDK | Month 3 |
| `xgboost` | ML signal generation | Month 5 |
| `shap` | Feature importance / model interpretability | Month 5 |
| `newsapi-python` | Live financial news headlines (NewsApiClient) | Month 5 |
| `sklearn` | TimeSeriesSplit, preprocessing | Month 5 |
| `pickle` | Model serialization (.pkl) | Month 5 |
| `python-dotenv` | Environment variable management | All months |

---

## Core Analytical Frameworks Built Across the Course

### 1. The FINN Quant Workflow (9 Steps — Month 1)
A systematic, iterative pipeline: Hypothesis → Data → Features → Statistical Test → Model → Backtest → Risk → Paper Trade → Review

### 2. The Feature Matrix Architecture (Month 2)
A standardized daily DataFrame with 20+ engineered features per ticker per day: returns, trend indicators, momentum indicators, volatility indicators, volume indicators, candlestick pattern flags, forward return labels.

### 3. IC-First Signal Validation (Month 2)
Before building any strategy, validate the signal: ADF test → t-test → IC → rolling IC. If IC < 0.05 and p > 0.05, kill the signal. No exceptions.

### 4. Walk-Forward Backtesting (Month 2)
Training window → test window → slide forward → repeat. Never evaluate a model on data used to build it. In-sample Sharpe means nothing without out-of-sample confirmation.

### 5. The 6 Risk Rules + ATR Position Sizing (Month 3)
Non-negotiable framework for every paper trade: risk ≤ 2% per trade, pre-defined stop, daily 5% hard stop, 10% total drawdown = size reduction. Position size = `risk_$` / (`ATR × multiplier`).

### 6. P&L Attribution Framework (Month 3)
Decompose portfolio return into alpha (skill), beta (market exposure), and residual (noise). A strategy that beats SPY only because SPY went up is not alpha — it's leveraged beta.

### 7. Market Regime Classifier (Month 3)
Five regimes: BULL_TRENDING / BULL_RANGING / HIGH_VOLATILITY / BEAR_TRENDING / TRANSITIONAL. Different strategy types are appropriate for different regimes. Regime detection is a prerequisite for strategy deployment.

### 8. The Adaptation Decision Framework (Month 3–4)
When live performance deviates from backtest expectations: is this a bad week (normal variance), regime mismatch (expected), or broken signal (requires adaptation)? The decision must be made with quantitative evidence — minimum 20 trades before any parameter change.

### 9. Automated Signal Pipeline (Month 4)
Pre-market pipeline that automatically fetches data, computes features, runs sentiment, evaluates entry conditions, and fires alerts. Removes human emotion from signal detection.

### 10. Multi-Signal Scoring Architecture (Month 5)
Composite score from three independent signal types: technical rules (0.35 weight), XGBoost ML probability (0.45 weight), FinBERT sentiment (0.20 weight). Hard veto on extreme negative sentiment. Decision thresholds: BUY ≥ 0.60, WATCH ≥ 0.45.

---

## Hypothesis-as-Trade Intellectual Framework

Every trade in FINN is a hypothesis. The journal captures the reasoning pre-outcome.

**Not acceptable:** "I bought AAPL because it looked cheap."
**Acceptable:** "RSI_14 = 27.3 (below entry threshold 30). Close $0.3% below EMA_20 (within tolerance). Vol_Ratio = 1.6 (below 2.5 threshold). ADX = 29 (above 25 — trending regime). ML probability = 0.67 (above 0.60 threshold). Sentiment score = +0.12 (positive, not veto territory). Composite score: 0.64 → BUY signal. Entry $186.40. Stop $183.80 (ATR × 1.5). Size 12 shares ($31.20 risk = 1.9% of portfolio). Hypothesis: composite signal predicts positive 5-day forward return above SPY in current bull trending regime."

This discipline — applying specific numbers to every decision — is the core behavioral change the course is designed to produce.

---

## Assessment Philosophy

FINN measures success by process quality, not P&L. A student who underperforms SPY every month but maintains rigorous documentation, honest attribution, disciplined risk management, and clear understanding of why — has met the standard.

**Highest grade (M4):** Presents a report that:
- States hypothesis clearly with causal mechanism
- Shows honest IC/statistical validation
- Documents every limitation
- Compares to benchmark
- Explains exactly what failed and why
- Proposes specific, evidence-backed improvements

**Lowest grade:** A report that claims the strategy worked perfectly with no limitations.

---

## Holiday Schedule / Async Packages
- **May 25, 2026** — Memorial Day: Week 7 Monday async (backtesting theory)
- **July 4, 2026** — Independence Day: Saturday in 2026 — low-impact. July 3 (Friday) is a low-volume market session.
- **September 7, 2026** — Labor Day: Week 22 Monday async (built into Month 6)

---

*Generated: May 8, 2026*
*Source files: `FINN_Month01.md`, `FINN_Month02.md`, `FINN_Month03.md`, `FINN_Month04.md`, `FINN_Month05.md`, `FINN_Month06.md`*
*Use: Compare against Udemy competitor curriculum (`udemy_curriculum_context.md`) to identify coverage gaps, sequence decisions, and competitive positioning.*
