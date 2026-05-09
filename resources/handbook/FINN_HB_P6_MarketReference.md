# FINN Student Reference Handbook
## Part 6 — Market Reference
### The Technical Toolkit: Fibonacci, Volume, Timeframes, Sentiment

**Part of:** FINN Knowledge Base Library
**Cross-references:** `ig_fibonacci.html` · `ig_volume_analysis.html` · `ig_mtf_analysis.html` · `ig_sentiment_indicators.html` · `ig_heikin_ashi.html` · `FINN_HB_P2_ChartReading.md` §2.7 · `FINN_Glossary.md`
**First referenced:** Week 6 (Fibonacci, volume, MTF, Heikin Ashi) · Week 8 (sentiment indicators)

This part of the handbook covers the analytical tools that sit between basic chart reading (Part 2) and quantitative signal construction (Months 3–5). These are reference tools — frameworks for understanding market structure, not standalone entry signals. They become signals when you backtest them and confirm their IC.

---

## §6.1 — Fibonacci Retracements

Fibonacci retracements are levels derived from the Fibonacci sequence that traders use to identify potential support or resistance after a significant price move. They work because a large number of market participants use them — which is a self-fulfilling prophecy worth understanding, not a claim about hidden mathematical order in markets.

### The Core Levels

After a significant price swing (up or down), draw from the swing low to the swing high (for uptrends) or swing high to swing low (for downtrends). The key retracement levels are:

| Level | Ratio | Significance |
|-------|-------|-------------|
| **23.6%** | ~1/4 of the move | Shallow retracement; strong trend continuation signal if held |
| **38.2%** | ~1/3 of the move | Common first test; moderate retracement in a healthy trend |
| **50.0%** | Half the move | Not a true Fibonacci ratio, but widely watched and frequently respected |
| **61.8%** | "Golden ratio" | The most significant level; deep retracement but still trend-consistent |
| **78.6%** | √0.618 | Deeper still; if this fails, the original swing is likely retracing fully |
| **100%** | Full retracement | Original swing low/high — complete retracement of the move |

### How to Draw Fibonacci Retracements

**In an uptrend (looking for pullback support):**
1. Identify the most recent significant swing low (the base of the move)
2. Identify the most recent significant swing high (the peak of the move)
3. Draw from swing low → swing high
4. The retracement levels appear between: the 23.6% level (near the top) down to 78.6% (near the bottom)
5. Watch for price to stall or reverse at one of these levels as it pulls back

**In a downtrend (looking for bounce resistance):**
1. Identify the swing high (start of the down move)
2. Identify the swing low (bottom of the down move)
3. Draw from swing high → swing low
4. Retracement levels appear as price bounces upward
5. Watch for price to stall or reverse at one of these levels

### FINN Fibonacci Rules

| Rule | Rationale |
|------|-----------|
| **The level is a zone, not a line** | Price rarely turns at exactly 61.8%. Use a ±0.5–1% zone around each level |
| **Confluence increases probability** | A Fibonacci level that aligns with a prior S&R zone, a trendline, or a moving average is significantly more reliable than a Fibonacci level in isolation |
| **Volume confirms the turn** | At a Fibonacci support level, look for volume to decrease into the level and increase on the reversal candle |
| **Never use alone** | Fibonacci is a price-level tool. It says "this is where a reaction may occur." Your signal confirms whether to act. |
| **Test it before using it** | Run an IC test on Fibonacci bounce trades in your universe. If the IC is not statistically significant — the level works for others, not for your tickers. |

### Fibonacci Extensions (Beyond 100%)

After a pullback to a Fibonacci level, extensions project where the next move might terminate:

| Extension Level | Common Use |
|----------------|-----------|
| **127.2%** | First extension — common profit target after a 61.8% retrace |
| **161.8%** | Primary extension — "golden" profit target; most widely used |
| **261.8%** | Deep extension for strong trending moves |

Extensions are drawn from the same swing points as retracements, but project beyond the original high (or low). Use them as profit targets, not as entry signals.

---

## §6.2 — Volume Reading Guide

Price tells you what happened. Volume tells you how much conviction was behind it. A price move without volume confirmation is a hypothesis. A price move with volume confirmation is a stronger hypothesis. Neither is a certainty.

### Volume Basics

**Average volume** is the baseline. TradingView shows a 20-period moving average of volume by default. A volume bar that extends above the average line is above-average. Below the line is below-average.

The question is always relative: **is today's volume high or low compared to the recent average?** Not relative to some absolute number.

### Volume Patterns and What They Mean

**Breakout Volume**

| Condition | What It Means |
|-----------|--------------|
| Price breaks resistance on volume ≥ 1.5× average | Confirmed breakout — institutional participation, follow-through likely |
| Price breaks resistance on volume ≤ 0.8× average | Suspect breakout — low conviction, high trap probability (Handbook §4.5) |
| Price breaks resistance, then volume spikes on the next candle | Late confirmation — entry still possible but at a worse price |

**Reversal Volume**

| Condition | What It Means |
|-----------|--------------|
| High-volume bearish candle after an uptrend | Distribution — sellers are active; possible reversal |
| High-volume bullish candle after a downtrend | Accumulation — buyers are active; possible reversal |
| Spike in volume at a support or resistance level | Climactic action — one side is exhausted; watch for reversal |
| Decreasing volume into a key level | Consolidation — the move is losing momentum; decision approaching |

**On-Balance Volume (OBV)**

OBV is a running total: volume is added on up days, subtracted on down days.

| OBV signal | What It Means |
|-----------|--------------|
| OBV rising while price is flat | Accumulation — buyers are absorbing supply; bullish divergence |
| OBV falling while price is flat | Distribution — sellers are unloading into steady price; bearish divergence |
| OBV confirms price trend | Volume and price agree — trend is healthy |
| OBV diverges from price trend | Warning — one of them is wrong; the divergence often resolves in OBV's direction |

**Climactic Volume**

A volume spike 3–5× above average at the end of a sustained trend often marks the final exhaustion move:

- **Buying climax:** End of uptrend. Extreme volume as the last buyers pile in. Smart money is distributing into this demand. Price reverses sharply.
- **Selling climax:** End of downtrend. Extreme volume as the last sellers capitulate. Smart money is accumulating. Price reverses sharply.

Climactic volume is most reliable on weekly charts. On intraday charts it is noisier.

### Volume in FINN Backtests

When encoding volume as a feature:

```python
# Relative volume: current volume vs. 20-day average
df['rel_volume'] = df['Volume'] / df['Volume'].rolling(20).mean()

# Volume spike flag
df['vol_spike'] = (df['rel_volume'] > 1.5).astype(int)

# OBV calculation
df['obv'] = (df['Volume'] * np.sign(df['Close'].diff())).cumsum()
```

Run IC tests on `rel_volume` and `vol_spike` against forward returns. In most liquid equity universes, volume confirmation adds 0.01–0.03 to the IC of a breakout signal. Small but real.

---

## §6.3 — Multi-Timeframe Analysis (MTF)

Multi-timeframe analysis is the practice of analyzing the same security on multiple time horizons before making a trade decision. The logic: a bullish signal on a 5-minute chart in the context of a bearish daily chart is a counter-trend trade. The higher timeframe sets the context; the lower timeframe provides the entry.

### The Standard MTF Framework

FINN uses a top-down approach with four timeframes:

| Timeframe | Role | What You're Looking For |
|-----------|------|------------------------|
| **Daily (1D)** | Primary trend direction | Is the stock in an uptrend, downtrend, or sideways? Major S&R levels? |
| **4-Hour (4H)** | Intermediate structure | Where is price within the daily trend? What intermediate levels are relevant? |
| **1-Hour (1H)** | Entry context | What is the setup forming? Is there a pattern completing? |
| **15-Minute (15M)** | Entry timing | Precise entry candle; stop level; first 15-min range confirmation |

### The Top-Down Process

**Step 1 — Daily chart first**

Before looking at any intraday chart, establish:
- Trend: Is the stock above or below its 20-day and 50-day moving averages?
- Structure: Where are the major support and resistance levels?
- Regime: Is this a trending, consolidating, or topping/bottoming structure?

**Decision:** Long bias, short bias, or no bias. This is your directional filter. Do not take counter-trend setups on lower timeframes unless you have a specific mean-reversion thesis with IC support.

**Step 2 — 4-Hour chart: context**

On the 4H chart:
- Confirm the daily trend or identify a consolidation range
- Find intermediate S&R levels (often not visible on daily due to scale)
- Identify any emerging patterns (flags, triangles, wedges)

**Decision:** Is price approaching a level where a setup is likely? Is there an active pattern on the 4H that matches your signal type?

**Step 3 — 1-Hour chart: setup**

On the 1H chart:
- Identify the specific setup: breakout, pullback to a level, pattern completion
- Confirm that the setup aligns with the daily and 4H direction
- Check volume on the 1H — is there accumulation or distribution forming?

**Decision:** Is the setup valid? Does it meet all criteria on the signal checklist?

**Step 4 — 15-Minute chart: entry**

On the 15M chart:
- Wait for the entry candle that confirms the setup
- Set the stop-loss level (1.5× ATR below the 15M setup structure)
- Set the profit target based on the next major S&R level on the 1H or 4H chart

**Decision:** Entry price, stop price, position size, profit target — all defined before the order is placed.

### MTF Rules

| Rule | Rationale |
|------|-----------|
| **Higher timeframe always overrides lower** | A bearish 4H structure that conflicts with a bullish 15M signal = no trade |
| **Entry on the lowest timeframe, target on a higher one** | Enter on the 15M setup; target the next 1H or 4H resistance level |
| **Stops sized to the entry timeframe** | Use the 15M ATR for stop sizing, not the daily ATR — the daily ATR produces stops too wide for intraday entries |
| **Do not start with the 15M chart** | Starting at the lowest timeframe generates setups without context; this leads to counter-trend trades and low-probability entries |

### MTF in FINN Backtests

MTF analysis is primarily a discretionary framework — it is harder to fully encode than single-timeframe signals. In FINN quantitative work, the daily chart drives signal construction. The multi-timeframe layer is applied manually when evaluating setups during paper trading, using the framework above as the decision structure.

---

## §6.4 — Sentiment Indicators (Non-AI)

Sentiment indicators measure the emotional state of market participants at the aggregate level. Unlike price and volume (which measure what participants actually did), sentiment measures what they feel — which often diverges from what they will do next.

FINN uses sentiment indicators as regime context and contrarian inputs, not as standalone entry signals.

### VIX — The Volatility Index

**What it is:** The CBOE Volatility Index measures the implied volatility of S&P 500 options for the next 30 days. It is derived from options pricing — when options are expensive (high demand for protection), VIX rises.

**How to read it:**

| VIX Level | Market Interpretation | FINN Application |
|-----------|----------------------|-----------------|
| Below 15 | Low fear, complacency | Trending conditions more likely; momentum strategies tend to perform |
| 15–25 | Normal range, moderate uncertainty | Standard conditions; no regime adjustment |
| 25–35 | Elevated fear | Increased volatility; tighten position sizes, widen stops slightly |
| Above 35 | High fear, panic conditions | Mean-reversion strategies tend to outperform; trend-following often fails |
| Above 50 | Extreme fear (rare) | Historical extremes often mark significant lows; consider reducing shorts |

**Contrarian use:** VIX above 35 at a price low often indicates a capitulation event — a potential long opportunity for mean-reversion players. VIX below 12 with an extended rally suggests complacency — reduce long exposure or tighten trailing stops.

**FINN code:**
```python
import yfinance as yf
vix = yf.download('^VIX', start='2020-01-01', progress=False)
vix.columns = [c[0] if isinstance(c, tuple) else c for c in vix.columns]
vix['regime'] = pd.cut(vix['Close'],
                        bins=[0, 15, 25, 35, 100],
                        labels=['low', 'normal', 'elevated', 'panic'])
```

### CNN Fear & Greed Index

**What it is:** A composite index (0–100) built from seven market indicators: stock price momentum, stock price strength, stock price breadth, put/call ratio, junk bond demand, market volatility (VIX), and safe haven demand.

**How to read it:**

| Score | Label | Contrarian Signal |
|-------|-------|-----------------|
| 0–24 | Extreme Fear | Potential long opportunity — everyone is selling |
| 25–44 | Fear | Cautious but not extreme |
| 45–55 | Neutral | No contrarian signal |
| 56–74 | Greed | Cautious but not extreme |
| 75–100 | Extreme Greed | Potential short or take-profit signal — everyone is buying |

**Limitations:** The Fear & Greed Index is a composite of indicators, some of which are already in your analysis (VIX, P/C ratio). It can remain in Extreme Greed or Extreme Fear for weeks before price reverses. Use it as one signal among many, not as a timing tool.

**Where to find it:** CNN Business → Markets → Fear & Greed Index. Not available via API in the free tier.

### AAII Investor Sentiment Survey

**What it is:** Weekly poll of American Association of Individual Investors members. Results: % Bullish, % Bearish, % Neutral. Historical average: ~38% Bullish, ~30% Bearish, ~32% Neutral.

**Contrarian signals:**

| Condition | Contrarian Signal |
|-----------|-----------------|
| % Bullish > 50% | Excessive retail optimism — bearish contrarian signal |
| % Bearish > 50% | Excessive retail pessimism — bullish contrarian signal |
| Bull-Bear spread > +20% | Greed territory — consider reducing long exposure |
| Bull-Bear spread < -20% | Fear territory — potential accumulation zone |

**Key limitation:** Individual investor sentiment is a lagging indicator of price. Retail investors become bullish after markets have risen and bearish after they have fallen. The contrarian signal works at extremes — not in the normal range.

**Where to find it:** aaii.com → Sentiment Survey (free, published every Thursday).

### Put/Call Ratio

**What it is:** Total put volume ÷ total call volume on US equity options markets. A ratio above 1.0 means more puts are being bought than calls (bearish sentiment). Below 1.0 means more calls (bullish sentiment).

**How to read it:**

| P/C Ratio | Interpretation | Contrarian Signal |
|-----------|---------------|-----------------|
| Below 0.70 | High call buying — complacency | Bearish contrarian: markets may be near a short-term top |
| 0.70–1.00 | Normal range | No contrarian signal |
| Above 1.20 | High put buying — fear | Bullish contrarian: hedging activity suggests a potential bottom |
| Above 1.50 | Extreme fear | Strong bullish contrarian signal at extremes |

**FINN code:**
```python
# P/C ratio is available via CBOE (manual download) or some data vendors
# Approximate via options data if available:
# pc_ratio = put_volume / call_volume
# Use as a feature in regime classification models
```

**Where to find it:** cboe.com → Market Statistics → Put/Call Ratios (free daily data).

### Using Sentiment as a Feature

Sentiment indicators are most useful as:

1. **Regime filters:** Is the current environment high-fear or high-complacency? Adjust strategy expectations accordingly.
2. **Contrarian signals at extremes:** Not as precise entry signals, but as a reason to look for reversals when sentiment is historically extreme.
3. **ML features:** Encode VIX level, AAII bull-bear spread, and P/C ratio as features in your XGBoost model. Run IC tests on each. Most are statistically significant over large samples.

**The key constraint:** Sentiment indicators cannot time entries precisely. They tell you the environment — not the exact moment. Combine with price structure (Handbook §2.2, §2.3) and volume confirmation (Handbook §6.2) for actionable setups.

---

## §6.5 — Heikin Ashi (Extended Reference)

Heikin Ashi candles are covered in Handbook §2.7 (basic construction and signals). This section provides the extended reference for using Heikin Ashi in trend identification, strategy filtering, and practical trading.

### Heikin Ashi Formula (Reference)

| Value | Formula |
|-------|---------|
| **HA Close** | (Open + High + Low + Close) / 4 |
| **HA Open** | (Prior HA Open + Prior HA Close) / 2 |
| **HA High** | Max(High, HA Open, HA Close) |
| **HA Low** | Min(Low, HA Open, HA Close) |

The smoothing effect comes from the HA Open being an average of the prior HA values — this creates a rolling momentum effect that standard candles don't have.

### Advanced Signal Reference

**Strong trend signals:**

| Signal | Description | Action |
|--------|-------------|--------|
| Consecutive bullish HA candles (no lower wicks) | Strong uptrend with no pullback pressure | Trend-following entries; tight trailing stops |
| Consecutive bearish HA candles (no upper wicks) | Strong downtrend with no recovery pressure | Short entries; tight trailing stops |
| Long body + absence of opposing wicks for 5+ candles | Trend momentum is high | Add to position on any shallow consolidation |

**Transition signals:**

| Signal | Description | Action |
|--------|-------------|--------|
| First HA candle with both upper and lower wicks | Trend is losing momentum — not a reversal, but a pause | Tighten stop; do not add; wait for resolution |
| Small HA body after a trend run | Doji-equivalent in HA — indecision | Same: tighten stop, watch for direction candle |
| First opposing wick after a no-wick trend | Early warning of potential trend change | Do not exit yet — one candle is not a reversal. Wait for HA color change. |

**Reversal confirmation:**

| Signal | Description | Confirmation Required |
|--------|-------------|----------------------|
| HA color change from bullish to bearish | Trend may be reversing | Requires the new color candle to be full-bodied (not a doji) |
| HA color change + standard chart shows price crossing a key MA | Higher probability reversal | Both signals align — treat as a stronger signal |
| HA color change + volume spike | Capitulation with HA confirmation | Strongest reversal signal combination |

### Heikin Ashi vs. Standard Candles: When to Use Each

| Use Case | Recommended |
|----------|------------|
| Identifying trend direction and strength | Heikin Ashi |
| Identifying exact reversal candle patterns (hammer, engulfing, etc.) | Standard candles |
| Reading the precise open/high/low/close for a period | Standard candles (HA values are synthetic) |
| Filtering trend-following entries (only enter on HA bullish color) | Heikin Ashi as a filter layer |
| Setting stop-loss levels | Standard candles — HA Low is smoothed and may not represent real price structure |

### Heikin Ashi as a Signal Filter in FINN Backtests

The most powerful FINN use case for Heikin Ashi is as a **directional filter** on top of other signals:

```python
import pandas_ta as ta

# Calculate Heikin Ashi
df['ha_close'] = (df['Open'] + df['High'] + df['Low'] + df['Close']) / 4
df['ha_open'] = ((df['Open'].shift(1) + df['Close'].shift(1)) / 2)
df['ha_high'] = df[['High', 'ha_open', 'ha_close']].max(axis=1)
df['ha_low'] = df[['Low', 'ha_open', 'ha_close']].min(axis=1)

# HA trend filter: bullish = HA close > HA open
df['ha_bullish'] = (df['ha_close'] > df['ha_open']).astype(int)

# Apply as entry filter: only take long signals when HA is bullish
df['filtered_signal'] = df['raw_signal'] * df['ha_bullish']
```

Run IC tests on `raw_signal` vs. `filtered_signal`. In trending markets, the HA filter typically improves IC by filtering out counter-trend entries. In choppy markets, the filter may reduce IC by cutting valid mean-reversion setups. Know your regime before applying it.

### Practical Limitations

| Limitation | Detail |
|-----------|--------|
| **Repainting** | Some charting platforms recalculate prior HA candles as new data arrives. Always confirm your platform's HA values are calculated from raw OHLC data, not recalculated retroactively. |
| **Synthetic prices** | HA Open and HA Close are not real prices. You cannot place orders at HA levels — they don't correspond to actual market prices. Use standard candle levels for order placement. |
| **Lag** | The smoothing that makes HA readable also makes it lag. In fast-moving markets, HA may not signal a reversal until after a significant portion of the move has occurred. |
| **Not for scalping** | HA is designed for trend identification across multiple candles. On very short timeframes (1–5 min), the lag makes it unreliable. |

---

*FINN Student Reference Handbook — Part 6: Market Reference*
*Built: Session B3.b (May 8, 2026)*
*Handbook complete: Parts 1–6 all built. Next phase: Infographics (Phase C).*
