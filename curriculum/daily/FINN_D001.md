# FINN — Day 1
## Monday · April 13, 2026 · Week 1 of 24
### Topic: Asset Classes, Market Structure & Who's In the Room

```
MORNING   9:00–10:00 AM EST   60 min   Instructor-led (first week only)
EVENING   8:00–9:30  PM EST   90 min   60 min material · 30 min Q&A
```

> **Prep:** TradingView open with SPY, QQQ, VIX loaded. Finviz heatmap ready. Hypothesis log open.

> **Resource:** [Student Handbook Part 1 — Getting Started](../../resources/handbook/FINN_HB_P1_GettingStarted.md) — Pre-reading for Day 1: trade types, TradingView and Finviz setup, broker comparison.

---

# MORNING — Daily Market Brief
## 9:00–10:00 AM

---

**9:00 | OPEN** `5 min`

"Good morning. This is the Daily Market Brief — the DMB. Every market day for the next six months, we start here at 9:00 AM. Today I walk you through every item. Starting next Monday, one of you runs this. Watch the format."

---

**9:05 | PRE-MARKET SCAN** `20 min`

Work through each item live. One sentence of context per item — students haven't seen these before.

> **Futures — ES, NQ, YM**
> "Before the open, futures show us where the market wants to go. Check the direction and magnitude."
> [SHOW: ES, NQ, YM on TradingView]

> **Resource:** [ig_platform_tradingview.html](../../resources/infographics/ig_platform_tradingview.html) — TradingView interface guide: chart types, watchlists, indicators, and layout setup.

> **VIX**
> "The fear gauge. VIX closed at 25.78 on Tuesday — that's elevated. Above 20 means the market is anxious. Above 30 means real fear. We check this every morning because it determines how we size trades."

> **Macro calendar**
> "Any scheduled news today? Fed speeches, CPI, jobs data — these create predictable volatility spikes."
> [SHOW: TradingView or tradingeconomics.com economic calendar]

> **Earnings calendar**
> "Who's reporting this week? Bank earnings kick off this week — JPMorgan, Goldman, Wells Fargo all report. Earnings = volatility. We don't get surprised."

> **Finviz sector heatmap**
> "Where is money flowing? Last Tuesday energy was the worst sector — oil crashed 16% in one day after the Iran ceasefire. That kind of rotation shows up here instantly."
> [SHOW: finviz.com → Maps]

> **10-year yield**
> "Currently at ~4.33%. When yields rise, growth stocks get hit. When they fall — risk-on. The oil crash is giving the Fed room to cut. Watch this direction."

> **Bitcoin overnight**
> "BTC was at $71,906 Tuesday morning, up $3,600 from the night before. Crypto trades 24/7 — it often signals global risk appetite before our markets open. It did exactly that this week."

> **Resource:** [ig_market_open.html](../../resources/infographics/ig_market_open.html) — Opening session patterns: Asia-Europe range, gap scenarios, and what pre-market futures signal about the first 30 minutes.

---

**9:25 | TICKER BRIEF DEMO** `20 min`

"Here's the format you'll each run starting next Monday. I'll walk through three tickers."

```
Ticker:       SPY
Current:      $[update Monday] | +/- % from Friday
Setup:        [One sentence on price action]
Catalyst:     [Any news or event today]
Hypothesis:   [One specific, falsifiable statement]
Signal Check: [What does VIX + sector context say about this setup?]
```

[Walk through SPY, QQQ, and one energy name — energy is live context from the oil crash week]

---

**9:45 | FIRST HYPOTHESIS** `10 min`

"Every hypothesis we write goes in this log. We review all of them at the end of Month 6. Here's the format:"

```
Date:       2026-04-13
Hypothesis: [Specific, testable statement about the market this week]
Basis:      [What pre-market data supports it]
Timeframe:  [When will we know if it's right or wrong?]
Outcome:    [TBD — reviewed Friday]
```

"Not 'the market will be volatile.' Try: 'SPY will fail to hold the Tuesday ceasefire bounce by Thursday close, because the late-session pullback on Tuesday suggests the ceasefire is fragile.' Specific. Falsifiable. Based on what we actually saw."

---

**9:55 | OBSERVATION ASSIGNMENT** `5 min`

"During market hours today: find one ticker moving more than 2%. Note the ticker, the move percentage, and your best guess at the cause. We open tonight with it."

---

---

# EVENING — Theory Session
## 8:00–9:30 PM

```
8:00  Opening + observation review     10 min
8:10  Asset classes                    15 min
8:25  Market structure + order book    15 min
8:40  Market participants              10 min
8:50  First hypotheses + close         10 min
9:00  Q&A — open                       30 min
```

---

**8:00 | OPENING** `10 min`

"What did you find moving more than 2% today?"

[ASK THE ROOM — call on 3–4 students. For each: what was the ticker, what caused it, could the morning brief have predicted it?]

"That's the process we just ran. Market event → trace the cause → ask if it was predictable. We do this every session. Tonight we build the map underneath it: what you're trading, where it trades, and who else is in the room."

---

**8:10 | ASSET CLASSES** `15 min`

Six categories. One real anchor for each.

**Equities:** "One share of NVDA means you own a fractional piece of NVIDIA. If they print money on AI chips, your share rises. If they go bankrupt, it goes to zero. Simple ownership."

**ETFs:** "SPY holds all 500 S&P 500 companies proportionally. Buying SPY is buying the index in one trade. This is our benchmark — everything we build gets measured against SPY."

**Options:** "A call on SPY at $550 gives you the right to buy SPY at $550 regardless of where it trades. We observe options every Friday — we don't trade them yet, but the options market signals where institutions are positioned."

**Futures:** "ES futures are what we checked this morning. Institutions hedge billion-dollar books overnight with futures. When ES is down 0.8% pre-market, that's real money expressing a view."

**Crypto:** "Bitcoin at $71,906 on Tuesday morning moved $3,600 overnight on ceasefire news — before US markets opened. That's why we track it. Sentiment signal, not a trade vehicle for this course."

**Forex:** "EUR/USD reflects dollar strength. When the Fed cuts rates — dollar weakens. When yields fall like they did this week — watch the dollar."

"Our scope: equities and ETFs. Everything else is context."

> **Resource:** [ig_trade_types.html](../../resources/infographics/ig_trade_types.html) — 8 trade styles ranked by time horizon, capital requirement, and skill level — from scalping to position trading.

---

**8:25 | MARKET STRUCTURE + THE ORDER BOOK** `15 min`

"Price is not the market. Price is the last agreed transaction. The real market is what's pending."

[SHOW: TradingView Level 2 on SPY or any liquid ticker]

"Left side: bids — buyers waiting. Right side: asks — sellers waiting. The gap between the highest bid and lowest ask is the spread. Every market order you place crosses that spread. On SPY it's a penny. On a thin small-cap it can be $0.50 — that's money out of your account before the trade does anything.

Hours matter: pre-market and after-hours, the spread widens and moves are less reliable. Institutions wait for the 9:30 open. We respect that.

[ASK] If the spread on a $10 stock is $0.10 — what percentage cost is that per round trip? And how often do you need to be right just to break even?"

> Let them work it out: 1% per round trip. You need to clear that before you make a dollar.

---

**8:40 | MARKET PARTICIPANTS** `10 min`

"Five groups in the room with you at all times."

- **Retail** — You. Smallest fish. Late to information, paying spreads.
- **Institutions** — Pension funds, mutual funds. Moving billions slowly. Their flows drive trends.
- **Hedge funds** — Faster, using leverage and shorting. Some are quants doing exactly what we're building.
- **Market makers** — Always willing to buy or sell. They profit from the spread. Necessary. Neutral.
- **HFTs** — Algorithms holding positions for milliseconds. Different time scale entirely — not your competition.

"Institutions cannot hide. A $500 million buy order would move the price against itself if placed at once — so they slice it over days. What retail calls 'sideways chop' is often an institution quietly building a position. Volume is their footprint.

[ASK] This week's Iran ceasefire caused the S&P to jump 2.5% in a single session. Who was buying in the first 10 minutes after the announcement — retail or institutions? And who do you think had positioned for it before the announcement?"

---

**8:50 | FIRST HYPOTHESES + CLOSE** `10 min`

"Six minutes. Open your hypothesis log. Write three hypotheses — specific, testable, based on what we saw this week in the market. The ceasefire, the oil crash, the VIX at 25 — all of it is fair game. Go."

[6 min silent writing — circulate and read over shoulders]

"Wednesday we open Python for the first time. Pull `W01_workshop_market_data_starter.ipynb` from GitHub before Wednesday morning. Tonight's deliverable: reading notes and three hypotheses in your log by 11:59 PM."

---

---

# Q&A — OPEN
## 9:00–9:30 PM · 30 min

"Thirty minutes. Any question that connects to today, this market, or this course. Who's first?"

> Wait. Let the room lead. If quiet after 15 seconds — use a seed question.

**Seed questions (use 1–2 max if needed):**
- "Retail is the smallest fish. What advantages does a small, fast, individual trader have that a $10 billion fund doesn't?"
- "The ceasefire sent markets up 2.5% in one day. Is that a tradeable edge — or pure luck? How would you know the difference?"
- "Market makers profit from the spread. Are they your enemy or your friend? Argue both sides."

**When a question needs a precise answer:** Ask FINN directly in chat. Read the response to the class. That's a normal part of how this works.

**9:25 — Hard close:**
"One more question. Make it your best one."

[Take it. Answer. Then:]

"That's Day 1. Six asset classes, market structure, five participants, and your first three hypotheses. Wednesday: Python. See you at 9:00 AM."

---

## DELIVERABLES

| What | When |
|------|------|
| 3 hypotheses in hypothesis log | Tonight 11:59 PM |
| Reading notes W01 | Tonight 11:59 PM |
| Pull `W01_workshop_market_data_starter.ipynb` | Before Wednesday DMB |

---

*Day 1 · Monday April 13, 2026 · Draws from `FINN_W01.md`*

Sources:
- [Stock Market Live April 8, 2026: S&P 500 Soars on Ceasefire](https://247wallst.com/investing/2026/04/08/stock-market-live-april-8-2026-sp-500-spy-soars-on-ceasefire/)
- [Bitcoin price April 8, 2026](https://fortune.com/article/price-of-bitcoin-04-08-2026/)
- [10-Year Treasury Yield context](https://www.coindesk.com/markets/2026/03/27/bitcoin-falls-below-usd68-000-as-10-year-treasury-yield-nears-1-year-high-of-4-5)
