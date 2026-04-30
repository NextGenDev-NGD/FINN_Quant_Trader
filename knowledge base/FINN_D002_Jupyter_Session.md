# FINN — D002 Jupyter Session Transcript
## Python Environment + First Market Data Pull
### Wednesday, April 15, 2026 · Evening Session · 8:10 PM Guided Build

**Session type:** Live guided build — instructor + student
**Environment:** Windows 11 · `finnenv` (venv) · Python 3.11.9 · Jupyter Notebook
**Notebook:** `W01_workshop_market_data_[initials].ipynb`
**Ticker used:** SPY (S&P 500 ETF) · Period: 1 year

> *"Before we pull a single data point, the environment has to be clean.
> A broken dependency at Day 2 means debugging installs instead of learning markets."*
> — FINN

---

## PRE-SESSION NOTE — Environment Activation

**Issue encountered:** `jupyter notebook` command not recognized on first attempt.

**Cause:** The `finnenv` virtual environment was not active. Jupyter is installed *inside* the environment — it is not available system-wide.

**Resolution:** Activate `finnenv` first, then launch Jupyter from inside it.

```powershell
# Step 1 — Activate the environment (PowerShell as Administrator)
C:\Users\reere\finnenv\Scripts\Activate.ps1

# Prompt should change to:
# (finnenv) PS C:\Users\reere>

# Step 2 — Launch Jupyter from inside the environment
jupyter notebook
```

> **If Activate.ps1 is blocked (UnauthorizedAccess error):**
> ```powershell
> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
> ```
> Press Y, then run the activate command again.

**Key rule:** Always activate `finnenv` before launching Jupyter. Every course notebook must run on the **Python (finnenv)** kernel — never the system Python.

---

## STEP 1 — Environment Check

**Purpose:** Confirm all core libraries imported correctly before touching any data.

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

**Actual output:**
```
pandas: 3.0.2
numpy: 2.4.4
yfinance: 1.3.0
All imports successful.
```

**Versions match the verified install state from `FINN_D002_Install_Guide.md`.**

> *"Did everyone get 'All imports successful'? If not, stop — we fix this now before anything else."*

---

## STEP 2 — Fetch Single Ticker

**Purpose:** Pull one year of SPY daily OHLCV data and inspect the raw dataset.

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

**Actual output:**
```
Shape: (250, 5)

Column names:
['Close', 'High', 'Low', 'Open', 'Volume']

First 5 rows:
                 Close        High         Low        Open    Volume
Date
2025-04-17  520.443848  525.149909  517.972182  521.659948  79868100
2025-04-21  508.055847  515.787225  502.697263  515.253307  69368100
2025-04-22  521.274414  523.301168  513.305764  514.245010  75948100
2025-04-23  529.351746  539.248306  527.829221  534.304974  90590700
2025-04-24  540.494019  541.225622  529.381418  530.636983  64150400

Data types:
Close     float64
High      float64
Low       float64
Open      float64
Volume      int64
dtype: object

Any nulls?
Close     0
High      0
Low       0
Open      0
Volume    0
dtype: int64
```

**Annotations:**

- **250 rows** — 250 trading days over the last year. Markets don't trade weekends or holidays. 250 is correct, not 365.
- **5 columns** — Open, High, Low, Close, Volume. Standard OHLCV format. The backbone of every strategy in this course.
- **Zero nulls** — clean data, no gaps.
- **DatetimeIndex** — rows are indexed by `Date`, not by row numbers. This is a time series. That distinction matters for how we slice and calculate later.
- **Column flattening line** — `df.columns = [c[0] if isinstance(c, tuple) else c for c in df.columns]` is required. Without it, yfinance sometimes returns a multi-level column header that breaks downstream operations.
- **Date range** — data starts April 17, 2025 because `period="1y"` pulls the last 12 months backwards from today (April 2026). The oldest row is the start of that window. This is correct behavior, not a data mismatch.

---

## STEP 3 — Summary Statistics + Case-Sensitivity Lesson

**Purpose:** Describe the distribution of price and volume. Introduce a deliberate error.

```python
print(df.describe())

print(f"\nHighest close: ${df['Close'].max():.2f}")
print(f"Lowest close:  ${df['Close'].min():.2f}")
print(f"Average volume: {df['Volume'].mean():,.0f} shares/day")
```

**Actual output:**
```
           Close        High         Low        Open        Volume
count  250.000000  250.000000  250.000000  250.000000  2.500000e+02
mean   645.165792  647.980043  641.619129  644.896322  7.712319e+07
std     42.170520   42.210787   42.303358   42.405444  2.135241e+07
min    508.055847  515.787225  502.697263  514.245010  3.760340e+07
25%    622.398193  623.379833  619.277116  621.334720  6.307798e+07
50%    658.276794  661.438803  654.326897  658.210651  7.335850e+07
75%    679.458618  681.865041  675.800012  679.030218  8.896320e+07
max    701.659973  702.780029  698.530029  701.059998  1.652935e+08

Highest close: $701.66
Lowest close:  $508.06
Average volume: 77,123,185 shares/day
```

**Observation:** SPY ranged from $508 to $701 over the last year — a $193 spread that includes the April 2025 tariff-driven selloff visible in the first rows of the dataset.

---

### DELIBERATE ERROR — Case Sensitivity

**Code run intentionally:**
```python
df['close']   # lowercase — will fail
```

**Error received:**
```
KeyError: 'close'
```

**Explanation:**

A DataFrame is like a spreadsheet with named columns. The column is labeled exactly `Close` — capital C. When you type `df['close']`, Python goes looking for a column labeled `close`. It doesn't find one. `C` and `c` are different characters. Python reads characters, not meaning.

> Like telling someone: "Hand me the folder labeled **Smith**."
> They hand you one labeled **smith**.
> You say: "That's not it."
> The label doesn't match. Case matters.

**The fix:** Always check exact column names with `df.columns` and copy-paste rather than typing from memory. The traceback looks intimidating — 20 lines of pandas internals — but the only line that matters is the last one: `KeyError: 'close'`.

---

## STEP 4 — Calculate Daily Returns

**Purpose:** Add a daily return series to the DataFrame. Understand `pct_change()` behavior.

```python
df['Daily_Return'] = df['Close'].pct_change()

print(df[['Close', 'Daily_Return']].head(10))
print(f"\nMean daily return: {df['Daily_Return'].mean():.4f}")
print(f"Std of daily returns: {df['Daily_Return'].std():.4f}")
print(f"Best day:  {df['Daily_Return'].max():.2%}")
print(f"Worst day: {df['Daily_Return'].min():.2%}")
```

**Actual output:**
```
                 Close  Daily_Return
Date
2025-04-17  520.443848           NaN
2025-04-21  508.055847     -0.023803
2025-04-22  521.274414      0.026018
2025-04-23  529.351746      0.015495
2025-04-24  540.494019      0.021049
2025-04-25  544.399292      0.007225
2025-04-28  544.606873      0.000381
2025-04-29  548.037476      0.006299
2025-04-30  548.255066      0.000397
2025-05-01  552.140503      0.007087

Mean daily return: 0.0012
Std of daily returns: 0.0083
Best day:  3.30%
Worst day: -2.70%
```

**Annotations:**

- **Decimal vs percentage** — `0.026018` = +2.60%. Same value, different format. The `:.2%` formatter in the best/worst lines converts it for display. The raw column stores decimals.
- **NaN on first row** — `pct_change()` calculates *(today − yesterday) / yesterday*. April 17 is the first row. There is no "yesterday." Python returns `NaN` (Not a Number). This is correct behavior, not an error. Expect it every time you use `pct_change()`.
- **Mean daily return: 0.0012** — SPY gained ~0.12% per day on average. Sounds small. Compounded over 250 trading days, it is meaningful.
- **Std: 0.0083** — on a typical day, SPY moves about 0.83% in either direction. This is the baseline volatility measure.
- **Worst day: -2.70%** — likely within the April 2025 tariff selloff period visible in the first rows.

---

## STEP 5 — Highest Volume Day

**Purpose:** Identify the single busiest trading day in the dataset and find its cause.

```python
max_vol_date = df['Volume'].idxmax()
max_vol_row = df.loc[max_vol_date]
print(f"Highest volume day: {max_vol_date.date()}")
print(f"Volume: {max_vol_row['Volume']:,.0f}")
print(f"Close that day: ${max_vol_row['Close']:.2f}")
print(f"Return that day: {max_vol_row['Daily_Return']:.2%}")
```

**Actual output:**
```
Highest volume day: 2025-11-20
Volume: 165,293,500
Close that day: $648.84
Return that day: -1.52%
```

**Context:** Average volume for SPY in this dataset: 77 million shares/day.
November 20 saw **165 million** — **2.1x normal volume**.

**Student research — what happened November 20, 2025:**

Multiple catalysts aggregated simultaneously:
- Political uncertainty (Epstein file controversy, Congressional conflict)
- Economic concerns (layoffs)
- Cryptocurrency regulatory uncertainty (Trump policy changes)

**FINN annotation:**

No single catalyst caused that volume spike. It was **sentiment aggregation** — multiple uncertainty sources hitting simultaneously caused institutions to rebalance exposure at the same time. When everyone repositions at once, volume explodes. Price drops because sellers are more urgent than buyers that day.

This is not retail traders reacting. 165 million shares in a single session is institutional movement.

> **Key distinction:** -1.52% return with 2.1x volume = institutional de-risking under multi-source negative sentiment.
> This is not the same as a quiet -1.52% day on normal volume. The *combination* of direction and volume magnitude is the signal.

**Filed observation:**
> *"High volume + negative return + multi-source negative sentiment = institutional de-risking event."*
> Not a rule yet. A hypothesis. Testable in Month 4 when FinBERT enters the stack.

---

## STEP 6 — Visualization

**Purpose:** Plot 1-year closing price and daily volume on the same time axis. Make the first visual observation.

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

**Student observation:**

> SPY rallied from ~$525 in May 2025 to ~$700+ by early 2026. Volume was elevated during Q3/Q4 2025 while price continued higher. Volume declined in early 2026 as price stabilized near highs. The chart appears contradictory — high volume during a bullish run doesn't feel intuitive.

**FINN explanation — Volume measures activity, not direction:**

The assumption that high volume = big price drop is wrong. Volume measures how many shares changed hands. Buyers and sellers both contribute equally to volume.

> Think of it like a highway:
> - **Low volume** = quiet road. Small moves, few participants.
> - **High volume** = rush hour. Lots of cars. Traffic can still move forward — it's just busier.

**The Q3/Q4 2025 pattern decoded:**

High volume during a sustained price rally = **institutional accumulation**. Large players were actively buying into the move. The volume confirmed the rally — it was not distribution (selling into strength).

Compare to November 20: high volume *with* price drop = **distribution / de-risking**. Same high volume, opposite price behavior. The combination of volume + price direction carries the signal.

**Student observation reframed precisely:**
> *"SPY rallied from ~$525 to ~$700 over 12 months. Volume was elevated during Q3/Q4 2025 while price continued higher — suggesting institutional accumulation, not distribution. Volume declined in early 2026 as price stabilized near highs."*

---

## KEY CONCEPTS FROM THIS SESSION

| Concept | Plain language | What to remember |
|---------|---------------|-----------------|
| OHLCV | Open, High, Low, Close, Volume | The 5 columns every market dataset starts with |
| DatetimeIndex | Rows indexed by date, not by row number | Time series — slice by date, not by position |
| `pct_change()` | Day-over-day return as a decimal | First row always NaN — correct behavior |
| Case sensitivity | `'Close'` ≠ `'close'` | Always check `df.columns`, never type from memory |
| NaN | Not a Number — no data to calculate from | Expected at the start of any `pct_change()` series |
| Volume ≠ direction | High volume = high activity, not necessarily a drop | Combine volume with price direction for signal |
| Accumulation | High volume + rising price | Institutions buying into the move |
| Distribution / de-risking | High volume + falling price | Institutions selling or reducing exposure |
| Sentiment aggregation | Multiple catalysts hitting simultaneously | Can cause 2x+ volume spikes even without a single dominant headline |

---

## DELIVERABLE REMINDER

| What | When |
|------|------|
| `W01_workshop_market_data_[initials].ipynb` — Steps 1–6 complete | Tonight 11:59 PM |
| Independent work: 4 additional tickers, 5 questions answered in markdown cells | In same notebook |
| Highest-volume day identified and researched for each of 5 tickers | In notebook |

**Independent work tickers required:** At least one ETF (QQQ or IWM), one large-cap stock, one stock you personally find interesting.

**Extension challenge:** Normalize all 5 closing prices to 100 at start of period and plot on one chart — code is in `FINN_D002.md`.

---

## MUDDIEST POINT — End of Session

> *"The muddiest point from tonight — the thing I least understood — was ___."*

Fill this in and include it as the final markdown cell in your notebook before pushing to GitHub.

---

*FINN_D002_Jupyter_Session.md*
*Created: April 16, 2026 · Live session transcript with annotations*
*Reference: FINN_D002.md · FINN_D002_Install_Guide.md*
*Notebook: W01_workshop_market_data_[initials].ipynb*
