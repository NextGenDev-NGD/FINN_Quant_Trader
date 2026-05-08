# May 2026 Market Context & Strategy Base File
## Compiled: April 29, 2026 · Post-FOMC · Post-Q1 Earnings

**Data sources:** Live yfinance pull (Apr 28 open → Apr 29 close) · Q1 Earnings Analysis · FOMC Press Conference Transcript · 60-day daily lookback  
**Purpose:** Base context file for options, long/short swing trade strategy development — May 2026 Week 1  
**Bias weighting:** 100% data-driven. Sentiment observations derived from price behavior, not narrative.

---

## 1. MACRO ENVIRONMENT — The Operating Regime

### Federal Reserve — Hold Decision (Apr 29, 2026)

| Parameter | Value | Implication |
|-----------|-------|-------------|
| Fed Funds Rate | 3.50% – 3.75% (HOLD) | No near-term cut signal |
| PCE Inflation (March) | 3.5% total / 3.2% core | Above 2% target; energy is primary driver |
| Core PCE driver | Tariff effects on goods sector | Structural, not transitory |
| Unemployment | 4.3% (unchanged) | Labor market softening but not breaking |
| Job gains | Low / slowing | Partly from lower immigration + participation |
| Housing | "Remained weak" (Powell's words) | Rate-sensitive sector under continued pressure |
| Powell final term | Chair ends May 15, 2026 | Warsh confirmed out of Senate Banking Committee |
| Kevin Warsh | Nominee for Fed Chair | Known hawk: smaller balance sheet, dollar stability over market relief |
| Next FOMC | June 2026 | No cut expected unless CPI reverses sharply |

**Key Powell Quote (Verbatim):** *"Monetary policy is not on a preset course, and we will make our decisions on a meeting-by-meeting basis."*  
Translation: Data-dependent paralysis. The Fed is watching, not leading.

### Yield & Volatility Snapshot (Apr 29 Close)

| Indicator | Apr 28 Open | Apr 29 Close | 2D Change | Signal |
|-----------|-------------|-------------|-----------|--------|
| 10-Yr Yield (^TNX) | 4.37% | 4.42% | +1.08% | Bond market not pricing cuts. Rising on FOMC day = inflation skepticism |
| VIX | 18.30 | 18.78 | +2.62% | Dropped Mon, reversed hard on FOMC day (+5.33%). Below 20 = no fear, but directional shift matters |
| VIX Range (2D) | — | — | 9.02% | Wide intraday VIX range = elevated uncertainty beneath calm surface |

### The Oil Variable — Primary Risk Factor

USO surged **+8.50%** over 2 sessions (open Apr 28 → close Apr 29).  
30-day USO return: **+26.8%**. RSI: 68.5. Well above both SMA20 (+15.7%) and SMA50 (+31.9%).

**Why this is the single most important data point in the file:**  
- Powell explicitly named energy prices (Middle East conflict) as the primary inflation driver  
- PCE already at 3.5%. If oil sustains at current levels, May 12 CPI likely prints at or above 3.5%  
- A hot CPI on May 12 eliminates any probability of a June rate cut  
- Eliminates rate-cut narrative = multiple compression across rate-sensitive sectors  
- Below-average volume on USO's 2-day surge (vol ratio: 0.44) is a yellow flag — institutional money has NOT fully loaded energy equities yet. XLE only +2.3% vs oil +8.5%. That gap will close, one way or the other.

---

## 2. Q1 2026 EARNINGS SCORECARD — S&P 500 Summary

| Metric | Q1 2026 | Prior Quarter Estimate | Signal |
|--------|---------|----------------------|--------|
| Blended EPS Growth | **+15.1%** | +13.1% | Sixth consecutive quarter of double-digit growth |
| Revenue Growth (blended) | **+10.3%** | — | Highest since Q3 2022 |
| Net Profit Margin | **13.4%** | — | Record high since FactSet began tracking (2009) |
| EPS Beat Rate | 84% of reporters | — | Above historical average (~73%) |
| Revenue Beat Rate | 81% of reporters | — | Strong operational baseline |
| IT Sector EPS Growth | +46.0% | — | Masking moderate growth in rest of index |
| Energy Sector EPS | -6.5% | — | Oil exposure = costs before revenue in Q1 |
| Health Care EPS | -9.2% | — | Notable weak spot |
| Industrials Beat | +33.2% vs estimates | — | Infrastructure + manufacturing rebound |
| Q2 2026 Net Margin Est. | 14.1% | — | Analyst consensus: margins continue expanding |

**The S&P 493:** When Magnificent 7 excluded, the remaining 493 companies show materially lower growth. The headline 15.1% is tech-concentration-dependent.

---

## 3. KEY DATES — MAY 2026

| Date | Event | Market Sensitivity |
|------|-------|-------------------|
| May 1 | Week 1 trading begins | FOMC/earnings digestion |
| May 7 | NVDA earnings (est.) | High — AI/semiconductor re-rating risk |
| May 8 | BLS Employment Report | Moderate — labor market direction |
| May 12 | **CPI Release** | **Critical** — hot print kills rate cut narrative through summer |
| May 15 | **Powell's term ends. Warsh sworn in.** | **High** — policy regime uncertainty event |
| May TBD | MSFT earnings (est.) | High — cloud/AI benchmark |

---

## 4. TICKER-BY-TICKER DATA & STRATEGY LEAN

### Live Data Table — Full Dataset

| Ticker | Name | Close 4/29 | 2D% | 5D% | 10D% | 30D% | RSI(14) | vs SMA20 | vs SMA50 | Vol Ratio |
|--------|------|-----------|-----|-----|------|------|---------|---------|---------|-----------|
| AMZN | Amazon | $263.04 | +1.80% | +3.0% | +5.8% | +22.2% | 83.3 | +8.8% | +18.3% | 1.08 |
| META | Meta Platforms | $669.12 | -0.76% | -0.8% | -0.4% | +7.5% | 65.6 | +4.0% | +6.0% | 0.88 |
| GS | Goldman Sachs | $905.60 | -3.79% | -3.1% | +0.7% | +12.2% | 50.6 | -0.1% | +4.1% | 0.80 |
| INTC | Intel | $94.75 | +16.57% | +45.2% | +45.9% | +115.0% | 87.3 | +42.8% | +77.0% | 1.49 |
| PG | Procter & Gamble | $146.46 | -2.38% | +3.3% | +2.9% | -2.6% | 51.9 | +1.7% | -1.6% | 0.93 |
| LUV | Southwest Airlines | $37.22 | -1.95% | -5.4% | -10.7% | -9.5% | 40.1 | -5.8% | -11.6% | 0.64 |
| ALK | Alaska Air | $38.31 | -4.49% | -6.1% | -9.9% | -1.6% | 45.6 | -5.2% | -9.8% | 0.68 |
| SPY | S&P 500 ETF | $711.58 | -0.03% | +0.1% | +1.7% | +6.4% | 77.6 | +2.8% | +5.0% | 0.64 |
| QQQ | Nasdaq 100 ETF | $661.57 | +0.63% | +1.0% | +3.8% | +9.8% | 81.7 | +5.1% | +8.5% | 0.63 |
| XLF | Financials ETF | $51.92 | -0.54% | -0.6% | -0.5% | +5.3% | 56.7 | +1.0% | +2.7% | 0.59 |
| SOXL | Semis 3x Lev. ETF | $117.97 | +8.48% | +11.7% | +37.2% | +114.7% | 77.5 | +34.1% | +71.0% | 0.86 |
| SMH | Semis ETF | $499.58 | +2.33% | +4.8% | +10.3% | +25.9% | 84.6 | +10.7% | +19.3% | 1.09 |
| XLE | Energy ETF | $59.03 | +2.27% | +4.4% | +5.9% | +1.6% | 59.7 | +3.0% | +3.0% | 0.77 |
| NVDA | Nvidia | $209.25 | -0.11% | +3.3% | +5.2% | +15.0% | 74.8 | +7.3% | +12.1% | 0.98 |
| MSFT | Microsoft | $424.46 | -0.03% | -1.9% | +3.2% | +6.3% | 73.5 | +5.7% | +7.3% | 0.92 |
| GOOGL | Alphabet | $349.94 | +0.40% | +3.1% | +3.8% | +12.6% | 77.6 | +6.6% | +12.1% | 1.13 |
| TSLA | Tesla | $372.80 | -0.50% | -3.8% | -4.9% | -6.6% | 63.5 | +0.5% | -3.1% | 0.67 |
| GLD | Gold ETF | $417.41 | -0.79% | -4.1% | -5.2% | -9.1% | 34.8 | -3.9% | -6.3% | 0.86 |
| BTC-USD | Bitcoin | $75,771 | -2.08% | -1.6% | +3.2% | +14.3% | 54.8 | +0.6% | +5.7% | 0.99 |
| ETH-USD | Ethereum | $2,253 | -2.20% | -2.0% | +0.2% | +12.1% | 42.0 | -2.2% | +3.2% | 0.98 |
| USO | Oil ETF | $150.63 | +8.48% | +16.4% | +22.9% | +26.8% | 68.5 | +15.7% | +31.9% | 0.44 |
| ^VIX | Volatility Index | 18.81 | +2.62% | -0.6% | +3.5% | -15.9% | 45.4 | -5.8% | -15.9% | — |
| ^TNX | 10-Yr Yield | 4.42% | +1.08% | +2.9% | +3.2% | +5.1% | 65.7 | +2.5% | +4.2% | — |

---

### 4A. AMAZON (AMZN) — $263.04

**Q1 Earnings Facts:**
- Net Sales: $181.5B (+17% YoY)
- AWS Net Sales: $37.6B (+28% — fastest acceleration in 15 quarters)
- Operating Income: $23.9B (+30%)
- Net Income: $30.3B (includes $16.8B Anthropic gain — strip this: $13.5B operating earnings)
- Free Cash Flow (TTM): $1.2B (down from $25.9B — capex absorbed nearly all cash flow)
- 2026 Capex Plan: ~$200B (+60% from 2025)

**Technical Position:**
- RSI 83.3 — overbought. Highest RSI in this dataset after INTC.
- 22% above 50 SMA. Extended.
- Volume ratio 1.08 — confirmed move, not low-conviction.

**Behavioral Read:** The market bought AWS's reacceleration and forgave the FCF collapse. That forgiveness is conditional. If AWS growth decelerates below 25% next quarter, the narrative breaks and the $200B capex becomes the headline instead.

**May Week 1 Strategy Lean:** 
- **Directional:** Bullish but overbought. Do not chase at RSI 83.
- **Options:** Bull call spread — sell upside to finance the buy (cap gains, reduce premium risk at elevated vol). Target entry on a 2-3% pullback toward $255 range.
- **Swing:** Long hold from prior position justified. New entries: wait for RSI to cool toward 65-70.
- **Risk:** Any AWS guidance miss = -10%+ reaction. FCF story becoming narrative risk.

---

### 4B. META PLATFORMS (META) — $669.12

**Q1 Earnings Facts:**
- Revenue: $56.3B (+25% YoY)
- Operating Margin: 41% (strong)
- Daily Active People: 3.58B (+7% YoY)
- Reality Labs Operating Loss: -$6.02B
- 2026 Capex Guidance: $125B–$145B (raised from $72B in 2025)
- Instagram Reels: $50B annualized revenue rate
- AI ad-ranking lift: +12% ad quality, +3.5% FB ad clicks

**Technical Position:**
- RSI 65.6 — neutral-to-elevated. Room to move either direction.
- 30D +7.5% (lagging AMZN/GOOGL on same timeframe)
- Volume ratio 0.88 — below average. No institutional conviction on the 2D move.

**Behavioral Read:** Market is in a holding pattern on META. The $125-145B capex raise spooked investors who were used to the "Year of Efficiency" story. The operating margin is real at 41%, but the question the market is asking is: *does Reality Labs ever stop bleeding?* $19.2B in annual losses from one division on top of a massive capex raise is a lot to absorb. The flat/negative 2D action on below-average volume is indecision, not distribution.

**May Week 1 Strategy Lean:**
- **Directional:** Neutral. Range-bound between $650-$690 is the base case until capex narrative resolves.
- **Options:** Iron condor / short strangle (collect premium on sideways movement). Sell the $650 put and $695 call for Week 1.
- **Swing:** No directional trade with conviction. If you must: defined-risk bull position only, given capex overhang.
- **Risk:** Any Reality Labs update or capex revision higher = leg lower. Advertising data miss = hard selloff.

---

### 4C. GOLDMAN SACHS (GS) — $905.60

**Q1 Earnings Facts:**
- Net Revenues: $17.23B (+14% YoY)
- IB Fees: $2.84B (+48%)
- Equities Revenue: $5.33B (record, +27%)
- FICC: $4.01B (-10%)
- ROE: 19.8% / ROTE: 21.3%
- Capital returned to shareholders: $6.38B in Q1 (including $5B buybacks)

**Technical Position:**
- RSI 50.6 — exactly neutral. The one ticker in the dataset sitting at mid-range RSI after a move.
- vs SMA20: **-0.1%** — GS is sitting right on its 20-day moving average. This is a decision point.
- 30D still +12.2% — the Q1 earnings run is intact on the longer timeframe.
- Volume ratio 0.80 — low-conviction selloff (not a panic flush).

**Behavioral Read:** GS had record earnings and the stock sold off -3.76% over 2 days. This is a classic "buy the rumor, sell the news" reaction, compounded by Warsh uncertainty. The market priced in the good news already. The Warsh "yield curve = NIM expansion = bullish for banks" thesis did not trade in this window — institutional money chose to wait for policy clarity rather than front-run the steepening narrative.

The SMA20 test ($905 area) is the critical level. If GS holds here, the low-volume pullback is a buying opportunity. If it breaks SMA20 on higher volume, the distribution move has more room.

**May Week 1 Strategy Lean:**
- **Directional:** Cautiously bullish at current levels IF SMA20 holds as support.
- **Options:** Bull put spread — sell the put below SMA20, buy further down. Collect premium while defining risk. Avoids the directional exposure until Warsh clarity.
- **Swing:** Long entry at SMA20 with a hard stop 3% below. Target: prior high ~$945 if Warsh signals yield curve tolerance.
- **Catalyst to watch:** Any Warsh commentary on balance sheet or yields before May 15.
- **Risk:** SMA20 break on volume = distribution confirmed. Exit immediately.

---

### 4D. INTEL (INTC) — $94.75

**Q1 Earnings Facts:**
- Revenue: $13.58B (+7% YoY)
- Adj. EPS: $0.29 vs. $0.01 consensus (29x the estimate — category event, not a beat)
- DCAI (Data Center & AI) Revenue: $5.1B (+22%)
- Intel Foundry Revenue: $5.4B (+16%)
- Q2 Guidance: $13.8B–$14.8B revenue, adj. EPS $0.20 (above consensus)
- Tesla confirmed as lead customer for 14A/18A process node
- Evercore street-high target: $111

**Technical Position:**
- RSI 87.3 — most overbought ticker in this entire dataset.
- 30D return: **+115%**. This is not a typo.
- vs SMA50: **+77%**. Massively extended above any reasonable moving average.
- Volume ratio 1.49 — confirmed by institutional buying. This was NOT a thin-market squeeze.

**Behavioral Read:** INTC's earnings were a fundamental re-rating event. The market spent 2 years pricing INTC as a dying business. One quarter proved the "Foundry First" thesis has product. The Tesla 14A/18A win was the institutional trigger — it validated that the node works, has a marquee customer, and competes with TSMC in the western supply chain.

The problem: RSI 87, +115% in 30 days, +77% above SMA50. This is the most crowded trade in the dataset. Everyone who bought the earnings catalyst already has significant gains. Profit-taking risk is extreme.

**May Week 1 Strategy Lean:**
- **Directional:** Mean reversion expected. A 10-20% consolidation from peak ($94-95) is entirely normal after a +115% 30-day run. $75-$80 is a realistic re-test zone.
- **Options:** Bear call spread (sell calls above current price, buy further out of money calls as hedge). Or buy puts for a defined-risk short-term fade.
- **Swing:** Do NOT initiate new longs at RSI 87. If already long, consider taking partial profits or protecting with covered calls. New position: wait for RSI to cool toward 60 (likely requires a 15-20% pullback) before re-entry.
- **The long-term thesis is intact.** 14A/18A + foundry + Tesla is real. The trade is just badly crowded right now.
- **Risk:** If INTC holds RSI 87 and squeezes further, it is showing extraordinary institutional accumulation. Check volume on any continuation — if vol > 2x average and price holds, the thesis is stronger than the technicals suggest.

---

### 4E. PROCTER & GAMBLE (PG) — $146.46

**Q1 Earnings Facts:**
- Net Sales: $22.4B (+3% YoY)
- Core EPS: $1.99 (+3%)
- Organic Sales Growth: +2% (volumes up, not just price)
- Net Profit Margin: 19% (up from 18%)
- FY2026 EPS Guidance: $6.83–$7.09 (maintained)
- Tariff/commodity headwind absorbed: ~$500M

**Technical Position:**
- RSI 51.9 — neutral
- 30D: -2.6% — PG is down over the last month while the market is up
- vs SMA50: -1.6% — below its 50-day moving average. Weak for a defensive name.
- Defensive rotation is NOT happening. Money is not hiding in staples.

**Behavioral Read:** In a normal risk-off environment, PG goes up while tech sells off. The opposite is happening. This tells you the current market selloff (to the extent there is one) is not fear-driven — it's selective. Investors aren't hiding; they're rotating toward earnings catalysts, not safe havens.

**May Week 1 Strategy Lean:**
- **Directional:** Neutral-to-bearish. No catalyst. Below SMA50.
- **Options:** No strong options play. If anything, sell covered calls against existing positions.
- **Swing:** No trade. PG is a yield instrument right now, not a momentum trade.

---

### 4F. SOUTHWEST AIRLINES (LUV) — $37.22

**Q1 Earnings Facts:**
- Revenue: $7.25B (record Q1)
- Net Income: $227M (returned to profitability)
- RASM: +11.2% YoY (revenue per available seat mile)
- Business Revenue: record, +16%
- Assigned seating launch: 60% of customers opted up
- Hedging program: CLOSED (fully unhedged on fuel)

**Technical Position:**
- RSI 40.1 — approaching oversold
- 30D: -9.5%, 10D: -10.7%
- vs SMA20: -5.8%, vs SMA50: -11.6%
- Volume ratio 0.64 — selling is low-conviction but persistent

**Behavioral Read:** LUV's transformation story is real — assigned seating is a genuine structural improvement. But oil at +8.5% in 2 days, with USO already +26.8% in 30 days, on a carrier with zero fuel hedging is a margin math problem that no business model transformation can outrun in the short term. RSI 40 suggests it's getting cheap, but "cheap and getting cheaper" is a value trap without an oil catalyst.

**May Week 1 Strategy Lean:**
- **Directional:** Bearish. Downtrend confirmed across all timeframes.
- **Options:** Put spreads — buy the $36 put, sell the $33 put for Week 1 exposure to continued selling.
- **Swing:** Short or avoid. Oil is the governor. No long until USO shows reversal.
- **Risk:** Any de-escalation in Middle East conflict = oil drops = LUV bounces hard. This is the only bull catalyst.

---

### 4G. ALASKA AIR (ALK) — $38.31

**Q1 Earnings Facts:**
- Revenue: $3.30B
- Net Loss: -$193M (fuel-driven)
- Fuel cost headwind: +$100M in Q1, expected +$600M in Q2
- RASM: +3.5% (lagging LUV)
- Full-year guidance: SUSPENDED (citing fuel uncertainty)
- Unit costs: +6.3%

**Technical Position:**
- RSI 45.6
- 10D: -9.9%, 5D: -6.1%
- vs SMA20: -5.2%, vs SMA50: -9.8%
- Guidance suspension is a red flag — management has no visibility

**Behavioral Read:** ALK is in a worse structural position than LUV. No transformation catalyst, suspended guidance, larger proportional fuel exposure. The -4.51% 2-day move was the largest individual equity decline in the dataset. Institutions are reducing exposure, not adding.

**May Week 1 Strategy Lean:**
- **Directional:** Bearish. Strongest conviction short in the airline space.
- **Options:** Puts or put spreads. The $37 put for May expiry has a clean setup given the downtrend.
- **Swing:** Short with SMA20 as resistance target for re-entry on any bounce.
- **Risk:** Same as LUV — oil reversal is the only catalyst. But ALK has no transformation story to soften the blow the way LUV does.

---

### 4H. NVIDIA (NVDA) — $209.25

**Technical Position (Pre-Earnings):**
- RSI 74.8 — elevated but not extreme
- 30D: +15.0%, 10D: +5.2%
- vs SMA20: +7.3%, vs SMA50: +12.1%
- Volume ratio 0.98 — neutral positioning, no aggressive accumulation or distribution
- 2D: -0.11% — NVDA did NOT participate in INTC's AI narrative. These are distinct stories.

**Behavioral Read:** INTC's earnings argued that "agentic AI" is running on CPUs, not exclusively on GPUs. If that narrative takes hold, it is a mild headwind for the "NVDA is the only AI trade" thesis. The market is distinguishing between the two — a sophisticated read, not a knee-jerk rotation.

NVDA is sitting in a healthy technical position ahead of earnings. RSI 74 is elevated but leaves room for an earnings pop. The question: what does a "beat" look like against already high expectations?

**May Week 1 Strategy Lean:**
- **Directional:** Earnings binary. Bull case on beat with guidance raise. Bear case if data center capex concerns spook on "peak GPU" narrative.
- **Options:** Strangle ahead of earnings (buy both call and put) — captures the binary move either direction. The IV expansion before earnings will price this, so time the entry early in the week.
- **Swing:** Hold existing longs through earnings. No new directional position without knowing the earnings print.
- **Risk:** Disappointing guidance (not just the beat) is the risk. The market has seen AMZN/META capex surges — if hyperscalers signal GPU order delays, NVDA gets hit hard.

---

### 4I. MICROSOFT (MSFT) — $424.46

**Technical Position (Pre-Earnings):**
- RSI 73.5 — elevated, near-overbought
- 30D: +6.3%, but 5D: -1.9% (recent fade)
- vs SMA20: +5.7%
- Volume ratio 0.92 — slightly below average, waiting mode

**Behavioral Read:** MSFT is in a holding pattern ahead of earnings. The -1.9% 5-day move while SPY is flat suggests mild profit-taking before the print. Azure cloud growth will be the number the market cares about — can it keep pace with AWS's 28% re-acceleration?

**May Week 1 Strategy Lean:**
- **Directional:** Neutral until earnings. Post-beat: bullish. Post-miss: RSI 73 means a meaningful correction.
- **Options:** Same strangle approach as NVDA — earnings binary.
- **Swing:** Wait for the print. Enter on the day-after-earnings reaction.

---

### 4J. ALPHABET (GOOGL) — $349.94

**Technical Position (Post-Earnings):**
- RSI 77.6 — elevated
- 30D: +12.6%, 2D: +0.40%
- vs SMA20: +6.6%, vs SMA50: +12.1%
- Volume ratio 1.13 — slightly above average (confirmed Q1 earnings move)

**Behavioral Read:** GOOGL already posted earnings and the market received them positively (+0.4% 2D). Cloud and search are intact. No fireworks in either direction. The RSI 77 with confirmed above-average volume suggests institutional accumulation is ongoing, just not at a sprint.

**May Week 1 Strategy Lean:**
- **Directional:** Mild bullish. Earnings catalyst already digested positively.
- **Options:** Bull call spread — modest upside target. Not a high-conviction momentum trade.
- **Swing:** Long with RSI 77 as a caution flag. Set alert at RSI 80 for trimming.

---

### 4K. TESLA (TSLA) — $372.80

**Technical Position:**
- RSI 63.5 — neutral-to-elevated
- 30D: **-6.6%** — TSLA is negative over the last month while the market is up
- vs SMA50: **-3.1%** — below its 50-day moving average
- 5D: -3.8%
- Volume ratio 0.67 — low volume selloff, but sustained

**Behavioral Read:** TSLA is the most notable underperformer relative to the broader Mag 7 and market. The Intel 14A/18A partnership (where Tesla was named as lead customer for custom AI chips) did not produce any TSLA rally. This means: TSLA investors are not interested in chip partnerships right now. They want delivery numbers, margin data, and Musk execution focus. None of those catalysts were in play during this window.

TSLA being below its SMA50 while QQQ is 8.5% above its SMA50 is a significant divergence. This is a relative weakness signal.

**May Week 1 Strategy Lean:**
- **Directional:** Bearish. Confirmed underperformance relative to peer group and index.
- **Options:** Put spreads or outright puts. Target: retest of $350 support.
- **Swing:** Short with stop above $385 (above SMA20 resistance).
- **Risk:** Any Musk catalyst (robotaxi announcement, delivery beat, FSD breakthrough) could trigger a sharp short squeeze. TSLA has high short interest.

---

### 4L. SEMICONDUCTORS — SMH ($499.58) / SOXL ($117.97)

**Technical Position:**
- SMH RSI: 84.6 — overbought (highest ETF RSI in dataset)
- SMH 30D: +25.9%, 10D: +10.3%
- SOXL 30D: +114.7% (leveraged, so ~38% underlying — consistent with SMH)
- SMH vol ratio 1.09 — confirmed accumulation
- INTC's earnings are the direct driver of this move

**Behavioral Read:** INTC's 29x earnings beat pulled the entire semiconductor ETF complex higher. SMH at RSI 84.6 is the most overbought ETF in the dataset. The sector re-rating is real — agentic AI on CPUs is a new thesis — but RSI 84 following a 2-day surge is a consolidation setup, not a buy signal.

**May Week 1 Strategy Lean:**
- **SMH/SOXL:** Bullish sector thesis, bearish near-term entry. Wait for RSI pullback to 65-70 before new longs.
- **Options:** Bear call spread on SOXL for near-term consolidation play. The leverage amplifies any mean reversion.
- **Swing:** If already in SOXL/SMH long: protect with calls sold against position (covered call or collar).

---

### 4M. ENERGY — XLE ($59.03) / USO ($150.63)

**Technical Position:**
- XLE RSI: 59.7 — mid-range (most room to run of any sector)
- XLE 30D: +1.6% (dramatically lagging USO's +26.8%)
- USO RSI: 68.5 — elevated but not overbought
- USO vol ratio: **0.44** — the big move happened on below-average volume

**Behavioral Read:** Oil moved +8.5% in 2 days on geopolitical news. Energy equities (XLE) only moved +2.3%. This gap — oil up 8.5%, energy stocks up 2.3% — historically closes. Either oil pulls back or XLE re-rates higher to reflect the commodity price. The low USO volume suggests this may be a thin geopolitical spike rather than structural demand-driven move, but the Middle East conflict is ongoing and Powell explicitly named it as the primary inflation risk.

**May Week 1 Strategy Lean:**
- **XLE:** Bullish. Energy equities have not caught up to oil. Call options or long equity if oil sustains.
- **USO:** Cautiously bullish. Low volume on the spike is the caution flag. Watch for follow-through volume in Week 1.
- **Options:** Bull call spread on XLE — higher conviction than USO options given the equity re-pricing lag.
- **Risk:** Middle East de-escalation = oil reversal = XLE/USO snap back hard. Define risk.

---

### 4N. FINANCIALS — XLF ($51.92) / GS ($905.60)

*(See GS section for detailed GS analysis)*

**XLF Technical Position:**
- RSI 56.7 — neutral
- 30D: +5.3%, but 2D: -0.54%, 5D: -0.6%
- vol ratio 0.59 — low conviction in both directions

**Behavioral Read:** Financials are in a wait-and-see mode. The Warsh narrative is not yet trading. The sector has the fundamental setup (rising yields = NIM expansion) but the institutional behavior says: *show us the policy, then we'll position*. XLF is range-bound between $51.50-$52.50 until Warsh clarity.

**May Week 1 Strategy Lean:**
- **Directional:** Neutral until May 15 Warsh transition.
- **Options:** Wait. Sell premium if you want income (sell puts at $51 support). No directional bet before the regime change is priced.

---

### 4O. GOLD (GLD) — $417.41

**Technical Position:**
- RSI **34.8** — approaching oversold. Lowest RSI in the equity/ETF dataset.
- 30D: **-9.1%** — gold is in a significant pullback
- vs SMA20: -3.9%, vs SMA50: -6.3%
- This is happening while oil is +26.8% in 30 days and PCE is at 3.5%

**Behavioral Read:** This is the most counterintuitive signal in the dataset. Oil +26.8% in 30 days, inflation above target, geopolitical conflict — and gold is down 9.1% in the same window. Three possible explanations:
1. The geopolitical oil spike is being read as temporary (not structural inflation) — so no flight to hard assets
2. USD is strengthening on "higher-for-longer" rate expectations, which suppresses gold (gold and USD move inversely)
3. Institutional inflation hedges went into energy equities (XLE) rather than gold

RSI 34.8 is a bounce candidate. If May 12 CPI comes in hot, gold could see a sharp reversal. The risk/reward for a contrarian long is favorable at these levels.

**May Week 1 Strategy Lean:**
- **Directional:** Contrarian bullish setup. RSI 34.8 below SMA50 is a classic oversold bounce candidate.
- **Options:** Call debit spread — define risk on the bounce thesis. Target: return to SMA20 (~$435).
- **Swing:** Long entry zone: $413-$418. Stop: $408 (below 52-week technical support). Catalyst: May 12 CPI.
- **Risk:** If the market continues interpreting the oil spike as temporary and USD strengthens, gold can stay depressed or continue lower.

---

### 4P. BITCOIN (BTC) — $75,771 / ETHEREUM (ETH) — $2,253

**Technical Position:**
- BTC RSI 54.8 — neutral, but trending down from recent highs
- ETH RSI **42.0** — weak, approaching oversold
- BTC 30D: +14.3%, but 2D: **-2.08%**
- ETH 30D: +12.1%, 2D: **-2.20%**
- BTC vs SMA20: +0.6% (barely above)
- ETH vs SMA20: **-2.2%** (below its 20-day moving average — weak signal)

**Behavioral Read:** The critical observation: crypto sold off on a day when QQQ was +0.46% and INTC was +8.63%. This is a decoupling from the "crypto = risk-on" correlation. When tech rallies and crypto sells off, it is either:
1. USD strengthening from higher-for-longer rates — suppressing BTC/ETH (BTC is priced in USD; strong dollar = headwind)
2. Speculative capital choosing earnings-driven equities over crypto for the near term
3. Market interpreting FOMC hold + oil = rate cuts off the table well into 2026 = crypto loses the "easy money / debasement hedge" bid

ETH's position is more concerning than BTC's. ETH below SMA20 (BTC still above) with RSI 42 signals relative weakness. BTC is the institutional-grade hold; ETH is more speculative.

**May Week 1 Strategy Lean:**
- **BTC:** Neutral. The 30D return of +14.3% is intact, and RSI 54 doesn't scream sell. But the 2D decoupling from tech is a yellow flag. No new aggressive longs until risk-on correlation resumes.
- **ETH:** Mild bearish. Below SMA20, RSI 42, underperforming BTC. If BTC sells off, ETH falls harder.
- **Options/Crypto:** No week 1 directional trade with conviction. If forced: small BTC long only, with tight stop below $74,000 (SMA50 area).
- **Risk:** Rate cut repricing in either direction is the binary. Dovish Warsh signal = crypto pops. Hawkish Warsh = crypto gets another leg lower.

---

## 5. CROSS-ASSET DIVERGENCES — WHAT HUMANS ARE SIGNALING

These divergences are the most useful behavioral signals in the dataset. Each one describes a place where human market behavior contradicts the expected narrative.

| Expected Behavior | Actual Behavior | What It Means |
|------------------|----------------|--------------|
| Oil +8.5% → Gold up | GLD **-0.79%** (30D: -9.1%) | Oil spike read as temporary/geopolitical, not structural inflation. OR USD strength suppressing gold. |
| Warsh nomination → Banks rally | GS **-3.76%**, XLF -0.54% | Institutional money chose uncertainty over the NIM narrative. Warsh trade may play — but not yet. |
| INTC AI beat → NVDA joins rally | NVDA **-0.11%** | Market is distinguishing CPU-AI (INTC) from GPU-AI (NVDA). These are competing theses, not complementary. |
| TSLA named in INTC partnership → TSLA up | TSLA **-0.50%** | TSLA investors don't care about chip partnerships. They want delivery numbers. |
| Risk-on (tech up) → Crypto up | BTC **-2.08%**, ETH **-2.20%** | Crypto decoupled from risk-on signal. Higher-for-longer rates and/or USD strength suppressing crypto. |
| Defensive rotation (market fear) → PG up | PG **-2.38%** | This is NOT a fear-driven market. Rotation is earnings-driven, not safety-driven. |

---

## 6. MAY 2026 WEEK 1 — STRATEGY SCORECARD

| Ticker | Lean | Strategy Type | Key Trigger | Primary Risk |
|--------|------|--------------|-------------|-------------|
| AMZN | **Bullish** (wait for pullback) | Bull call spread on dip | AWS guidance continuation | RSI 83 = chasing danger |
| META | **Neutral** | Iron condor / short strangle | No catalyst | Capex revision higher |
| GS | **Cautious Bull** at SMA20 | Bull put spread | Warsh yields clarity | SMA20 break = distribution |
| INTC | **Bearish near-term** | Bear call spread / put | RSI 87, 115% 30D run | Volume squeeze continuation |
| PG | **Neutral** | No trade | — | Below SMA50, no momentum |
| LUV | **Bearish** | Put spreads | Oil sustained | Middle East de-escalation |
| ALK | **Bearish** | Puts / short | Oil + suspended guidance | Same as LUV |
| SPY | **Neutral** | Wait for CPI (May 12) | CPI print | Hot CPI = breakdown |
| QQQ | **Mild bullish** | Long if NVDA/MSFT beat | Earnings week | RSI 81 = limited upside room |
| XLF | **Neutral** | Wait | May 15 Warsh transition | Uncertainty priced in |
| SOXL/SMH | **Bull thesis, bad entry** | Wait for RSI 65-70 pullback | INTC follow-through | Mean reversion from RSI 84 |
| XLE | **Bullish** | Bull call spread | Energy re-pricing lag to oil | Oil reversal |
| USO | **Cautious bull** | Smaller position (low vol warning) | Oil geopolitical | Volume needs to confirm |
| NVDA | **Binary (earnings)** | Strangle pre-earnings | Beat + guidance | "Peak GPU" narrative |
| MSFT | **Binary (earnings)** | Strangle pre-earnings | Azure growth rate | Miss on cloud guidance |
| GOOGL | **Mild bullish** | Bull call spread | Already reported positively | RSI 77 limits upside |
| TSLA | **Bearish** | Put spreads | Confirmed relative weakness | Short squeeze risk (high SI) |
| GLD | **Contrarian bull** | Call spread / long equity | May 12 CPI hot print | USD strengthens further |
| BTC | **Neutral** | No new longs | Rate policy clarity | Higher-for-longer confirmed |
| ETH | **Mild bearish** | No trade / small short | Below SMA20, RSI 42 | Crypto rotation resumes |

---

## 7. THE MACRO RISK CALENDAR — MAY WEEK 1 PRIORITY ORDER

**Day-by-day decision framework for Week 1:**

| Day | What to Watch | Why It Matters |
|-----|--------------|---------------|
| Mon May 4 | Pre-market futures + USO open | Does oil hold the +8.5% gain or fade? This sets energy/airline tone for the week |
| Tue May 5 | MSFT after-hours earnings | Azure cloud growth vs AWS's 28%. Market sets QQQ direction. |
| Wed May 6 | NVDA earnings (if this week) | AI capex confirmation or "peak GPU" concern. Highest beta single-stock event. |
| Thu May 7 | BLS jobs preview + NVDA reaction | Labor market signal ahead of May 8 report |
| Fri May 8 | **BLS Employment Report** | If jobs come in weak: rate cut hope returns. If strong: higher-for-longer confirmed. |

**May 12 CPI is the Week 2 event that Week 1 positioning should anticipate.** If you are holding positions through the weekend, your primary risk is a CPI surprise on May 12 that reprices the entire rate path.

---

## 8. REGIME SUMMARY — ONE PARAGRAPH

The market entering May 2026 is in a **selective earnings rotation with macro headwinds building in the background**. The index (SPY) is essentially flat, which is the wrong number to watch. Underneath it: tech is re-rating on fundamentals (INTC +16%, AMZN +2%, QQQ outperforming SPY), energy is surging on geopolitical risk (+8.5% 2D), airlines and crypto are selling off, gold is ignoring the inflation signal, and the Fed just confirmed it is not cutting rates while simultaneously engineering a leadership transition. The human behavior pattern is: **trust the earnings, ignore the macro — for now.** The "for now" ends on May 12. A hot CPI print with oil at current levels forces the rate-cut narrative off the table through the summer, which reprices every multiple-expansion story in the index. The single most important thing to track in Week 1 is whether USO volume confirms the oil move. Low-volume geopolitical spikes reverse. High-volume sustained oil above $150 (USO) changes the inflation calculus and every strategy in this document.

---

*Generated: April 29, 2026 · FOMC Decision Day · End of Powell Era*  
*Data: Live yfinance pull + Q1 Earnings Analysis + FOMC Transcript*  
*For use in: May 2026 Week 1 options and swing trade strategy development*  
*Update trigger: May 8 BLS + May 12 CPI + May 15 Warsh transition*
