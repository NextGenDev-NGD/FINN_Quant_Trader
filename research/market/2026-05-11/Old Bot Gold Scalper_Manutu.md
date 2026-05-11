# Old Bot Gold Scalper — Manutu
## Strategy Context & Enhancement Notes
**Source file:** `Bot Trader_Manutu.txt`
**Analyzed:** 2026-05-11
**Platform:** MetaTrader 5 (MQL5)
**Instrument:** XAUUSD (Gold vs USD)
**EA Name:** XAU_EXPERT_PRICE_ACTION_VB1000

---

## Strategy Identity

**Type:** Trend-following pullback with price action confirmation
**In one sentence:** Wait for gold to be in a trending market structure, pull back to the 50 EMA, and reject with a pin bar — then enter in the direction of the trend.

**Timeframes:**
- M5 — trade execution
- M15 — trend filter (50 EMA)

---

## Signal Chain (All 4 Must Fire)

| Layer | What it checks | How |
|-------|---------------|-----|
| 1. Market Structure | Is the market making HH+HL (up) or LH+LL (down)? | Compares two consecutive 10-bar windows |
| 2. Trend Filter | Is price on the correct side of the M15 50 EMA? | Bid vs EMA value — bypassed in QuickTestMode |
| 3. Pullback to EMA | Did price pull back to the EMA and hold? | Last closed candle within 1.2×ATR of EMA, closed above it |
| 4. Candle Confirmation | Does the candle show rejection (pin bar/hammer)? | Bullish body + body≥35% of range + lower wick≥80% of body |

---

## Risk & Sizing Parameters

| Parameter | Value | Meaning |
|-----------|-------|---------|
| Virtual Balance | $1,000 | Base for risk calculation |
| Risk per trade | 1% = $10 | Fixed dollar risk |
| Max lot cap | 0.02 | Hard position ceiling |
| Stop Loss | ATR × 1.2 | Dynamic, volatility-scaled |
| Take Profit | ATR × 2.2 | Fixed R:R ~1.83:1 |
| Min ATR threshold | 80 points | No trades in flat/dead markets |
| Breakeven win rate needed | ~35.3% | Floor for profitability at 1.83:1 R:R |

---

## Position Management — 3-Stage Ladder

| Stage | Trigger | Action |
|-------|---------|--------|
| Break-even | +100 points profit | Move SL to entry |
| Profit lock | +150 points profit | Move SL to entry + 40 points |
| Trailing stop | +220 points profit | Trail SL 120 points from current price |

- **Opposite signal exit:** If a SELL signal fires while long (or vice versa), position closes immediately before new entry evaluation.

---

## Kill Switches (all bypassed when QuickTestMode = true)

| Control | Threshold |
|---------|-----------|
| Equity guard | Stop trading below $900 (10% drawdown) |
| Session filter | 7:00–20:00 server time only |
| Spread filter | Max 120 points spread |
| Daily loss cap | 5% of day-start balance |
| Loss streak | Stop after 3 consecutive losses |
| Trade frequency | Max 5/day + 15-min cooldown between trades |
| Position cap | Max 1 open position at a time |

> **Current state:** `QuickTestMode = true` — all safety rails above are disabled. Not a live configuration.

---

## Known Technical Gaps

**1. Window-based structure, not pivot-based.**
`IsUpStructure()` compares two fixed 10-bar windows rather than detecting true swing highs/lows. Misfires in corrective and ranging conditions.

**2. QuickTestMode defaults to true.**
Silently disables trend direction, spread, session, daily loss, and loss streak checks. No warning issued on `OnInit()`. Live account risk if deployed without changing this.

**3. Fixed ATR take profit.**
TP is always 2.2×ATR from entry regardless of structure. Exits early in strong trend continuations; does not target the next swing high or resistance zone.

**4. Multi-timeframe EMA read on M5 close.**
The M15 EMA value is read at M5 bar close — not at M15 bar close. The EMA is technically real-time but the bot doesn't wait for M15 confirmation, which creates minor timeframe inconsistency.

**5. No news/event filter.**
XAUUSD is highly sensitive to macro releases (NFP, CPI, FOMC). Rejection candle patterns during high-impact events are noise, not signal.

---

## Proposed Augmentations

**Signal Quality**
- Replace window-comparison structure detection with true pivot-based swing highs/lows — current method misfires in corrective markets and can produce false structure signals.
- Add higher-timeframe confirmation (H1 or H4 EMA/structure alignment) before allowing M5 entries — filters counter-trend pullbacks that appear valid on M5 but oppose a larger move.

**Entry Precision**
- Add momentum confirmation at the pullback zone (RSI < 40 for buys, > 60 for sells on M5) — quantifies the "oversold at support" condition the wick filter is approximating.
- Build a news/high-impact event blackout window — gold is an NFP/CPI instrument and rejection candle patterns during macro releases are unreliable noise.

**Exit Logic**
- Replace fixed ATR take profit with structure-based target (next swing high for buys, next swing low for sells) — current 2.2×ATR cap exits early in strong trend continuations.
- Add partial close at 1:1 R:R (close 50%, move SL to breakeven on remainder) — locks realized P&L without killing the trade in strong moves.

**Risk Controls**
- Add volatility regime filter using ATR percentile: only trade when ATR is in the 30th–70th percentile of its 60-bar history — avoids dead markets and explosive news-driven conditions where the pattern degrades.
- Set `QuickTestMode = false` as default and add a hard `Print()` warning on `OnInit()` when it is enabled — silently disabling all safety rails is a live account risk.

---

## Open Questions (for testing/validation)

- What is the actual win rate of the pullback + rejection signal on M5 XAUUSD over a 3-year sample?
- What is the Information Coefficient (IC) of the combined signal (structure + EMA + wick filter) vs. forward 5-bar return?
- Does the 50 EMA on M15 outperform the 20 or 100 EMA as a pullback anchor for XAUUSD?
- What percentage of signals fire outside 7:00–20:00? Are those trades net positive or negative?
- What is the OOS Sharpe ratio across 2022–2025 (covering both trend and mean-reversion regimes)?
