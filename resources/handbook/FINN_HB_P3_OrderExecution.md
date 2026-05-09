# FINN Student Reference Handbook
## Part 3 — Order Execution
### Getting In, Getting Out, Getting It Right

**Part of:** FINN Knowledge Base Library
**Cross-references:** `ig_order_types.html` · `FINN_Glossary.md`
**First referenced:** Week 2 (order types, short selling) · Week 9 (live paper trading execution)

Order execution is the mechanical layer between your signal and your position. A correct signal entered with the wrong order type can still lose money — paying unnecessary spread, getting filled at the wrong price, or triggering a stop at a moment of noise. This section gives you the complete vocabulary and mechanics so that execution is never the reason a good trade fails.

---

## §3.1 — Complete Order Type Taxonomy

Every order you place is an instruction to a broker with specific conditions. Understanding what each order does — and what it doesn't guarantee — is non-negotiable before paper trading begins.

### Core Order Types

| Order Type | What It Does | Guarantee | Best Used When |
|------------|-------------|-----------|----------------|
| **Market Order** | Buys or sells immediately at the best available price | Execution — NOT price | Highly liquid stocks (AAPL, SPY); when speed matters more than price |
| **Limit Order** | Buys at or below a specified price (buy limit) or sells at or above it (sell limit) | Price — NOT execution | You have a target entry or exit; you're willing to miss the trade to get your price |
| **Stop Order (Stop-Loss)** | Becomes a market order when price hits the stop price | Execution once triggered — NOT price | Cutting losses; protects a position from catastrophic drawdown |
| **Stop-Limit Order** | Becomes a limit order when price hits the stop price | Neither execution nor price — both are conditional | When you want to avoid a bad fill after the stop triggers; gap risk is real |
| **Trailing Stop** | Stop price moves with the market; locks in gains as price rises | Execution direction (follows trend) — NOT exact price | Riding a trend while protecting accumulated gains |
| **Market-on-Open (MOO)** | Executes at the opening auction price | Opening price — NOT specific price | When you want the opening print; useful for news-driven setups |
| **Market-on-Close (MOC)** | Executes at the closing auction price | Closing price — NOT specific price | Rebalancing; institutional flow strategies; end-of-day signals |
| **Limit-on-Open (LOO)** | Limit order submitted to the opening auction | Price limit at open | When you only want to trade at or better than a specific opening level |
| **Limit-on-Close (LOC)** | Limit order submitted to the closing auction | Price limit at close | End-of-day entry/exit with price discipline |

### Conditional / Advanced Order Types

| Order Type | What It Does | Key Risk | FINN Context |
|------------|-------------|----------|-------------|
| **One-Cancels-Other (OCO)** | Two orders placed simultaneously; if one fills, the other is automatically cancelled | Partial fills on one leg may not cancel the other cleanly | Set a profit target and stop-loss simultaneously; standard in FINN rule-based entries |
| **Bracket Order** | A market or limit entry paired with an automatic OCO (profit target + stop-loss) | Slippage on any leg affects the others | Preferred entry format for FINN paper trading — full risk defined at entry |
| **Fill-or-Kill (FOK)** | Must be filled entirely and immediately; otherwise cancelled | High cancellation rate on illiquid stocks | Not used in FINN course — informational only |
| **Immediate-or-Cancel (IOC)** | Fills as much as possible immediately; cancels the rest | Partial fills create tracking complexity | Not used in FINN course — informational only |
| **Good-til-Cancelled (GTC)** | Order stays active until filled or manually cancelled (broker max: usually 60–90 days) | Order sits open through earnings, dividends, volatility events — review regularly | Use for limit entries that may take days to reach your price |
| **Day Order** | Expires at the close of the current trading session if unfilled | Order disappears — must re-enter next session | Default order duration in most brokers; appropriate for most intraday setups |
| **Extended Hours Order** | Executes in pre-market or after-hours sessions | Wide spreads, low liquidity, high slippage risk | Webull paper trading supports this — use with caution; results are not representative of market-hours execution quality |

### The Price Guarantee Matrix

Understanding what each order guarantees — and what it does not — is the most important concept in this section.

| Order | Guaranteed: Execution? | Guaranteed: Price? |
|-------|:---------------------:|:-----------------:|
| Market | ✅ Yes | ❌ No |
| Limit | ❌ No | ✅ Yes (if filled) |
| Stop | ✅ Yes (once triggered) | ❌ No |
| Stop-Limit | ❌ No | ❌ No (conditional on both) |
| Trailing Stop | ✅ Yes (once triggered) | ❌ No |
| OCO | Depends on legs | Depends on legs |

**The gap problem with Stop orders:** If a stock closes at $50 and opens the next morning at $44 because of bad earnings, your $48 stop becomes a market order that fills at $44 — not $48. Stop-Limit orders avoid this by setting a floor below which you refuse to sell. The risk: if the stock blows through both prices, you get no fill at all and hold a position through a crash.

There is no order type that guarantees both execution and price. That is a structural fact of markets. Know which guarantee you're choosing.

---

## §3.2 — Short Selling Basics

Short selling is the practice of borrowing shares, selling them, and buying them back later at a lower price to profit from the decline. It reverses the usual sequence: sell first, buy later.

### The Mechanics

**Standard long trade:**
1. Buy 100 shares of XYZ at $50 → cost: $5,000
2. Price rises to $60 → sell: $6,000
3. Profit: $1,000 (20%)

**Short trade:**
1. Borrow 100 shares of XYZ from broker
2. Sell 100 shares at $50 → receive: $5,000
3. Price falls to $40 → buy back (cover) 100 shares: $4,000
4. Return borrowed shares to broker
5. Profit: $1,000 (20% on the $5,000 proceeds)

**If price rises instead:**
- Buy back at $60 → cost: $6,000
- Loss: $1,000 on a $5,000 position (20%)
- Maximum theoretical loss: **unlimited** (price can rise without a ceiling)
- Maximum profit: **limited** (stock can only fall to $0)

This asymmetry is the most important fact about short selling. Long positions have limited downside (you can only lose what you invested). Short positions have unlimited theoretical upside risk.

### Requirements and Restrictions

| Requirement | Detail |
|-------------|--------|
| **Margin account** | Short selling requires a margin account. Cash accounts cannot short. Webull paper trading supports this — your paper account has margin enabled. |
| **Borrowing availability** | Broker must have shares available to lend. "Hard-to-borrow" stocks have limited supply — may be unavailable or carry a daily borrow fee. |
| **Borrow fee** | Expressed as an annual rate applied daily. Easy-to-borrow stocks: near 0%. Hard-to-borrow stocks (highly shorted): 10–100%+ annualized. In paper trading, borrow fees are simulated. |
| **Uptick rule (Rule 10a-1)** | In live trading, short sales can only be executed on an uptick or zero-plus tick. Circuit breakers trigger additional restrictions when a stock falls 10%+ in a day. In paper trading, this is not always enforced — real execution would differ. |
| **Margin call** | If losses on a short position cause your margin to fall below the broker's minimum, you'll receive a margin call requiring you to add funds or cover the position. |

### Short Selling in the FINN Context

FINN uses short selling as an educational concept and a paper trading tool. The rules:

- **Paper only** — all short positions are paper traded on Webull
- **Defined max loss** — treat shorts with the same stop-loss discipline as longs; "unlimited upside risk" is the theory, but stops limit it in practice
- **Signal required** — a short position must be based on a quantified bearish signal, not a feeling that the stock is "too high"
- **Record the borrow cost** — when Webull shows an estimated borrow fee, log it; it affects your actual P&L calculation

### Common Short Selling Setups in FINN

| Setup | Description |
|-------|-------------|
| **Breakdown short** | Price breaks below a well-defined support level with above-average volume. Signal: prior S&R now acting as resistance on a retest. |
| **Bearish pattern completion** | Head and shoulders, double top, or descending triangle completes and price closes below the neckline. |
| **Gap fill on failed gap-up** | Stock gaps up on news, fails to hold the gap level intraday, and reverses. Entry: when price crosses below the prior day's close. |
| **Oversold bounce short** | Counter-trend play — stock bounces into a clear resistance level after a downtrend. Higher risk; requires tight stop above resistance. |

---

## §3.3 — Order Routing and Best Execution

Order routing is what happens between the moment you click "submit" and the moment your order fills. Most retail traders never think about this layer — understanding it gives you an edge in execution quality.

### Where Your Order Goes

When you submit an order on Webull or any retail broker, it doesn't go directly to the NYSE or Nasdaq. It travels through a routing decision tree.

**The path of a retail market order:**

```
You → Broker → [Routing decision] → Execution venue → Fill confirmation
```

**Routing destinations:**

| Venue | What It Is | Who Uses It |
|-------|-----------|------------|
| **National exchanges (NYSE, Nasdaq, CBOE)** | Centralized lit markets with public order books | Institutional and retail; price discovery happens here |
| **ECNs (ARCA, BATS, IEX)** | Electronic communication networks — match buyers and sellers directly | Active traders; tighter spreads on liquid names |
| **Dark pools** | Private exchanges that don't display order flow publicly | Institutional block trades; minimizes market impact |
| **Market makers (PFOF)** | Broker sells order flow to a market maker who fills it off-exchange | Most retail brokers, including Webull; common for small retail orders |

### Payment for Order Flow (PFOF)

Webull, like most commission-free brokers, uses **Payment for Order Flow (PFOF)**. The broker receives compensation from a market maker for sending your order to them. In exchange, the market maker guarantees execution at the NBBO (National Best Bid and Offer) or better.

**What this means for you:**
- You pay no commission — the market maker's profit comes from the spread
- Your fill price is at or better than the NBBO at the moment of routing
- For small retail orders on liquid stocks, the quality difference is minimal
- For less liquid stocks or large orders, you may experience more slippage

**FINN rule:** For paper trading, PFOF is irrelevant — fills simulate best execution. When you move to live trading, use limit orders on less liquid names to control your fill price directly.

### Bid-Ask Spread — The Hidden Cost

Every market has a bid (highest price a buyer will pay) and an ask (lowest price a seller will accept). The spread is the gap between them.

| Stock type | Typical spread | Impact on a $5,000 position |
|-----------|---------------|---------------------------|
| **Highly liquid (SPY, AAPL)** | $0.01 | ~$0.01–0.02 per share — negligible |
| **Mid-cap liquid** | $0.03–0.10 | $1.50–$5.00 per trade — minor |
| **Small-cap / illiquid** | $0.10–$1.00+ | $50–$500+ per trade — significant |

When you submit a market order to buy, you pay the ask. When you sell, you receive the bid. You lose the spread on every round trip. On liquid stocks this is negligible. On illiquid stocks, it is a real cost that must be accounted for in your backtest — use mid-price or ask-price data, not close prices, when modeling entry costs.

### Slippage

Slippage is the difference between the price you expected and the price you got. It has three sources:

| Source | Description | How to reduce |
|--------|-------------|---------------|
| **Spread** | You buy at the ask, not the mid | Use limit orders; trade liquid names |
| **Market impact** | Large orders move the price as they fill | Reduce position size; scale in |
| **Latency** | Price moves between your click and the fill | Unavoidable for retail; accept it for market orders |

**In FINN backtests:** The default assumption is 0.1% slippage per trade (round trip: 0.05% in, 0.05% out). This is conservative for SPY and aggressive for small-caps. Adjust your slippage assumption to match the actual bid-ask spread of the tickers in your universe.

### Best Execution Rule (Practical Version)

| Situation | Order to use |
|-----------|-------------|
| Liquid stock, speed matters | Market order |
| Any stock, price matters | Limit order |
| Protecting a position | Stop-loss (know the gap risk) |
| Defined entry + defined risk | Bracket order (entry + OCO) |
| Illiquid stock, any size | Limit order — always |
| Earnings, gap risk present | Reduce size or exit before; stops don't protect against gaps |

The execution layer doesn't generate alpha. But poor execution destroys it. A strategy with a 0.3% edge evaporates if you're paying 0.25% in slippage per trade. Know your costs before you evaluate your strategy's performance.

---

*FINN Student Reference Handbook — Part 3: Order Execution*
*Built: Session B2.a (May 8, 2026)*
*Next: Part 4 — Market Context (`FINN_HB_P4_MarketContext.md`)*
