# Multi-Timeframe RSI Gold Scalper — Context & Analysis
## Strategy Context, Bug Report & Enhancement Notes
**Source file:** `Multi_Timeframe_RSI_Gold_Scalper_MT5.mq5`
**Analyzed:** 2026-05-11
**Platform:** MetaTrader 5 (MQL5)
**Instrument:** XAUUSD (Gold vs USD)
**EA Name:** Multi-Timeframe RSI Gold Scalper - MT5

---

## Strategy Identity

**Type:** Pure RSI mean-reversion scalper
**In one sentence:** When RSI hits oversold or overbought on either M1 or H1, enter a mean-reversion trade and hold until RSI recovers — with no stop loss.

**Timeframes:**
- M1 — primary scalp signal
- H1 — macro signal (treated identically to M1)

---

## Signal Chain

### Entries

| Signal | Condition | Meaning |
|--------|-----------|---------|
| M1 BUY | RSI(14) M1 ≤ 30 | M1 oversold — expect bounce |
| H1 BUY | RSI(14) H1 ≤ 30 | H1 oversold — expect bounce |
| M1 SELL | RSI(14) M1 ≥ 70 | M1 overbought — expect reversal |
| H1 SELL | RSI(14) H1 ≥ 70 | H1 overbought — expect reversal |

Either timeframe alone triggers entry. No confirmation required between them.

### Exits (RSI-only — no hard stop loss, no take profit)

| Signal | Condition |
|--------|-----------|
| Close BUY | M1 RSI ≥ 67 OR H1 RSI ≥ 67 |
| Close SELL | M1 RSI ≤ 33 OR H1 RSI ≤ 33 |

Exit fires on whichever timeframe recovers first. No floor on losses if RSI stays pinned.

---

## Root Cause: The "Big Loss" Problem

**Developer report:** "Good wins followed by one big loss. Swing behavior in the stop-loss strategy."

**Diagnosis:** There is no stop-loss strategy. The `trade.Buy()` and `trade.Sell()` calls pass no SL or TP parameters:

```mql5
trade.Buy(LotSize, _Symbol)    // sl=0, tp=0 — no floor, no ceiling
trade.Sell(LotSize, _Symbol)   // sl=0, tp=0 — no floor, no ceiling
```

The CTrade::Buy() signature defaults sl and tp to 0.0 when not provided. The broker assigns no hard stop.

### The Exact Failure Sequence

```
1. Gold is ranging → RSI bounces repeatedly
   → Bot catches several small mean-reversion wins
   → P&L accumulates

2. A macro event triggers a trending move (NFP, CPI, FOMC)
   → RSI reaches ≤ 30 on M1 → Bot enters BUY
   → Gold continues falling
   → RSI stays pinned at 15–25 (trend continuation)
   → No stop loss fires → position bleeds indefinitely

3. Gold eventually reverses or margin is approached
   → Position closes with a loss that erases all prior wins
```

This is the textbook signature of an unprotected mean-reversion strategy deployed in a trending instrument.

---

## Confirmed Bugs (in order of severity)

### Bug 1 — No Stop Loss or Take Profit (Lines 172, 187, 205, 220)
**Severity: Critical**
Both entry calls pass no SL/TP. The only exit mechanism is RSI recovery. In trending conditions, RSI can stay pinned for hours, exposing the account to unlimited drawdown.

### Bug 2 — RSI Read from Live Bar (index 0), Not Closed Bar (Lines 89–93)
**Severity: High**
```mql5
CopyBuffer(rsiHandleM1, 0, 0, 1, rsiM1)  // index 0 = forming bar
CopyBuffer(rsiHandleH1, 0, 0, 1, rsiH1)  // index 0 = forming bar
```
RSI is recalculated every tick on the unclosed bar. M1 RSI can flash below 30 mid-bar and recover before close — entry fires on an unconfirmed signal. H1 RSI updates on every M1 tick, not at H1 bar close — the "H1 signal" is not a true H1 bar signal.

### Bug 3 — M1 and H1 Treated as Equal Signals (Lines 170–231)
**Severity: High**
M1 RSI touches 30 dozens of times per session (noise). H1 RSI touching 30 is a rare, high-conviction event. Both trigger the same lot size and the same entry logic. The bot is primarily trading M1 noise, not multi-timeframe confirmation.

### Bug 4 — OR Exit Logic Cuts Wins Short (Lines 130–163)
**Severity: Medium**
```mql5
if(hasBuy && currentRSIM1 >= BuyCloseRSI_M1)  // exits on M1 alone
if(hasBuy && currentRSIH1 >= BuyCloseRSI_H1)  // OR exits on H1 alone
```
M1 RSI can spike from 30 to 67 in 3–5 candles, closing the full position before H1 has moved. Winning trades are systematically cut short while losing trades (RSI pinned at extremes) have no cap.

### Bug 5 — Fixed 0.10 Lot Size, No Risk Scaling (Line 12)
**Severity: Medium**
0.10 lots on XAUUSD = ~$10/pip. Gold moves $30–$50 in trending sessions. One unprotected trending trade = $300–$500 loss with no floor. No relationship between lot size, account balance, and trade risk.

### Bug 6 — No Session, Spread, or Daily Risk Controls
**Severity: Medium**
Zero risk infrastructure compared to a properly built EA. No session filter (trades the Asian dead zone), no spread filter (trades during news spikes), no daily loss cap, no loss streak detection.

---

## Risk Infrastructure Comparison

| Control | Old Bot (Manutu) | This Bot |
|---------|-----------------|----------|
| Hard stop loss | ✓ ATR × 1.2 | ✗ None |
| Take profit | ✓ ATR × 2.2 | ✗ None |
| Risk-based sizing | ✓ 1% per trade | ✗ Fixed 0.10 lots |
| Session filter | ✓ 7:00–20:00 | ✗ None |
| Spread filter | ✓ Max 120 pts | ✗ None |
| Daily loss cap | ✓ 5% | ✗ None |
| Loss streak stop | ✓ 3 losses | ✗ None |
| Position cap | ✓ Max 1 | ✗ None |
| Equity guard | ✓ $900 floor | ✗ None |

---

## Top 10 Highest-ROI Augmentations

### #1 — Hard ATR Stop Loss on Every Entry
Attach a 1.5× ATR stop loss and 2.5× ATR take profit to every `trade.Buy()` and `trade.Sell()` call. This alone eliminates the catastrophic loss pattern. Without it, every other fix is cosmetic.
- **R:R target:** 2.5 / 1.5 = 1.67:1
- **Breakeven win rate needed:** ~37.5%

### #2 — Risk-Based Lot Sizing (1% per trade)
Replace fixed 0.10 lots with dynamic sizing based on account balance and ATR stop distance. Risk exactly 1% of balance per trade regardless of volatility or account size.
```
lotSize = (balance × 0.01) / (stopPoints × tickValue)
```

### #3 — Closed Bar RSI (index 1, not index 0)
Change all RSI reads from index 0 (live bar) to index 1 (last closed bar). Eliminates intra-bar RSI flickers as false signals. Every signal becomes a candle-confirmed event.

### #4 — Require M1 AND H1 Alignment for Entry
Replace OR entry logic with AND: both M1 RSI ≤ 30 AND H1 RSI ≤ 35 must be true to trigger a BUY. Fewer trades, significantly higher win rate, true multi-timeframe confirmation.

### #5 — Regime Filter (No Mean-Reversion Into a Trend)
Add H1 50 EMA trend gate: if price is more than 1 H1 ATR above/below the 50 EMA, block mean-reversion entries in that direction. RSI mean-reversion only works in ranging conditions — this filter disables it during trending ones.

### #6 — Asymmetric Exit: Partial Close at 1:1 R:R
Close 50% of position when profit reaches 1:1 R:R, move SL to breakeven on remainder. Half the position locks in a guaranteed win. The other half rides at zero risk, waiting for the H1 RSI recovery target.

### #7 — Trailing Stop After Breakeven
Once position is at breakeven (SL moved to entry), apply a trailing stop of 1× ATR. Converts the winning streak pattern into gains that survive the next losing trade. Prevents giveback on strong moves.

### #8 — Session Filter: London + NY Only (07:00–20:00 GMT)
Block all entries outside liquid sessions. Asian overnight gold (00:00–07:00 GMT) has thin liquidity, wider spreads, and different RSI statistical properties. 3-line fix that removes a subset of worst-performing trades.

### #9 — Daily Loss Cap + Max Trades Per Day
Stop all new entries after 3% daily loss or 6 trades per day, whichever comes first. Prevents the bot from compounding losses in a systematically bad session. Resets at midnight.

### #10 — Spread Filter (Block News Entries)
Block all entries when spread exceeds 150 points. Gold spreads widen to 150–300+ points during macro releases (NFP, CPI, FOMC) — exactly when RSI pins at extremes and mean-reversion fails. One-line fix that blocks the most dangerous entry window.

---

## Implementation Priority Order

| Priority | Fix | Impact |
|----------|-----|--------|
| 1 | Hard ATR stop loss | Eliminates catastrophic loss |
| 2 | Risk-based lot sizing | Converts undefined risk to controlled risk |
| 3 | Closed bar RSI (index 1) | Eliminates false signal entries |
| 4 | M1 AND H1 alignment | Highest signal quality improvement |
| 5 | Regime filter (EMA trend gate) | Blocks mean-reversion into trends |
| 6 | Partial close at 1:1 R:R | Converts small wins into compounding wins |
| 7 | Trailing stop after breakeven | Locks gains, prevents giveback |
| 8 | Session filter | Removes dead-zone low-quality signals |
| 9 | Daily loss cap + trade cap | Prevents single-day account damage |
| 10 | Spread filter | Blocks news-event entries |

> Implement in order. Do not add #6 before #1 exists. The stop loss is the foundation — every other fix builds on it.

---

## Open Questions (for validation)

- What is the win rate on closed-bar RSI signals (index 1) vs. live-bar signals (index 0) over a 12-month backtest?
- What percentage of the total loss P&L comes from trades entered when H1 ATR was in the top 20th percentile (trending/news regime)?
- Does requiring M1 AND H1 alignment reduce trade count by more than 60%? If so, is the win rate improvement proportional?
- What is the OOS Sharpe ratio after implementing fixes #1–4 across 2022–2025?
- How often does M1 RSI touch 30 within the same H1 bar that H1 RSI is also ≤ 35? That frequency determines true signal scarcity under the AND rule.
