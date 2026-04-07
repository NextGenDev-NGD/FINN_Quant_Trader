# FINN — Month 01 Lesson Plan
## Financial Intelligence & Navigation Network
### Foundation Phase: Market Literacy & Quant Mindset
**Dates:** April 13 – May 9, 2026
**Phase:** Month 1 of 6 — Foundation
**Milestone:** M1 — Market Literacy Assessment (End of Week 4)

---

> **INSTRUCTOR NOTE**
> This file covers Weeks 1–4 of the curriculum. The onboarding week (April 6–11) is
> separate and not part of this document. By the time students arrive at the first
> session below, they should have: Python environment (`finnenv`) running, Webull and
> Alpaca accounts created, GitHub repo initialized, and all required packages installed.
> If any student is still missing setup items, resolve 1:1 before April 13 — do not
> let setup issues bleed into curriculum time.

---

## Month 1 Overview

### Learning Objectives

By the end of Month 1, every student will be able to:

- Define and correctly use core financial market terminology without reference materials
- Explain market microstructure — how trades actually execute, who the participants are, and what drives price
- Describe all major asset classes and articulate why this course focuses on equities and ETFs
- Recite and explain every step of the 9-step FINN Quant Workflow from memory
- Read and interpret OHLCV data, candlestick charts, and key market indices
- Fetch, inspect, and describe financial data in Python using `yfinance`
- Identify and explain core performance metrics: Sharpe ratio, drawdown, win rate, expectancy
- Form specific, falsifiable daily market hypotheses and evaluate their outcomes
- Pass the Month 1 Milestone oral assessment without reference materials

### Month 1 Curriculum Sources
*(from `FINN_Curriculum_Wiki.md`)*

- Section 2: Financial Market Fundamentals (complete)
- Section 3.1: The Quant Workflow
- Section 3.2: Essential Statistics (descriptive statistics only — hypothesis testing deferred to Month 2)
- Section 3.3: Core Performance Metrics
- Section 4.1 & 4.2: Python environment and data acquisition patterns only
- Section 12: Glossary (reference throughout)

### Month 1 at a Glance

| Week | Dates | Theme | Monday Topic | Wednesday Workshop | Friday Focus |
|------|-------|-------|-------------|-------------------|-------------|
| 1 | Apr 13–18 | Market Structure | Asset classes, exchanges, participants | Python env + yfinance data pull | Week 1 chart review + index behavior |
| 2 | Apr 20–25 | How Markets Work | Order types, microstructure, bid-ask | Order simulation + OHLCV exploration | Order flow observation review |
| 3 | Apr 27–May 2 | Measuring Markets | Performance metrics, the quant workflow | Calculating returns + basic metrics in Python | Metrics applied to a real week |
| 4 | May 4–9 | Integration + M1 | Review + synthesis of all Month 1 material | Milestone prep workshop | M1 Oral Assessment |

---

---

# WEEK 1 — Market Structure & The Trading Landscape
**Theme:** Understanding what we are trading, where, and who else is in the room.

---

## Monday, April 13, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Instructor (Week 1 — instructor leads all DMBs to model the format)

#### Block 1 — Pre-Market Scan (9:00–9:15 AM)

This is the first DMB. Instructor models the entire format explicitly.
Narrate every item on the checklist — explain what each data point means and why we look at it.

**Checklist:**
- [ ] ES, NQ, YM futures — direction and magnitude pre-market
- [ ] VIX level — introduce what VIX is and why it matters
- [ ] Macro calendar — any events today? Walk through how to find this
- [ ] Earnings calendar — introduce the concept, show where to find it
- [ ] Finviz sector heatmap — walk through reading it for the first time
- [ ] 10-year yield — introduce the concept of risk-on/risk-off
- [ ] BTC/ETH overnight — explain why crypto is used as a sentiment signal

**Instructor note:** Spend extra time in this first DMB explaining *why* each data point is
on the checklist. Students have never done this before. The goal is not speed — it is
building the mental model of what "pre-market context" means.

#### Block 2 — Student-Led Brief (9:15–9:35 AM)

Week 1: No student lead. Instructor demonstrates what a student brief will look like.
Choose 3 tickers from a prepared watchlist and walk through the brief format:

```
Ticker:       SPY
Current:      $[PRICE] | [+/- % from yesterday]
Setup:        SPY is [describe price action in one sentence]
Catalyst:     [Any news or event to watch today]
Hypothesis:   [A specific, falsifiable statement about SPY today]
Signal Check: [Note VIX level and what it implies]
```

Tell students: "Starting next Monday, one of you will do this. By Week 3, you'll all
have led this block at least once."

#### Block 3 — Hypothesis Setting (9:35–9:50 AM)

First hypothesis of the course. Instructor writes it live and explains the format.

```
Date:          2026-04-13
Submitted by:  FINN Class
Hypothesis:    [Instructor writes a specific hypothesis about today's market]
Basis:         [Based on pre-market data from Block 1]
Timeframe:     Intraday
Outcome:       [TBD — reviewed Friday]
```

Explain: "Every hypothesis we write this year goes in this log. We will look back at
all of them at the end of Month 6. The log is the course's memory."

#### Block 4 — Observation Assignment (9:50–10:00 AM)

**This week's observation:** "During market hours today, find a stock that is moving
significantly (up or down more than 2%). Write down: the ticker, the price move,
and your best guess at what caused it. Bring this to tonight's class."

---

### Monday, April 13, 2026 — Theory Session
**Time:** 8:00–9:30 PM EST
**Topic:** Asset Classes, Market Structure & Who's In the Room
**Curriculum source:** Wiki Section 2.1, 2.4

#### Pre-Session Requirements
- [ ] No pre-reading assigned for Week 1 (first session) — students arrive fresh
- [ ] Observation from morning DMB logged and ready to share
- [ ] GitHub account created, repo initialized (from onboarding week)

---

#### Block 1 — Day Review & Introductions (8:00–8:15 PM) | 15 minutes

Open with: *"What did the market do today? Who found a stock moving more than 2%?"*

Call on 3–4 students to share their observation assignment results. For each one:
- What was the ticker?
- What moved it?
- Is this something we could have predicted? Why or why not?

This establishes immediately that the course is rooted in real market behavior.
There is no warmup — the market is the first topic, every single session.

Then briefly: "Before we go deep on concepts, let's establish what we're actually
dealing with. Tonight we answer: what can you trade, and who else is trading it?"

---

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 minutes

**Topic A: Asset Classes (15 min)**

Walk through the asset class table from Wiki Section 2.1. For each class, do not just
read the table — give a vivid real-world example:

- **Equities:** "When you buy one share of AAPL, you own a fractional piece of Apple Inc.
  If they make money, you make money. If they go bankrupt, your share is worth zero."
- **ETFs:** "SPY holds all 500 S&P 500 companies proportionally. Buying SPY is like
  buying the whole index in one trade. This is the benchmark we will measure everything against."
- **Options:** "A call option on NVDA at $900 gives you the right — not the obligation —
  to buy NVDA at $900 regardless of where it trades. We will not trade options in Month 1,
  but we will observe them every Friday."
- **Futures:** "An ES futures contract represents $50 × the S&P 500 index level.
  This is what we watch in the DMB every morning — it predicts where SPY will open."
- **Crypto:** "24/7 trading. No market close. We use BTC as a global risk appetite signal,
  not as a primary trading vehicle in this course."
- **Forex:** "EUR/USD tells you how many dollars one euro buys. Macro-driven.
  The Fed raising rates strengthens the dollar — this ripples across all asset classes."

**Scope reminder:** Primary focus is equities and ETFs. Everything else is context.

**Topic B: Market Structure (15 min)**

Walk through Wiki Section 2.2 — exchanges, market hours, and the order book concept.

Key points to hit with force:
- "Pre-market and after-hours trading is thinner — the spread is wider, moves are more
  violent, and prices are less reliable. Institutions wait for the open."
- "The order book is the real market. Price is just the last agreed transaction.
  What's pending — the bids and asks — tells you the real story."
- Draw the order book on a whiteboard or show a live Level 2 example in TradingView:
  show bid stack, ask stack, and the spread between them.

**Topic C: Market Participants (10 min)**

Walk through Wiki Section 2.4 — retail, institutional, hedge funds, market makers, HFTs.

The critical insight to land hard: "We are retail traders. We are the smallest fish.
Understanding what the bigger fish want — and when — is one of the most important edges
we can develop. Institutions can't hide. Their footprints show up in volume and price action."

Ask rhetorically: "If a hedge fund wants to buy $500 million of SPY without moving the price,
what do they do? They can't just hit market order. They slice it up over days.
That's what institutional accumulation looks like on a chart — what retail calls 'sideways chop'
is often a fund quietly building a position."

---

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 minutes

**Opening:** "No prepared questions tonight since this is Week 1. But I have some for you."

**Instructor questions:**

1. "We said retail traders are the smallest fish. Does that mean retail can't have an edge?
   What kind of edge could a small, fast, individual trader have that a $10 billion fund cannot?"
   *(Expected direction: size — retail can enter and exit small positions instantly without
   market impact. Speed in niches. No career risk.)*

2. "If market makers profit from the bid-ask spread, are they your enemy or your friend?
   Think about it from both angles."
   *(Expected direction: they're necessary — without them, no liquidity. But they take a toll
   on every transaction. Wide spreads on illiquid stocks eat your edge.)*

3. "Devil's advocate: If the stock market is just a mechanism for companies to raise capital,
   why should we expect price movements to be predictable at all?"
   *(Expected direction: they don't have to be perfectly predictable — just slightly more
   predictable than random, repeatedly, to generate alpha. That's the whole game.)*

**Instructor note:** Don't resolve these cleanly. Leave them open. Students should leave
tonight thinking, not satisfied. The discomfort is productive.

---

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 minutes

**Wednesday workshop assigned:**
"On Wednesday we open Python for the first time in this course. The exercise is simple:
fetch market data for 5 tickers using yfinance, inspect the data structure, and answer
5 questions about what you see. The notebook starter will be in the GitHub repo by
Tuesday evening. Pull it before Wednesday's DMB."

**Weekly hypotheses:** Students write their first 3 hypotheses in the log.
Instructor helps if needed — emphasize specificity and falsifiability.

**Pre-reading for next Monday:**
- Wiki Section 2.2 (full — order types and microstructure in detail)
- Wiki Section 2.3 (market indices — read and memorize the table)
- Glossary entries: bid-ask spread, order book, liquidity, market maker, slippage

**Closing reflection:** Each student writes:
*"The most important thing I need to understand before Wednesday is ___."*
Collect these — read a few aloud anonymously before ending.

---

## Wednesday, April 15, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Instructor

#### Block 1 — Pre-Market Scan (9:00–9:15 AM)
Run standard pre-market checklist. Note anything that shifted since Monday.
Specifically: "Did anything from Monday's hypothesis play out in Tuesday's market?
Check the hypothesis log."

#### Block 2 — Student-Led Brief (9:15–9:35 AM)
Week 1: Instructor leads. Model the brief again — students observe.
Choose 3 different tickers from Monday to show variety in setups.

#### Block 3 — Hypothesis Setting (9:35–9:50 AM)
Add Wednesday hypotheses to the log. Reference Monday's hypotheses — are they still valid?

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "When you open your Python notebook tonight, look at the volume
column for your 5 tickers. Find the single highest-volume day in the last year for each one.
Write down the date. We'll discuss what likely caused it tonight."

---

### Wednesday, April 15, 2026 — Workshop Session
**Time:** 8:00–9:30 PM EST
**Topic:** Python Environment + First Market Data Pull
**Curriculum source:** Wiki Section 4.1, 4.2, Code Pattern 1
**Notebook:** `W01_workshop_market_data_[initials].ipynb`

#### Pre-Session Requirements
- [ ] `finnenv` environment activated and working
- [ ] `yfinance`, `pandas`, `matplotlib` installed
- [ ] GitHub repo cloned locally
- [ ] Starter notebook pulled: `W01_workshop_market_data_starter.ipynb`

---

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 minutes

"Monday we talked about asset classes, market structure, and who's in the room.
Tonight we pull real market data for the first time and look at it as data scientists —
not as traders reading charts, but as analysts inspecting a dataset.

The question tonight is not 'should I buy this stock?' The question is:
'What is this data, what does it contain, and what can it tell me?'

By the end of tonight you will have fetched data for 5 real tickers, inspected the schema,
calculated a simple daily return series, and visualized price history.
That's it. Simple. But you'll understand every line of code."

---

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 minutes

Instructor opens a blank notebook and builds live. Students run every cell.

**Step 1 — Environment check (3 min)**
```python
# Confirm environment is working
import pandas as pd
import numpy as np
import yfinance as yf
import matplotlib.pyplot as plt

print("pandas:", pd.__version__)
print("numpy:", np.__version__)
print("yfinance:", yf.__version__)
print("All imports successful.")
```
*Pause: "Did everyone get 'All imports successful'? If not, stop — we fix this now."*

**Step 2 — Fetch single ticker (7 min)**
```python
# Fetch 1 year of daily OHLCV data for SPY
ticker = "SPY"
df = yf.download(ticker, period="1y", interval="1d")

print(f"Shape: {df.shape}")        # How many rows and columns?
print(f"\nColumn names:\n{df.columns.tolist()}")
print(f"\nFirst 5 rows:\n{df.head()}")
print(f"\nLast 5 rows:\n{df.tail()}")
print(f"\nData types:\n{df.dtypes}")
print(f"\nAny nulls?\n{df.isnull().sum()}")
```
*Pause: "What does each column represent? Open, High, Low, Close, Volume.
What is the index? It's a DatetimeIndex — dates are the rows. This is a time series."*

**Step 3 — Summary statistics (5 min)**
```python
# Describe the dataset
print(df.describe())

# What was the highest closing price this year?
print(f"\nHighest close: ${df['Close'].max():.2f}")
print(f"Lowest close:  ${df['Close'].min():.2f}")
print(f"Average volume: {df['Volume'].mean():,.0f} shares/day")
```
*Deliberate mistake: Try `df['close']` (lowercase) — get a KeyError. Explain: "Column names
are case-sensitive. This is one of the most common errors you will make. Good."*

**Step 4 — Calculate daily returns (10 min)**
```python
# Calculate daily percentage return
df['Daily_Return'] = df['Close'].pct_change()

# What does pct_change() do?
# Row N return = (Close_N - Close_{N-1}) / Close_{N-1}

print(df[['Close', 'Daily_Return']].head(10))
print(f"\nMean daily return: {df['Daily_Return'].mean():.4f}")
print(f"Std of daily returns: {df['Daily_Return'].std():.4f}")
print(f"Best day: {df['Daily_Return'].max():.2%}")
print(f"Worst day: {df['Daily_Return'].min():.2%}")
```
*Ask: "What does the first row's Daily_Return show? NaN — why?
Because there's no previous row to compare to. Always expect NaN on the first row
of a pct_change. This is not an error."*

**Step 5 — Find highest volume day (5 min)**
```python
# Find the highest volume day
max_vol_date = df['Volume'].idxmax()
max_vol_row = df.loc[max_vol_date]
print(f"Highest volume day: {max_vol_date.date()}")
print(f"Volume: {max_vol_row['Volume']:,.0f}")
print(f"Close that day: ${max_vol_row['Close']:.2f}")
print(f"Return that day: {max_vol_row['Daily_Return']:.2%}")
```
*Ask: "What happened on that date? Can anyone look it up right now?
This connects to the DMB observation assignment from this morning."*

**Step 6 — Simple visualization (10 min)**
```python
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(12, 8))

# Price chart
ax1.plot(df.index, df['Close'], color='steelblue', linewidth=1.5)
ax1.set_title(f'{ticker} — 1 Year Closing Price', fontsize=14)
ax1.set_ylabel('Price ($)')
ax1.grid(True, alpha=0.3)

# Volume chart
ax2.bar(df.index, df['Volume'], color='gray', alpha=0.6)
ax2.set_title(f'{ticker} — Daily Volume', fontsize=14)
ax2.set_ylabel('Volume (shares)')
ax2.grid(True, alpha=0.3)

plt.tight_layout()
plt.show()
```

---

#### Block 3 — Independent / Pair Work (8:50–9:15 PM) | 25 minutes

**Core Exercise:**
Repeat the guided build for 4 additional tickers of the student's choice.
Required: at least one ETF (QQQ or IWM), one large-cap stock, one stock they personally
find interesting. Answer these 5 questions in markdown cells in the notebook:

```
1. Which of your 5 tickers had the highest average daily volume? Why might that be?
2. Which had the most volatile daily returns (highest standard deviation)?
3. What was the worst single-day return across all 5 tickers this year? What date?
4. Is there any visual relationship between price and volume in your charts?
5. Look up what happened on the highest-volume day for one of your tickers. What was the cause?
```

**Extension Challenge:**
Fetch data for all 5 tickers in a single loop. Normalize all closing prices to 100
at the start of the period (divide each by its first close × 100) and plot them on
the same chart. This shows relative performance rather than absolute price.

```python
# Hint for extension:
tickers = ['SPY', 'QQQ', 'AAPL', 'MSFT', 'your_choice']
normalized = {}
for t in tickers:
    data = yf.download(t, period="1y", interval="1d")['Close']
    normalized[t] = data / data.iloc[0] * 100

pd.DataFrame(normalized).plot(figsize=(12, 6), title="Normalized Price Performance")
plt.ylabel("Indexed to 100")
plt.grid(True, alpha=0.3)
plt.show()
```

---

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 minutes

**Share-out (10 min):**
- 2 students share their volume analysis findings
- Focus discussion on: why does volume spike? What events cause extreme volume?
- Connect to Monday's concept: "High volume = institutional footprints."

**Muddiest Point (5 min):**
> *"The muddiest point from tonight — the thing I least understood — was ___."*

**Notebook submission:**
Push `W01_workshop_market_data_[initials].ipynb` to GitHub before midnight Wednesday.

---

## Friday, April 17, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Instructor

Run standard checklist. Specifically flag: "Today is the first Friday. We will spend
time in tonight's class reviewing the week's hypothesis log and looking at this week's
charts. Make sure your hypothesis log entries are complete before tonight."

**Observation Assignment:**
"Before tonight's class, pull up SPY on TradingView. Switch to a weekly candle view.
Note where the week opened and where it is closing. Was it a bullish week, bearish week,
or inside week? Write it down."

---

### Friday, April 17, 2026 — Review & Market Session
**Time:** 8:00–9:30 PM EST
**Topic:** Week 1 Review + First Market Autopsy
**Curriculum source:** Wiki Sections 2.1, 2.4

#### Pre-Session Requirements
- [ ] Hypothesis log reviewed — know your Monday hypotheses' outcomes
- [ ] TradingView open: SPY weekly, QQQ daily, VIX daily
- [ ] Wednesday notebook reviewed and pushed to GitHub

---

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 minutes

**Questions (select 3–4):**

1. "Explain asset classes as if someone who missed Monday asked you what we covered.
   Give me the whole picture in under 2 minutes."

2. "In Wednesday's notebook — what does `pct_change()` actually calculate?
   Walk me through the math on the first non-NaN row."

3. "What is the bid-ask spread, and why does it matter for a retail trader trying
   to enter and exit positions quickly?"

4. "We said market makers profit from the spread. Name a situation where being
   in an illiquid stock could cost you significantly more than you expected."

5. "What did the observation assignment tell you? You found a high-volume day —
   what caused it? What does that tell us about the relationship between news and price?"

---

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 minutes

**Step 1 — Hypothesis Audit (10 min)**

Open the hypothesis log. Review every hypothesis submitted Monday and Wednesday:
- Was it correct? Partially? Wrong?
- Update the `Outcome` field for every entry
- Ask the submitter: "Walk me through what actually happened."
- If wrong: "What signal would have told you earlier?"
- If right: "Was this skill or luck? How do you tell the difference?"

**Step 2 — Chart Review (15 min)**

Open TradingView. Walk through:

*SPY — Weekly candle:*
- "What was the dominant structure this week? Trend, range, or reversal?"
- "Where did we open Monday? Where did we close Friday?"
- "Did price respect any obvious level — a prior high, a round number, a moving average?"

*QQQ — Daily candle:*
- "Did tech lead SPY or lag it this week? What does that tell us?"

*VIX — Daily:*
- "VIX moved from ___ to ___. What does that say about how the market felt this week?"
- "Is there a visible inverse relationship between SPY and VIX this week?"

*One student's watchlist ticker:*
- Pull up one ticker from this week's student briefs
- "How did it perform relative to SPY? What would our basic data pull have shown us?"

**Step 3 — Sector Rotation (10 min)**

Open Finviz heatmap. Walk through:
- "Which sectors were green this week? Which were red?"
- "Does this match the macro context from our DMBs?"
- "Is there a story here — rotation toward defense? Tech leading? Energy lagging?"
- Ask students: "What does this week's sector rotation suggest about how institutions
  were positioned?"

---

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 minutes

**Week 1 — Observation only. Instructor narrates everything.**

Open TradingView or a free options scanner:
- "The put/call ratio today is ___. A high P/C ratio means more puts than calls are
  being bought — that's bearish sentiment. Low means complacency or bullish bets."
- "VIX term structure: if short-term VIX is higher than long-term VIX, the market
  expects near-term volatility — that's called backwardation."
- "Weekly options expired today. We don't trade them yet — but notice where SPY
  closed relative to the most popular strikes. This is called 'max pain.'"

Tell students: "For the next 8 weeks, you are observers here. Just watch, listen,
and ask questions. By Month 3 you'll interpret this on your own."

---

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 minutes

**Next week's topic:** Order types, market microstructure, and the mechanics of execution.

**Assign reading:**
- Wiki Section 2.2 (full) — order types table, order book, bid-ask spread
- Wiki Section 2.3 — memorize the indices table
- Glossary: all entries starting with letters A–M

**DMB rotation:** Assign first student-led DMB brief for Monday April 20.
Walk them through what to prepare: "Pick 3–5 tickers you want to follow.
Prepare the brief template. Have TradingView open at 9:00 AM. You've got this."

**Upcoming macro events to flag:**
Review economic calendar for the week of April 20. Flag anything relevant
(earnings reports, Fed speeches, macro data releases).

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

Read 3–4 aloud. Keep all in the course log.

---

---

# WEEK 2 — How Markets Actually Work
**Theme:** Order mechanics, microstructure, and the hidden costs of trading.

---

## Monday, April 20, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** First student rotation (assigned Friday April 17)

#### Block 1 — Pre-Market Scan (9:00–9:15 AM)
Instructor runs Block 1. Student presenter observes and prepares Block 2.

#### Block 2 — Student-Led Brief (9:15–9:35 AM)
**First student-led brief.** Instructor steps back completely.
Student presents their 3–5 tickers using the brief template.
After the brief, instructor gives brief verbal feedback:
- One thing done well
- One thing to sharpen for next time
- No grade, no judgment — only coaching

#### Block 3 — Hypothesis Setting (9:35–9:50 AM)
Add this week's hypotheses to the log. Reference last week's outcomes.
"Looking at what played out last week — does that change how you're thinking today?"

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Find one stock today that has a wide bid-ask spread
(more than $0.05 difference) and one with a very tight spread (less than $0.02).
Write down both tickers, the spread, and the daily volume for each.
What pattern do you notice between spread width and volume?"

---

### Monday, April 20, 2026 — Theory Session
**Time:** 8:00–9:30 PM EST
**Topic:** Order Types, Market Microstructure & The True Cost of Trading
**Curriculum source:** Wiki Section 2.2 (full), order types table

#### Pre-Session Requirements
- [ ] Wiki Section 2.2 (full) read and annotated
- [ ] Wiki Section 2.3 read — indices table memorized
- [ ] Glossary entries A–M reviewed
- [ ] DMB observation (bid-ask spread comparison) logged

---

#### Block 1 — Day Review & Reading Check (8:00–8:15 PM) | 15 minutes

"What did you see in the market today? Who found a stock with a wide bid-ask spread?
Tell me the ticker, the spread, and the volume. What pattern emerged?"

Cold-call reading check:
- "Name the 5 order types from the wiki. Define each one in one sentence."
- "What is the bid-ask spread? Give me the formula."
- "Where did the reading lose you?"

---

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 minutes

**Topic A: Order Types in Depth (20 min)**

Walk through Wiki Section 2.2 order types table. For each, give a scenario:

- **Market Order:** "You want in NOW. You'll pay whatever the ask is.
  On SPY with a $0.01 spread, this costs you almost nothing.
  On a small-cap stock with a $0.30 spread — you just gave away 0.3% before the trade even moves."
- **Limit Order:** "You want 100 shares of AAPL but only at $185 or less.
  You put in a limit buy at $185. If price never touches $185, you never get filled.
  The risk is missing the move."
- **Stop Order:** "You own TSLA at $250. You set a stop at $235.
  If TSLA drops to $235, your stop triggers and becomes a market order.
  Warning: in a fast market, you might get filled at $228 — not $235. This is called gap risk."
- **Stop-Limit:** "Stop at $235 but limit at $233. You won't sell below $233.
  Risk: if the stock falls through $233 instantly, you don't get out at all."
- **Trailing Stop:** "You're long SPY and it's rising. Set a 2% trailing stop.
  If SPY is at $500 and rises to $520, your stop rises to $509.60.
  If it then drops 2% from $520, you're out at $509.60 — locking in gains."
- **MOO/MOC:** "Used by institutions for rebalancing. Market On Open ensures
  you trade at the opening print. Market On Close ensures you trade at the closing auction.
  These create predictable volume spikes at open and close."

**Topic B: The Order Book & Market Microstructure (15 min)**

Show a live or screenshot Level 2 order book in TradingView.
Point out: bid side (buyers), ask side (sellers), the spread.

"The inside market is the best bid and best ask. That's the price you see quoted.
But behind it, there are layers of orders stacked at lower bids and higher asks.
When a large market order hits, it doesn't just take the inside ask —
it eats through multiple levels. This is called market impact."

Whiteboard exercise: Draw an order book.
- Best bid: $99.95 (200 shares)
- Next bid: $99.90 (500 shares)
- Best ask: $100.00 (150 shares)
- Next ask: $100.05 (800 shares)

"If I want to buy 400 shares right now at market, what do I pay?
I take 150 at $100.00 and 250 at $100.05. My average fill is $100.03.
The quoted price was $100.00 but I paid $100.03. That's market impact."

**Topic C: Slippage, Commission, and Hidden Costs (5 min)**

"Zero-commission brokers (Robinhood, Webull, etc.) still cost you money.
They make money through payment for order flow — they route your order to market makers
who pay them to see it. The market maker profits from the spread.
Your commission is zero. Your slippage and spread cost is very real."

Concrete example: "On 100 shares of a $50 stock with a $0.10 spread,
your hidden transaction cost is ~$5 round trip — just from the spread, before any adverse move."

---

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 minutes

**Discussion questions:**

1. "If you always use limit orders, you avoid slippage — but what risk do you take on?
   What happens when the market moves fast and your limit never fills?"

2. "Devil's advocate: Is a stop-loss actually dangerous? Think about who is on the other side
   of your stop order when it triggers. Who benefits from stop runs?"
   *(Expected direction: market makers and HFTs know where retail stops cluster —
   at round numbers, at recent lows. They hunt those levels. This is called a stop hunt.
   Does that mean stops are bad? No — but placement matters.)*

3. "We said institutions slice large orders to avoid moving the market. If you're watching
   a stock and see steady, small-volume buying all day with the price barely moving —
   what might that be? How would you distinguish accumulation from just low interest?"

4. "We pay the spread every time we trade. If a strategy makes 0.3% per trade average,
   and the spread on our stock costs 0.3% round trip — what does that tell us about
   minimum required edge before we even consider live trading?"

---

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 minutes

**Wednesday workshop:**
"Wednesday we'll work with OHLCV data more deeply. We'll calculate spread proxies
from daily data, explore volume patterns, and build a function that flags unusual
volume days automatically. Starter notebook: `W02_workshop_ohlcv_starter.ipynb`"

**Weekly hypotheses:** Add to log. Push toward applying order mechanics:
"Try to make at least one hypothesis this week that references an order type or
a specific market level that you think will act as support or resistance."

**Pre-reading for next Monday:**
- Wiki Section 3.1 — The Quant Workflow (read and re-read until you can recite all 9 steps)
- Wiki Section 3.3 — Core Performance Metrics (read and look up any unfamiliar terms)
- Glossary entries N–Z

**Closing reflection:**
*"The most important thing I need to understand before Wednesday is ___."*

---

## Wednesday, April 22, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation (second student assigned)

Run standard format. After the student brief, instructor asks the class:
"Did this week's market behavior match your Monday hypotheses so far?"

**Observation Assignment:**
"Today, look at the 5-minute chart of SPY during the first 30 minutes of market open
(9:30–10:00 AM EST). Note: the opening volume relative to midday volume.
Write down your observation. We'll connect this to order flow tonight."

---

### Wednesday, April 22, 2026 — Workshop Session
**Time:** 8:00–9:30 PM EST
**Topic:** OHLCV Deep Dive + Volume Analysis + Spread Proxy Calculation
**Curriculum source:** Wiki Section 2.2, Code Pattern 1
**Notebook:** `W02_workshop_ohlcv_[initials].ipynb`

#### Pre-Session Requirements
- [ ] `finnenv` running, repo pulled
- [ ] `W02_workshop_ohlcv_starter.ipynb` open
- [ ] Monday notes reviewed — Questions/Signals column ready

---

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 minutes

"Monday we talked about the hidden costs of trading — spread, slippage, market impact.
Tonight we work with the data that reveals those dynamics.

Daily OHLCV data doesn't give us the actual bid-ask spread — that's intraday tick data.
But it gives us proxies: the high-low range, the close-to-open gap, and volume patterns.
Tonight we build functions that extract those signals from daily data.

By the end of tonight, you'll have a reusable function that automatically flags
unusual volume days, calculates a daily volatility proxy, and identifies gap days.
These will become building blocks in future workshops."

---

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 minutes

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
*"A large high-low range on high volume = market was very active, two-sided.
Large range on low volume = thin market, less reliable signal."*

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
*Deliberate mistake: Run rolling with window=20 before dropping NaN rows first —
get NaN-heavy output. "See these NaNs? The rolling window needs 20 rows before
it can compute. Always check your rolling calculations for leading NaNs."*

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

---

#### Block 3 — Independent / Pair Work (8:50–9:15 PM) | 25 minutes

**Core Exercise:**
Run the `flag_notable_days` function on 3 different tickers of your choice.
For each ticker, answer in markdown cells:
1. How many high-impact days did each ticker have over 2 years?
2. Pick the most interesting high-impact day — look up what happened on that date.
3. Is there a pattern in *when* high-impact days cluster? (Hint: earnings seasons)
4. Does a high-impact day tend to be followed by above-average or below-average volatility?

**Extension Challenge:**
Add a new flag to the function: `Flag_Inside_Day` — a day where the high is lower than
the prior day's high AND the low is higher than the prior day's low.
Inside days suggest consolidation before a breakout. How often do they occur?
What typically follows them in your 3 tickers?

---

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 minutes

**Share-out:** Focus on the most interesting high-impact days found.
Discussion: "If you had a system that automatically detected these days and looked
up news, what would that be the beginning of?" *(Foreshadowing: LLM sentiment pipeline.)*

**Muddiest Point:**
> *"The muddiest point from tonight was ___."*

**Notebook submission:** Push `W02_workshop_ohlcv_[initials].ipynb` to GitHub.

---

## Friday, April 25, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation (third student)

Standard checklist. Note any notable market events this week — earnings, macro data.
Flag anything that connects to the order types and volume concepts from this week.

---

### Friday, April 25, 2026 — Review & Market Session
**Time:** 8:00–9:30 PM EST
**Topic:** Week 2 Review + Market Autopsy — Order Flow in Action

---

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 minutes

**Questions:**

1. "Explain the difference between a stop order and a stop-limit order.
   Give me a scenario where the stop-limit fails you."

2. "What is market impact? If I want to buy $1 million of a small-cap stock with
   100,000 average daily volume — what happens?"

3. "In Wednesday's notebook, what does the `Vol_Ratio` column tell us?
   A Vol_Ratio of 3.5 on a down day — what might that indicate?"

4. "We said zero-commission brokers still cost you money. Explain the mechanism
   of payment for order flow to someone who has never heard of it."

5. "What was the best trade setup you *saw* this week — not took, just saw?
   Walk me through why it was interesting."

---

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 minutes

**Hypothesis Audit:** Review and close all this week's hypotheses.

**Chart Review focus this week:**
- Pull up SPY on 5-minute timeframe for a portion of a volatile intraday session.
  Identify: opening range, midday consolidation, afternoon trend.
  "This is what order flow looks like from the outside. The opening burst is retail
  and program trading. The midday quiet is market makers and institutions.
  The afternoon move is often institutions leaning toward the close."

- Show a stock that had a high-impact day this week (from student watchlists if possible).
  "Look at volume at the open versus midday. Notice the gap. Where would a stop order
  below the prior close have gotten triggered?"

**Sector Rotation:** Walk through the week's sector performance.
Ask: "Anything change from last week? Is the rotation consistent with macro conditions?"

---

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 minutes

Observe and narrate. Add to last week's observations:
"Notice how the put/call ratio changes as the week progresses. It often elevates
going into weekends — institutions hedge their exposure over the two-day close.
We can't trade yet, but log what you see. This builds your intuition library."

---

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 minutes

**Next week's topic:** Performance metrics and the 9-step quant workflow.
This is the transition from "understanding markets" to "thinking like a quant."

**Assign reading:**
- Wiki Section 3.1 — Quant Workflow (memorize all 9 steps)
- Wiki Section 3.3 — Performance Metrics (full table — understand every metric)
- Wiki Section 3.2 — Descriptive statistics only (mean, std, skewness, rolling)

**Flag upcoming:** Week 4 closes with Milestone 1 oral assessment.
Students should begin reviewing all Month 1 material from this point forward.

**DMB rotation:** Assign next week's student leads.

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

---

# WEEK 3 — Measuring Markets & The Quant Workflow
**Theme:** From market observer to market analyst. How quants measure, evaluate, and think.

---

## Monday, April 27, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "Find any investment, fund, or strategy online that publishes
its Sharpe ratio. Write it down — what's the number and what does it claim to mean?
Bring it to class tonight."

---

### Monday, April 27, 2026 — Theory Session
**Time:** 8:00–9:30 PM EST
**Topic:** The Quant Workflow & Core Performance Metrics
**Curriculum source:** Wiki Sections 3.1, 3.3

#### Pre-Session Requirements
- [ ] Wiki Section 3.1 read — 9-step workflow memorized
- [ ] Wiki Section 3.3 read — performance metrics table reviewed
- [ ] Wiki Section 3.2 (descriptive stats) read
- [ ] Sharpe ratio observation logged

---

#### Block 1 — Day Review & Reading Check (8:00–8:15 PM) | 15 minutes

"Who found a published Sharpe ratio today? Tell me the number.
Do you trust it? Why might a published Sharpe be misleading?"

Cold-call: "Name all 9 steps of the quant workflow in order. No notes."
Give the student time. If they stall, other students can help — but everyone
should work toward knowing this cold. It is the skeleton of the course.

---

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 minutes

**Topic A: The 9-Step Quant Workflow (20 min)**

Walk through Wiki Section 3.1 in detail. For each step, make it concrete:

- **Step 1 — Hypothesis:** "Not 'I think AAPL will go up.' That's not a hypothesis.
  A hypothesis is: 'Stocks with RSI below 30 that close above the 20-day SMA on high volume
  tend to outperform the market over the next 5 days.' Specific. Testable. Measurable."

- **Step 2 — Data Acquisition:** "We already did this Wednesday. yfinance, Alpaca, FRED.
  But data quality matters — the best model on bad data is worse than no model."

- **Step 3 — Feature Engineering:** "Raw OHLCV is not a signal. RSI derived from Close
  is a signal. A 20-day return rank across 500 stocks is a signal.
  Feature engineering is the art of turning data into prediction-relevant inputs."

- **Step 4 — Statistical Testing:** "Before you build a model, test if the signal
  even has predictive value. If stocks with RSI < 30 don't outperform ANY more often
  than random — your hypothesis is wrong. Kill it. Move on."

- **Steps 5–9:** Walk through model → backtest → risk → paper trade → review.
  Emphasize the loop: "This is not linear. You iterate. Most hypotheses fail.
  That's the job."

**Topic B: Performance Metrics (20 min)**

Walk through Wiki Section 3.3 metrics table. For each metric, use a concrete example:

- **Sharpe Ratio:** "Hedge fund A returns 20%/year. Hedge fund B returns 15%/year.
  Which is better? You can't answer without knowing the volatility.
  If A had 40% annual volatility and B had 5%, B is far superior on a risk-adjusted basis.
  Sharpe tells you return per unit of risk taken."

- **Max Drawdown:** "If your portfolio went from $10,000 to $7,000 before recovering —
  that's a 30% max drawdown. Ask yourself: could you psychologically hold through
  a 30% loss without abandoning the strategy? Most people can't. Size your exposure
  so the drawdown you can tolerate matches your strategy's historical worst."

- **Win Rate + R:R:** "A 40% win rate is not a bad strategy. If your average winner
  is 3× your average loser — you make money at 40% win rate.
  A 70% win rate with a 0.5 R:R is a losing strategy. Never judge by win rate alone."

- **Expectancy:** "Expected value per trade = (Win Rate × Avg Win) − (Loss Rate × Avg Loss).
  If this is positive, the strategy makes money over time, in expectation.
  This is the only number that matters in the long run."

---

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 minutes

1. "Backtesting shows a Sharpe ratio of 2.5 over 5 years of historical data.
   You deploy it live. After 3 months, the Sharpe is 0.4. What happened?
   Give me 3 possible explanations."
   *(Overfitting. Regime change. Transaction costs not modeled. Market adapted.)*

2. "Devil's advocate: Is the quant workflow just a sophisticated way of fitting
   patterns to historical data? How would you prove your strategy is real alpha
   versus a historical coincidence?"
   *(Out-of-sample testing. Walk-forward. Causal mechanism not just correlation.)*

3. "A strategy has a win rate of 80% but a Sharpe ratio of 0.3. How is this possible?
   What does it imply about the loss structure?"
   *(Small frequent wins, occasional catastrophic losses. Classic risk of options selling
   or mean-reversion without stops.)*

---

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 minutes

**Wednesday workshop:**
"We calculate all the metrics we discussed tonight on real return data.
Starter notebook: `W03_workshop_metrics_starter.ipynb`
Come ready to implement Sharpe, drawdown, and expectancy from scratch in Python.
No importing from a library — we build them ourselves first."

**Pre-reading for next Monday (Week 4 — review week):**
- Review all of Wiki Sections 2 and 3 — everything from Month 1
- Review your own weekly notes from Weeks 1–3
- Glossary: review the entire glossary — know every term

**Milestone 1 reminder:** End of Week 4. Oral assessment.
"Treat your pre-reading this weekend as exam preparation. Any concept from Weeks 1–3
is fair game. No notes during the assessment."

---

## Wednesday, April 29, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Observation Assignment:**
"Before tonight's class, find a mutual fund or ETF that publishes its 3-year Sharpe ratio
and maximum drawdown in its factsheet. Write both numbers down. We'll use them tonight."

---

### Wednesday, April 29, 2026 — Workshop Session
**Time:** 8:00–9:30 PM EST
**Topic:** Building Performance Metrics from Scratch in Python
**Curriculum source:** Wiki Section 3.3, Code Pattern 4
**Notebook:** `W03_workshop_metrics_[initials].ipynb`

---

#### Block 1 — Framing & Context Bridge (8:00–8:10 PM) | 10 minutes

"Monday we defined every performance metric. Tonight we implement them.
There are libraries that compute these for you — `quantstats`, `pyfolio`.
We are NOT using them tonight. We build from scratch first.

Why? Because if you use a library you don't understand, you don't know when it's wrong.
And it will be wrong. Understanding the math behind the metric
is the only way to catch errors and know what you're actually measuring."

---

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 minutes

```python
import yfinance as yf
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# Fetch 3 years of SPY data
df = yf.download("SPY", period="3y", interval="1d")
df['Return'] = df['Close'].pct_change().dropna()
returns = df['Return'].dropna()
print(f"Working with {len(returns)} daily returns")
print(f"Date range: {returns.index[0].date()} to {returns.index[-1].date()}")
```

**Step 1 — Total and annualized return (5 min)**
```python
def total_return(returns):
    """Compound total return over the period."""
    return (1 + returns).prod() - 1

def annualized_return(returns, periods_per_year=252):
    """Annualized return assuming daily returns."""
    n = len(returns)
    return (1 + total_return(returns)) ** (periods_per_year / n) - 1

print(f"Total Return:     {total_return(returns):.2%}")
print(f"Annualized Return: {annualized_return(returns):.2%}")
```

**Step 2 — Volatility (5 min)**
```python
def annual_volatility(returns, periods_per_year=252):
    """Annualized standard deviation of daily returns."""
    return returns.std() * np.sqrt(periods_per_year)

print(f"Annual Volatility: {annual_volatility(returns):.2%}")
```
*"Why multiply by sqrt(252)? Because variance scales linearly with time,
and standard deviation scales with the square root of time.
252 trading days per year — so daily std × √252 = annual std."*

**Step 3 — Sharpe Ratio (8 min)**
```python
def sharpe_ratio(returns, risk_free_rate=0.05, periods_per_year=252):
    """
    Sharpe Ratio: excess return per unit of risk.
    risk_free_rate: annual rate (use current 3-month T-bill rate)
    """
    daily_rf = risk_free_rate / periods_per_year
    excess_returns = returns - daily_rf
    if excess_returns.std() == 0:
        return 0
    return (excess_returns.mean() / excess_returns.std()) * np.sqrt(periods_per_year)

sharpe = sharpe_ratio(returns)
print(f"Sharpe Ratio: {sharpe:.3f}")
print("Interpretation:", end=" ")
if sharpe > 1.5:
    print("Excellent")
elif sharpe > 1.0:
    print("Good")
elif sharpe > 0.5:
    print("Acceptable")
else:
    print("Poor")
```

**Step 4 — Maximum Drawdown (12 min)**
```python
def max_drawdown(returns):
    """
    Maximum peak-to-trough decline in cumulative returns.
    Returns the drawdown as a negative percentage.
    """
    cumulative = (1 + returns).cumprod()
    rolling_max = cumulative.cummax()
    drawdown = (cumulative - rolling_max) / rolling_max
    return drawdown.min()

def drawdown_series(returns):
    """Return the full drawdown time series for visualization."""
    cumulative = (1 + returns).cumprod()
    rolling_max = cumulative.cummax()
    return (cumulative - rolling_max) / rolling_max

mdd = max_drawdown(returns)
print(f"Maximum Drawdown: {mdd:.2%}")

# Visualize cumulative return and drawdown
fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(14, 8), sharex=True)

cumret = (1 + returns).cumprod()
ax1.plot(cumret.index, cumret, color='steelblue', lw=1.5)
ax1.set_title('SPY — Cumulative Return (3 Years)', fontsize=13)
ax1.set_ylabel('Growth of $1')
ax1.grid(True, alpha=0.3)

dd_series = drawdown_series(returns)
ax2.fill_between(dd_series.index, dd_series, 0, color='red', alpha=0.4)
ax2.set_title('Drawdown from Peak', fontsize=13)
ax2.set_ylabel('Drawdown (%)')
ax2.grid(True, alpha=0.3)

plt.tight_layout()
plt.show()
```

**Step 5 — Win rate and expectancy (10 min)**
```python
def win_rate(returns):
    """Percentage of positive return days."""
    return (returns > 0).mean()

def expectancy(returns):
    """
    Expected value per trade/period.
    E = (Win Rate × Avg Win) - (Loss Rate × Avg Loss)
    """
    wins = returns[returns > 0]
    losses = returns[returns < 0]

    win_r = len(wins) / len(returns)
    loss_r = len(losses) / len(returns)
    avg_win = wins.mean() if len(wins) > 0 else 0
    avg_loss = abs(losses.mean()) if len(losses) > 0 else 0

    e = (win_r * avg_win) - (loss_r * avg_loss)

    print(f"Win Rate:    {win_r:.2%}")
    print(f"Loss Rate:   {loss_r:.2%}")
    print(f"Avg Win:     {avg_win:.4%}")
    print(f"Avg Loss:    {avg_loss:.4%}")
    print(f"R:R Ratio:   {avg_win/avg_loss:.2f}")
    print(f"Expectancy:  {e:.4%} per day")
    return e

expectancy(returns)
```

---

#### Block 3 — Independent / Pair Work (8:50–9:15 PM) | 25 minutes

**Core Exercise:**
Run all 5 metric functions on 3 different assets — compare SPY to QQQ and
one high-volatility stock (student's choice). Answer in markdown:
1. Which asset had the best Sharpe? Does that surprise you?
2. Which had the worst max drawdown? When did the peak-to-trough occur?
3. Using the fund/ETF data from the DMB observation — does your calculated
   Sharpe match what was published? If not, why might they differ?

**Extension Challenge:**
Wrap all metrics into a single `performance_summary()` function that takes
a return series and prints a formatted report. Then run it on all 3 assets
and build a comparison DataFrame.

---

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 minutes

**Share-out:** Focus on Sharpe ratio comparison across assets.
"Which surprised you most? Which metric felt most useful for comparing strategies?"

**Muddiest Point:**
> *"The muddiest point from tonight was ___."*

**Notebook submission:** Push `W03_workshop_metrics_[initials].ipynb` to GitHub.

---

## Friday, May 1, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Observation Assignment:**
"Before tonight's class, calculate the approximate Sharpe ratio for SPY this week.
Use the last 5 days of returns (this week only). What does the weekly Sharpe look like?
Is this meaningful? We'll debate it tonight."

---

### Friday, May 1, 2026 — Review & Market Session
**Time:** 8:00–9:30 PM EST
**Topic:** Week 3 Review + Metrics in the Real Market + Milestone 1 Prep

---

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 minutes

1. "Recite the 9-step quant workflow from memory. Every step."
2. "What is the Sharpe ratio telling you that a simple return figure cannot?
   Give me the formula and explain each term."
3. "In Wednesday's notebook — why do we multiply standard deviation by √252?
   Explain the math."
4. "Max drawdown of −28%. Sharpe of 1.1. Is this a good strategy? Defend your answer."
5. "What is expectancy? Give me a strategy that has a 35% win rate but is still profitable."

---

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 minutes

**Hypothesis audit:** Close all this week's hypotheses.

**Chart review — apply metrics:**
"This week we're going to think about the market's behavior in metric terms.
SPY's weekly return was ___%. Its high-low range was ___%.
The weekly drawdown from Monday's open to the lowest intraday point was ___%.
These are the same metrics we calculated Wednesday — now we're reading them on real data."

Walk through: "If SPY this week were a strategy in a backtest, what would the
weekly Sharpe look like? The student from the DMB observation calculated this —
what did you get? Is a single-week Sharpe meaningful? Why not?"

*(Answer: No. Sharpe requires many observations to be statistically meaningful.
A single week's Sharpe is noise. This is a setup for next week's statistics content.)*

---

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 minutes

Continue observation. Specifically note put/call ratio and VIX behavior leading
into the weekend. Ask: "Does VIX tend to move before weekends? Why might that be?"

---

#### Block 4 — Milestone 1 Preview & Close (9:20–9:30 PM) | 10 minutes

**Milestone 1 is next Friday, May 8.**

"The oral assessment will be 20 minutes each, one on one.
Any topic from Weeks 1–3 is fair game. I will ask you to explain concepts
as if you're teaching them. You will be asked to interpret a chart, a metric,
and an order scenario. There are no trick questions. If you did the work, you pass.

Spend this weekend reviewing:
- All three weekly review logs
- Your Cornell notes from all three Monday sessions
- The full glossary — every term

Monday will be a review session — we'll use the entire 90 minutes to drill
concepts, answer questions, and make sure everyone is ready."

**DMB rotation for Week 4:** Assign all three leads.

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

---

# WEEK 4 — Integration, Review & Milestone 1
**Theme:** Solidifying everything from Month 1. Demonstrating true comprehension.

---

## Monday, May 4, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

**Observation Assignment:**
"Today, observe the market and try to connect every movement you see to something
we've studied in the last three weeks. Bring 2–3 connections to class tonight."

---

### Monday, May 4, 2026 — Theory Session
**Time:** 8:00–9:30 PM EST
**Topic:** Month 1 Integration Review — All Concepts, No New Material
**Curriculum source:** All of Sections 2, 3.1, 3.3

---

#### Block 1 — Day Review (8:00–8:15 PM) | 15 minutes

"What market connections did you find today? Walk me through them.
I want to hear the concept, the observation, and the link between them."

---

#### Block 2 — Structured Review (8:15–8:55 PM) | 40 minutes

No new material tonight. This block is entirely student-driven review.
Instructor facilitates. Students teach each other.

**Format — Lightning Round (20 min):**
Rapid-fire cold calls. One student, one term, one definition. Fast and precise.
- Asset classes (all 7) — what, characteristics, examples
- Order types (all 6) — definition, use case, risk
- Market participants (all 6) — role, incentive, market impact
- Indices (all 5) — what it tracks, ticker, why it matters
- Quant workflow (all 9 steps) — name and one-sentence description
- Performance metrics (all 9) — definition and "good" value

**Format — Concept Pairs (20 min):**
Split into pairs. Each pair gets assigned one concept from the month.
They have 3 minutes to prepare a 2-minute explanation.
Then they teach it to the class. Class asks one question each.

Concepts to assign:
- Bid-ask spread and slippage (pair 1)
- Sharpe ratio and Sortino ratio (pair 2)
- Max drawdown and Calmar ratio (pair 3)
- Market makers and HFTs (pair 4)
- Stop orders and stop-limit orders (pair 5)
- Quant workflow steps 1–5 (pair 6)

---

#### Block 3 — Milestone Simulation (8:55–9:15 PM) | 20 minutes

Run a practice version of the oral assessment. Pick 2–3 students and run
shortened versions of the real assessment questions:

Sample questions:
- "Explain market microstructure. What is the order book? Give me a concrete example."
- "A strategy has Sharpe 1.8, max drawdown −12%, win rate 42%. Evaluate it."
- "Walk me through steps 1–5 of the quant workflow using a real trade setup as your example."

After each, give brief feedback — not a grade, just: stronger, sharper, more specific.

---

#### Block 4 — Final Prep & Close (9:15–9:30 PM) | 15 minutes

"Friday is Milestone 1. Wednesday workshop is the last session before it.
Wednesday we will build a complete single-stock analysis notebook —
this is also your practice for talking through quantitative work out loud.

Any questions about what to expect Friday? Ask them now."

No new reading assigned. Existing material only.

---

## Wednesday, May 6, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation

---

### Wednesday, May 6, 2026 — Workshop Session
**Time:** 8:00–9:30 PM EST
**Topic:** Milestone Prep — Full Single-Stock Analysis Notebook
**Curriculum source:** All of Month 1 — integration exercise
**Notebook:** `W04_workshop_integration_[initials].ipynb`

---

#### Block 1 — Framing (8:00–8:10 PM) | 10 minutes

"Tonight's workshop is different. There's no guided build.
You have all the code you need from the last 3 weeks — the data pull, the flagging function,
the metrics. Tonight you apply all of it to a single stock of your choice.

The output is a complete analysis notebook: fetch data, clean it, flag notable days,
calculate all performance metrics, visualize price and drawdown.

Then write a 300-word markdown analysis at the bottom answering:
'Based purely on this data, what kind of instrument is this? Is it suitable as a
trading target? What risks does it carry?'

This notebook is your Milestone 1 artifact. It shows you can do the work."

---

#### Block 2 — Independent Work (8:10–9:10 PM) | 60 minutes

Students work independently. No guided build. Instructor circulates and asks
probing questions — does not provide solutions.

Recommended structure students should aim for:
```
Section 1: Data Acquisition
  - Fetch 2 years of daily OHLCV
  - Display head, tail, describe, info, null check

Section 2: Feature Engineering
  - Daily return
  - HL_Range_Pct
  - Volume ratio and flags

Section 3: Performance Metrics
  - Total return and annualized return
  - Annual volatility
  - Sharpe ratio
  - Max drawdown with visualization
  - Win rate and expectancy

Section 4: Visualization
  - Price and volume chart
  - Cumulative return and drawdown chart
  - Notable days marked

Section 5: Written Analysis (300 words minimum)
  - What did the data tell you?
  - What risks does this instrument carry?
  - Would this be a suitable paper trading target? Why?
```

---

#### Block 3 — Share-Out & Muddiest Point (9:10–9:30 PM) | 20 minutes

**Share-out (15 min):** 3 students present their analysis.
Focus on the written section — "Did your interpretation of the data make sense?
Did you connect the metrics to real-world meaning?"

**Muddiest Point (5 min):**
> *"The muddiest point — anything still unclear before Friday's assessment — was ___."*

**Notebook submission:** `W04_workshop_integration_[initials].ipynb` pushed to GitHub.

---

## Friday, May 8, 2026
### DMB — Daily Market Brief
**Time:** 9:00–10:00 AM EST
**Led by:** Student rotation (standard format)

---

### Friday, May 8, 2026 — Milestone 1 Oral Assessment
**Time:** 8:00–9:30 PM EST
**Format:** Individual oral assessments — 20 minutes per student
**Note:** Run assessments sequentially. Other students observe or study quietly.
If class is large, assessments may continue into a second session.

---

#### Assessment Format (20 minutes per student)

**Part 1 — Concept Recall (5 min)**
Instructor asks 3 rapid-fire definitional questions from any Month 1 concept.
Student must answer without notes. Examples:
- "What is the bid-ask spread? Give me the formula for the cost to a trader."
- "Name the 9 steps of the quant workflow."
- "What does a Sharpe ratio of 0.4 tell you?"

**Part 2 — Applied Interpretation (8 min)**
Instructor presents one of the following scenarios. Student interprets out loud:
- A performance metric table from a real or hypothetical strategy
- A candlestick chart with a notable week of price action to describe
- A brief description of an order book scenario to analyze

**Part 3 — Integration Question (7 min)**
One open-ended question requiring synthesis of multiple concepts:
- "A retail trader wants to day trade a small-cap stock with $50,000.
  Walk me through every risk they face — from market structure, to order mechanics,
  to performance measurement."
- "Using the quant workflow, walk me through the first 4 steps for a hypothesis
  you would personally want to test."

**Pass criteria:** Student can explain any concept in their own words with a real-world
example, without notes, demonstrating genuine understanding not memorization.

---

#### After Assessments — Month 1 Close (remaining time)

Once all assessments are complete:

**Month 1 retrospective (10 min):**
"Looking back at Week 1 — what feels completely obvious now that felt foreign then?
What was the hardest concept of the month? What surprised you most about how markets work?"

**Month 2 preview (5 min):**
"Next month we go from understanding markets to building strategies.
We add statistics, indicators, backtesting, and AI. The Python work gets significantly heavier.
Everything we did this month is the foundation that makes Month 2 possible."

**Pre-reading for Month 2, Week 1:**
- Wiki Section 3.2 — Full statistics section (hypothesis testing, time series)
- Wiki Section 4.2 — Full Python stack table
- Wiki Section 5.1 — Technical indicators overview

**Monthly One-Liner:**
> *"Month 1 taught me ___, and Month 2 I want to ___."*

---

---

## Month 1 — Instructor Summary Notes

### Content Coverage Checklist

- [ ] Wiki Section 2.1 — Asset classes (Week 1 Monday)
- [ ] Wiki Section 2.2 — Market structure and order types (Week 2 Monday)
- [ ] Wiki Section 2.3 — Market indices (Week 1–2 reading)
- [ ] Wiki Section 2.4 — Market participants (Week 1 Monday)
- [ ] Wiki Section 3.1 — Quant workflow (Week 3 Monday)
- [ ] Wiki Section 3.2 — Descriptive statistics (Week 3 reading)
- [ ] Wiki Section 3.3 — Performance metrics (Week 3 Monday)
- [ ] Wiki Section 4.1 — Python environment (Week 1 Wednesday)
- [ ] Wiki Section 4.2 — Data acquisition (Weeks 1–2 Wednesday)
- [ ] Wiki Section 12 — Glossary (ongoing reference)

### Workshops Delivered

| Workshop | Notebook | Key Skills |
|---------|---------|-----------|
| W01 | `W01_workshop_market_data` | yfinance data pull, OHLCV inspection, basic visualization |
| W02 | `W02_workshop_ohlcv` | Feature engineering, volume flags, reusable functions |
| W03 | `W03_workshop_metrics` | Sharpe, drawdown, win rate, expectancy from scratch |
| W04 | `W04_workshop_integration` | Full single-stock analysis — integration of all W1–W3 skills |

### Hypotheses Logged This Month

All hypotheses from Weeks 1–4 should be in `hypothesis_log_master.md` with outcomes filled in.
Review before Month 2 begins — what patterns emerged in student predictions?
What were the most common errors in hypothesis construction?

### Milestone 1 Results

Document each student's assessment outcome:
```
Student: [Name]
Date: May 8, 2026
Outcome: Pass / Needs Review
Strongest area: ___
Area to watch in Month 2: ___
Notes: ___
```

### Async Packages to Pre-Build Before Month 2

Based on Month 1 experience, build async fallbacks now for:
- Memorial Day week (late May) — high cancellation risk
- Any week where Muddiest Points suggest content gaps

---

*FINN — Month 01 Lesson Plan*
*Foundation Phase: Market Literacy & Quant Mindset*
*Dates: April 13 – May 9, 2026*
*Next: FINN_Month02.md — Quant Methods, AI Integration & Strategy Presentation*
