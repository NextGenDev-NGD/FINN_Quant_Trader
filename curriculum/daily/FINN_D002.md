# FINN — Day 2
## Wednesday · April 15, 2026 · Week 1 of 24
### Topic: Python Environment + First Market Data Pull

```
MORNING   9:00–10:00 AM EST   60 min   Instructor-led (Week 1)
EVENING   8:00–9:30  PM EST   90 min   10 min framing · 40 min guided build · 25 min independent · 15 min share-out
```

> **Prep:** `finnenv` activated via `C:\Users\[username]\finnenv\Scripts\Activate.ps1` (PowerShell — venv, not conda). `W01_workshop_market_data_starter.ipynb` pulled from GitHub and open. TradingView ready.

---

# MORNING — Daily Market Brief
## 9:00–10:00 AM

---

**9:00 | PRE-MARKET SCAN** `15 min`

Run standard checklist. Reference Monday's hypotheses: "Did anything from Monday's DMB play out in Tuesday's session? Check the log."

> **ES, NQ, YM Futures** — direction and magnitude. Any gap overnight from Monday's close?
> **VIX** — compare to Monday's level. Higher or lower?
> **Macro calendar** — any events today or tomorrow?
> **Earnings calendar** — bank earnings week continues. Any reports today?
> **Finviz sector heatmap** — what's moving this morning?
> **10-year yield** — any shift from Monday?
> **Bitcoin overnight** — any change in risk sentiment since Monday?

---

**9:15 | STUDENT-LED BRIEF** `20 min`

Week 1: Instructor demonstrates again. Choose 3 different tickers from Monday — show variety in setups. Narrate every step: "I'm choosing these tickers because..."

```
Ticker:       [TICKER]
Current:      $[PRICE] | [+/- % from yesterday]
Setup:        [One sentence on price action]
Catalyst:     [Any news or event today]
Hypothesis:   [One specific, falsifiable statement]
Signal Check: [VIX level + sector context]
```

After the third ticker: "Starting next Monday, one of you runs this. Watch the structure."

---

**9:35 | HYPOTHESIS SETTING** `15 min`

Add Wednesday hypotheses to the log. Reference Monday's entries: "Are Monday's hypotheses still valid? Did anything in Tuesday's session change your view?"

```
Date:          2026-04-15
Hypothesis:    [Specific, testable statement]
Basis:         [Pre-market data from this morning]
Timeframe:     [When will we know if it's right or wrong?]
Outcome:       [TBD — reviewed Friday]
```

---

**9:50 | OBSERVATION ASSIGNMENT** `10 min`

"When you open your Python notebook tonight, look at the Volume column for your 5 tickers. Find the single highest-volume day in the last year for each one. Write down the date. We'll discuss what likely caused it tonight."

---

---

# EVENING — Workshop Session
## 8:00–9:30 PM

```
8:00  Framing — Python as a data tool      10 min
8:10  Guided build — Steps 1–6             40 min
8:50  Independent work — 5 tickers         25 min
9:15  Share-out + Muddiest Point           15 min
```

---

**8:00 | FRAMING** `10 min`

"Monday we talked about asset classes, market structure, and who's in the room. Tonight we pull real market data for the first time and look at it as data scientists — not as traders reading charts, but as analysts inspecting a dataset.

The question tonight is not 'should I buy this stock?' The question is: 'What is this data, what does it contain, and what can it tell me?'

By the end of tonight you will have fetched data for 5 real tickers, inspected the schema, calculated a simple daily return series, and visualized price history. Simple. But you'll understand every line of code."

---

**8:10 | GUIDED BUILD** `40 min`

Instructor opens a blank notebook and builds live. Students run every cell.

**Step 1 — Environment check (3 min)**
```python
import pandas as pd
import numpy as np
import yfinance as yf
import matplotlib.pyplot as plt
import warnings
warnings.filterwarnings('ignore')

print("pandas:", pd.__version__)
print("numpy:", np.__version__)
print("yfinance:", yf.__version__)
print("All imports successful.")
```
*"Did everyone get 'All imports successful'? If not, stop — we fix this now before anything else."*

**Step 2 — Fetch single ticker (7 min)**
```python
ticker = "SPY"
df = yf.download(ticker, period="1y", interval="1d", progress=False)
df.columns = [c[0] if isinstance(c, tuple) else c for c in df.columns]

print(f"Shape: {df.shape}")
print(f"\nColumn names:\n{df.columns.tolist()}")
print(f"\nFirst 5 rows:\n{df.head()}")
print(f"\nData types:\n{df.dtypes}")
print(f"\nAny nulls?\n{df.isnull().sum()}")
```
*"What does each column represent? Open, High, Low, Close, Volume. The index is a DatetimeIndex — dates are the rows. This is a time series."*

**Step 3 — Summary statistics (5 min)**
```python
print(df.describe())

print(f"\nHighest close: ${df['Close'].max():.2f}")
print(f"Lowest close:  ${df['Close'].min():.2f}")
print(f"Average volume: {df['Volume'].mean():,.0f} shares/day")
```
*Deliberate mistake: Try `df['close']` (lowercase) — get a KeyError. "Column names are case-sensitive. This error will happen to you repeatedly. Good — now you've seen it."*

**Step 4 — Calculate daily returns (10 min)**
```python
df['Daily_Return'] = df['Close'].pct_change()

print(df[['Close', 'Daily_Return']].head(10))
print(f"\nMean daily return: {df['Daily_Return'].mean():.4f}")
print(f"Std of daily returns: {df['Daily_Return'].std():.4f}")
print(f"Best day:  {df['Daily_Return'].max():.2%}")
print(f"Worst day: {df['Daily_Return'].min():.2%}")
```
*"What does the first row's Daily_Return show? NaN — why? There's no previous row to compare to. Always expect NaN on the first row of pct_change. This is not an error."*

**Step 5 — Highest volume day (5 min)**
```python
max_vol_date = df['Volume'].idxmax()
max_vol_row = df.loc[max_vol_date]
print(f"Highest volume day: {max_vol_date.date()}")
print(f"Volume: {max_vol_row['Volume']:,.0f}")
print(f"Close that day: ${max_vol_row['Close']:.2f}")
print(f"Return that day: {max_vol_row['Daily_Return']:.2%}")
```
*"What happened on that date? This connects to the morning observation assignment — look it up right now. What does that tell us about institutional footprints?"*

**Step 6 — Visualization (10 min)**
```python
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(12, 8))

ax1.plot(df.index, df['Close'], color='steelblue', linewidth=1.5)
ax1.set_title(f'{ticker} — 1 Year Closing Price', fontsize=14)
ax1.set_ylabel('Price ($)')
ax1.grid(True, alpha=0.3)

ax2.bar(df.index, df['Volume'], color='gray', alpha=0.6)
ax2.set_title(f'{ticker} — Daily Volume', fontsize=14)
ax2.set_ylabel('Volume (shares)')
ax2.grid(True, alpha=0.3)

plt.tight_layout()
plt.show()
```
*"Do you see any correlation between volume spikes and price moves? Don't answer — write it down. That's your first observation."*

---

**8:50 | INDEPENDENT WORK** `25 min`

Repeat the guided build for 4 additional tickers of your choice. Required: at least one ETF (QQQ or IWM), one large-cap stock, one stock you personally find interesting. Answer these 5 questions in markdown cells:

```
1. Which of your 5 tickers had the highest average daily volume? Why might that be?
2. Which had the most volatile daily returns (highest standard deviation)?
3. What was the worst single-day return across all 5 tickers this year? What date?
4. Is there any visual relationship between price and volume in your charts?
5. Look up what happened on the highest-volume day for one of your tickers. What caused it?
```

**Extension Challenge:** Fetch all 5 tickers in a single loop, normalize all closing prices to 100 at the start of the period, and plot them on the same chart.

```python
tickers = ['SPY', 'QQQ', 'AAPL', 'MSFT', 'your_choice']
normalized = {}
for t in tickers:
    data = yf.download(t, period="1y", interval="1d", progress=False)
    data.columns = [c[0] if isinstance(c, tuple) else c for c in data.columns]
    normalized[t] = data['Close'] / data['Close'].iloc[0] * 100

pd.DataFrame(normalized).plot(figsize=(12, 6), title="Normalized Price Performance")
plt.ylabel("Indexed to 100")
plt.grid(True, alpha=0.3)
plt.show()
```

---

**9:15 | SHARE-OUT + MUDDIEST POINT** `15 min`

**Share-out (10 min):** Two students share their volume analysis findings. Focus: why does volume spike? What events cause extreme volume? Connect to Monday's concept — high volume is institutional footprints.

**Muddiest Point (5 min):**
> *"The muddiest point from tonight — the thing I least understood — was ___."*

"Wednesday notebook pushed to GitHub by 11:59 PM. Filename: `W01_workshop_market_data_[initials].ipynb`. Friday we open with the highest-volume findings across the whole class."

> **Resource:** [ig_platform_tradingview.html](../../resources/infographics/ig_platform_tradingview.html) — After tonight's session: open TradingView, load your 5 tickers, and configure your first watchlist using the interface guide.

---

## DELIVERABLES

| What | When |
|------|------|
| Workshop notebook `W01_workshop_market_data_[initials].ipynb` | Tonight 11:59 PM |
| Observation: highest-volume day noted for each of 5 tickers | In notebook |

---

*Day 2 · Wednesday April 15, 2026 · Draws from `FINN_W01.md`*
