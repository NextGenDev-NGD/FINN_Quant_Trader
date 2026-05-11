# XAUUSD MTF RSI Gold Scalper PRO — Context & Analysis
## Strategy Context, Remaining Issues & Enhancement Notes
**Source file:** `XAUUSD_MTF_RSI_Gold_Scalper_PRO.mq5`
**Version:** 2.00
**Analyzed:** 2026-05-11
**Platform:** MetaTrader 5 (MQL5)
**Instrument:** XAUUSD (Gold vs USD)
**EA Name:** XAUUSD Multi-Timeframe RSI Gold Scalper PRO

---

## Lineage

This is the third bot in the XAUUSD series, developed after analysis of the previous two:

| Version | File | Core Issue |
|---------|------|-----------|
| V1 — Old Bot | `Bot Trader_Manutu.txt` | Price action pullback EA — no critical bugs, refinement needed |
| V2 — RSI Scalper | `Multi_Timeframe_RSI_Gold_Scalper_MT5.mq5` | No stop loss, live bar RSI, undefined risk |
| V3 — PRO (this) | `XAUUSD_MTF_RSI_Gold_Scalper_PRO.mq5` | V2 bugs fixed, subtler issues remain |

---

## Strategy Identity

**Type:** Multi-timeframe RSI mean-reversion with full risk architecture
**In one sentence:** When M1 RSI is deeply oversold/overbought AND H1 RSI confirms directional alignment AND H1 price is on the correct side of the 200 EMA, enter with ATR-scaled stops and manage through a three-stage position ladder.

**Timeframes:**
- M1 — primary entry signal (RSI timing) + ATR sizing
- H1 — RSI alignment filter + 200 EMA trend gate

---

## What Was Fixed vs. V2

Every critical bug from the prior bot was addressed in this version:

| Fix | V2 (Broken) | PRO V3 (Fixed) |
|-----|-------------|----------------|
| Hard stop loss | ✗ None | ✓ ATR × 1.5 |
| Take profit | ✗ None | ✓ ATR × 2.0 |
| Risk-based sizing | ✗ Fixed 0.10 lots | ✓ 1% equity per trade |
| Closed bar RSI | ✗ Live index 0 | ✓ Index 1 confirmed |
| M1 AND H1 alignment | ✗ OR logic | ✓ AND logic |
| EMA regime filter | ✗ None | ✓ H1 200 EMA gate |
| Partial close | ✗ None | ✓ 50% at 1:1 R:R |
| Breakeven | ✗ None | ✓ At 1:1 R:R + 20 pts |
| Trailing stop | ✗ None | ✓ After 1.2× R:R |
| Session filter | ✗ None | ✓ 07:00–20:00 |
| Daily loss cap | ✗ None | ✓ 3% |
| Max trades/day | ✗ None | ✓ 6/day |
| Spread filter | ✗ None | ✓ 150 pts |

The foundation is now solid. Remaining issues are subtler but still material.

---

## Signal Chain

### Entry Logic (Lines 155–159)

```mql5
if(rsiM1 <= BuyRSI_M1 && rsiH1 <= BuyRSI_H1)   // M1 ≤ 30 AND H1 ≤ 45
   buySignal = true;

if(rsiM1 >= SellRSI_M1 && rsiH1 >= SellRSI_H1)  // M1 ≥ 70 AND H1 ≥ 55
   sellSignal = true;
```

Both timeframes must agree simultaneously. All RSI values read from closed bar (index 1). AND logic. Correct.

### EMA Regime Filter (Lines 163–170)

```mql5
if(buySignal && h1Close <= emaH1)    // cancel buy if H1 price below 200 EMA
   buySignal = false;

if(sellSignal && h1Close >= emaH1)   // cancel sell if H1 price above 200 EMA
   sellSignal = false;
```

Buy only when H1 price is above the 200 EMA (long-term bull context).
Sell only when H1 price is below the 200 EMA (long-term bear context).
This is a directional trend gate — not a pullback-to-EMA filter.

### ATR Sizing (Lines 191–205)

```
SL distance = M1 ATR(14) × 1.5
TP distance = M1 ATR(14) × 2.0
R:R = 1.33:1 → breakeven win rate = 43%
```

### Risk Controls Checked on Every Entry Attempt (Lines 379–423)

| Control | Value |
|---------|-------|
| Max trades per day | 6 |
| Daily loss cap | 3% of start equity |
| Max spread | 150 points |
| Session hours | 07:00–20:00 server time |
| Min ATR threshold | 50 points (dead market filter) |

### Position Management — Three-Stage Ladder (Lines 281–372)

| Stage | Trigger | Action |
|-------|---------|--------|
| RSI exit | M1 RSI ≥ 67 (for buy) | Close full position |
| Partial close | Profit ≥ 1.0× initial risk | Close 50% of position |
| Breakeven | Profit ≥ 1.0× initial risk | Move SL to entry + 20 pts |
| Trailing stop | Profit ≥ 1.2× initial risk | Trail at 1× M1 ATR from current price |

---

## Remaining Issues (in order of severity)

### Issue 1 — M1 ATR Stop Is Too Tight for Mean-Reversion Trade Duration
**Severity: High**

The SL and TP are sized on M1 ATR (Line 90, 91):
```mql5
atrHandleM1 = iATR(_Symbol, PERIOD_M1, ATRPeriod);
double slDistance = atrValue * ATR_SL_Mult;   // M1 ATR × 1.5
```

M1 ATR on gold during active sessions ≈ $0.40–$0.80.
- SL = $0.60–$1.20 from entry
- TP = $0.80–$1.60 from entry

A mean-reversion trade triggered by H1 RSI alignment takes 30–90 minutes to resolve. Normal M1 price noise in that window routinely exceeds 1× M1 ATR, triggering the stop before the trade develops. The stop is correctly sized for a 3–5 minute scalp, not a multi-timeframe mean-reversion entry.

**Fix:** Calculate SL/TP distances using H1 ATR, or blend M1 + H1 ATR. The trade timeframe is H1 — the stop must breathe at H1 scale.

### Issue 2 — Trailing Stop Is Noise-Level Tight
**Severity: High**

```mql5
double trailDistance = atrM1 * TrailDistanceATRMult;  // 1.0 × M1 ATR (Line 356)
```

Trail distance = $0.40–$0.80 from current price. One normal M1 candle moving against the position fires this trail. The trailing stop is canceling winning trades before they reach TP — the bot exits near breakeven rather than running to target.

**Fix:** Trail at minimum 2× M1 ATR, or preferably 1× H1 ATR. Give the trade room to survive normal M1 oscillation while still protecting gains at the H1 scale.

### Issue 3 — H1 RSI Threshold Is Too Loose
**Severity: Medium**

```mql5
input double BuyRSI_H1  = 45.0;   // H1 ≤ 45 for buy alignment
input double SellRSI_H1 = 55.0;   // H1 ≥ 55 for sell alignment
```

H1 RSI ≤ 45 is barely below neutral. It does not confirm H1 weakness — it just confirms H1 isn't overbought. The filter adds marginal signal quality over M1 alone. A true H1 directional confirmation would require ≤ 40 for buys and ≥ 60 for sells, placing the H1 in a genuinely directional state rather than near-neutral territory.

**Fix:** Tighten to `BuyRSI_H1 = 40.0` and `SellRSI_H1 = 60.0`. Fewer trades, meaningfully higher signal quality.

### Issue 4 — No Trade Cooldown After Position Close
**Severity: Medium**

After a stop-loss hit, if M1 RSI is still ≤ 30 on the next tick (which it will be if price is still falling in a trend), the bot immediately opens a new trade in the same direction into the same losing move. With MaxTradesPerDay = 6, a trending session can burn all 6 slots in under 30 minutes — 6 consecutive stop losses before the daily cap fires.

**Fix:** Add `TradeCooldownMinutes = 15`. After any position close (stop or RSI exit), block new entries for 15 minutes. Gives the market time to reassert ranging conditions before re-entry.

### Issue 5 — EMA Filter Checks Direction Only, Not Proximity
**Severity: Medium**

```mql5
if(buySignal && h1Close <= emaH1)  // passes if H1 is $500 above 200 EMA
   buySignal = false;
```

The filter confirms which side of the 200 EMA price is on — not whether price is near it. If gold is in a multi-year bull trend and H1 is $500 above the 200 EMA, the filter passes. M1 RSI hitting 30 in that context is pure M1 noise — there's no H1-level support being tested. The EMA is not acting as a value zone in that scenario.

**Fix:** Add proximity condition: price must be within 1.5× H1 ATR of the 200 EMA to qualify for entry. This elevates the EMA filter from a trend direction gate into a "price is testing the EMA as support/resistance" filter — which is the higher-conviction version of this signal.

### Issue 6 — No Consecutive Loss Streak Tracking
**Severity: Medium**

The daily 3% loss cap provides a floor on damage, but doesn't catch the pattern: 3 consecutive losses in 20 minutes signals a regime mismatch — the strategy is systematically failing current conditions. The daily cap still has 3 more trade slots available after those 3 losses.

The first bot (Manutu) had `MaxConsecutiveLosses = 3` which catches this faster.

**Fix:** Add consecutive loss counter. Reset on any winning trade. Stop trading for the day after 3 consecutive losses.

### Issue 7 — GlobalVariable Partial Close Tracking Is Not Crash-Resilient
**Severity: Low**

```mql5
void MarkPartialDone(ulong ticket) {
   GlobalVariableSet(PartialKey(ticket), 1.0);  // Line 558 — lost on terminal crash
}
```

GlobalVariables survive EA restarts but are cleared on terminal crash. If the terminal crashes after partial close execution, the flag is gone. On restart, `PartialAlreadyDone()` returns false and the bot may attempt a second partial on an already-partially-closed position.

**Fix:** Store partial close state in the position comment field via `trade.PositionModify()`. Comments are stored on the broker server and survive terminal restarts.

### Issue 8 — R:R of 1.33:1 Requires 43% Win Rate to Break Even
**Severity: Low but worth tracking**

```
SL = ATR × 1.5, TP = ATR × 2.0 → R:R = 1.33:1
Breakeven win rate = 1 / (1 + 1.33) = 43%
```

RSI mean-reversion on gold historically achieves 45–55% win rate in ranging conditions, declining significantly in trending regimes. A 43% breakeven leaves thin buffer. The first bot ran 1.83:1 R:R (35% breakeven) — more robust to losing streaks.

**Fix:** Raise TP to ATR × 2.5. New R:R = 1.67:1. Breakeven drops to 37.5%. Same stop, same trade logic — better expected value.

---

## Top 10 Highest-ROI Augmentations

| # | Fix | What It Solves |
|---|-----|---------------|
| 1 | Use H1 ATR for SL/TP distances | Stops sized for trade duration, not M1 noise |
| 2 | Trail at 2× M1 ATR or 1× H1 ATR | Prevents trail from firing on normal M1 candle oscillation |
| 3 | Tighten H1 RSI to ≤ 40 buy / ≥ 60 sell | Genuine H1 directional confirmation, not near-neutral |
| 4 | Add 15-min cooldown after any position close | Prevents back-to-back entries into same losing condition |
| 5 | Add EMA proximity check (within 1.5× H1 ATR of 200 EMA) | Elevates EMA from directional gate to value zone filter |
| 6 | Add consecutive loss streak tracking (stop at 3) | Catches regime failure faster than daily % cap alone |
| 7 | Raise TP to ATR × 2.5 (R:R → 1.67:1) | Reduces required win rate from 43% to 37.5% |
| 8 | Replace GlobalVariable with comment-based partial tracking | Crash-resilient partial close state |
| 9 | Add ATR percentile filter (trade 30th–70th percentile only) | Blocks dead markets and news-spike volatility extremes |
| 10 | Add H1 RSI exit as secondary close trigger | Holds winners longer when M1 exits too early but H1 hasn't recovered |

> **Implementation order:** Fix #1 and #2 first — ATR sizing is the load-bearing structural issue in this version. Every other fix is secondary to getting the stop and trail distances right.

---

## Open Validation Questions

- What is the OOS win rate when M1 ATR stops replace H1 ATR stops — does the win rate improve enough to justify the wider stop?
- What percentage of trades hit the trailing stop before reaching TP at the current 1× M1 ATR trail distance?
- How often do M1 RSI ≤ 30 AND H1 RSI ≤ 40 co-occur vs. the current H1 ≤ 45 threshold — what is the signal frequency reduction?
- Does the EMA proximity filter (within 1.5× H1 ATR of 200 EMA) reduce trade count by more than 40%? What is the win rate improvement?
- What is the IC of the combined signal (M1 RSI ≤ 30 AND H1 RSI ≤ 40 AND H1 within 1.5 ATR of 200 EMA) vs. 5-period forward return on XAUUSD over 2022–2025?
- What percentage of 6-trade daily sessions (all slots used) end with net negative P&L? That number quantifies the cost of having no cooldown.
