# FINN Glossary
## Complete Terminology Reference
**Location:** `resources/FINN_Glossary.md`
**Format:** Term | Definition | *First appears: Week | See: cross-reference*
**Coverage:** ~72 terms — all Tier 1 + Tier 2 curriculum concepts, alphabetical

---

## A

**Alpha**
Return generated above a benchmark (e.g., SPY). If your strategy returns 12% when SPY returns 8%, alpha is +4%. FINN requires all performance claims to include alpha vs. SPY. *First appears: W03 | See: ig_performance_metrics.html*

**ATR (Average True Range)**
Volatility measure — the average price range over N periods (default 14). Used in FINN for position sizing and stop placement. ATR-based stops adapt to volatility; fixed-dollar stops do not. *First appears: W02 | See: HB P3 §3.1, ig_risk_rules.html*

---

## B

**Backtest**
Running a trading strategy on historical data to measure how it would have performed. In FINN, backtests are invalid if they use look-ahead bias or optimize parameters on the same data used for evaluation. An in-sample backtest with no out-of-sample test is incomplete. *First appears: W03 | See: ig_quant_workflow.html*

**Bear trap**
A false signal indicating price will continue falling, luring short sellers in — then reversing sharply upward. Bears who shorted are "trapped" as price moves against them. *First appears: W02 | See: HB P4 §4.5, ig_market_traps.html*

**Beta**
Sensitivity of an asset's returns to market returns (SPY). Beta of 1.0 = moves with market. Beta > 1 = amplified moves. Beta < 1 = dampened moves. Negative beta = moves opposite market. *First appears: W03 | See: ig_performance_metrics.html*

**Bid-ask spread**
The difference between the highest price a buyer will pay (bid) and the lowest price a seller will accept (ask). Wider spreads indicate less liquid assets. Always check spread before trading low-float stocks. *First appears: W01 | See: HB P3 §3.1*

**Bollinger Bands**
Volatility bands placed two standard deviations above and below a 20-period moving average. Price touching the upper band signals high volatility — not automatically a sell. Test Bollinger Band signals with IC analysis before trading them. *First appears: W05 | See: ig_quant_workflow.html*

**Bull trap**
A false breakout above resistance that attracts buyers — then fails and reverses downward, trapping buyers at the high. *First appears: W02 | See: HB P4 §4.5, ig_market_traps.html*

---

## C

**Candlestick**
A single price bar showing open, high, low, and close for a time period. Body = open-to-close range. Wicks = high/low extremes. Pattern recognition requires confirmation — one candle alone is not a signal. *First appears: W01 | See: HB P2 §2.1, ig_candlestick_patterns.html*

**Composite Signal Score**
FINN's multi-factor signal aggregation method. Combines technical score, ML probability, and sentiment score using a weighted average, with a veto layer for circuit-breaker conditions. Score above threshold triggers trade entry. *First appears: W17 | See: ig_multi_signal.html*

**Confirmation bias**
The tendency to search for and interpret information that confirms your existing belief. In trading: ignoring bearish signals because you are already long. FINN requires pre-defining what would make you wrong before entering a trade. *First appears: W09 | See: HB P5 §5.3, ig_trading_psychology.html*

**Continuation pattern**
A chart pattern signaling a pause in trend before resuming in the original direction. Examples: flags, pennants, triangles, rectangles. Confirmation is required before entering. *First appears: W06 | See: HB P2 §2.4, ig_chart_patterns_continuation.html*

**Cup and handle**
A bullish continuation pattern: price forms a U-shaped base (cup) followed by a smaller dip (handle), then breaks upward. Volume on the breakout confirms the pattern. *First appears: W06 | See: HB P2 §2.5, ig_chart_patterns_reversal.html*

---

## D

**Daily Market Briefing (DMB)**
FINN's daily pre-market routine. Students complete a structured pre-market scan each trading morning: market regime check, sector scan, watchlist update, and a hypothesis for the day. The DMB is where market literacy is built through habit. *First appears: W01 | See: HB P4 §4.1*

**Day trade**
Opening and closing a position within the same trading session. Requires Pattern Day Trader (PDT) compliance if account < $25,000. High intensity, short feedback loop. *First appears: W01 | See: HB P1 §1.1, ig_trade_types.html*

**Doji**
A candlestick where open and close are nearly equal, creating a cross or plus-sign shape. Signals indecision — neither buyers nor sellers control. Requires context and confirmation to interpret. *First appears: W01 | See: HB P2 §2.1, ig_candlestick_patterns.html*

**Drawdown**
The peak-to-trough decline in portfolio value before a new high is reached. Maximum drawdown (MDD) is the largest historical drawdown. FINN's hard rule: stop trading for the day if daily drawdown exceeds 5%. *First appears: W03 | See: ig_performance_metrics.html, ig_risk_rules.html*

---

## E

**EMA (Exponential Moving Average)**
A moving average that weights recent prices more heavily than older prices. More responsive to price changes than SMA. Common periods: 9, 21, 50, 200. Used in FINN for trend direction and crossover signals. *First appears: W05 | See: HB P2 §2.1*

**Entry rule**
A pre-defined, specific, testable condition that must be met before opening a position. Entry rules must be written before any live or paper trade. If you cannot state the exact condition that triggered entry, you did not have an entry rule. *First appears: W01 | See: ig_quant_workflow.html*

**Exhaustion gap**
A gap that occurs at the end of a sustained trend — price gaps in the trend direction but quickly reverses. Signals trend exhaustion, not continuation. *First appears: W02 | See: HB P2 §2.6, ig_gap_types.html*

**Exit rule**
A pre-defined, specific condition for closing a position — at a profit target or at a stop loss. Exit rules must be set at entry time, not during the trade. Changing exits mid-trade is a protocol violation in FINN. *First appears: W01 | See: ig_quant_workflow.html*

---

## F

**False breakout**
Price moves beyond a support or resistance level — creating the appearance of a breakout — then reverses back inside the prior range. A common trap for momentum traders. *First appears: W02 | See: HB P4 §4.5, ig_market_traps.html*

**Feature engineering**
Creating new input variables for an ML model from raw data (price, volume, fundamentals, sentiment). Example: converting raw RSI into a binary "RSI < 30" feature. In FINN, all features must pass IC testing before inclusion in the model. *First appears: W07 | See: ig_quant_workflow.html*

**Fibonacci retracement**
A tool that uses horizontal lines at key Fibonacci ratios (23.6%, 38.2%, 50%, 61.8%, 78.6%) to identify potential support and resistance levels after a price move. Not a standalone signal — requires confirmation. *First appears: W06 | See: HB P6 §6.1, ig_fibonacci.html*

**Float**
The number of shares available for public trading (total shares minus locked-up insider shares). Low-float stocks are more volatile and susceptible to short squeezes. *First appears: W01 | See: HB P1 §1.1*

**FOMO (Fear of Missing Out)**
The impulse to enter a trade because it is already moving — not because the setup meets entry rules. One of the three dangerous emotions in FINN's psychology framework. FOMO entries almost always occur at the worst possible price. *First appears: W09 | See: HB P5 §5.2, ig_trading_psychology.html*

**Forward return**
The price return of an asset over a future window (e.g., 5-day, 10-day). Used as the dependent variable in IC calculations. Example: "5-day forward return" measured from signal date. *First appears: W03 | See: ig_quant_workflow.html*

---

## G

**Gap (price gap)**
A price discontinuity on a chart where no trading occurred — the open of one bar is significantly above or below the close of the prior bar. Gaps are classified as: Common, Breakaway, Runaway (Continuation), and Exhaustion. Each type carries different predictive implications. *First appears: W02 | See: HB P2 §2.6, ig_gap_types.html*

---

## H

**Head and shoulders**
A bearish reversal pattern: price makes three peaks where the middle (head) is highest, with two lower peaks (shoulders) on either side. Breakdown below the neckline confirms the pattern. Inverse H&S is bullish. *First appears: W06 | See: HB P2 §2.5, ig_chart_patterns_reversal.html*

**Heikin Ashi**
A modified candlestick type using averaged OHLC values to smooth noise. Easier to identify trends but lags behind price — not suitable for precise entry/exit timing. *First appears: W06 | See: HB P2 §2.7, ig_heikin_ashi.html*

---

## I

**IC (Information Coefficient)**
The correlation between a signal's predicted rank and the actual forward return rank. IC of 0 = no predictive value. IC of 0.05 = weak but potentially tradeable. IC ≥ 0.10 = strong. FINN requires IC > 0.05 and p < 0.05 for any signal to enter the strategy. *First appears: W03 | See: ig_quant_workflow.html, ig_performance_metrics.html*

**In-sample data**
Historical data used to build or optimize a model. Any backtest evaluated only on in-sample data is meaningless — you can always fit noise if you try enough parameters. *First appears: W07 | See: ig_quant_workflow.html*

---

## J

**Journal (trading journal)**
FINN's primary accountability tool. A structured daily log of every trade hypothesis, entry/exit rationale, emotional state, and post-trade analysis. The journal documents decisions before outcomes are known — that is its entire value. *First appears: W01 | See: HB P5 §5.5*

---

## L

**Limit order**
An order to buy or sell at a specific price or better. A buy limit order executes at or below the limit price. A sell limit order executes at or above the limit price. Guarantees price but not execution. *First appears: W02 | See: HB P3 §3.1, ig_order_types.html*

**Liquidity**
How easily an asset can be bought or sold without significantly affecting its price. High-liquidity assets (large-cap stocks, ETFs) have tight spreads and deep order books. FINN paper trading focuses on liquid assets only. *First appears: W01 | See: HB P3 §3.1*

**Long (position)**
Owning a security with the expectation that its price will rise. "Going long" = buying. Profit is made when price increases. *First appears: W01 | See: HB P1 §1.1*

**Loss aversion**
The psychological tendency to feel losses more acutely than equivalent gains (losses hurt ~2× more than gains feel good). In trading: holding losing positions too long to avoid "making the loss real." Stop-loss rules exist partly to override this instinct. *First appears: W09 | See: HB P5 §5.3, ig_trading_psychology.html*

---

## M

**MACD (Moving Average Convergence Divergence)**
A momentum indicator showing the difference between a 12-period EMA and a 26-period EMA, with a 9-period signal line. Used to identify trend direction and momentum shifts. Always test MACD signals with IC analysis before trading them. *First appears: W05 | See: ig_quant_workflow.html*

**Market cap**
Market capitalization = share price × shares outstanding. Large cap = >$10B. Mid cap = $2–10B. Small cap = $300M–2B. Micro cap = <$300M. Smaller caps have higher volatility and lower liquidity. *First appears: W01 | See: HB P1 §1.1*

**Market maker**
A firm that continuously quotes buy and sell prices to provide liquidity. Market makers profit from the bid-ask spread. When your stop triggers, someone sophisticated is on the other side of that trade. *First appears: W01 | See: HB P3 §3.1*

**Market order**
An order to buy or sell immediately at the current best available price. Guarantees execution but not price. In volatile markets, market orders can result in significant slippage. *First appears: W02 | See: HB P3 §3.1, ig_order_types.html*

**Milestone**
FINN's four structured assessment checkpoints: M1 at W04, M2 at W08, M3 at W12, M4 at W24. Each requires a live presentation of completed analysis and documentation. *First appears: W01 | See: FINN_CurriculumIndex.md*

**Momentum trade**
A strategy that buys rising assets and sells falling assets, based on the principle that trends persist short-term. Requires tight stop management due to rapid reversals. *First appears: W05 | See: HB P1 §1.1, ig_trade_types.html*

**Moving average**
The average price of an asset over a defined lookback period, recalculated on a rolling basis. Smooths price noise to show trend direction. Primary types: SMA (equal weight) and EMA (recency weighted). *First appears: W02 | See: HB P2 §2.1*

---

## O

**OBV (On-Balance Volume)**
A cumulative volume indicator: volume is added when price closes up, subtracted when price closes down. OBV divergence — price makes a new high but OBV fails to confirm — can signal weakening momentum. *First appears: W06 | See: HB P6 §6.2, ig_volume_analysis.html*

**OCO (One-Cancels-Other)**
A paired order where two orders are placed simultaneously — if one fills, the other is automatically cancelled. Common use: pairing a profit-target limit order with a stop-loss order. *First appears: W02 | See: HB P3 §3.1, ig_order_types.html*

**Out-of-sample test**
Evaluating a strategy on data that was not used to build or optimize it. The only valid way to estimate real-world performance. In FINN: always required before any strategy is traded on paper. *First appears: W07 | See: ig_quant_workflow.html*

**Overfitting**
A model that performs well on historical data because it has been optimized to fit that specific data — but fails on new data. More parameters = more opportunities to overfit. FINN's preference for simple strategies is a direct defense against overfitting. *First appears: W07 | See: ig_quant_workflow.html*

---

## P

**Paper trading**
Trading with virtual money in a simulated live-market environment. FINN uses Webull paper trading. Paper trades are real decisions — treated with the same rigor as live trades. Every paper trade requires a journal entry. *First appears: W09 | See: HB P1 §1.3, ig_platform_webull.html*

**Pennant**
A short-term continuation pattern: a sharp price move (flagpole) followed by consolidation in a small symmetrical triangle (pennant). Breakout in the direction of the flagpole confirms continuation. *First appears: W06 | See: HB P2 §2.4, ig_chart_patterns_continuation.html*

**Position sizing**
Calculating how many shares to trade based on account size, risk per trade, and stop distance. FINN default: risk 1–2% of account per trade. Formula: Shares = (Account × Risk%) ÷ Stop distance ($). *First appears: W02 | See: ig_risk_rules.html*

**Position trade**
Holding a position for weeks to months based on fundamental or macro analysis. Lower frequency, larger price moves required to cover costs. *First appears: W01 | See: HB P1 §1.1, ig_trade_types.html*

---

## R

**Resistance**
A price level where selling pressure has historically been strong enough to reverse upward price movement. Not a hard ceiling — a zone. Price breaking above resistance on strong volume can signal a new trend. *First appears: W01 | See: HB P2 §2.2, ig_support_resistance.html*

**Revenge trading**
Entering a new trade immediately after a loss in an attempt to win back the loss. One of the three dangerous emotions in FINN's psychology framework. Revenge trades are almost always entered without meeting entry rules. *First appears: W09 | See: HB P5 §5.2, ig_trading_psychology.html*

**Reversal pattern**
A chart pattern signaling that a trend is ending and a new trend in the opposite direction is beginning. Examples: head and shoulders, double top/bottom. Requires volume confirmation. *First appears: W06 | See: HB P2 §2.5, ig_chart_patterns_reversal.html*

**RSI (Relative Strength Index)**
A momentum oscillator measuring the magnitude of recent gains vs. losses, scaled 0–100. Conventional interpretation: > 70 = overbought, < 30 = oversold. FINN requires IC testing of RSI signals — "overbought" does not automatically mean "sell." *First appears: W03 | See: ig_quant_workflow.html*

---

## S

**Scalp**
The shortest-duration trade type — holding seconds to minutes to capture very small price moves. Requires tight spreads, high liquidity, and fast execution. Not recommended for FINN students in Months 1–3. *First appears: W01 | See: HB P1 §1.1, ig_trade_types.html*

**Sharpe ratio**
A risk-adjusted return measure: (Return − Risk-free rate) ÷ Standard deviation of returns. Sharpe > 1.0 is acceptable. > 1.5 is strong. A Sharpe of 2.8 on in-sample data should trigger immediate skepticism about overfitting. *First appears: W03 | See: ig_performance_metrics.html*

**Short (position)**
Selling a borrowed security with the expectation that its price will fall — planning to buy it back at a lower price. Profit is made when price decreases. Theoretical loss is unlimited (price can rise indefinitely). *First appears: W01 | See: HB P1 §1.1, HB P3 §3.2*

**Short selling**
The mechanics of taking a short position: borrowing shares, selling them, buying them back later. Requires a margin account. Some brokers restrict shorting on certain securities. *First appears: W02 | See: HB P3 §3.2*

**Signal**
A quantifiable indicator that predicts future price movement with statistical confidence. In FINN: a signal must have IC > 0.05, p < 0.05, and pass an out-of-sample test before it is traded. "It feels right" is not a signal. *First appears: W03 | See: ig_quant_workflow.html, ig_multi_signal.html*

**SMA (Simple Moving Average)**
A moving average where each price period is weighted equally. Less responsive to recent price changes than EMA. Common periods: 20, 50, 200. The 200-SMA is widely used as a long-term trend filter. *First appears: W02 | See: HB P2 §2.1*

**Stop hunt**
Deliberate price action designed to trigger retail stop-loss orders before reversing. Recognizable as a sharp wick below recent lows that quickly reverses upward. *First appears: W02 | See: HB P4 §4.5, ig_market_traps.html*

**Stop-limit order**
A two-part order: a stop price that triggers the order, and a limit price that caps execution. Provides price protection but does not guarantee execution if price moves through the limit quickly. *First appears: W02 | See: HB P3 §3.1, ig_order_types.html*

**Stop-loss order**
An order to close a position automatically if price moves against you by a defined amount. Required on every FINN paper trade. ATR-based stops adjust to volatility; fixed-point stops do not. *First appears: W01 | See: HB P3 §3.1, ig_risk_rules.html*

**Support**
A price level where buying pressure has historically been strong enough to stop or reverse downward price movement. Not a hard floor — a zone. Price breaking below support on volume can signal a new downtrend. *First appears: W01 | See: HB P2 §2.2, ig_support_resistance.html*

**Swing trade**
Holding a position for 1 to 10 trading days to capture a directional swing in price. The primary style taught in FINN Months 1–3. Requires overnight position management and awareness of gap risk. *First appears: W01 | See: HB P1 §1.1, ig_trade_types.html*

---

## T

**Trendline**
A straight line drawn across sequential highs (downtrend) or sequential lows (uptrend) to visualize price direction. Requires at least 2 touch points; 3+ is more reliable. A trendline break is a signal — not automatically an entry. *First appears: W02 | See: HB P2 §2.3, ig_trendlines.html*

---

## V

**VIX (CBOE Volatility Index)**
A real-time measure of market-implied volatility derived from S&P 500 options prices. Often called the "fear gauge." VIX > 20 = elevated fear. VIX > 30 = high fear. VIX > 40 = crisis conditions. FINN uses VIX as a regime filter. *First appears: W01 | See: HB P6 §6.4, ig_sentiment_indicators.html*

**Volume**
The number of shares traded in a given period. Volume confirms price moves: a breakout on high volume is more reliable than one on thin volume. Volume analysis is core to gap typing, pattern confirmation, and trend analysis. *First appears: W01 | See: HB P6 §6.2, ig_volume_analysis.html*

**VWAP (Volume-Weighted Average Price)**
The average price of a stock weighted by volume over a session, reset daily. Widely used by institutions as a benchmark. Price above VWAP = bullish intraday bias. Price below VWAP = bearish intraday bias. *First appears: W05 | See: HB P4 §4.3*

---

## W

**Win rate**
The percentage of trades that close profitably. Win rate alone is meaningless — a 30% win rate can be profitable with a 3:1 reward-to-risk ratio. Always pair win rate with average win vs. average loss (expectancy). *First appears: W03 | See: ig_performance_metrics.html*

---

*FINN_Glossary.md — Complete Terminology Reference*
*Built: Session A1 (May 8, 2026) | ~72 terms | Next update: Session B1 (confirm handbook cross-references)*
