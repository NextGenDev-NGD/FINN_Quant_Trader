# FINN — Week 2: How Markets Actually Work
## Foundation Phase | Month 1: Market Literacy & Quant Mindset
**Dates:** April 20–25, 2026
**Week Number:** 2 of 24

---

## WEEK OVERVIEW

### Theme
Order mechanics, microstructure, and the hidden costs of trading. Students move from "what can I trade" to "how does a trade actually happen and what does it cost me?" This week reveals the invisible tax on every transaction.

### Learning Objectives
By the end of this week, students will be able to:
- Name and define all 6 major order types with a realistic use case for each
- Explain market impact — how large orders eat through order book levels
- Calculate the true cost of a round-trip trade including spread and slippage
- Describe how payment for order flow works and why "zero commission" isn't truly free
- Build a Python function that flags unusual volume days on any ticker
- Identify gap days, high-range days, and calculate a daily volatility proxy from OHLCV data
- Explain why stop orders can be dangerous and what a stop hunt is

### Materials Needed
- TradingView — Level 2 order book display for live demonstration
- `finnenv` environment — `yfinance`, `pandas`, `numpy`, `matplotlib` installed
- GitHub repo — starter notebook `W02_workshop_ohlcv_starter.ipynb` (distribute before class)
- Finviz.com — for sector rotation
- Hypothesis log — running from Week 1

### Pre-Week Checklist (Instructor)
- [ ] Assign first student-led DMB brief to student for Monday April 20 (assigned last Friday)
- [ ] Prepare Level 2 order book screenshot or live display (AAPL or SPY with active spread)
- [ ] Prepare whiteboard order book diagram: bid stack, ask stack, spread, market impact example
- [ ] Push `W02_workshop_ohlcv_starter.ipynb` to GitHub before Wednesday
- [ ] Review economic calendar for week of April 20 — flag any major events
- [ ] Prepare verbal feedback structure for first student-led brief (one strength, one sharpen)

---

## MONDAY — April 20, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** First student rotation (assigned Friday April 17)

#### Block 1 — Pre-Market Scan (9:00–9:15 AM)
Instructor runs Block 1 standard checklist. Student presenter observes and prepares Block 2. Reference: "Looking at last week's hypotheses — did anything play out over the weekend in futures?"

Standard checklist:
- [ ] ES, NQ, YM futures — direction and magnitude
- [ ] VIX level — compare to last Friday
- [ ] Macro calendar — any events today?
- [ ] Earnings calendar — who reports this week?
- [ ] Finviz sector heatmap
- [ ] 10-year yield
- [ ] BTC/ETH overnight

#### Block 2 — Student-Led Brief (9:15–9:35 AM)
**First student-led brief.** Instructor steps back completely. Student presents their 3–5 tickers using the brief template.

After the brief, instructor gives brief verbal feedback (30 seconds maximum):
- One thing done well
- One thing to sharpen for next time
- No grade, no judgment — only coaching

#### Block 3 — Hypothesis Setting (9:35–9:50 AM)
Add this week's hypotheses to the log. Reference last week's outcomes: "Looking at what played out last week — does that change how you're thinking today?"

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Find one stock today that has a wide bid-ask spread (more than $0.05 difference) and one with a very tight spread (less than $0.02). Write down both tickers, the spread, and the daily volume for each. What pattern do you notice between spread width and volume?"

---

### EVENING: Theory Session (8:00–9:30 PM EST)
**Topic:** Order Types, Market Microstructure & The True Cost of Trading
**Curriculum Source:** Wiki Section 2.2 (full), order types table

#### Pre-Session Setup
- [ ] Wiki Section 2.2 (full) read and annotated
- [ ] Wiki Section 2.3 read — indices table memorized
- [ ] Glossary entries A–M reviewed
- [ ] DMB observation (bid-ask spread comparison) logged
- [ ] TradingView with Level 2 ready for live order book demonstration

#### Block 1 — Day Review & Reading Check (8:00–8:15 PM) | 15 min

"What did you see in the market today? Who found a stock with a wide bid-ask spread? Tell me the ticker, the spread, and the volume. What pattern emerged?"

Cold-call reading check:
- "Name the 5 order types from the wiki. Define each one in one sentence."
- "What is the bid-ask spread? Give me the formula."
- "Where did the reading lose you?"

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 min

**Topic A: Order Types in Depth (20 min)**

Walk through Wiki Section 2.2 order types table. For each, give a concrete scenario:

- **Market Order:** "You want in NOW. You'll pay whatever the ask is. On SPY with a $0.01 spread, this costs you almost nothing. On a small-cap stock with a $0.30 spread — you just gave away 0.3% before the trade even moves."
- **Limit Order:** "You want 100 shares of AAPL but only at $185 or less. You put in a limit buy at $185. If price never touches $185, you never get filled. The risk is missing the move."
- **Stop Order:** "You own TSLA at $250. You set a stop at $235. If TSLA drops to $235, your stop triggers and becomes a market order. Warning: in a fast market, you might get filled at $228 — not $235. This is called gap risk."
- **Stop-Limit:** "Stop at $235 but limit at $233. You won't sell below $233. Risk: if the stock falls through $233 instantly, you don't get out at all."
- **Trailing Stop:** "You're long SPY and it's rising. Set a 2% trailing stop. If SPY is at $500 and rises to $520, your stop rises to $509.60. If it then drops 2% from $520, you're out at $509.60 — locking in gains."
- **MOO/MOC:** "Used by institutions for rebalancing. Market On Open ensures you trade at the opening print. Market On Close ensures you trade at the closing auction. These create predictable volume spikes at open and close."

**Topic B: The Order Book & Market Microstructure (15 min)**

Show a live or screenshot Level 2 order book in TradingView. Point out: bid side (buyers), ask side (sellers), the spread.

"The inside market is the best bid and best ask. That's the price you see quoted. But behind it, there are layers of orders stacked at lower bids and higher asks. When a large market order hits, it doesn't just take the inside ask — it eats through multiple levels. This is called market impact."

Whiteboard exercise — draw an order book:
- Best bid: $99.95 (200 shares)
- Next bid: $99.90 (500 shares)
- Best ask: $100.00 (150 shares)
- Next ask: $100.05 (800 shares)

"If I want to buy 400 shares right now at market, what do I pay? I take 150 at $100.00 and 250 at $100.05. My average fill is $100.03. The quoted price was $100.00 but I paid $100.03. That's market impact."

**Topic C: Slippage, Commission, and Hidden Costs (5 min)**

"Zero-commission brokers (Robinhood, Webull, etc.) still cost you money. They make money through payment for order flow — they route your order to market makers who pay them to see it. The market maker profits from the spread. Your commission is zero. Your slippage and spread cost is very real."

Concrete example: "On 100 shares of a $50 stock with a $0.10 spread, your hidden transaction cost is ~$5 round trip — just from the spread, before any adverse move."

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 min

1. "If you always use limit orders, you avoid slippage — but what risk do you take on? What happens when the market moves fast and your limit never fills?"

2. "Devil's advocate: Is a stop-loss actually dangerous? Think about who is on the other side of your stop order when it triggers. Who benefits from stop runs?"
   *(Expected direction: market makers and HFTs know where retail stops cluster — at round numbers, at recent lows. They hunt those levels. This is called a stop hunt. Does that mean stops are bad? No — but placement matters.)*

3. "We said institutions slice large orders to avoid moving the market. If you're watching a stock and see steady, small-volume buying all day with the price barely moving — what might that be? How would you distinguish accumulation from just low interest?"

4. "We pay the spread every time we trade. If a strategy makes 0.3% per trade average, and the spread on our stock costs 0.3% round trip — what does that tell us about minimum required edge before we even consider live trading?"

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 min

**Wednesday workshop:**
"Wednesday we'll work with OHLCV data more deeply. We'll calculate spread proxies from daily data, explore volume patterns, and build a function that flags unusual volume days automatically. Starter notebook: `W02_workshop_ohlcv_starter.ipynb`"

**Weekly hypotheses:** Add to log. Push toward applying order mechanics: "Try to make at least one hypothesis this week that references an order type or a specific market level that you think will act as support or resistance."

**Pre-reading for next Monday:**
- Wiki Section 3.1 — The Quant Workflow (read and re-read until you can recite all 9 steps)
- Wiki Section 3.3 — Core Performance Metrics (read and look up any unfamiliar terms)
- Glossary entries N–Z

**Closing reflection:**
*"The most important thing I need to understand before Wednesday is ___."*

**Monday Deliverable:** Reading Notes + 3 Hypotheses submitted by 11:59 PM

---

## WEDNESDAY — April 22, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation (second student assigned)

Run standard format. After the student brief, instructor asks the class: "Did this week's market behavior match your Monday hypotheses so far?"

**Observation Assignment:** "Today, look at the 5-minute chart of SPY during the first 30 minutes of market open (9:30–10:00 AM EST). Note: the opening volume relative to midday volume. Write down your observation. We'll connect this to order flow tonight."

---

### EVENING: Workshop Session (8:00–9:30 PM EST)
**Workshop:** W2 — OHLCV Deep Dive + Volume Analysis + Spread Proxy Calculation
**Notebook:** `W02_workshop_ohlcv_[initials].ipynb`
**Curriculum Source:** Wiki Section 2.2, Code Pattern 1

#### Pre-Session Setup
- [ ] `finnenv` running, repo pulled
- [ ] `W02_workshop_ohlcv_starter.ipynb` open
- [ ] Monday notes reviewed — Questions/Signals column ready
- [ ] DMB observation (SPY opening volume) noted

#### Block 1 — Framing (8:00–8:10 PM) | 10 min

"Monday we talked about the hidden costs of trading — spread, slippage, market impact. Tonight we work with the data that reveals those dynamics.

Daily OHLCV data doesn't give us the actual bid-ask spread — that's intraday tick data. But it gives us proxies: the high-low range, the close-to-open gap, and volume patterns. Tonight we build functions that extract those signals from daily data.

By the end of tonight, you'll have a reusable function that automatically flags unusual volume days, calculates a daily volatility proxy, and identifies gap days. These will become building blocks in future workshops."

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 min

```python
import yfinance as yf
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# Fetch 2 years of data for analysis
ticker = "AAPL"
df = yf.download(ticker, period="2y", interval="1d")
df.dropna(inplace=True)
print(f"Fetched {len(df)} trading days of data for {ticker}")
```

**Step 1 — Daily range and volatility proxy (8 min)**
```python
# High-Low range as a proxy for intraday volatility
df['HL_Range'] = df['High'] - df['Low']
df['HL_Range_Pct'] = df['HL_Range'] / df['Close'] * 100  # As % of close

# Gap: difference between today's open and yesterday's close
df['Gap'] = df['Open'] - df['Close'].shift(1)
df['Gap_Pct'] = df['Gap'] / df['Close'].shift(1) * 100

print("Average daily range:", f"{df['HL_Range_Pct'].mean():.2f}%")
print("Average daily gap:", f"{df['Gap_Pct'].mean():.2f}%")
print("\nTop 5 largest range days:")
print(df['HL_Range_Pct'].nlargest(5))
```
*"A large high-low range on high volume = market was very active, two-sided. Large range on low volume = thin market, less reliable signal."*

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
*Deliberate mistake: Run rolling with window=20 before dropping NaN rows first — get NaN-heavy output. "See these NaNs? The rolling window needs 20 rows before it can compute. Always check your rolling calculations for leading NaNs."*

**Step 3 — Build a reusable flagging function (12 min)**
```python
def flag_notable_days(df, vol_threshold=2.0, gap_threshold=1.5):
    """
    Flag trading days with unusual characteristics.

    Parameters:
        df: DataFrame with OHLCV columns
        vol_threshold: Flag days where volume > X times 20-day average
        gap_threshold: Flag days where gap > X% of prior close

    Returns:
        DataFrame with added flag columns
    """
    df = df.copy()

    # Volume flags
    df['Vol_MA20'] = df['Volume'].rolling(20).mean()
    df['Vol_Ratio'] = df['Volume'] / df['Vol_MA20']
    df['Flag_Volume'] = df['Vol_Ratio'] > vol_threshold

    # Gap flags
    df['Gap_Pct'] = (df['Open'] - df['Close'].shift(1)) / df['Close'].shift(1) * 100
    df['Flag_Gap_Up'] = df['Gap_Pct'] > gap_threshold
    df['Flag_Gap_Down'] = df['Gap_Pct'] < -gap_threshold

    # Combine: days with BOTH unusual volume AND a gap
    df['Flag_High_Impact'] = df['Flag_Volume'] & (df['Flag_Gap_Up'] | df['Flag_Gap_Down'])

    return df

df_flagged = flag_notable_days(df, vol_threshold=2.0, gap_threshold=1.5)
high_impact = df_flagged[df_flagged['Flag_High_Impact']]
print(f"High-impact days: {len(high_impact)}")
print(high_impact[['Close', 'Gap_Pct', 'Vol_Ratio']].head(10))
```

**Step 4 — Visualize (10 min)**
```python
fig, (ax1, ax2, ax3) = plt.subplots(3, 1, figsize=(14, 10), sharex=True)

ax1.plot(df_flagged.index, df_flagged['Close'], color='steelblue', lw=1.5)
ax1.set_title(f'{ticker} — Price with High-Impact Days Marked')

# Mark high-impact days on price chart
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

#### Block 3 — Independent Work (8:50–9:15 PM) | 25 min

**Core Exercise:**
Run the `flag_notable_days` function on 3 different tickers of your choice. For each ticker, answer in markdown cells:
1. How many high-impact days did each ticker have over 2 years?
2. Pick the most interesting high-impact day — look up what happened on that date.
3. Is there a pattern in *when* high-impact days cluster? (Hint: earnings seasons)
4. Does a high-impact day tend to be followed by above-average or below-average volatility?

**Extension Challenge:**
Add a new flag to the function: `Flag_Inside_Day` — a day where the high is lower than the prior day's high AND the low is higher than the prior day's low. Inside days suggest consolidation before a breakout. How often do they occur? What typically follows them in your 3 tickers?

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 min

**Share-out:** Focus on the most interesting high-impact days found.
Discussion: "If you had a system that automatically detected these days and looked up news, what would that be the beginning of?" *(Foreshadowing: LLM sentiment pipeline in Month 2.)*

**Muddiest Point:**
> *"The muddiest point from tonight was ___."*

**Wednesday Deliverable:** Completed notebook `W02_workshop_ohlcv_[initials].ipynb` submitted to GitHub by 11:59 PM

---

## FRIDAY — April 24, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Student rotation (third student)

Standard checklist. Note any notable market events this week — earnings, macro data. Flag anything that connects to the order types and volume concepts from this week.

---

### EVENING: Review & Market Session (8:00–9:30 PM EST)

#### Pre-Session Setup
- [ ] Hypothesis log reviewed — all Week 2 hypotheses ready for audit
- [ ] TradingView with SPY 5-minute chart ready for intraday order flow analysis
- [ ] Finviz heatmap loaded

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 min

**Questions:**

1. "Explain the difference between a stop order and a stop-limit order. Give me a scenario where the stop-limit fails you."

2. "What is market impact? If I want to buy $1 million of a small-cap stock with 100,000 average daily volume — what happens?"

3. "In Wednesday's notebook, what does the `Vol_Ratio` column tell us? A Vol_Ratio of 3.5 on a down day — what might that indicate?"

4. "We said zero-commission brokers still cost you money. Explain the mechanism of payment for order flow to someone who has never heard of it."

5. "What was the best trade setup you *saw* this week — not took, just saw? Walk me through why it was interesting."

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 min

**Hypothesis Audit:** Review and close all this week's hypotheses.

**Chart Review — Order Flow Focus:**
Pull up SPY on 5-minute timeframe for a portion of a volatile intraday session. Identify: opening range, midday consolidation, afternoon trend.

"This is what order flow looks like from the outside. The opening burst is retail and program trading. The midday quiet is market makers and institutions. The afternoon move is often institutions leaning toward the close."

Show a stock that had a high-impact day this week (from student watchlists if possible): "Look at volume at the open versus midday. Notice the gap. Where would a stop order below the prior close have gotten triggered?"

**Sector Rotation:** Walk through the week's sector performance. Ask: "Anything change from last week? Is the rotation consistent with macro conditions?"

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 min

Observe and narrate. Add to last week's observations: "Notice how the put/call ratio changes as the week progresses. It often elevates going into weekends — institutions hedge their exposure over the two-day close. We can't trade yet, but log what you see. This builds your intuition library."

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 min

**Next week's topic:** Performance metrics and the 9-step quant workflow. This is the transition from "understanding markets" to "thinking like a quant."

**Assign reading:**
- Wiki Section 3.1 — Quant Workflow (memorize all 9 steps)
- Wiki Section 3.3 — Performance Metrics (full table — understand every metric)
- Wiki Section 3.2 — Descriptive statistics only (mean, std, skewness, rolling)

**Flag upcoming:** Week 4 closes with Milestone 1 oral assessment. Students should begin reviewing all Month 1 material from this point forward.

**DMB rotation:** Assign next week's student leads.

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

## WEEKLY DELIVERABLES SUMMARY

| Deliverable | Due | Format |
|-------------|-----|--------|
| Reading Notes + 3 Hypotheses | Monday 11:59 PM | Markdown in hypothesis log |
| Workshop Notebook (W02) | Wednesday 11:59 PM | `.ipynb` pushed to GitHub |
| Weekly Review Log | Friday 11:59 PM | Markdown |
| Hypothesis Outcome Record | Friday 11:59 PM | Appended to hypothesis log |

---

## INSTRUCTOR NOTES FOR WEEK 2

**First student-led brief coaching:** The first student-led brief is often nervous and fragmented. Give specific, direct, brief feedback — not a lengthy critique. "Your hypothesis was specific — good. Next time, explain the signal check before the hypothesis so the context lands first." Keep it under 30 seconds so you don't embarrass or discourage.

**Order types conceptual sticking point:** Stop-limit orders consistently confuse students because the distinction between the trigger price (stop) and the execution price (limit) is not intuitive. Use a concrete example with explicit numbers every time. Draw it out: "Stop at $235 triggers the order. Limit at $233 is the floor. If the stock gaps from $240 to $225 overnight — you never get out."

**Stop hunts are a controversial topic:** Some students will have heard of stop hunting from social media and will have strong opinions. Acknowledge the controversy: professional opinion is divided on whether HFTs actually target retail stops deliberately. What is uncontroversial: stops cluster at predictable levels, and prices frequently probe those levels. Whether intentional or not, the effect is the same for retail traders.

**Wednesday notebook building:** When building `flag_notable_days()`, make sure students understand that the function is parameterized — they can change `vol_threshold` and `gap_threshold`. This is the beginning of parameter thinking that will matter enormously when they reach backtesting. "The threshold is a choice. Different choices produce different results. You'll need to justify your choice."

**SPY 5-minute chart on Friday:** The opening range analysis is visually compelling. Open the chart during class and ask students to narrate what they see — don't just explain it yourself. "What do you notice about volume at 9:30 vs. 11:00? What do you think is happening?" This develops their ability to read a chart as a story, not just data.

---

## WEEKLY RESOURCES

> Resources are labeled **[Pre-session]** (review before class) or **[Homework]** (explore after). FINN covers every concept live — these are your scaffolding, not your syllabus.

---

### Monday — Order Types, Microstructure & The True Cost of Trading

- **[Article | Pre-session]** [Types of Orders](https://www.investor.gov/introduction-investing/investing-basics/how-stock-markets-work/types-orders) — Investor.gov / SEC. Authoritative, plain-language breakdown of market, limit, stop, and stop-limit orders. Short read — covers the definitions we work through live in Monday's Block 2A.

- **[Article | Pre-session]** [Order Types](https://www.finra.org/investors/investing/investment-products/stocks/order-types) — FINRA. Regulatory-level definitions with emphasis on risk disclosures. Worth reading specifically for the stop-order warning: "stop orders do not guarantee execution at or near the stop price."

- **[Article | Homework]** [Payment for Order Flow (PFOF) Explained](https://www.britannica.com/money/payment-for-order-flow-explained) — Britannica Money. Balanced explainer on how "zero commission" brokers actually make money. Covers the NBBO, routing incentives, and the SEC's ongoing debate. Read after Monday's PFOF discussion to reinforce both sides of the argument.

- **[Article | Homework]** [Inside Payment for Order Flow and Commission-Free Trading Apps](https://alpaca.markets/learn/love-it-or-hate-it-inside-payment-for-order-flow-and-commission-free-trading-apps) — Alpaca (November 2021). More opinionated take from a trading infrastructure company — useful for seeing how a practitioner thinks about PFOF versus how a regulator does.

- **[Article | Homework]** [Stop Loss Hunting](https://www.forex.com/en-us/glossary/stop-loss-hunting/) — FOREX.com. Clear definition of stop hunts, why they happen at predictable price levels, and how retail traders can recognize the pattern. FINN's caveat: whether this is deliberate targeting or natural liquidity dynamics is debated — read the "how to protect yourself" section with that skepticism in mind.

- **[YouTube | Pre-session]** Search YouTube for: *"order types explained limit stop market order trading"* — filter by upload date (2021 or later). Look for a 10–15 min video that shows order placement on a real broker platform, not just whiteboard theory. Channels worth checking: **Investopedia**, **Schwab**, **tastytrade**. Skip any video that focuses only on Forex — equity order mechanics differ slightly.

---

### Wednesday — OHLCV Workshop: Volume Anomalies, Gap Days & Volatility

- **[Article | Pre-session]** [Plotting stock charts (OHLC) with matplotlib and mplfinance](https://pythonfintech.com/articles/plotting-stock-charts-ohlc-matplotlib-mplfinance/) — PythonFinTech (March 2025). Shows how to go from a yfinance DataFrame to a proper candlestick chart in Python. Preview this before Wednesday — we visualize OHLCV in the workshop.

- **[Article | Reference]** [Analyzing Market Microstructure with Python](https://www.pyquantnews.com/free-python-resources/analyzing-market-microstructure-with-python) — PyQuant News. Goes slightly beyond the workshop into bid-ask and trade flow — good extension reading for students who want to push further after Wednesday's notebook.

- **[YouTube | Pre-session]** Search YouTube for: *"OHLCV data analysis Python pandas matplotlib 2023"* — look for a video that builds a volume spike detection or candlestick chart from scratch in a Jupyter notebook. Target: 15–25 min. The code approach should closely match what we use in class (yfinance + pandas + matplotlib).

---

### Friday — Chart Review, Opening Range & Hypothesis Audit

- **[Article | Pre-session]** [Inside The Market: Order Books And What You're Missing Out On](https://bookmap.com/blog/inside-the-market-order-books-and-what-youre-missing-out-on) — Bookmap (September 2024). If you didn't read this in Week 1, read it now — Friday's session connects the order book theory from Monday to the visual patterns you'll see in TradingView Level 2.

- **[Article | Homework]** [Understanding Market, Limit, and Stop Orders](https://www.schwab.com/learn/story/understanding-market-limit-and-stop-orders) — Charles Schwab. Clean summary with a practical angle — what order type to use in which situation. Good reference after Friday's session when students start placing their first paper trades in Month 3.

---

*FINN Week 2 — How Markets Actually Work | Part of FINN_Month01.md*
