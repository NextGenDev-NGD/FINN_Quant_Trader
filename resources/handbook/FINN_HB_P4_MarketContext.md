# FINN Student Reference Handbook
## Part 4 — Market Context
### Reading the Environment Before You Read the Chart

**Part of:** FINN Knowledge Base Library
**Cross-references:** `ig_info_sources.html` · `ig_market_open.html` · `ig_trading_day_types.html` · `ig_market_traps.html` · `FINN_Glossary.md`
**First referenced:** Week 1 (daily routine, info sources, market open) · Week 2 (market traps) · Week 9 (types of trading days)

A chart is a record of what happened. Market context tells you why it happened and what environment you're operating in right now. Before you look at a single candlestick, you should know: what is the macro regime? What happened overnight? What type of day is this likely to be? What traps are set?

The traders who get ambushed by the market are almost always traders who skipped this section.

---

## §4.1 — Trader's Daily Routine

Trading is a practice, not an event. The daily routine builds the mental model that makes chart reading meaningful. Without it, you're reading a sentence without knowing the paragraph.

### Pre-Market Routine (6:00 AM – 9:30 AM ET)

**6:00–7:30 AM — Overnight scan**

| Task | Where | What You're Looking For |
|------|-------|------------------------|
| Futures check | TradingView: `/ES`, `/NQ`, `/YM`, `/RTY` | Direction and magnitude of overnight move; gaps relative to prior close |
| VIX level | TradingView: `VIX` | Below 15 = low fear, trending conditions more likely; 15–25 = moderate; above 25 = elevated fear, expect noise and reversals |
| International markets | TradingView: `SPX500` (Europe), Nikkei | Confirms or contradicts US futures direction |
| Macro calendar | Briefing.com or Investing.com | Any scheduled releases: CPI, FOMC, earnings, jobs data — these change everything |
| News scan | Reuters, Bloomberg headlines, Finviz News tab | What broke overnight? Any sector-wide news? Anything touching your watchlist tickers? |

**7:30–9:00 AM — Watchlist review**

| Task | What to Check |
|------|--------------|
| Pre-market movers | Finviz → Screener → Pre-market or after-hours volume filter; identify what's up/down 2%+ |
| Earnings releases | Any positions or watchlist names reporting today or after close? |
| Gap identification | Which watchlist tickers are gapping at the open? What type of gap? (Handbook §2.6) |
| Level identification | Mark key S&R on your top 3 setups for the day |
| Hypothesis formation | Write your DMB entry: "Today I expect ___ because ___. I will watch for ___ to confirm or deny." |

**9:00–9:30 AM — Pre-open final check**

| Task | What to Do |
|------|-----------|
| Review any GTC orders | Still valid? Has anything changed since you placed them? |
| Confirm order parameters | Entry price, stop price, position size — all correct before the bell? |
| Set alerts | TradingView alerts for price levels you're watching on key names |
| Mental state check | Handbook §5.4 — Pre-trade emotional check. If you're distracted, anxious, or revenge-trading from yesterday — size down or stand aside |

### Market Hours (9:30 AM – 4:00 PM ET)

**9:30–10:00 AM — The first 30 minutes**

The first 30 minutes are the most dangerous and the most informative. Price discovery is happening. Institutional orders are executing. Retail over-reactions are being tested. FINN rule: **do not chase the open**. Watch. Let the first 15–30 minutes resolve before entering unless your setup was pre-planned and pre-gapped exactly as expected.

See §4.3 (Reading the Market Open) for the full framework.

**10:00 AM – 3:30 PM — Active session**

| Time | What Happens | Action |
|------|-------------|--------|
| 10:00–11:30 AM | First trend leg often develops after the open | Monitor open positions; look for first pullbacks in trending names |
| 11:30 AM – 1:00 PM | Lunch lull — volume drops, moves are less reliable | Tighten filters; avoid initiating new positions unless signal is very strong |
| 1:00–3:00 PM | Second trend leg or reversal | Re-evaluate day type; adjust entries if necessary |
| 3:00–3:30 PM | Institutional repositioning, MOC orders build | Unusual moves are common; be cautious about new entries this late |

**3:30–4:00 PM — The close**

| Task | What to Do |
|------|-----------|
| Review open positions | Do any need to be closed before the bell to avoid overnight risk? |
| MOC orders | Any bracket orders still open? Know how they'll behave into the close |
| Journal update | Log outcome, P&L, adherence to rules, what you noticed |

### Post-Market Routine (4:00–5:00 PM ET)

| Task | What to Do |
|------|-----------|
| Results log | Actual fill prices vs. expected; slippage was it material? |
| Rule adherence audit | Did you follow your entry rules exactly? Any deviations? Log and explain. |
| DMB close entry | "Today the hypothesis was ___. The outcome was ___. The IC of the signal this week was ___. The regime was ___." |
| Watchlist update | Add new setups forming; remove names that broke your thesis |
| Next-day preparation | Anything on the macro calendar tomorrow? Earnings? Anything you need to research tonight? |

---

## §4.2 — Information Sources Map

Information quality is the input to your signal universe. Bad inputs produce bad signals. This map organizes the sources FINN uses by category, with notes on reliability, latency, and appropriate use.

### Category 1 — Price and Volume Data (Primary)

| Source | What It Provides | Cost | FINN Use |
|--------|-----------------|------|---------|
| **yfinance** | Daily OHLCV for any ticker; adjusted for splits/dividends; goes back decades | Free | Primary data source for all backtests |
| **TradingView** | Real-time charts, indicators, alerts, multi-timeframe views | Free (basic) | Primary charting platform |
| **Finviz** | Screener, heatmap, real-time news, futures tab | Free (basic) | Daily scan and sector overview |
| **Webull** | Paper trading, Level 2 order book (on app), pre/after-hours data | Free | Paper trading execution platform |

### Category 2 — Macro and Economic Data

| Source | What It Provides | Cost | FINN Use |
|--------|-----------------|------|---------|
| **FRED (Federal Reserve)** | Economic indicators: GDP, unemployment, CPI, rates, M2, yield curve | Free | Regime identification; macro feature engineering |
| **Investing.com** | Economic calendar; all scheduled macro releases | Free | Daily pre-market routine |
| **Briefing.com** | Earnings calendar, economic calendar, pre-market movers | Free (limited) | Morning prep |
| **CME FedWatch** | Fed funds rate probability by meeting | Free | Rate environment context |

### Category 3 — News and Sentiment

| Source | What It Provides | Cost | FINN Use |
|--------|-----------------|------|---------|
| **NewsAPI** | 30-day news articles by ticker or keyword via API | Free tier | FinBERT sentiment pipeline input |
| **Finviz News tab** | Aggregated news headlines by ticker | Free | Manual sentiment check; quick pre-market scan |
| **Reuters / AP** | Unbiased headline news | Free | Overnight macro scan |
| **SEC EDGAR** | 10-K, 10-Q, 8-K filings | Free | Fundamental research when fundamentals matter to your signal |

### Category 4 — Sentiment Indicators (Market-Wide)

| Indicator | What It Measures | Where to Find | FINN Use |
|-----------|----------------|---------------|---------|
| **VIX** | Implied volatility of S&P 500 options; "fear index" | TradingView: `VIX` | Regime classification; position sizing adjustment |
| **CNN Fear & Greed Index** | Composite of 7 market indicators | CNN Business | Quick sentiment read; not a trading signal by itself |
| **AAII Sentiment Survey** | Weekly poll of individual investors: % bullish, bearish, neutral | aaii.com | Contrarian signal input; useful at extremes |
| **Put/Call Ratio** | Options put volume ÷ call volume | CBOE.com | Elevated P/C = fear; low P/C = complacency; both are signals |

See `FINN_HB_P6_MarketReference.md` §6.4 for how to read and use each of these indicators.

### Category 5 — Professional / Institutional Perspective

| Source | What It Provides | Cost | FINN Use |
|--------|-----------------|------|---------|
| **13F filings (SEC)** | Quarterly institutional holdings (45-day lag) | Free via EDGAR | Research input; shows what large funds are accumulating |
| **COT Report (CFTC)** | Commitment of Traders — futures positioning by category | Free via CFTC.gov | Advanced: shows commercial vs. speculative positioning |
| **Earnings transcripts** | Management comments on business conditions | Seeking Alpha (limited free) | Qualitative feature input for sentiment models |

### Information Hierarchy

Not all information is equal. In descending order of FINN reliability:

1. **Price and volume** — the market's actual revealed preferences. Always primary.
2. **Scheduled macro data** — CPI, FOMC, NFP. High impact, predictable timing. Prepare for it.
3. **Quantified sentiment indicators** — VIX, P/C ratio, AAII. Useful at extremes; filter noise near the middle.
4. **News headlines** — directional input only. Market's reaction to the news matters more than the news itself.
5. **Analyst opinions and social media** — noise until quantified. FINN uses FinBERT to extract signal from news text; raw opinion is not a trading input.

---

## §4.3 — Reading the Market Open

The first 30 minutes of the trading session is where the previous session's overnight hypotheses get tested against real order flow. Reading the open correctly tells you what kind of day you're in before the first hour is complete.

### Pre-Open Gap Analysis

Before the bell, check where each watchlist ticker is relative to its prior close:

| Gap Size | Definition | Implications |
|----------|-----------|-------------|
| **Flat** | Within 0.1% of prior close | Normal open; no specific gap strategy applies |
| **Small gap** | 0.1%–0.5% | Minor overnight move; watch how it fills in the first 15 min |
| **Significant gap** | 0.5%–2% | News or overnight futures move; gap-fill probability is elevated |
| **Large gap** | 2%+ | Major catalyst; gap fills are less predictable; let price settle first |

Gap types and their trading implications are covered in Handbook §2.6 and `ig_gap_types.html`.

### The Opening Types Framework

| Opening Type | What It Looks Like | What It Suggests |
|-------------|-------------------|-----------------|
| **Gap-and-Go** | Gaps up or down, holds the gap level in the first 15 min, continues in gap direction | Trend day likely; the gap is real, not a trap |
| **Gap-and-Fade** | Gaps up or down, reverses and fills the gap in the first 30–60 min | Rotation/reversal day likely; fade the open, wait for the gap fill |
| **Inside-Day Open** | Opens near the prior close, stays within prior day's range initially | Consolidation day likely; wait for range to establish, then trade breakout or breakdown |
| **Volatile Open** | Wild swings in both directions in the first 15 min, no clear direction | News-driven uncertainty; stand aside or wait for the first 30 min to resolve |

### The First 30-Minute Rule

FINN standard: **do not initiate new positions in the first 15 minutes unless the setup was pre-planned and the open confirms it exactly.**

The first 15 minutes are dominated by institutional order execution — the morning MOO (market-on-open) and MOC (market-on-close) orders from the prior day settle, market makers adjust their books, and price discovery is noisy. The retail trader who jumps in at 9:31 is often providing liquidity for an institution adjusting its position.

By 10:00 AM, the character of the day is usually established. That's when FINN enters.

### Asia-Europe Range as Context

For US equities with international exposure, the Asia and European session ranges provide context:

| Session | Hours (ET) | What It Tells You |
|---------|-----------|------------------|
| **Asia** | 8:00 PM – 2:00 AM | Risk-on/risk-off sentiment; technology flows (Japan, Korea tech) |
| **Europe** | 3:00 AM – 11:30 AM | European macro context; USD strength/weakness; overlaps US open for 2 hours |
| **US Open** | 9:30 AM – 4:00 PM | Primary session; highest volume and price discovery |

During the 9:30–11:30 AM overlap with European markets, volatility is typically higher. After 11:30 AM when Europe closes, US market often finds a clearer trend direction.

---

## §4.4 — Types of Trading Days

Markets do not behave the same every day. One of the most common mistakes new traders make is applying a trend-following strategy on a reversal day, or a mean-reversion strategy on a trend day. Identifying the day type early saves you from executing the right strategy in the wrong environment.

### The Three Primary Day Types

**Trending Day**

| Feature | Description |
|---------|-------------|
| **What it looks like** | Price moves consistently in one direction from open to close; pullbacks are shallow and brief |
| **Volume profile** | Higher than average volume; consistent throughout the day |
| **VIX behavior** | Declining on up-trend days; rising sharply on down-trend days |
| **Identification signal** | By 10:30 AM, any pullback holds above the opening range low (up day) or stays below the opening range high (down day) |
| **Best strategies** | Trend following; breakout entries; adding to winners on pullbacks |
| **What to avoid** | Fading the trend; counter-trend entries; profit-taking too early |

**Rotational / Choppy Day**

| Feature | Description |
|---------|-------------|
| **What it looks like** | Price moves up and down within a defined range; every rally fades, every selloff recovers |
| **Volume profile** | Below-average or decreasing through the day |
| **VIX behavior** | Relatively flat; no strong directional move |
| **Identification signal** | By 10:30 AM, the opening range high has been tested and held; the opening range low has been tested and held |
| **Best strategies** | Range trading; buy the low, sell the high of the established range |
| **What to avoid** | Breakout entries — they fail repeatedly; trend-following will result in multiple small losses |

**News-Driven Day**

| Feature | Description |
|---------|-------------|
| **What it looks like** | Market moves sharply on a specific catalyst; can be a trend or reversal depending on the news |
| **Volume profile** | Spike in volume at open and around the news event; may settle after |
| **VIX behavior** | Elevated and volatile |
| **Identification signal** | Clear headline catalyst; market moves 1%+ within first hour; sector-specific or broad-market |
| **Best strategies** | Wait. Let price find equilibrium. Then apply standard trend or reversal logic if direction is clear. |
| **What to avoid** | Reacting to the news instead of to the price; chasing the initial move |

### Day Type Decision Tree

```
Pre-market: Large gap + strong futures?
  → YES → Gap-and-Go or Gap-and-Fade (watch first 15 min)
  → NO  → Is there a specific news catalyst?
              → YES → News-driven day; wait for equilibrium
              → NO  → Watch opening range
                         → Opening range breaks and holds?
                              → YES → Trending day
                              → NO  → Rotational day
```

### FINN Application

Each morning DMB entry should include a **day type hypothesis**:

> "Based on pre-market futures (ES +0.4%), no major macro catalyst, and my watchlist showing small gaps — I expect a rotational day. I will set alerts at yesterday's high and low and wait for a range to develop before entering."

If the day develops differently than expected — update the hypothesis and log the revision. That revision is data.

---

## §4.5 — Market Traps

Market traps are price behaviors that appear to signal a breakout or reversal but are in fact engineered or naturally occurring false moves that stop out retail traders and reverse. Understanding them prevents you from being the liquidity for someone else's trade.

### The Four Primary Traps

**Bull Trap (False Breakout to the Upside)**

| Element | Detail |
|---------|--------|
| **What happens** | Price breaks above a well-defined resistance level, triggering buy orders from breakout traders. Then reverses sharply back below the level. |
| **Why it happens** | Large sellers use the breakout level to distribute (sell) into the buying pressure. Once buyers are exhausted, price reverses. |
| **How to identify** | Breakout occurs on below-average volume; price stalls within 0.5–1% above the level; next candle is bearish and closes back below resistance |
| **Protection** | Wait for a confirmed close above resistance (not just a wick). Volume on the breakout candle should be significantly above average. |

**Bear Trap (False Breakdown to the Downside)**

| Element | Detail |
|---------|--------|
| **What happens** | Price breaks below a well-defined support level, triggering stop-losses and short entries. Then reverses sharply back above the level. |
| **Why it happens** | Large buyers use the stop-hunt below support to accumulate at lower prices. Once shorts are in, buyers push price back up, squeezing the new short positions. |
| **How to identify** | Breakdown on below-average volume; price recovers quickly (within 1–3 candles); next candle is bullish and closes above support |
| **Protection** | Use stop orders placed below the support zone, not exactly at the line. Stops placed at the obvious level are the most vulnerable to hunts. |

**Stop Hunt**

| Element | Detail |
|---------|--------|
| **What happens** | Price briefly spikes below a cluster of obvious stop-loss levels (usually just below a round number or well-known S&R level), triggers those stops, then immediately reverses. |
| **Why it happens** | Market makers and algorithmic traders can see where stop clusters are concentrated. A brief move through those levels creates liquidity they can trade against. |
| **How to identify** | A sudden, sharp wick below an obvious level that recovers in 1–2 candles; often visible on the 1-minute chart as a spike that doesn't appear on the 15-minute |
| **Protection** | Place stops slightly beyond the zone, not at the obvious level. Use ATR-based stops rather than round numbers: "entry price minus 1.5× ATR(14)" is harder to hunt than "just below $50.00" |

**False Breakout from Consolidation**

| Element | Detail |
|---------|--------|
| **What happens** | After a period of tight consolidation (narrow range, declining volume), price breaks out in one direction but quickly reverses back into the range. |
| **Why it happens** | Low-volume consolidations often lack committed buyers or sellers. A small order can temporarily push price outside the range, but there's no follow-through. |
| **How to identify** | Consolidation range is tight (2–3% wide or less); breakout candle has low volume; price returns to range within 1–3 candles |
| **Protection** | Require volume confirmation on any consolidation breakout: breakout candle volume should be at least 1.5× the average volume of the prior 5 consolidation candles. |

### Trap Identification Checklist

Before entering any breakout trade, run this check:

| Question | Trap if... |
|----------|-----------|
| What is volume doing on the breakout candle? | Volume is below average or equal to prior candles |
| Is the level extremely obvious (round number, prior high/low)? | Yes — the more obvious, the more hunted |
| How quickly did price move through the level? | Very fast, wick-only move with no body |
| Did price close beyond the level, or only wick through? | Only wick — a close is more reliable |
| Is the broad market moving in the same direction? | Market is moving opposite to the breakout direction |

**Three or more of these = high trap probability. Wait for confirmation or stand aside.**

### FINN's Trap Awareness Rule

Traps are not failures of the market — they are features of it. Market makers exist to provide liquidity and they profit when retail traders are predictable. The most predictable retail trade is the obvious breakout at the obvious level.

FINN requires:
1. **Volume confirmation** on every breakout entry
2. **ATR-based stops**, not round-number stops
3. **Candle close confirmation** before entry — wicks don't count
4. **Broad market alignment** — if SPY is selling off, a breakout in an individual stock is suspect

Document every trap you experience. "I was stopped out by what appeared to be a stop hunt on XYZ — breakdown below $47.50, recovered to $49.20 within 2 candles. Next time: place stop at $47.00 (1.5× ATR below the zone, not at the obvious level)." That entry is worth more than the lost trade.

---

*FINN Student Reference Handbook — Part 4: Market Context*
*Built: Session B2.b (May 8, 2026)*
*Next: Part 5 — Psychology (`FINN_HB_P5_Psychology.md`) — Session B3.a*
