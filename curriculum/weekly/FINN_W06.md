# FINN — Week 6: Technical Indicators as Data Features
## Quant Methods Phase | Month 2: Quant Methods, AI Integration & Strategy Development
**Dates:** May 18–23, 2026
**Week Number:** 6 of 24

---

## WEEK OVERVIEW

### Theme
Indicators are not crystal balls. They are engineered features. Test them like data, not like prophecy. This week reframes every technical indicator from "trading signal" to "feature in a machine-readable feature matrix." Students build the foundation of all future ML and backtesting work.

### Learning Objectives
By the end of this week, students will be able to:
- Name and describe all 10 core technical indicators with their mathematical basis and trading interpretation
- Explain the difference between using RSI as a chart-reading tool vs. as a feature in a quantitative model
- Explain ATR and its use for position sizing and stop placement
- Build a complete feature matrix with `pandas-ta` containing 20+ features from raw OHLCV data
- Run a feature correlation matrix and identify highly correlated (redundant) features
- Explain multicollinearity and why using correlated features in an ML model is problematic
- Lock their Milestone 2 strategy hypothesis (due Friday this week)

### Materials Needed
- `finnenv` environment — `yfinance`, `pandas`, `numpy`, `matplotlib`, `pandas_ta` installed
- GitHub repo — starter notebook `W06_workshop_features_starter.ipynb`
- TradingView — RSI, MACD, Bollinger Bands, Volume added to charts for DMB observation
- Hypothesis log — Milestone 2 strategy hypothesis due by Friday midnight

### Pre-Week Checklist (Instructor)
- [ ] Push `W06_workshop_features_starter.ipynb` to GitHub before Wednesday
- [ ] Verify `pandas_ta` is in every student's `finnenv`
- [ ] Assign DMB rotation for Monday, Wednesday, Friday
- [ ] Prepare `W07_async_monday_package` for distribution at Friday's session (Memorial Day next week)
- [ ] Note: Every student must have Milestone 2 strategy hypothesis submitted by Friday midnight
- [ ] Prepare calibration examples for Milestone 2 hypothesis review (Friday Block 3)

---

## MONDAY — May 18, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Pull up any stock on TradingView and add RSI (14) and MACD (12,26,9) to the chart. Find one moment in the last 3 months where RSI was below 30 AND MACD had a bullish crossover at the same time. Write down the date and what the stock did in the following 5 days. Bring it tonight."

---

### EVENING: Theory Session (8:00–9:30 PM EST)
**Topic:** Technical Indicators as Quantifiable Features — Not Chart Reading
**Curriculum Source:** Wiki Sections 5.1, 5.2

#### Pre-Session Setup
- [ ] Wiki Section 5.1 read — all 10 indicators, definitions and signal use
- [ ] Wiki Section 5.2 read — candlestick pattern encoding table
- [ ] TradingView observation from DMB logged
- [ ] Week 5 workshop notebook reviewed

#### Block 1 — Day Review & Reading Check (8:00–8:15 PM) | 15 min

"Who found a confluence of RSI < 30 and bullish MACD crossover on TradingView today? What happened in the following 5 days? Did the stock go up?

And here's the follow-up question: Is one example meaningful? How many instances would we need before we could trust a pattern?"

Cold-call reading check:
- "Name 5 technical indicators from the reading. What type is each one — momentum, trend, volatility?"
- "What is ATR and why is it in the volatility category?"
- "What does VWAP stand for and why do institutions use it?"

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 min

**Topic A: Reframing Indicators — From Art to Feature Engineering (10 min)**

"Traditional technical analysis says: 'RSI below 30 means oversold — buy.' We say: 'RSI below 30 is a binary feature in our feature matrix. It may or may not predict positive forward returns. Test it.'

The difference is not the tool — it's the mindset. Every indicator in this room is a data transformation that may or may not contain signal. Your job is to test whether it does, quantify how much, and combine the strong signals into a model.

We are not chart readers. We are feature engineers."

**Topic B: The 10 Core Indicators — Deep Walk (30 min)**

Walk through Wiki Section 5.1 indicator table. For each indicator, cover three things: what it calculates, how it behaves, and how we use it as a feature.

- **RSI (14):**
"RSI = 100 - [100/(1 + RS)] where RS = avg gain / avg loss over 14 periods. Ranges 0–100. Below 30 = historically oversold. Above 70 = historically overbought. As a feature: the raw RSI value, not just the binary threshold. A model might find that RSI = 25 predicts differently from RSI = 29.
Feature usage: `df['RSI'] = ta.rsi(df['Close'], length=14)`"

- **MACD (12, 26, 9):**
"MACD = EMA(12) - EMA(26). Signal line = EMA(9) of MACD. Histogram = MACD - Signal. The crossover (MACD crosses above Signal) is the traditional signal. As a feature: use the histogram value (magnitude of divergence), not just the crossover binary.
Feature usage: `macd = ta.macd(df['Close']); df = df.join(macd)`"

- **Bollinger Bands (20, 2σ):**
"Middle band = 20-day SMA. Upper/lower = ±2 standard deviations. When price touches the lower band, it has moved 2σ below average — statistically extreme. %B = (Close - Lower Band) / (Upper Band - Lower Band). %B < 0 = below lower band.
Feature usage: `df['%B'] = ta.bbands(df['Close'])['BBP_20_2.0']`"

- **ATR (14):**
"Average True Range = average of max(High-Low, |High-PrevClose|, |Low-PrevClose|) over 14 days. Pure volatility measure — no directional component. Used for:
1. Position sizing: risk per share = ATR × multiplier
2. Stop placement: stop = entry - (ATR × 1.5)
3. Volatility filter: only trade when ATR is above/below threshold
Feature usage: `df['ATR'] = ta.atr(df['High'], df['Low'], df['Close'], length=14)`"

- **EMA/SMA (20, 50, 200):**
"SMA = simple average. EMA = weighted average emphasizing recent prices. 200-day SMA = the long-term trend filter used by institutional traders. Price above 200 SMA = bull regime. Price below = bear regime.
Feature usage: `df['EMA_20'] = ta.ema(df['Close'], length=20)`"

- **Volume and OBV:**
"OBV = cumulative sum of volume, adding on up days and subtracting on down days. OBV divergence: price makes a new high but OBV doesn't = distribution (smart money selling).
Feature usage: `df['OBV'] = ta.obv(df['Close'], df['Volume'])`"

> **Resource:** Volume reading guide — OBV, volume breakout patterns, climactic volume, and reversal signals — the visual interpretation layer for the OBV feature built in this section → `resources/infographics/ig_volume_analysis.html` + `resources/handbook/FINN_HB_P6_MarketReference.md` §6.2

- **VWAP:**
"Volume-Weighted Average Price = sum(price × volume) / sum(volume) for the session. VWAP resets daily — it's an intraday indicator. Institutions use it as a fair value anchor. Price above VWAP = bullish intraday bias. Below = bearish bias. For daily data, we compute a rolling approximation. True VWAP requires intraday data."

- **Stochastic, ADX (brief):**
"Stochastic %K/%D: close relative to high-low range over 14 periods. Crossover signals. ADX: trend strength 0–100 — above 25 = strong trend present (no direction info). Feature: use ADX as a regime filter — only apply trend-following signals when ADX > 25."

**Topic C: Candlestick Patterns as Binary Features (5 min)**

"Candlestick patterns are encoded as 1 or 0 in the feature matrix. `pandas-ta` provides `cdl_pattern()` which computes these automatically. As features, they add pattern-based signal to the numeric indicators."

> **Resource:** Chart pattern visual library — continuation patterns (flag, pennant, triangle, wedge) and reversal patterns (H&S, double top/bottom, cup & handle); Heikin Ashi for trend-smoothed signal validation — the visual basis for the binary pattern features encoded with `cdl_pattern()` → `resources/infographics/ig_chart_patterns_continuation.html` + `resources/infographics/ig_chart_patterns_reversal.html` + `resources/infographics/ig_heikin_ashi.html` + `resources/handbook/FINN_HB_P2_ChartReading.md` §2.4–2.5 & 2.7

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 min

1. "We have RSI, MACD, Bollinger Bands, ATR, and 3 EMAs as features. What's wrong with just throwing all of them into an ML model together? What problem does that create?"
   *(Expected: Multicollinearity — many indicators are derived from the same price series and are highly correlated. Adding correlated features doesn't add information, it adds noise. Feature selection matters.)*

2. "ATR tells you nothing about direction. Is it useful in a model that's trying to predict whether to go long or short? Why or why not?"
   *(Expected: Yes — as a regime or sizing input, not a directional signal. Low ATR regime → mean reversion strategies work better. High ATR regime → trend following works better.)*

3. "Devil's advocate: Every indicator is just a mathematical transformation of price and volume. Since they're all derived from the same underlying data, can they ever provide truly independent signals?"
   *(Expected: They can't be completely independent. But different transformations can emphasize different aspects: momentum vs. volatility vs. trend. The combination can be more predictive than any one alone.)*

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 min

**Wednesday workshop:**
"We build the feature matrix. Starter notebook: `W06_workshop_features_starter.ipynb`. We'll add all 10 indicators to a DataFrame and encode candlestick patterns. By the end, you'll have a production-ready feature matrix for 3 tickers."

**Pre-reading:**
- Wiki Section 7.1 — Backtesting best practices (read before next week)
- Wiki Section 7.2 — Backtesting tools comparison
- Wiki Section 4.3 — Code Pattern 3 (Backtrader)

**Milestone 2 notice:** Two weeks from now. Students should be deciding what signal or hypothesis they want to backtest. By Friday this week, every student should have their Milestone 2 strategy hypothesis written.

**Monday Deliverable:** Reading Notes + 3 Hypotheses by 11:59 PM

---

## WEDNESDAY — May 20, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**Observation Assignment:** "Pull up SPY on TradingView. Add: RSI(14), MACD(12,26,9), Bollinger Bands(20,2), and volume bars. Look at the last two weeks of price action. Find one moment where at least 3 of these indicators gave a signal simultaneously. Write down the date and what happened. Bring it tonight."

---

### EVENING: Workshop Session (8:00–9:30 PM EST)
**Workshop:** W6 — Building a Complete Feature Matrix with pandas-ta
**Notebook:** `W06_workshop_features_[initials].ipynb`
**Curriculum Source:** Wiki Sections 5.1, 5.2, Code Pattern 2

#### Pre-Session Setup
- [ ] `finnenv` running with `pandas_ta` verified
- [ ] Starter notebook pulled from GitHub
- [ ] TradingView observation from DMB morning noted

#### Block 1 — Framing (8:00–8:10 PM) | 10 min

"Monday we understood what each indicator measures. Tonight we build the feature matrix — the structured table that a machine learning model or a rules-based strategy will consume.

Think of the feature matrix as the translated version of raw price data. Each row is a trading day. Each column is a quantified signal. When we're done tonight, we'll have a DataFrame with 20+ features per day for 3 tickers — and it will be reusable for any ticker, any time period.

This is the engineering work that sits between data and strategy."

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 min

```python
import yfinance as yf
import pandas as pd
import numpy as np
import pandas_ta as ta
import matplotlib.pyplot as plt

def build_feature_matrix(ticker, period="3y", interval="1d"):
    """
    Build a complete feature matrix for a given ticker.
    Returns a DataFrame with price data + all engineered features.
    """
    # --- DATA ACQUISITION ---
    df = yf.download(ticker, period=period, interval=interval)
    df.columns = [c[0] if isinstance(c, tuple) else c for c in df.columns]
    df.dropna(inplace=True)
    print(f"Fetched {len(df)} rows for {ticker}")

    # --- RETURNS ---
    df['Return']       = df['Close'].pct_change()
    df['Return_5d']    = df['Close'].pct_change(5)
    df['Return_20d']   = df['Close'].pct_change(20)
    df['Log_Return']   = np.log(df['Close'] / df['Close'].shift(1))

    # --- TREND FEATURES ---
    df['EMA_9']        = ta.ema(df['Close'], length=9)
    df['EMA_20']       = ta.ema(df['Close'], length=20)
    df['EMA_50']       = ta.ema(df['Close'], length=50)
    df['SMA_200']      = ta.sma(df['Close'], length=200)

    # Price relative to moving averages (normalized)
    df['Close_vs_EMA20']  = (df['Close'] - df['EMA_20']) / df['EMA_20']
    df['Close_vs_SMA200'] = (df['Close'] - df['SMA_200']) / df['SMA_200']
    df['EMA20_vs_EMA50']  = (df['EMA_20'] - df['EMA_50']) / df['EMA_50']

    # --- MOMENTUM FEATURES ---
    df['RSI_14']       = ta.rsi(df['Close'], length=14)
    df['RSI_7']        = ta.rsi(df['Close'], length=7)

    macd_df = ta.macd(df['Close'], fast=12, slow=26, signal=9)
    df['MACD']         = macd_df['MACD_12_26_9']
    df['MACD_Signal']  = macd_df['MACDs_12_26_9']
    df['MACD_Hist']    = macd_df['MACDh_12_26_9']
    df['MACD_Cross']   = (df['MACD'] > df['MACD_Signal']).astype(int)

    stoch_df = ta.stoch(df['High'], df['Low'], df['Close'])
    df['Stoch_K']      = stoch_df['STOCHk_14_3_3']
    df['Stoch_D']      = stoch_df['STOCHd_14_3_3']

    # --- VOLATILITY FEATURES ---
    df['ATR_14']       = ta.atr(df['High'], df['Low'], df['Close'], length=14)
    df['ATR_Norm']     = df['ATR_14'] / df['Close']  # Normalized ATR

    bb_df = ta.bbands(df['Close'], length=20, std=2)
    df['BB_Upper']     = bb_df['BBU_20_2.0']
    df['BB_Lower']     = bb_df['BBL_20_2.0']
    df['BB_Pct']       = bb_df['BBP_20_2.0']   # %B: 0=lower band, 1=upper band
    df['BB_Width']     = (df['BB_Upper'] - df['BB_Lower']) / df['Close']

    df['Vol_20d']      = df['Return'].rolling(20).std() * np.sqrt(252)
    df['HL_Range_Pct'] = (df['High'] - df['Low']) / df['Close']

    # --- VOLUME FEATURES ---
    df['OBV']          = ta.obv(df['Close'], df['Volume'])
    df['OBV_Change']   = df['OBV'].pct_change(5)
    df['Vol_Ratio']    = df['Volume'] / df['Volume'].rolling(20).mean()

    # ADX (trend strength)
    adx_df = ta.adx(df['High'], df['Low'], df['Close'], length=14)
    df['ADX']          = adx_df['ADX_14']

    # --- CANDLESTICK PATTERN FEATURES ---
    cdl = ta.cdl_pattern(df['Open'], df['High'], df['Low'], df['Close'],
                          name=['doji', 'hammer', 'engulfing', 'morningstar'])
    df = pd.concat([df, cdl], axis=1)

    # --- LABEL (for ML — forward 5-day return positive?) ---
    df['Label']        = (df['Close'].pct_change(5).shift(-5) > 0).astype(int)

    df.dropna(inplace=True)
    print(f"Feature matrix shape: {df.shape}")
    print(f"Features: {[c for c in df.columns if c not in ['Open','High','Low','Close','Volume']]}")
    return df
```
*Pause: "Note what we're doing with the label: shift(-5) gives us the future 5-day return. This is only for research purposes — computing what will happen after the signal. In a live model, the label is never available. We train on past data, predict on new data."*

```python
# Build feature matrices for 3 tickers
tickers = ['SPY', 'QQQ', 'AAPL']
feature_matrices = {}

for t in tickers:
    feature_matrices[t] = build_feature_matrix(t, period="3y")
    print(f"\n{t}: {feature_matrices[t].shape[0]} rows, "
          f"{feature_matrices[t].shape[1]} features\n{'─'*40}")

# Inspect the SPY feature matrix
spy_fm = feature_matrices['SPY']
print("\nFeature matrix sample (last 5 rows, key columns):")
key_cols = ['Close', 'RSI_14', 'MACD_Hist', 'ATR_Norm', 'BB_Pct', 'Vol_Ratio', 'ADX', 'Label']
print(spy_fm[key_cols].tail())
```

**Step 2 — Feature correlation analysis (8 min)**
```python
# Check for multicollinearity — are features redundant?
feature_cols = ['RSI_14', 'RSI_7', 'MACD_Hist', 'MACD_Cross',
                'BB_Pct', 'ATR_Norm', 'Vol_Ratio', 'ADX',
                'Close_vs_EMA20', 'EMA20_vs_EMA50']

corr_matrix = spy_fm[feature_cols].corr()

plt.figure(figsize=(10, 8))
im = plt.imshow(corr_matrix, cmap='RdYlGn', vmin=-1, vmax=1, aspect='auto')
plt.colorbar(im)
plt.xticks(range(len(feature_cols)), feature_cols, rotation=45, ha='right')
plt.yticks(range(len(feature_cols)), feature_cols)
plt.title('Feature Correlation Matrix — SPY', fontsize=13)
plt.tight_layout()
plt.show()

# Flag highly correlated feature pairs
print("\nHighly correlated feature pairs (|r| > 0.7):")
for i in range(len(feature_cols)):
    for j in range(i+1, len(feature_cols)):
        r = corr_matrix.iloc[i, j]
        if abs(r) > 0.7:
            print(f"  {feature_cols[i]} & {feature_cols[j]}: r = {r:.3f}")
```

#### Block 3 — Independent Work (8:50–9:15 PM) | 25 min

**Core Exercise:**
Run `build_feature_matrix()` on 2 tickers of your choice (not SPY/QQQ/AAPL). Then answer in markdown:
1. How many NaN rows were dropped? Why do they appear?
2. Which feature pair has the highest correlation in your tickers?
3. Look at the `Label` column distribution — what % of days are labeled 1 (positive)?
4. Find one week in your data where RSI < 30 AND BB_Pct < 0.1 simultaneously. What was the actual 5-day forward return that week?

**Extension Challenge:**
Add 3 more features of your own design to `build_feature_matrix()`:
1. A momentum feature: the 10-day minus 30-day return spread
2. A gap feature: (Open - prior Close) / prior Close
3. A volume trend: OBV vs. 20-day OBV moving average

Check whether they are correlated with existing features.

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 min

**Share-out:** Walk through the correlation matrix results. "Which indicators are nearly redundant? What does that tell us about using them together?"

**Muddiest Point:**
> *"The muddiest point from tonight was ___."*

**Milestone 2 reminder:** "By Friday this week, every student must have their Milestone 2 hypothesis written and submitted to the hypothesis log. The hypothesis is the strategy you will backtest."

**Wednesday Deliverable:** Completed notebook `W06_workshop_features_[initials].ipynb` submitted to GitHub by 11:59 PM

---

## FRIDAY — May 22, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation

**IMPORTANT NOTE TO INSTRUCTOR:** This is the last regular Friday before Memorial Day weekend. Distribute the Week 7 Monday Async Package at the end of today's DMB. Announce: "Monday May 25 is Memorial Day. The Monday evening class is cancelled. Your async package for Monday is in the GitHub repo. Complete it by Tuesday. Wednesday class runs as normal."

---

### EVENING: Review & Market Session (8:00–9:30 PM EST)

#### Pre-Session Setup
- [ ] `W07_async_monday_package.md` ready to distribute (push to GitHub before class)
- [ ] Hypothesis log ready — all Week 6 hypotheses for audit
- [ ] TradingView with SPY daily loaded + RSI, MACD, Bollinger Bands indicators added

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 min

1. "What is the difference between using RSI as a chart-reading tool versus using it as a feature in a quantitative model? What changes about how you interpret it?"

2. "What is ATR measuring? Give me a concrete example of how you'd use it for position sizing."

3. "In Wednesday's notebook, we computed a feature correlation matrix. RSI_14 and RSI_7 were highly correlated. What are the implications of using both as features in the same model?"

4. "What does BB_Pct = 0 mean? What does BB_Pct = 1 mean? Which would typically signal a mean-reversion buy opportunity?"

5. "What is ADX telling you that RSI and MACD cannot tell you?"

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 min

**Hypothesis Audit:** Close Week 6 hypotheses.

**Chart Review — Indicators on Live Charts:**
Open TradingView. Add RSI, MACD, Bollinger Bands, and volume to SPY.

Walk through this week's price action:
- "Was RSI overbought or oversold at any point this week?"
- "Did MACD cross during the week? Was it a meaningful move or noise?"
- "Did price touch a Bollinger Band? What happened after?"
- "Were there any high-volume days? What caused them?"

Pull up one student's watchlist ticker: "If you had our full feature matrix running on this ticker this week, what signals would it have flagged? Let's read the indicator states together."

> **Resource:** Chart reading frameworks for live analysis — Fibonacci retracements (key S/R levels and how to draw them) and multi-timeframe top-down framework (daily → 4hr → 1hr → 15min) for contextualizing the indicator states observed in Friday review → `resources/infographics/ig_fibonacci.html` + `resources/infographics/ig_mtf_analysis.html` + `resources/handbook/FINN_HB_P6_MarketReference.md` §6.1 & §6.3

**Sector Rotation:** Standard Finviz heatmap review.

#### Block 3 — Milestone 2 Strategy Lock (9:05–9:20 PM) | 15 min

**Every student must submit their Milestone 2 hypothesis tonight.**

"Your Milestone 2 strategy hypothesis must answer:
1. What is the edge I am trying to capture? (Momentum? Mean reversion? Sentiment?)
2. What specific signal(s) will trigger entry?
3. What is the exit rule?
4. What universe of stocks and what time period?

Format it using the hypothesis log template. Submit before midnight tonight."

Walk through 2–3 student examples to calibrate:
- Too vague: "I'll buy when RSI is low" — Not acceptable
- Specific enough: "Buy SPY when RSI_14 < 30 AND Close > EMA_20 on daily close, hold for 5 days, exit at market on day 5" — Acceptable

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 min

**Memorial Day reminder:** Monday May 25 class cancelled. Async package distributed now.

**Distribute async package:** Push `W07_async_monday_package.md` and announce it's in GitHub. Completion due: Tuesday May 26 by 11:59 PM.

**Next week structure:**
- Monday: ASYNC — Backtrader theory and backtesting best practices
- Wednesday: First full Backtrader session — backtest a live strategy
- Friday: Review backtest results against this week's actual market behavior

**Assign reading (for async AND for Wednesday prep):**
- Wiki Section 7.1 — Backtesting best practices (all 7 rules)
- Wiki Section 7.2 — Tools comparison
- Wiki Section 4.3 — Code Pattern 3 (Backtrader template)

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

## WEEKLY DELIVERABLES SUMMARY

| Deliverable | Due | Format |
|-------------|-----|--------|
| Reading Notes + 3 Hypotheses | Monday 11:59 PM | Markdown in hypothesis log |
| Workshop Notebook (W06) | Wednesday 11:59 PM | `.ipynb` pushed to GitHub |
| **Milestone 2 Strategy Hypothesis** | **Friday 11:59 PM** | **Hypothesis log** |
| Weekly Review Log | Friday 11:59 PM | Markdown |
| Hypothesis Outcome Record | Friday 11:59 PM | Appended to hypothesis log |

---

## INSTRUCTOR NOTES FOR WEEK 6

**The mindset shift is the core of this week:** More important than any code or any indicator is the reframe: "Indicators are features, not signals." Students who internalize this think differently about every tool they use for the rest of the course. Students who don't will keep treating a MACD crossover as a sacred trigger rather than a testable hypothesis.

**`pandas-ta` common issues:** The library outputs column names like `MACD_12_26_9` and `MACDs_12_26_9` — these are not obvious. Walk through the column naming explicitly. A common confusion: students try `df['MACD']` before assigning it from `ta.macd()` output. Make the two-step process explicit.

**Feature matrix NaN rows:** When students ask "why are there so many NaN rows?", explain that the 200-day SMA needs 200 rows before it can compute. All the indicators with long look-back periods create leading NaNs. `dropna()` removes them. "This is the cost of using long look-back indicators — you lose the first N rows of history."

**Milestone 2 hypothesis quality review:** The calibration examples on Friday are critical. "I'll buy when RSI is low" produces a terrible backtest with arbitrary parameters and no clear falsifiability. "Buy SPY when RSI_14 < 30 AND Close > EMA_20, hold 5 days" is testable, reproducible, and specific. Push every student toward the latter.

**Async package delivery:** Have the `W07_async_monday_package.md` ready to push to GitHub at the end of Friday's class. Confirm every student knows where to find it. The Memorial Day disruption is expected — don't let it catch anyone off guard.

---

## WEEKLY RESOURCES

> Resources are labeled **[Pre-session]** (review before class) or **[Homework]** (explore after). FINN covers every concept live — these are your scaffolding, not your syllabus.

---

### Monday — Technical Indicators as Quantitative Features

- **[Article | Pre-session]** [Candlestick, RSI, Bollinger Bands, and MACD with Python](https://medium.com/@armand_aguilar/candlestick-rsi-bollinger-bands-and-macd-with-python-ba7ddaef0525) — Medium / Armando Aguilar. Builds and visualizes RSI, Bollinger Bands, and MACD in Python from scratch alongside candlestick charts. Read before Monday — the code is approachable and gives you the visual intuition we build on in class.

- **[Article | Pre-session]** [pandas-ta on PyPI](https://pypi.org/project/pandas-ta/) — PyPI. The official package page for `pandas-ta` — the library we use all of Month 2 for feature engineering. Check the version, see the indicator list, and run `pip show pandas-ta` to confirm you have it installed before Wednesday.

- **[Article | Homework]** [pandas-ta GitHub Repository](https://github.com/twopirllc/pandas-ta) — twopirllc / GitHub. The source and full documentation for `pandas-ta`. Specifically: look at the "Strategy" section and the indicator list. Understanding how to run a batch of indicators in one call is what makes Wednesday's feature matrix workshop fast.

- **[YouTube | Pre-session]** Search YouTube for: *"RSI MACD Bollinger Bands explained quant feature engineering 2022 2023"* — look for a video that treats these indicators as data inputs rather than trading rules. The framing matters: you want "RSI is a momentum feature" not "RSI tells you when to buy." Target: 15–25 min. Channels worth checking: **QuantPy**, **Coding Finance**, **NeuralNine**.

---

### Wednesday — Building the Feature Matrix with pandas-ta

- **[Article | Pre-session]** [Technical Analysis Library in Python — Documentation](https://technical-analysis-library-in-python.readthedocs.io/en/latest/ta.html) — ReadTheDocs. Full API reference for the `ta` library (companion to `pandas-ta`). Useful if you want to understand what each indicator calculates under the hood — especially ATR and VWAP which have less intuitive formulas.

- **[Article | Homework]** [Stock Investment Analysis with Python: Technical Analysis with yfinance × pandas × pandas-ta](https://tasukehub.com/articles/python-stock-analysis-yfinance-guide) — Tasuke Hub. End-to-end walkthrough that starts from yfinance data and builds a full feature matrix with `pandas-ta`. Mirrors the Wednesday workshop closely. Good reference if you get stuck on indicator syntax.

- **[YouTube | Homework]** Search YouTube for: *"pandas-ta feature matrix python tutorial 2023"* — look for a notebook-based tutorial that adds 10+ indicators to a DataFrame in a single workflow. The goal is seeing the `.ta.strategy()` pattern used to generate many indicators at once.

---

### Friday — Indicator Behavior on Live Charts & Milestone 2 Hypothesis Lock

- **[Article | Pre-session]** [Python: Buy/Sell Signals Using SMA, MACD, Bollinger](https://tradewithpython.com/generating-buy-sell-signals-using-python) — TradeWithPython. Shows how indicator crossovers are coded as entry/exit signals — exactly the logic you'll need for Milestone 2. Read this before Friday's session when we calibrate your Milestone 2 hypothesis.

- **[Article | Homework]** [Analyzing Market Microstructure with Python](https://www.pyquantnews.com/free-python-resources/analyzing-market-microstructure-with-python) — PyQuant News. Goes beyond individual indicators into feature-level analysis of market behavior. Good extension reading as you refine your Milestone 2 hypothesis this weekend.

---

*FINN Week 6 — Technical Indicators as Data Features | Part of FINN_Month02.md*
