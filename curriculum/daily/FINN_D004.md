# FINN — Day 4
## Monday · April 20, 2026 · Week 2 of 24
### Topic: Order Types, Microstructure & The True Cost of Trading

```
MORNING   9:00–10:00 AM EST   60 min   First student-led brief
EVENING   8:00–9:30  PM EST   90 min   15 min review · 40 min concepts · 20 min Socratic · 15 min close
```

> **Prep:** Wiki Section 2.2 (full) read. Wiki Section 2.3 read. Glossary A–M reviewed. TradingView with Level 2 order book ready. Hypothesis log open.

---

# MORNING — Daily Market Brief
## 9:00–10:00 AM

---

**9:00 | PRE-MARKET SCAN** `15 min`

Instructor runs Block 1. Student presenter for Block 2 prepares tickers while instructor scans.

"Looking at last week's hypotheses — did anything play out over the weekend in futures?"

> **ES, NQ, YM Futures** — direction and magnitude
> **VIX** — compare to last Friday's close. Did the weekend shift the level?
> **Macro calendar** — any events today?
> **Earnings calendar** — who reports this week?
> **Finviz sector heatmap** — what's leading pre-market?
> **10-year yield** — change from Friday?
> **Bitcoin overnight** — any weekend risk movement?

---

**9:15 | STUDENT-LED BRIEF** `20 min`

**First student-led brief.** Instructor steps back completely. Student presents their 3–5 tickers using the brief template.

After the brief, instructor gives verbal feedback (30 seconds maximum):
- One thing done well
- One thing to sharpen for next time
- No grade. No judgment. Coaching only.

"Every brief is a reps game. You get better by doing it, not by watching it."

---

**9:35 | HYPOTHESIS SETTING** `15 min`

Add this week's hypotheses. Reference last week's outcomes: "What played out last week — does that change how you're thinking today? Try to write at least one hypothesis this week that references a specific price level or spread observation."

---

**9:50 | OBSERVATION ASSIGNMENT** `10 min`

"Find one stock today that has a wide bid-ask spread — more than $0.05 difference — and one with a very tight spread, less than $0.02. Write down both tickers, the spread, and the daily volume for each. What pattern do you notice between spread width and volume?"

---

---

# EVENING — Theory Session
## 8:00–9:30 PM

```
8:00  Day review + reading check           15 min
8:15  Core concepts A — order types        20 min
8:35  Core concepts B — order book         15 min
8:50  Core concepts C — hidden costs        5 min
8:55  Socratic discussion                  20 min
9:15  Wednesday setup + close             15 min
```

---

**8:00 | DAY REVIEW + READING CHECK** `15 min`

"What did you see in the market today? Who found a stock with a wide bid-ask spread? Tell me the ticker, the spread, and the volume. What pattern emerged?"

Cold-call reading check:
- "Name the order types from the reading. Define each one in one sentence."
- "What is the bid-ask spread? Give me the formula."
- "Where did the reading lose you?"

[Take all three. Answer the third honestly.]

---

**8:15 | ORDER TYPES** `20 min`

Walk through Wiki Section 2.2 order types. For each, a concrete scenario with numbers:

**Market Order:** "You want in NOW. You pay whatever the ask is. On SPY with a $0.01 spread, this costs you almost nothing. On a small-cap with a $0.30 spread — you gave away 0.3% before the trade moves at all."

**Limit Order:** "You want 100 shares of AAPL but only at $185 or less. You put in a limit buy at $185. If price never touches $185, you never get filled. The risk is missing the move."

**Stop Order:** "You own TSLA at $250. You set a stop at $235. If TSLA drops to $235, your stop triggers and becomes a market order. Warning: in a fast market you might get filled at $228, not $235. That is gap risk."

**Stop-Limit:** "Stop at $235, limit at $233. You won't sell below $233. Risk: if the stock falls through $233 instantly, you don't get out at all. The protection becomes a trap."

**Trailing Stop:** "You're long SPY, it's rising. Set a 2% trailing stop. If SPY rises to $520, your stop rises to $509.60. If it then drops 2% from $520, you exit at $509.60 — gains locked in automatically."

**MOO/MOC:** "Used by institutions for rebalancing. Market On Close ensures you trade at the closing auction. These create predictable volume spikes at open and close — which we see every day in the DMB."

> **Resource:** [ig_order_types.html](../../resources/infographics/ig_order_types.html) — Complete order type taxonomy: all 12+ types with use cases, execution risks, and when each is appropriate.

---

**8:35 | THE ORDER BOOK + MARKET IMPACT** `15 min`

[SHOW: TradingView Level 2 — live or screenshot]

"The inside market is the best bid and best ask. That's the price you see quoted. But behind it are layers of orders stacked at lower bids and higher asks. When a large market order hits, it doesn't just take the inside ask — it eats through multiple levels. This is market impact."

Whiteboard — draw an order book:
- Best bid: $99.95 (200 shares)
- Next bid: $99.90 (500 shares)
- Best ask: $100.00 (150 shares)
- Next ask: $100.05 (800 shares)

"If I want to buy 400 shares right now at market, what do I pay?"

> [Let them work it out.] 150 shares at $100.00 and 250 at $100.05. Average fill: $100.03. The quoted price was $100.00 — you paid $100.03. That gap is market impact. Now imagine doing this with 400,000 shares.

---

**8:50 | HIDDEN COSTS** `5 min`

"Zero-commission brokers still cost you money. They make money through payment for order flow — they route your order to market makers who pay them to see it. The market maker profits from the spread.

Concrete: 100 shares of a $50 stock with a $0.10 spread. Your hidden transaction cost is ~$5 round trip — just from the spread, before any adverse move. Commission is zero. The cost is real."

---

**8:55 | SOCRATIC DISCUSSION** `20 min`

1. "If you always use limit orders, you avoid slippage — but what risk do you take on? What happens when the market moves fast and your limit never fills?"

2. "Devil's advocate: Is a stop-loss actually dangerous? Think about who is on the other side of your stop order when it triggers. Who benefits from stop runs?"
   > *Expected direction: market makers and HFTs know where retail stops cluster — at round numbers, at recent lows. Prices frequently probe those levels. Does that make stops bad? No — but placement matters.*

3. "We said institutions slice large orders to avoid market impact. If you're watching a stock and see steady small-volume buying all day with price barely moving — what might that be? How do you distinguish accumulation from just low interest?"

4. "A strategy makes 0.3% per trade average. The spread on your stock costs 0.3% round trip. What does that tell you about minimum required edge before you consider live trading?"

[Don't resolve any of these cleanly. Leave students in the discomfort. That's the point.]

---

**9:15 | WEDNESDAY SETUP + CLOSE** `15 min`

**Wednesday workshop:** "We work with OHLCV data more deeply — calculate spread proxies from daily data, explore volume patterns, and build a function that automatically flags unusual volume days. Starter notebook: `W02_workshop_ohlcv_starter.ipynb` — pull it before Wednesday's DMB."

**Hypotheses:** Push toward order mechanics: "Try to write at least one hypothesis this week that references a specific market level you think will act as support or resistance."

**Pre-reading for next Monday:**
- Wiki Section 3.1 — The Quant Workflow (read and re-read until you can recite all 9 steps)
- Wiki Section 3.3 — Core Performance Metrics (read and look up any unfamiliar terms)
- Glossary N–Z

**Closing reflection:**
*"The most important thing I need to understand before Wednesday is ___."*

---

## DELIVERABLES

| What | When |
|------|------|
| Reading Notes + 3 Hypotheses | Tonight 11:59 PM |
| Pull `W02_workshop_ohlcv_starter.ipynb` | Before Wednesday DMB |

---

*Day 4 · Monday April 20, 2026 · Draws from `FINN_W02.md`*
