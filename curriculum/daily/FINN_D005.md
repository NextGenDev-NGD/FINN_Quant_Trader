# FINN — Day 5
## Wednesday · April 22, 2026 · Week 2 of 24
### Topic: OHLCV Deep Dive + Volume Anomalies + Spread Proxy

```
MORNING   9:00–10:00 AM EST   60 min   Student-led brief (second rotation)
EVENING   8:00–9:30  PM EST   90 min   10 min framing · 40 min guided build · 25 min independent · 15 min share-out
```

> **Prep:** `W02_workshop_ohlcv_starter.ipynb` pulled and open. `finnenv` activated. Monday notes reviewed.

---

# MORNING — Daily Market Brief
## 9:00–10:00 AM

---

**9:00 | PRE-MARKET SCAN** `15 min`

Standard checklist. After the scan: "Did this week's market behavior match your Monday hypotheses so far? Check the log — are they still valid?"

> **ES, NQ, YM Futures**
> **VIX** — compare to Monday's level
> **Macro calendar** — anything today?
> **Earnings calendar**
> **Finviz sector heatmap**
> **10-year yield**
> **Bitcoin overnight**

---

**9:15 | STUDENT-LED BRIEF** `20 min`

Second student rotation. After the brief, instructor gives 30-second coaching feedback: one strength, one to sharpen.

"Notice: each brief is different. Different tickers, different setups, different hypotheses. The format is the same. The insight varies. That variance is the data."

---

**9:35 | HYPOTHESIS SETTING** `15 min`

Add Wednesday hypotheses. Reference Monday's entries. "One hypothesis today should reference a volume observation or a gap — connect it to tonight's workshop content."

---

**9:50 | OBSERVATION ASSIGNMENT** `10 min`

"Today, look at the 5-minute chart of SPY during the first 30 minutes of market open — 9:30 to 10:00 AM EST. Note the opening volume relative to midday volume. Write down your observation. We'll connect this to order flow tonight."

> **Resource:** [Handbook 2.3 — Trendlines](../../resources/handbook/FINN_HB_P2_ChartReading.md) — While you have the SPY weekly chart open: draw a trendline using the method in Section 2.3. Confirm direction and slope match the method before tonight's class.

---

---

# EVENING — Workshop Session
## 8:00–9:30 PM

```
8:00  Framing — daily data as signal proxy    10 min
8:10  Guided build — Steps 1–4               40 min
8:50  Independent work — 3 tickers           25 min
9:15  Share-out + Muddiest Point             15 min
```

---

**8:00 | FRAMING** `10 min`

"Monday we talked about the hidden costs of trading — spread, slippage, market impact. Tonight we work with the data that reveals those dynamics.

Daily OHLCV data doesn't give us the actual bid-ask spread — that's intraday tick data. But it gives us proxies: the high-low range, the close-to-open gap, and volume patterns. Tonight we build functions that extract those signals from daily data.

By the end of tonight, you'll have a reusable function that automatically flags unusual volume days, calculates a daily volatility proxy, and identifies gap days. These are building blocks in every workshop that follows."

---

**8:10 | GUIDED BUILD** `40 min`

```python
import yfinance as yf
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import warnings
warnings.filterwarnings('ignore')

ticker = "AAPL"
df = yf.download(ticker, period="2y", interval="1d", progress=False)
df.columns = [c[0] if isinstance(c, tuple) else c for c in df.columns]
df.dropna(inplace=True)
print(f"Fetched {len(df)} trading days of data for {ticker}")
```

**Step 1 — Daily range and volatility proxy (8 min)**
```python
# High-Low range as a proxy for intraday volatility
df['HL_Range'] = df['High'] - df['Low']
df['HL_Range_Pct'] = df['HL_Range'] / df['Close'] * 100

# Gap: today's open vs. yesterday's close
df['Gap'] = df['Open'] - df['Close'].shift(1)
df['Gap_Pct'] = df['Gap'] / df['Close'].shift(1) * 100

print("Average daily range:", f"{df['HL_Range_Pct'].mean():.2f}%")
print("Average daily gap:", f"{df['Gap_Pct'].mean():.2f}%")
print("\nTop 5 largest range days:")
print(df['HL_Range_Pct'].nlargest(5))
```
*"A large high-low range on high volume means the market was very active, two-sided. Large range on low volume means a thin market — less reliable signal. Which do you trust more?"*

> **Resource:** [ig_gap_types.html](../../resources/infographics/ig_gap_types.html) — The 4 gap types and what each signals about price action and institutional behavior.

**Step 2 — Volume analysis (10 min)**
```python
# 20-day rolling average volume
df['Vol_MA20'] = df['Volume'].rolling(20).mean()

# Volume ratio: today's volume vs. 20-day average
df['Vol_Ratio'] = df['Volume'] / df['Vol_MA20']

# Flag unusual volume days (ratio > 2 = twice normal volume)
df['Unusual_Volume'] = df['Vol_Ratio'] > 2.0

unusual_days = df[df['Unusual_Volume']]
print(f"\nUnusual volume days (>2x average): {len(unusual_days)}")
print(unusual_days[['Close', 'Volume', 'Vol_Ratio', 'HL_Range_Pct']].head(10))
```
*Deliberate mistake: Run rolling before checking leading NaNs — get NaN-heavy output. "See these NaNs? The rolling window needs 20 rows before it can compute. Always check your rolling calculations for leading NaNs before using this data downstream."*

> **Resource:** [ig_volume_analysis.html](../../resources/infographics/ig_volume_analysis.html) — Volume patterns and what they reveal: breakout volume, reversal volume, OBV divergence, and climactic volume.

**Step 3 — Reusable flagging function (12 min)**
```python
def flag_notable_days(df, vol_threshold=2.0, gap_threshold=1.5):
    """
    Flag trading days with unusual volume or gap characteristics.
    Parameters:
        df: DataFrame with OHLCV columns
        vol_threshold: Flag days where volume > X times 20-day average
        gap_threshold: Flag days where gap > X% of prior close
    Returns:
        DataFrame with flag columns added
    """
    df = df.copy()

    df['Vol_MA20'] = df['Volume'].rolling(20).mean()
    df['Vol_Ratio'] = df['Volume'] / df['Vol_MA20']
    df['Flag_Volume'] = df['Vol_Ratio'] > vol_threshold

    df['Gap_Pct'] = (df['Open'] - df['Close'].shift(1)) / df['Close'].shift(1) * 100
    df['Flag_Gap_Up'] = df['Gap_Pct'] > gap_threshold
    df['Flag_Gap_Down'] = df['Gap_Pct'] < -gap_threshold

    df['Flag_High_Impact'] = df['Flag_Volume'] & (df['Flag_Gap_Up'] | df['Flag_Gap_Down'])

    return df

df_flagged = flag_notable_days(df)
high_impact = df_flagged[df_flagged['Flag_High_Impact']]
print(f"High-impact days: {len(high_impact)}")
print(high_impact[['Close', 'Gap_Pct', 'Vol_Ratio']].head(10))
```
*"The thresholds are parameters — they are choices. `vol_threshold=2.0`, `gap_threshold=1.5`. Different choices produce different results. You'll need to justify your choices. This is exactly the kind of decision you'll face in every backtesting step."*

**Step 4 — Visualization (10 min)**
```python
fig, (ax1, ax2, ax3) = plt.subplots(3, 1, figsize=(14, 10), sharex=True)

ax1.plot(df_flagged.index, df_flagged['Close'], color='steelblue', lw=1.5)
ax1.set_title(f'{ticker} — Price with High-Impact Days Marked')
for date in high_impact.index:
    ax1.axvline(date, color='red', alpha=0.4, lw=1)

ax2.bar(df_flagged.index, df_flagged['Vol_Ratio'],
        color=['red' if x else 'gray' for x in df_flagged['Flag_Volume']],
        alpha=0.7)
ax2.axhline(2.0, color='red', linestyle='--', lw=1, label='2x threshold')
ax2.set_title('Volume Ratio (vs 20-day average)')
ax2.legend()

ax3.bar(df_flagged.index, df_flagged['Gap_Pct'],
        color=['green' if x > 0 else 'red' for x in df_flagged['Gap_Pct']],
        alpha=0.7)
ax3.axhline(0, color='black', lw=0.5)
ax3.set_title('Daily Gap % (Open vs Prior Close)')

plt.tight_layout()
plt.show()
```

---

**8:50 | INDEPENDENT WORK** `25 min`

Run `flag_notable_days` on 3 different tickers of your choice. Answer in markdown cells:

```
1. How many high-impact days did each ticker have over 2 years?
2. Pick the most interesting high-impact day — look up what happened on that date.
3. Is there a pattern in when high-impact days cluster? (Hint: think earnings seasons)
4. Does a high-impact day tend to be followed by above-average or below-average volatility?
```

**Extension Challenge:** Add a new flag to the function — `Flag_Inside_Day`. An inside day is one where the high is lower than the prior day's high AND the low is higher than the prior day's low. Inside days suggest consolidation before a breakout. How often do they occur? What typically follows them?

---

**9:15 | SHARE-OUT + MUDDIEST POINT** `15 min`

**Share-out (10 min):** Focus on the most interesting high-impact days found.

"If you had a system that automatically detected these days and pulled news context for each one — what would that be the beginning of?"

[Don't answer it. Let the question sit. This is the foreshadowing for the sentiment pipeline in Month 2.]

**Muddiest Point (5 min):**
> *"The muddiest point from tonight was ___."*

"Notebook pushed to GitHub by 11:59 PM: `W02_workshop_ohlcv_[initials].ipynb`."

---

## DELIVERABLES

| What | When |
|------|------|
| Workshop notebook `W02_workshop_ohlcv_[initials].ipynb` | Tonight 11:59 PM |

---

*Day 5 · Wednesday April 22, 2026 · Draws from `FINN_W02.md`*
