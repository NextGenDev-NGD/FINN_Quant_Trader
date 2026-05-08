# FINN Student Reference Handbook
## Part 1 — Getting Started
### The Foundation Layer: What You Need Before You Trade

**Part of:** FINN Knowledge Base Library
**Cross-references:** `ig_trade_types.html` · `ig_platform_tradingview.html` · `ig_platform_webull.html` · `ig_platform_finviz.html` · `ig_broker_comparison.html`
**First referenced:** Week 1 (pre-reading)

This section covers the infrastructure layer — the decisions and tools you need in place before you analyze a single chart. Read it before Week 1. Return to it when you're choosing a live broker or configuring your platforms.

---

## §1.1 — What Kind of Trader Are You?

Before you learn a single indicator, answer this question: what style of trading fits your life, your capital, and your current skill level?

Every style is a valid choice. Most styles are wrong for a first-year trader. FINN's curriculum is built around swing trading in Months 1–3 because swing trading has the optimal feedback loop for learning — trades last long enough to analyze, short enough to generate volume of experience.

### Trade Style Taxonomy

| Style | Hold Time | Trades/Week | Capital to Start | PDT Exposure | FINN Phase |
|-------|-----------|:-----------:|:----------------:|:------------:|:----------:|
| **Scalp** | Seconds – 5 min | 50–200+ | $25k+ (PDT) | Extreme | Not in scope |
| **Day Trade** | Minutes – hours | 5–20 | $25k+ (PDT) | High | Paper only, M1–M3 |
| **Momentum** | Hours – 2 days | 3–10 | $5k+ | Moderate | M2–M3 |
| **Swing Trade** | 2–10 days | 1–5 | $2k+ | Low | **M1–M3 (primary)** |
| **Options** | Days – weeks | 1–5 | $5k+ | Low–Moderate | M4–M5 (intro) |
| **Position** | Weeks – 3 months | < 1 | $2k+ | Very Low | M3–M6 (secondary) |
| **Pairs / Spread** | Days – weeks | 1–3 | $10k+ | Low | M4–M6 (advanced) |
| **Systematic / Algo** | Rule-defined | Rule-defined | Variable | Rule-defined | M5–M6 (FINN core) |

### Style Descriptions

**Scalp** — The fastest style. You are competing directly with HFT algorithms and market makers who see your order flow before you do. Scalping requires sub-second execution, extremely tight bid-ask spreads, and a statistical edge measured in fractions of a percent per trade. Do not attempt this in your first year.

**Day Trade** — You open and close every position within the same calendar day. You are never exposed to overnight gap risk. The tradeoff: the Pattern Day Trader (PDT) rule requires $25,000+ in your margin account if you make more than 3 day trades in a rolling 5-day window. Paper trading has no PDT restriction.

**Momentum Trade** — You enter a stock that is already moving on catalysts (earnings, news, sector rotation) and ride the move for hours to 1–2 days. High win rates are possible, but losses are sharp when reversals happen. Requires real-time scanning during market hours.

**Swing Trade** — You hold positions for 2–10 trading days, targeting a directional "swing" from one price level to another. You analyze after market hours. You check positions once or twice during market hours. This is the primary style taught in FINN Months 1–3 because it is compatible with a full-time job and provides the volume of trades needed to evaluate a strategy statistically.

**Options** — You trade contracts giving the right (not obligation) to buy or sell a stock at a specific price. Options allow you to define maximum loss, create asymmetric payoffs, and trade volatility independently of direction. Introduced in FINN Month 4 as a supplement to your equity strategy, not a replacement.

**Position Trade** — You hold for weeks to months based on fundamental, macro, or sector rotation analysis. Very low frequency. Requires significant moves to justify transaction costs. Best paired with a day job. Used in FINN as a secondary strategy layer.

**Pairs / Spread Trading** — You simultaneously go long one asset and short a correlated asset, betting on the spread between them widening or narrowing. Market-neutral — you profit from relative performance, not market direction. Requires deeper analysis. Introduced Month 4+.

**Systematic / Algo Trading** — Your entire strategy is codified in rules. A signal fires, a position is sized, an order is placed — no discretionary override. This is FINN's core methodology. Every prior style can be systematized. The capstone project (Months 5–6) implements this in Python.

### FINN's Recommendation

Start as a swing trader. In Months 1–3, every trade you make on paper should be a swing trade. You will accumulate enough trades to test hypotheses statistically. You will develop the discipline of setting rules before you enter. You will learn to hold through short-term noise without abandoning a valid setup.

When your swing strategy has a documented IC > 0.05 and positive paper-trading Sharpe, you will have the foundation to layer in other styles.

---

## §1.2 — TradingView: Your Primary Chart Platform

TradingView is your primary analysis platform in FINN. You read charts here, set alerts here, and perform most of your pre-trade technical analysis here. The free tier is sufficient for FINN Months 1–4.

**Platform:** `tradingview.com` — browser-based. No download required. Optional desktop app available.

### Account Setup

1. Go to `tradingview.com` → click **Get Started** → create a free account
2. Verify your email
3. On first login: dismiss the tutorial pop-up. You will navigate this yourself.

**Free vs. Pro:** The free tier limits you to 1 active indicator per chart. You can work around this by combining indicators into a single script (covered in FINN Month 2). For Months 1–3, prioritize: RSI + Volume. Add EMA lines using the built-in overlay settings.

### Chart Configuration

**Setting chart type to Candlestick:**
Top toolbar → chart type icon (second from left in the top bar) → select **Candles**

Use candlestick charts. Line charts discard open/high/low data. Bar charts contain the same data but are harder to read.

**Timeframes (top-left selector):**

| Timeframe | FINN Use Case |
|-----------|--------------|
| **D (Daily)** | Primary swing trade analysis — use this most |
| **W (Weekly)** | Trend context — look here before any swing setup |
| **4H** | Entry timing — find your entry window within the daily trend |
| **1H** | Intraday context on entry day |
| **15m** | Only on entry day to time a precise limit order |

The Daily chart is where FINN does most of its work. Weekly context, daily signal, 4H entry.

### Adding Indicators

Click the **Indicators** button (top center) → search by name → click to apply.

**FINN standard indicator setup:**

| Indicator | Settings | Purpose |
|-----------|----------|---------|
| RSI | Length: 14, Source: Close | Momentum / overbought-oversold |
| Volume | Default | Confirm breakouts and reversals |
| EMA | Length: 20, color: blue | Short-term trend |
| EMA | Length: 50, color: orange | Medium-term trend |
| SMA | Length: 200, color: red | Long-term trend filter |

To add a second EMA: click **Indicators** → type "EMA" → click again to add a second instance → configure separately.

**VWAP:** Add for intraday charts only (not meaningful on daily). Search "VWAP" → apply when using 1H or 15m charts on entry day.

### Watchlists

Right side panel → **Watchlist** tab → click **+** to add tickers.

Create separate lists:
- `FINN Core` — SPY, QQQ, VIX, TLT, DXY, USO (macro read)
- `Swing Candidates` — your active watchlist (rebuild weekly)
- `On Watch` — setups with a specific entry trigger pending

Keep your swing watchlist under 15 tickers. More than that dilutes attention.

### Alerts

Right-click on any price level on the chart → **Add Alert** → set condition (price crossing level) → notification method (email or app).

Set price alerts on your S&R levels and trendlines. Alerts replace the need to watch a chart continuously.

### Saving Chart Templates

Set up your indicators once → right-click the chart → **Save as Template** → name it "FINN Standard". Apply this template to any new ticker by right-clicking and selecting **Apply Template**.

---

## §1.3 — Webull: Your Paper Trading Platform

Webull is FINN's paper trading platform. Paper trading uses virtual money against real market prices and real order books. This is not a simulation — when your paper limit order fills, it fills because a real counterparty existed at that price.

**Download:** `webull.com` → **Download** → choose Desktop (Windows or Mac). The mobile app works but desktop is preferred for order management.

### Account Setup

1. Download and install Webull desktop
2. Create a free account (email + phone verification)
3. Once logged in: top menu → **Paper Trading** → click **Enable Paper Trading**
4. Your paper account starts with $1,000,000 in virtual cash. You can reset this.

**Setting your paper account balance:**
In Paper Trading mode → **Account** → **Reset Paper Account** → set to $10,000.

Use $10,000 as your paper account starting balance. It is a realistic amount for a new trader's live account, and it forces you to think in terms of real position sizing, not unlimited capital.

### Interface Overview

After switching to Paper Trading mode (toggle in the top bar):

| Area | Purpose |
|------|---------|
| Watchlist (left panel) | Track tickers you are following |
| Chart (center) | Price chart — set to candlestick, daily |
| Order entry (right panel) | Place buy/sell orders |
| Positions tab (bottom) | View open positions, unrealized P&L |
| Orders tab (bottom) | View pending, filled, and cancelled orders |
| Account tab (bottom) | Portfolio value, buying power, P&L summary |

### Placing a Paper Trade

**Buying (Long Entry):**
1. Search for your ticker in the search bar
2. Right panel → **Trade** → **Buy**
3. Order type: select **Limit** (always use limit, not market, for entries)
4. Shares: enter your calculated position size
5. Limit price: enter your entry price
6. Time in force: **Day** (expires if not filled by market close) or **GTC** (Good Till Cancelled — stays active)
7. Review → **Place Order**

**Setting a Stop-Loss (after entry fills):**
Positions tab → click your position → **Sell** → Order type: **Stop** → Stop price: your stop level → **Place Order**

Or use **OCO (One-Cancels-Other):** sell at profit target (limit) and stop-loss simultaneously — whichever fills first cancels the other. Webull supports OCO orders: Trade → Sell → Order Type: OCO.

**Closing a Position:**
Positions tab → click position → **Close Position** (market order) or set a limit sell order manually.

### Viewing Performance

**Account tab:**
- **Total P&L** — all-time paper trading gain/loss
- **Today's P&L** — intraday change
- **Buying Power** — available capital for new positions

**Trade History:** Orders tab → **History** — view all filled orders. Export this data at the end of each week for your journal.

### Paper Trading Rules in FINN

1. Every paper trade requires a journal entry before the order is placed
2. Stop-loss order must be placed immediately after entry fills
3. Position size must be calculated using the FINN formula (see Glossary: Position Sizing)
4. Do not exceed 10% of your $10,000 paper account in any single position ($1,000 max risk per trade — using the 1% rule that means $100 risk with a stop-distance-based share count)

---

## §1.4 — Finviz: Your Market Intelligence Dashboard

Finviz is a free, browser-based market data and screening tool. You use it during your Daily Market Briefing (DMB) to get a quick macro read before your TradingView deep-dive. No account required for basic use.

**Platform:** `finviz.com` — browser only, no download

### The Home Page

The Finviz home page on any trading day shows:
- **Futures:** S&P 500, Nasdaq, Dow, Russell 2000 pre-market futures — your first read of the morning
- **Forex:** major currency pairs
- **Top news headlines:** real-time
- **Market summary table:** major indices, sectors, % change

This is your DMB starting point. Open Finviz before TradingView every morning.

### The Heatmap

Navigation: `Maps` tab (top nav) → **S&P 500**

The heatmap displays every S&P 500 stock as a color-coded rectangle. Size = market cap. Color intensity = % change (green = up, red = down).

**How to read it:**
- Uniform green or red = broad market move in one direction
- Mixed = rotation or sector-specific news
- Large rectangles dominating the color = mega-caps (AAPL, MSFT, NVDA, AMZN) driving index

Change the grouping in the top dropdown: **By Sector** (default) or **By Industry**. Switch between **% Change**, **Performance (Week)**, and **Performance (Month)** to see different timeframes.

Use the heatmap to answer: *which sectors are leading and lagging today?*

### The Screener

Navigation: `Screener` tab (top nav)

The screener filters the entire stock universe by fundamental, technical, or descriptive criteria. FINN's basic swing-trade scan setup:

| Filter | Setting |
|--------|---------|
| Exchange | NYSE, NASDAQ |
| Market Cap | Mid ($2B–$10B) or Large (>$10B) |
| Average Volume | Over 500K |
| Price | Over $10 |
| RSI (14) | Oversold (30) or Overbought (70) — depending on your hypothesis |
| Country | USA |

Click **Screener** → **Filters** tab → set criteria → results appear in the table below.

The results table is sortable. Sort by **Volume** or **% Change** to surface the most active names meeting your criteria.

**Saving a screen:** Create a free Finviz account to save screener presets. Otherwise you rebuild the scan each session.

### The News Tab

Navigation: `News` tab (top nav)

Finviz aggregates news from multiple financial sources. Use the ticker search at the top to filter news for a specific stock. This is faster than searching Google for pre-market news on your watchlist names.

### The Futures Tab

Navigation: Home page → **Futures** section (below the main nav)

Or: `Futures` tab in top nav → shows full futures table across equity, commodity, currency, and bond futures.

Use the futures table during your pre-market DMB to assess overall market bias before the open.

### FINN DMB Sequence on Finviz

Each morning (before market open):
1. Home page → check futures direction (risk-on or risk-off?)
2. Maps → S&P 500 heatmap → which sectors leading/lagging?
3. News → scan your watchlist tickers for pre-market catalysts
4. Screener → run your FINN swing scan → note any new setups meeting your criteria

Total time: 5–10 minutes. Then move to TradingView for chart analysis.

---

## §1.5 — Broker Comparison: Choosing Your Live Trading Account

You paper trade on Webull throughout FINN. When you are ready to open a live account (your decision, your timeline), here is the landscape as of 2026.

**FINN does not recommend when to go live.** That decision depends on your paper trading Sharpe, your documented win rate, your financial cushion, and your emotional readiness. The data will tell you when you are ready. Do not go live on a schedule — go live when the evidence supports it.

### Comparison Table

| Broker | Commissions | PDT Rule | Min (no PDT) | Paper Trading | Options | Short Selling | FINN Fit |
|--------|:-----------:|:--------:|:------------:|:-------------:|:-------:|:-------------:|:--------:|
| **Webull** | $0 stocks | Enforced | $0 (PDT still applies) | ✅ Built-in | ✅ Level 2 | ✅ | ★★★★★ |
| **Schwab / Thinkorswim** | $0 stocks, $0.65/contract options | Enforced | $0 | ✅ paperMoney | ✅ Full | ✅ | ★★★★☆ |
| **Interactive Brokers (IBKR)** | $0–$0.005/share | Enforced | $0 | ✅ TWS paper | ✅ Full | ✅ Excellent | ★★★★★ |
| **Robinhood** | $0 stocks | Enforced | $0 | ❌ None | ✅ Level 3 | ✅ Limited | ★★☆☆☆ |
| **E*TRADE / Morgan Stanley** | $0 stocks, $0.65/contract | Enforced | $0 | ✅ Virtual | ✅ Full | ✅ | ★★★☆☆ |
| **Tastytrade** | $0 stocks, $1/contract cap | Enforced | $0 | ✅ | ✅ Best-in-class | ✅ | ★★★★☆ |

### Notes by Broker

**Webull** — Free, modern interface, paper trading built-in. The natural progression from your paper account to a live account. Fractional shares available. Extended hours trading (4AM–8PM EST). Best choice for FINN students making their first live account.

**Schwab / Thinkorswim** — Thinkorswim is the professional-grade platform inherited from TD Ameritrade (fully merged with Schwab by 2024). The paperMoney paper trading environment is the most realistic available — it even simulates partial fills. If you intend to trade options seriously, Thinkorswim is the industry standard.

**Interactive Brokers (IBKR)** — The institutional-grade retail broker. Best margin rates, best short-selling locate access, and best international market access. The platform (TWS) is dense and has a learning curve. IBKR is where you go when you outgrow Webull. The IBKR API also enables live algorithmic trading — directly relevant to FINN Month 6 capstone.

**Robinhood** — Zero friction, zero depth. No paper trading, limited order types, gamified interface explicitly designed to increase trading frequency. Not recommended for FINN students. The platform is built against the habits FINN is building.

**E*TRADE / Morgan Stanley** — Solid broker with full-featured platform. Less compelling than Webull for beginners or Schwab/IBKR for advanced traders. No strong FINN-specific reason to choose it.

**Tastytrade** — Built for options traders. Options commissions are capped at $10/leg (not $0.65 × N contracts), making it the cheapest option for large options positions. If your FINN Month 4–5 strategy becomes options-heavy, Tastytrade is worth considering. Equity trading is $0 commissions.

### PDT Rule Workarounds

The Pattern Day Trader rule requires $25,000 minimum equity if you make more than 3 round-trip day trades in a 5-business-day window in a margin account.

**Legal workarounds:**
- Trade a cash account (no PDT rule, but settlement times apply — T+1 for equities as of 2024)
- Open an account offshore through a broker not subject to FINRA PDT rules (higher risk, less regulatory protection)
- Don't day trade — swing trading has no PDT restriction

FINN's recommendation: stay in a cash account during paper trading and early live trading. The PDT rule is not a problem for swing traders.

---

## Summary — Part 1 Checklist

Before Week 1 session, confirm:

- [ ] Trade style decision made: **Swing Trade** (FINN primary for Months 1–3)
- [ ] TradingView account created; candlestick charts configured; RSI + Volume + EMA indicators added; FINN Standard template saved
- [ ] Webull desktop installed; paper trading enabled; paper account reset to $10,000
- [ ] Finviz bookmarked; home page, heatmap, screener, and news tabs explored
- [ ] Broker comparison reviewed; live account timeline noted (paper first, live when the data supports it)

---

*Next: Part 2 — Chart Reading | `handbook/FINN_HB_P2_ChartReading.md` | Built: Session B1*

---

*FINN_HB_P1_GettingStarted.md — Student Reference Handbook Part 1*
*Built: Session A2 (May 8, 2026) | Gaps addressed: #1 (trade types), #38 (TradingView), #39 (Webull), #40 (Finviz), #42 (broker comparison)*
