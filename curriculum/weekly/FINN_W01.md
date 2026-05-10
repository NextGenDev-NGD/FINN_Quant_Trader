# FINN — Week 1: Market Structure & The Trading Landscape
## Foundation Phase | Month 1: Market Literacy & Quant Mindset
**Dates:** April 13–18, 2026
**Week Number:** 1 of 24

---

## WEEK OVERVIEW

### Theme
Understanding what we are trading, where we are trading it, and who else is in the room. This is the first week of the course — students arrive fresh and leave with a complete mental model of the market ecosystem.

### Learning Objectives
By the end of this week, students will be able to:
- Define and correctly describe all major asset classes with real-world examples
- Explain market structure: exchanges, market hours, pre-market vs. regular hours
- Identify the major market participants and their incentives and market impact
- Read and interpret a live order book at the Level 2 / bid-ask level
- Fetch, inspect, and visualize 1 year of OHLCV data in Python using `yfinance`
- Write a first specific, falsifiable market hypothesis in the standard log format
- Explain why high volume is often an institutional footprint

### Materials Needed
- TradingView (free account) — for Level 2 / order book, SPY weekly chart, VIX daily
- Webull account (from onboarding week) — paper trading verified working
- `finnenv` Python environment — `yfinance`, `pandas`, `numpy`, `matplotlib` installed
- GitHub repo cloned locally and accessible
- Starter notebook: `W01_workshop_market_data_starter.ipynb` (push to GitHub by Tuesday evening)
- Finviz.com access (free) — for sector heatmap
- Hypothesis log: `hypothesis_log_master.md` — created during onboarding week

### Pre-Week Checklist (Instructor)
- [ ] Verify every student has `finnenv` running with all packages installed
- [ ] Push `W01_workshop_market_data_starter.ipynb` to GitHub by Tuesday evening
- [ ] Have TradingView open with SPY, QQQ, VIX loaded and Level 2 ready to display
- [ ] Prepare watchlist of 5–7 tickers for Monday DMB demonstration (first week — instructor leads)
- [ ] Prepare 3-ticker brief template examples (Monday evening demonstration)
- [ ] Prepare observation assignment cards or verbal prompts for each DMB block
- [ ] Note: NO pre-reading assigned for Week 1 — students arrive fresh
- [ ] Assign the first student-led DMB brief slot for Monday April 20 before Friday ends

---

## MONDAY — April 13, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Instructor (Week 1 — instructor leads ALL DMBs to model the format)

**Instructor note:** This is the first DMB ever. Narrate every item on the checklist — explain what each data point means and why we look at it. Students have never done this before. The goal is not speed — it is building the mental model of what "pre-market context" means. Spend extra time on the "why."

#### Block 1 — Pre-Market Scan (9:00–9:15 AM)
Work through the full checklist aloud. For each item, explain what it is and why it's on the list:

- [ ] **ES, NQ, YM futures** — direction and magnitude pre-market. "These are S&P 500, Nasdaq, and Dow futures. They tell us where the market wants to open before the bell."
- [ ] **VIX level** — introduce what VIX is and why it matters. "The VIX is the market's fear gauge. Above 20 means elevated anxiety. Below 15 means complacency. It affects every trade."
- [ ] **Macro calendar** — any events today? Walk through how to find it. "Check tradingeconomics.com or the economic calendar on TradingView. Fed speeches, CPI data, jobs reports — all move markets."
- [ ] **Earnings calendar** — introduce the concept, show where to find it. "Companies report earnings quarterly. Those days create massive volatility. We track them."
- [ ] **Finviz sector heatmap** — walk through reading it for the first time. "Green = sectors gaining. Red = sectors losing. The pattern tells us where money is flowing."
- [ ] **10-year yield** — introduce the concept of risk-on/risk-off. "When yields rise, money moves from growth stocks to bonds. Risk-off. When yields fall — risk-on. Watch this every day."
- [ ] **BTC/ETH overnight** — explain why crypto is used as a sentiment signal. "Crypto trades 24/7. An overnight Bitcoin crash often signals global risk appetite falling before our markets open."

> **Resource:** Information sources map — 6 categories and 30+ sources covering futures, economic calendars, earnings, heatmaps, sentiment signals, and news feeds → `resources/infographics/ig_info_sources.html` + `resources/handbook/FINN_HB_P4_MarketContext.md` §4.2

#### Block 2 — Student-Led Brief (9:15–9:35 AM)
Week 1: Instructor demonstrates what a student brief will look like. Choose 3 tickers from a prepared watchlist and walk through the brief format live:

```
Ticker:       SPY
Current:      $[PRICE] | [+/- % from yesterday]
Setup:        SPY is [describe price action in one sentence]
Catalyst:     [Any news or event to watch today]
Hypothesis:   [A specific, falsifiable statement about SPY today]
Signal Check: [Note VIX level and what it implies]
```

Tell students: "Starting next Monday, one of you will do this. By Week 3, you'll all have led this block at least once. Today, just watch how the brief connects pre-market context to a specific ticker setup."

#### Block 3 — Hypothesis Setting (9:35–9:50 AM)
First hypothesis of the course. Instructor writes it live on the board and explains the format:

```
Date:          2026-04-13
Submitted by:  FINN Class
Hypothesis:    [Instructor writes a specific hypothesis about today's market]
Basis:         [Based on pre-market data from Block 1]
Timeframe:     Intraday
Outcome:       [TBD — reviewed Friday]
```

Explain: "Every hypothesis we write this year goes in this log. We will look back at all of them at the end of Month 6. The log is the course's memory. A good hypothesis is specific, falsifiable, and based on evidence — not a feeling."

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**This week's observation:** "During market hours today, find a stock that is moving significantly — up or down more than 2%. Write down: the ticker, the price move, and your best guess at what caused it. Bring this to tonight's class."

---

### EVENING: Theory Session (8:00–9:30 PM EST)
**Topic:** Asset Classes, Market Structure & Who's In the Room
**Curriculum Source:** Wiki Section 2.1, 2.4

#### Pre-Session Setup
- [ ] No pre-reading assigned for Week 1 — students arrive fresh
- [ ] Observation from morning DMB logged and ready to share
- [ ] GitHub account created and repo initialized (from onboarding week)
- [ ] TradingView open and ready with Level 2 display for order book demonstration
- [ ] Whiteboard or screen-share ready for order book diagram

#### Block 1 — Day Review & Introductions (8:00–8:15 PM) | 15 min

Open with: *"What did the market do today? Who found a stock moving more than 2%?"*

Call on 3–4 students to share their observation assignment results. For each one:
- What was the ticker?
- What moved it?
- Is this something we could have predicted? Why or why not?

This establishes immediately that the course is rooted in real market behavior. There is no warmup — the market is the first topic, every single session.

Then: "Before we go deep on concepts, let's establish what we're actually dealing with. Tonight we answer: what can you trade, and who else is trading it?"

#### Block 2 — Core Concept Delivery (8:15–8:55 PM) | 40 min

**Topic A: Asset Classes (15 min)**

Walk through the asset class table from Wiki Section 2.1. For each class, do NOT just read the table — give a vivid real-world example:

- **Equities:** "When you buy one share of AAPL, you own a fractional piece of Apple Inc. If they make money, you make money. If they go bankrupt, your share is worth zero."
- **ETFs:** "SPY holds all 500 S&P 500 companies proportionally. Buying SPY is like buying the whole index in one trade. This is the benchmark we will measure everything against."
- **Options:** "A call option on NVDA at $900 gives you the right — not the obligation — to buy NVDA at $900 regardless of where it trades. We will not trade options in Month 1, but we will observe them every Friday."
- **Futures:** "An ES futures contract represents $50 × the S&P 500 index level. This is what we watch in the DMB every morning — it predicts where SPY will open."
- **Crypto:** "24/7 trading. No market close. We use BTC as a global risk appetite signal, not as a primary trading vehicle in this course."
- **Forex:** "EUR/USD tells you how many dollars one euro buys. Macro-driven. The Fed raising rates strengthens the dollar — this ripples across all asset classes."

**Scope reminder:** Primary focus is equities and ETFs. Everything else is context.

> **Resource:** Trade type taxonomy — 8 trade styles with time horizon, capital requirements, and skill level → `resources/infographics/ig_trade_types.html` + `resources/handbook/FINN_HB_P1_GettingStarted.md` §1.1

**Topic B: Market Structure (15 min)**

Walk through Wiki Section 2.2 — exchanges, market hours, and the order book concept.

Key points to hit with force:
- "Pre-market and after-hours trading is thinner — the spread is wider, moves are more violent, and prices are less reliable. Institutions wait for the open."
- "The order book is the real market. Price is just the last agreed transaction. What's pending — the bids and asks — tells you the real story."
- Draw the order book on a whiteboard or show a live Level 2 example in TradingView: show bid stack, ask stack, and the spread between them.

> **Resource:** TradingView platform guide — interface walkthrough, chart setup, Level 2 display, and watchlist configuration → `resources/infographics/ig_platform_tradingview.html` + `resources/handbook/FINN_HB_P1_GettingStarted.md` §1.2

**Topic C: Market Participants (10 min)**

Walk through Wiki Section 2.4 — retail, institutional, hedge funds, market makers, HFTs.

The critical insight to land hard: "We are retail traders. We are the smallest fish. Understanding what the bigger fish want — and when — is one of the most important edges we can develop. Institutions can't hide. Their footprints show up in volume and price action."

Ask rhetorically: "If a hedge fund wants to buy $500 million of SPY without moving the price, what do they do? They can't just hit market order. They slice it up over days. That's what institutional accumulation looks like on a chart — what retail calls 'sideways chop' is often a fund quietly building a position."

#### Block 3 — Socratic Discussion (8:55–9:15 PM) | 20 min

**Opening:** "No prepared questions tonight since this is Week 1. But I have some for you."

**Instructor questions:**

1. "We said retail traders are the smallest fish. Does that mean retail can't have an edge? What kind of edge could a small, fast, individual trader have that a $10 billion fund cannot?"
   *(Expected direction: size — retail can enter and exit small positions instantly without market impact. Speed in niches. No career risk.)*

2. "If market makers profit from the bid-ask spread, are they your enemy or your friend? Think about it from both angles."
   *(Expected direction: they're necessary — without them, no liquidity. But they take a toll on every transaction. Wide spreads on illiquid stocks eat your edge.)*

3. "Devil's advocate: If the stock market is just a mechanism for companies to raise capital, why should we expect price movements to be predictable at all?"
   *(Expected direction: they don't have to be perfectly predictable — just slightly more predictable than random, repeatedly, to generate alpha. That's the whole game.)*

**Instructor note:** Don't resolve these cleanly. Leave them open. Students should leave tonight thinking, not satisfied. The discomfort is productive.

#### Block 4 — Wednesday Setup & Close (9:15–9:30 PM) | 15 min

**Wednesday workshop assigned:**
"On Wednesday we open Python for the first time in this course. The exercise is simple: fetch market data for 5 tickers using yfinance, inspect the data structure, and answer 5 questions about what you see. The notebook starter will be in the GitHub repo by Tuesday evening. Pull it before Wednesday's DMB."

**Weekly hypotheses:** Students write their first 3 hypotheses in the log. Instructor helps if needed — emphasize specificity and falsifiability.

**Pre-reading for next Monday:**
- Wiki Section 2.2 (full — order types and microstructure in detail)
- Wiki Section 2.3 (market indices — read and memorize the table)
- Glossary entries: bid-ask spread, order book, liquidity, market maker, slippage

**Closing reflection:** Each student writes:
*"The most important thing I need to understand before Wednesday is ___."*
Collect these — read a few aloud anonymously before ending.

**Monday Deliverable:** Reading Notes + 3 Hypotheses submitted to hypothesis log by 11:59 PM

---

## WEDNESDAY — April 15, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Instructor (still modeling the format in Week 1)

#### Block 1 — Pre-Market Scan (9:00–9:15 AM)
Run standard pre-market checklist. Note anything that shifted since Monday. Specifically: "Did anything from Monday's hypothesis play out in Tuesday's market? Check the hypothesis log."

#### Block 2 — Student-Led Brief (9:15–9:35 AM)
Week 1: Instructor leads. Model the brief again — students observe. Choose 3 different tickers from Monday to show variety in setups.

#### Block 3 — Hypothesis Setting (9:35–9:50 AM)
Add Wednesday hypotheses to the log. Reference Monday's hypotheses — are they still valid?

#### Block 4 — Observation Assignment (9:50–10:00 AM)
**Today's observation:** "When you open your Python notebook tonight, look at the volume column for your 5 tickers. Find the single highest-volume day in the last year for each one. Write down the date. We'll discuss what likely caused it tonight."

---

### EVENING: Workshop Session (8:00–9:30 PM EST)
**Workshop:** W1 — Python Environment + First Market Data Pull
**Notebook:** `W01_workshop_market_data_[initials].ipynb`
**Curriculum Source:** Wiki Section 4.1, 4.2, Code Pattern 1

#### Pre-Session Setup
- [ ] `finnenv` activated via `C:\Users\[username]\finnenv\Scripts\Activate.ps1` (PowerShell — venv, not conda)
- [ ] `yfinance`, `pandas`, `numpy`, `matplotlib` installed and importable inside `finnenv`
- [ ] GitHub repo cloned locally — starter notebook pulled
- [ ] Starter notebook: `W01_workshop_market_data_starter.ipynb` open and ready

#### Block 1 — Framing (8:00–8:10 PM) | 10 min

"Monday we talked about asset classes, market structure, and who's in the room. Tonight we pull real market data for the first time and look at it as data scientists — not as traders reading charts, but as analysts inspecting a dataset.

The question tonight is not 'should I buy this stock?' The question is: 'What is this data, what does it contain, and what can it tell me?'

By the end of tonight you will have fetched data for 5 real tickers, inspected the schema, calculated a simple daily return series, and visualized price history. That's it. Simple. But you'll understand every line of code."

#### Block 2 — Guided Build (8:10–8:50 PM) | 40 min

Instructor opens a blank notebook and builds live. Students run every cell.

**Step 1 — Environment check (3 min)**
```python
# Confirm environment is working
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
*Pause: "Did everyone get 'All imports successful'? If not, stop — we fix this now."*

**Step 2 — Fetch single ticker (7 min)**
```python
# Fetch 1 year of daily OHLCV data for SPY
ticker = "SPY"
df = yf.download(ticker, period="1y", interval="1d", progress=False)
df.columns = [c[0] if isinstance(c, tuple) else c for c in df.columns]

print(f"Shape: {df.shape}")        # How many rows and columns?
print(f"\nColumn names:\n{df.columns.tolist()}")
print(f"\nFirst 5 rows:\n{df.head()}")
print(f"\nLast 5 rows:\n{df.tail()}")
print(f"\nData types:\n{df.dtypes}")
print(f"\nAny nulls?\n{df.isnull().sum()}")
```
*Pause: "What does each column represent? Open, High, Low, Close, Volume. What is the index? It's a DatetimeIndex — dates are the rows. This is a time series."*

**Step 3 — Summary statistics (5 min)**
```python
# Describe the dataset
print(df.describe())

# What was the highest closing price this year?
print(f"\nHighest close: ${df['Close'].max():.2f}")
print(f"Lowest close:  ${df['Close'].min():.2f}")
print(f"Average volume: {df['Volume'].mean():,.0f} shares/day")
```
*Deliberate mistake: Try `df['close']` (lowercase) — get a KeyError. Explain: "Column names are case-sensitive. This is one of the most common errors you will make. Good."*

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
*Ask: "What does the first row's Daily_Return show? NaN — why? Because there's no previous row to compare to. Always expect NaN on the first row of a pct_change. This is not an error."*

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
*Ask: "What happened on that date? Can anyone look it up right now? This connects to the DMB observation assignment from this morning."*

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

#### Block 3 — Independent Work (8:50–9:15 PM) | 25 min

**Core Exercise:**
Repeat the guided build for 4 additional tickers of the student's choice. Required: at least one ETF (QQQ or IWM), one large-cap stock, one stock they personally find interesting. Answer these 5 questions in markdown cells in the notebook:

```
1. Which of your 5 tickers had the highest average daily volume? Why might that be?
2. Which had the most volatile daily returns (highest standard deviation)?
3. What was the worst single-day return across all 5 tickers this year? What date?
4. Is there any visual relationship between price and volume in your charts?
5. Look up what happened on the highest-volume day for one of your tickers. What was the cause?
```

**Extension Challenge:**
Fetch data for all 5 tickers in a single loop. Normalize all closing prices to 100 at the start of the period (divide each by its first close × 100) and plot them on the same chart. This shows relative performance rather than absolute price.

```python
# Hint for extension:
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

#### Block 4 — Share-Out & Muddiest Point (9:15–9:30 PM) | 15 min

**Share-out (10 min):**
- 2 students share their volume analysis findings
- Focus discussion on: why does volume spike? What events cause extreme volume?
- Connect to Monday's concept: "High volume = institutional footprints."

**Muddiest Point (5 min):**
> *"The muddiest point from tonight — the thing I least understood — was ___."*

**Wednesday Deliverable:** Completed notebook `W01_workshop_market_data_[initials].ipynb` submitted to GitHub by 11:59 PM

---

## FRIDAY — April 17, 2026
### MORNING: Daily Market Brief (9:00–10:00 AM EST)

**Led by:** Instructor

Run standard checklist. Specifically flag: "Today is the first Friday. We will spend time in tonight's class reviewing the week's hypothesis log and looking at this week's charts. Make sure your hypothesis log entries are complete before tonight."

**Observation Assignment:** "Before tonight's class, pull up SPY on TradingView. Switch to a weekly candle view. Note where the week opened and where it is closing. Was it a bullish week, bearish week, or inside week? Write it down."

---

### EVENING: Review & Market Session (8:00–9:30 PM EST)

#### Pre-Session Setup
- [ ] Hypothesis log reviewed — know your Monday hypotheses' outcomes
- [ ] TradingView open: SPY weekly, QQQ daily, VIX daily
- [ ] Wednesday notebook reviewed and pushed to GitHub
- [ ] Finviz heatmap loaded for sector rotation review

#### Block 1 — Retrospective (8:00–8:30 PM) | 30 min

**Questions (select 3–4):**

1. "Explain asset classes as if someone who missed Monday asked you what we covered. Give me the whole picture in under 2 minutes."

2. "In Wednesday's notebook — what does `pct_change()` actually calculate? Walk me through the math on the first non-NaN row."

3. "What is the bid-ask spread, and why does it matter for a retail trader trying to enter and exit positions quickly?"

4. "We said market makers profit from the spread. Name a situation where being in an illiquid stock could cost you significantly more than you expected."

5. "What did the observation assignment tell you? You found a high-volume day — what caused it? What does that tell us about the relationship between news and price?"

#### Block 2 — Market Autopsy (8:30–9:05 PM) | 35 min

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

> **Resource:** Finviz platform guide — heatmap, screener, news, and futures overview → `resources/infographics/ig_platform_finviz.html` + `resources/handbook/FINN_HB_P1_GettingStarted.md` §1.4

Open Finviz heatmap. Walk through:
- "Which sectors were green this week? Which were red?"
- "Does this match the macro context from our DMBs?"
- "Is there a story here — rotation toward defense? Tech leading? Energy lagging?"
- Ask students: "What does this week's sector rotation suggest about how institutions were positioned?"

#### Block 3 — Derivatives Window (9:05–9:20 PM) | 15 min

**Week 1 — Observation only. Instructor narrates everything.**

Open TradingView or a free options scanner:
- "The put/call ratio today is ___. A high P/C ratio means more puts than calls are being bought — that's bearish sentiment. Low means complacency or bullish bets."
- "VIX term structure: if short-term VIX is higher than long-term VIX, the market expects near-term volatility — that's called backwardation."
- "Weekly options expired today. We don't trade them yet — but notice where SPY closed relative to the most popular strikes. This is called 'max pain.'"

Tell students: "For the next 8 weeks, you are observers here. Just watch, listen, and ask questions. By Month 3 you'll interpret this on your own."

> **Resource:** Reading the market open — opening types, Asia-Europe range, first-30-min patterns, and how to set context for the trading session → `resources/infographics/ig_market_open.html` + `resources/handbook/FINN_HB_P4_MarketContext.md` §4.3

#### Block 4 — Next Week Preview & Close (9:20–9:30 PM) | 10 min

**Next week's topic:** Order types, market microstructure, and the mechanics of execution.

**Assign reading:**
- Wiki Section 2.2 (full) — order types table, order book, bid-ask spread
- Wiki Section 2.3 — memorize the indices table
- Glossary: all entries starting with letters A–M

**DMB rotation:** Assign first student-led DMB brief for Monday April 20. Walk them through what to prepare: "Pick 3–5 tickers you want to follow. Prepare the brief template. Have TradingView open at 9:00 AM. You've got this."

**Upcoming macro events:** Review economic calendar for the week of April 20. Flag anything relevant (earnings reports, Fed speeches, macro data releases).

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

Read 3–4 aloud. Keep all in the course log.

---

## WEEKLY DELIVERABLES SUMMARY

| Deliverable | Due | Format |
|-------------|-----|--------|
| Reading Notes + 3 Hypotheses | Monday 11:59 PM | Markdown in hypothesis log |
| Workshop Notebook (W01) | Wednesday 11:59 PM | `.ipynb` pushed to GitHub |
| Weekly Review Log | Friday 11:59 PM | Markdown |
| Hypothesis Outcome Record | Friday 11:59 PM | Appended to hypothesis log |

---

## INSTRUCTOR NOTES FOR WEEK 1

**First session dynamics:** Students arrive with wildly varying backgrounds. Some have traded before; most haven't. The order book and bid-ask spread concepts land differently for each student. Use the live Level 2 demonstration in TradingView — seeing the numbers move in real time anchors the abstraction.

**Observation assignment follow-through:** The first observation assignment (find a stock moving >2%) sets the tone for the entire course. Treat it as a real assignment in Block 1 Monday evening. Call on every student, not just volunteers. This establishes the culture of accountability immediately.

**Python environment issues:** Expect 1–3 students to still have environment issues at Wednesday's workshop despite the onboarding week. Have a fallback: students without a working environment can pair with someone who does. Resolve 1:1 after class — never let setup issues consume class time.

**Socratic discussion tone:** Monday's questions are intentionally open and unanswerable. "Does retail have an edge?" is a lifelong debate. The goal is not resolution — it is establishing that we think critically here, not just absorb information. Students who try to give "right" answers quickly are the ones to push hardest.

**Volume analysis connection:** When students share their highest-volume day findings on Wednesday, connect the narrative to Monday's point about institutional footprints. Every major volume spike has a story. This habit of connecting data anomalies to real events is the foundation of good research.

**Week 1 common confusion:** Students often conflate price and value. "The stock went up — is the company worth more?" is a common confusion. Address it directly: "Price is what someone agreed to pay last. It may or may not reflect intrinsic value. We are studying price behavior, not valuation."

---

## WEEKLY RESOURCES

> Resources are labeled **[Pre-session]** (review before class) or **[Homework]** (explore after). FINN covers every concept live — these are your scaffolding, not your syllabus. Medium depth: some will come up in class, others extend what we covered.

---

### Monday — Asset Classes, Market Structure & Market Participants

- **[Article | Pre-session]** [How today's stock markets work](https://optiver.com/explainers/how-todays-stock-markets-work/) — Optiver (2022). Written by a market maker, not a textbook author. Covers the full life of a trade: from order placement through execution, clearing, and settlement. Read this before Monday — it gives you the vocabulary for the session.

- **[Article | Pre-session]** [Orders and the order book](https://optiver.com/explainers/orders-and-the-order-book/) — Optiver. Breaks down market orders, limit orders, and how the central limit order book (CLOB) prioritizes execution. This is the conceptual backbone for Monday's live Level 2 demonstration in TradingView.

- **[Article | Homework]** [Types of market participants](https://www.ig.com/en/ig-academy/how-trading-works/other-market-participants) — IG Academy. Clean breakdown of retail traders, institutional investors, market makers, and HFTs — exactly who we discuss in Monday's Block 2C. Read after class to reinforce the distinctions.

- **[Article | Homework]** [Retail vs. Institutional Investors: Key Differences](https://www.britannica.com/money/retail-vs-institutional-investor) — Britannica Money. Focuses on why size creates asymmetry — how the same market looks completely different depending on whether you're moving $5,000 or $500 million.

- **[YouTube | Pre-session]** [How does the stock market work?](https://www.youtube.com/watch?v=p7HKvqRI_Bo) — TED-Ed / Oliver Elfenbaum (2019, 4 min 30 sec). Animated, concise overview of how the stock market functions as a capital-raising mechanism. *Note: published 2019 — structural/definitional content, not methodology. Still fully accurate.* Watch this before Monday if you've never seen a stock market explained from first principles.

---

### Wednesday — Python Environment & First Market Data Pull

- **[Article | Pre-session]** [Pulling Historical Stock Data with YFinance: A Beginner's Guide](https://becomingquant.com/2026/01/23/pulling-historical-stock-data-with-yfinance-a-beginners-guide/) — Becoming Quant (January 2026). Covers OHLCV data structure, basic fetching, date ranges, and daily return calculation — mirrors exactly what Wednesday's workshop builds step by step. Read before the session.

- **[Article | Reference]** [yfinance Library — A Complete Guide](https://algotrading101.com/learn/yfinance-guide/) — AlgoTrading101. Comprehensive reference for the yfinance library: all major methods, parameters, and common patterns. Bookmark this — you'll return to it repeatedly throughout the course.

- **[Article | Homework]** [How to download market data with yfinance and Python](https://pythonfintech.com/articles/how-to-download-market-data-yfinance-python/) — PythonFinTech (March 2025). Walks through the download workflow with MultiIndex DataFrame handling and visualization — slightly beyond what we build in class, good next step.

- **[YouTube | Pre-session]** Search YouTube for: *"yfinance pandas tutorial Python stock data"* — filter by upload date (2022 or later). Look for a channel with clean, annotated code that builds a data pull and chart from scratch. Target: 15–25 min. Channels worth checking: **Coding Finance**, **Financial Python**, **PyQuant News**. If the presenter relies on Jupyter notebooks and explains every line — that's the right video.

---

### Friday — Chart Review, Hypothesis Audit & Sector Rotation

- **[Article | Pre-session]** [Inside The Market: Order Books And What You're Missing Out On](https://bookmap.com/blog/inside-the-market-order-books-and-what-youre-missing-out-on) — Bookmap (September 2024). Connects Monday's order book theory to what you'll actually see in TradingView Level 2: bid/ask depth, order types in real time, and how liquidity moves. Read before Friday's session.

- **[Article | Pre-session]** [Finviz Stock Screener Review: A Beginner's Guide](https://stockstotrade.com/finviz/) — StocksToTrade (2024). Covers the heatmap and sector group views we use in Friday's market autopsy. Skim the heatmap and groups sections before Friday — we'll use Finviz live.

- **[YouTube | Homework]** Search YouTube for: *"how to read candlestick charts for beginners"* — filter by upload date (2021 or later). Look for a video under 15 minutes. Focus on what open/high/low/close mean visually and how a candle's body and wick tell a story. This sets up Week 2's chart work. Channels worth checking: **Rayner Teo**, **Investopedia**, **The Plain Bagel**.

---

*FINN Week 1 — Market Structure & The Trading Landscape | Part of FINN_Month01.md*
