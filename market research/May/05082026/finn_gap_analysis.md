# FINN vs. Udemy — Comprehensive Curriculum Gap Analysis
## Generated: May 8, 2026
### Sources: `udemy_curriculum_context.md` · `FINN_curriculum_context.md`

---

## How to Read This Document

**Coverage Score (0–3):**
- 3 = Deep — dedicated module, multiple sessions, substantial content
- 2 = Standard — present, given appropriate time
- 1 = Mentioned/light — introduced but not developed
- 0 = Absent — not covered

**Gap Priority:**
- H = High — missing content that would meaningfully improve FINN for beginners or competitiveness
- M = Medium — present but shallow; noticeable gap vs. market standard
- L = Low — Udemy covers it; FINN's approach differs by design; omit intentionally
- P = FINN Advantage — FINN meets or exceeds both Udemy courses; no action needed

**Destination (where the gap gets addressed):**
- RH = Reference Handbook (new standalone student document)
- W01/W02 = Integrate into existing Week 1–2 curriculum files
- Wiki = Add section to `FINN_Curriculum_Wiki.md`
- NC = No change needed

---

## Section 1 — Core Technical Analysis: Element-by-Element

| # | Topic | Udemy C1 | Udemy C2 | FINN | Priority | Benchmark Note | Action |
|---|-------|:--------:|:--------:|:----:|:--------:|----------------|--------|
| 1 | Candlestick anatomy (visual reading) | 3 | 3 | 1 | H | Both Udemy courses dedicate extensive time to visual candlestick reading. FINN encodes patterns as binary features in Python but never teaches visual identification in TradingView. Students reaching W06 will be coding patterns they can't yet recognize on a live chart. | RH: full visual candlestick guide (30+ patterns, descriptions, chart screenshots or diagrams). W02 theory: add 10-min live candlestick identification block. |
| 2 | OHLC price bars | 3 | 2 | 3 | P | FINN covers OHLCV deeply in code and in the DMB. Full parity. | NC |
| 3 | Trendlines & channels | 3 | 3 | 0 | H | Trendlines are the single most-drawn tool on any chart. Both Udemy courses treat it as non-optional. FINN never teaches trendline drawing — not in code, not visually. Students doing the DMB from Week 1 will encounter trendlines on live charts without any instruction on how to draw or read them. | RH: how to draw trendlines, uptrends, downtrends, channels, false breaks, the filter and 1-2-3 rule. W02 Monday theory: add trendline block (15 min). |
| 4 | Support & Resistance | 2 | 3 | 1 | H | S&R is the most universally taught concept in retail TA. FINN mentions it implicitly in order flow discussion (W02) but never teaches S&R identification methodology. Students cannot read a chart without understanding where the key levels are. | RH: S&R zone drawing, level testing and retesting, horizontal vs. dynamic S&R, how price behaves at zones. W01 Friday or W02 Monday: add S&R identification block. |
| 5 | Chart patterns — continuation | 3 | 3 | 0 | M | Triangles, flags, pennants, wedges, rectangles. Both Udemy courses cover these as core pattern reading. FINN encodes candlestick-level patterns but not chart-level structure patterns. Students building strategies will find these patterns referenced everywhere without FINN having explained them. | RH: continuation patterns visual guide with trading signal descriptions. No curriculum change required — these are recognizable labels for structure FINN already analyzes quantitatively. |
| 6 | Chart patterns — reversal | 3 | 3 | 0 | M | Double bottom/top, head and shoulders, cup with handle. Covered extensively in both Udemy courses. Same issue as above — beginner students will encounter these terms constantly. | RH: reversal patterns visual guide. Note in W06: these patterns are subsets of the indicator-detected signals FINN already tests. |
| 7 | Moving averages (SMA, EMA) | 3 | 2 | 3 | P | FINN covers 9/20/50/200 EMA and SMA as engineered features with distance normalization. Stronger than Udemy. | NC |
| 8 | MACD | 3 | 2 | 3 | P | FINN uses MACD histogram as a feature. Full coverage. | NC |
| 9 | RSI | 3 | 3 | 3 | P | FINN covers RSI deeply: as a feature, as a backtest strategy, statistically validated with IC. Strongest in class. | NC |
| 10 | Stochastic Oscillator | 2 | 2 | 2 | P | FINN includes %K/%D crossover in feature matrix. On par. | NC |
| 11 | ATR | 3 | 0 | 3 | P | FINN uses ATR for position sizing. Deeper application than either Udemy course. | NC |
| 12 | Bollinger Bands | 3 | 0 | 3 | P | FINN covers BB as %B normalized feature. Strong. | NC |
| 13 | Fibonacci retracements | 2 | 3 | 1 | M | Udemy C2 has a 3-part advanced Fibonacci module plus a proprietary Fibonacci impulse trading system. FINN mentions Fibonacci but does not teach it. Fibonacci is arguably the most common tool retail traders discuss. Beginners will want to know how to use it. | RH: Fibonacci retracement basics — how to draw, key levels (38.2%, 50%, 61.8%, 78.6%), how traders use it, and FINN's honest framing (statistical signal, not magic). |
| 14 | Volume analysis (standalone) | 0 | 3 | 2 | M | FINN uses OBV in the feature matrix and covers volume ratio flags in W02. Udemy C2 goes much deeper: volume as a standalone interpretive skill — effort vs. result law, climactic volume, volume divergence as an institutional footprint read. FINN has the code, not the interpretive framework. | RH: volume reading guide — what volume tells you, high/low volume patterns, OBV divergence, climactic volume signals. W02 workshop: extend volume section to include interpretation, not just detection. |
| 15 | Gaps — 4 types | 3 | 0 | 1 | H | Udemy C1 covers all 4 gap types with trading strategies. FINN detects gaps in code (W02 `flag_notable_days()`) but never names them or explains what each type means. Students will see "gap" flagged in their notebooks without knowing if it's a breakaway or exhaustion gap — which have opposite implications. | RH: 4 gap types with visual descriptions and trading signal — breakaway (strong directional), runaway/measuring (continuation), exhaustion (near reversal), island reversal (strong reversal). Add naming layer to W02 workshop commentary. |
| 16 | Wyckoff methodology | 0 | 3 | 0 | L | Wyckoff is a sophisticated professional framework (accumulation/distribution phases, Effort vs. Result law, climactic volume interpretation). Udemy C2 dedicates a full module to it. Adding it to FINN would require minimum 2 weeks. Design decision: out of scope for FINN's current build. | RH: include as "Advanced Further Reading" entry only — brief 1-page description pointing to external resources. |
| 17 | Market Profile / Volume Profile | 0 | 3 | 0 | L | POC, value area, Gaussian distribution. Advanced institutional framework. Out of scope for FINN. | RH: brief "Further Reading" reference only. |
| 18 | Heikin Ashi candlesticks | 0 | 2 | 0 | M | Heikin Ashi are available on every charting platform and are one of the first things beginner traders encounter. They smooth noise and show trend more cleanly. Not complex — 2–3 pages of explanation. | RH: dedicated Heikin Ashi section — what they are, how they differ from standard candles, how to switch in TradingView, when they're useful vs. misleading. |
| 19 | ADX (trend strength filter) | 0 | 1 | 3 | P | FINN uses ADX > 25 as a trending regime filter in the feature matrix. Ahead of both Udemy courses. | NC |
| 20 | OBV | 0 | 0 | 2 | P | FINN includes OBV as a feature. | NC |
| 21 | VWAP | 0 | 0 | 2 | P | FINN includes rolling VWAP proxy as an intraday fair value anchor. | NC |
| 22 | Impulse structures | 0 | 3 | 0 | L | Course 2's proprietary entry framework (1st/2nd/3rd impulse, structures within structures). Professional-level and tightly integrated with Giorgio's system. Out of scope. | NC |
| 23 | Deceptive setups / trap identification | 0 | 2 | 1 | M | Stop hunts, bull/bear traps, false breakouts. FINN covers stop hunt dynamics conceptually in W02 (stop placement importance). The explicit "how the market engineers fake moves" framing is not taught. This is high-value psychological protection for beginners. | RH: "Market Traps" section — bull trap, bear trap, stop hunt, false breakout. How to spot them, how to protect against them. W02: expand the stop hunt reference already present. |

---

## Section 2 — Strategy, Systems & Trade Management

| # | Topic | Udemy C1 | Udemy C2 | FINN | Priority | Benchmark Note | Action |
|---|-------|:--------:|:--------:|:----:|:--------:|----------------|--------|
| 24 | Rules-based trading plan | 3 | 3 | 3 | P | FINN builds complete rules-based systems from hypothesis through backtest. Strongest in class. | NC |
| 25 | Paper trading (structured) | 3 | 1 | 3 | P | FINN's 6-month paper trading program is unmatched. Both Udemy courses mention it, FINN lives it. | NC |
| 26 | Backtesting (quantitative) | 3 | 0 | 3 | P | FINN backtests programmatically with Backtrader, walk-forward, and QuantStats. Far ahead of both competitors. | NC |
| 27 | Stop-loss strategy | 3 | 3 | 3 | P | FINN covers %, ATR, indicator-based, timing, and hard-stop types. Strong. | NC |
| 28 | Position sizing / money management | 1 | 3 | 3 | P | FINN covers Kelly Criterion + ATR-based sizing in Month 3. Deep advantage. | NC |
| 29 | Order types — complete taxonomy | 3 | 2 | 2 | M | FINN covers market, limit, stop, stop-limit, trailing, MOO/MOC. Udemy C1 adds AON (All-or-None), FOK (Fill-or-Kill), IOC (Immediate-or-Cancel), GTC (Good-till-Canceled), and bracketed orders. FINN students are missing the conditional and time-in-force orders that real platforms offer. | RH: complete order type taxonomy table — all types, definitions, use cases, when to use. Reference Webull and TradingView equivalents for each. |
| 30 | Market regime detection | 0 | 2 | 3 | P | FINN's 5-state regime classifier is ahead of both competitors. Clear advantage. | NC |
| 31 | Trading psychology (standalone) | 1 | 3 | 2 | M | Udemy C2 has a dedicated "Psicotrading" module covering mindset, mindfulness, energy management, goal setting, the "Holy Grail" myth, emotional journal as a separate artifact. FINN integrates psychology throughout but has no standalone session dedicated to it. Students would benefit from having it explicit early — before they start paper trading. | RH: "Trading Psychology Primer" — the 3 dangerous emotions, cognitive biases in trading (recency, loss aversion, confirmation), the pre-trade and post-trade mental check. Consider placing a brief W09 Monday segment before paper trading begins. |
| 32 | Emotional journal (standalone artifact) | 1 | 3 | 2 | M | FINN's trading journal combines trade mechanics and performance tracking. Udemy C2 separates the emotional journal — "before trading" state, "during trade" state, and "after trade" reflection — as a distinct artifact from the performance log. This before/after structure is clinically superior for behavioral awareness. | Modify FINN's existing journal template: add 2 fields — Pre-Trade Emotional State (1–5 + note) and Post-Trade Reflection (1–3 sentences). No new file required — update journal template in W09 and Reference Handbook. |
| 33 | Investment time horizons / trade styles | 0 | 2 | 0 | H | Udemy C2 covers scalping through long-term investment. FINN assumes students know where they fit. Beginners typically have no frame for "am I a day trader or a swing trader?" — this decision affects everything: platform choice, capital requirements, time commitment, risk profile. | RH: dedicated trade styles section — full taxonomy ranked by difficulty, time horizon, capital requirements, and platform needs. |
| 34 | Multi-timeframe analysis (MTF) | 1 | 3 | 1 | M | Udemy C2 has an extended SP500 MTF drill (daily → 60min → 15min → 3min). FINN references timeframes but never drills the top-down framework. Students in the DMB are looking at daily charts; understanding how 4hr and 15min context changes the read would improve hypothesis quality. | RH: MTF analysis section — top-down framework, how to move between timeframes in TradingView, what each timeframe shows. Optional: add a MTF chart reading block to one Friday chart review session (W05 or W06). |
| 35 | Types of trading days | 0 | 2 | 0 | M | Trending days (clear direction, ride), rotational days (chop, avoid breakouts), news-driven days (volatile, wide spreads). Udemy C2 teaches day type classification. This directly connects to FINN's regime classifier — it's the intraday version. Knowing the day type helps students know whether to execute or stand aside. | RH: "Reading Today's Market" section — how to identify the day type in the first 30–60 minutes, what each type implies for strategy execution. |
| 36 | Market opening behaviors | 0 | 2 | 0 | M | How price behaves at session open — Asia-Europe range, opening range breakout, first 30-min behavior patterns, opening type classification. Directly relevant to FINN's DMB structure and the hypothesis-setting block. Students are watching the open every morning without any formal instruction on how to read it. | RH: "Reading the Open" section — pre-market range, opening types, first 30-min setup patterns, how opening behavior connects to intraday hypothesis. |
| 37 | Live trade setup demonstrations | 3 | 3 | 0 | H | Both Udemy courses show live trade identification and annotation on real charts. FINN has no equivalent — the DMB runs chart reviews but doesn't walk through "here is a setup forming, here is why I'd take it or pass, here is where I'd place the stop." Students learn theory and code but never see a practitioner read and decide in real time on a live chart. | Design: add a "Live Chart Walk" segment to select Friday sessions (W05 onward) — instructor annotates a live chart in TradingView, identifies a setup, explains the decision logic, maps it to the relevant indicator signals. No real money required. This is a format change, not new content creation. |

---

## Section 3 — Beginner Foundation: Critical Gaps

These are absent from FINN as standalone structured content. Both Udemy courses address beginner onboarding explicitly. FINN does not.

| # | Topic | Udemy C1 | Udemy C2 | FINN | Priority | Benchmark Note | Action |
|---|-------|:--------:|:--------:|:----:|:--------:|----------------|--------|
| 38 | TradingView platform setup guide | 3 | 3 | 0 | H | Both Udemy courses include dedicated TradingView instruction — chart types, indicator panels, drawing tools, watchlists, alerts, layout saving. FINN uses TradingView in every DMB from Day 1 without ever formally teaching it. A student who has never used TradingView cannot follow the DMB effectively. | RH: TradingView setup guide — account creation, chart types (candlestick, Heikin Ashi, bar), adding indicators, drawing tools, alert setup, watchlist management, multi-chart layouts. |
| 39 | Webull paper trading setup guide | 0 | 0 | 1 | H | FINN prescribes Webull from W09 onward but provides no setup guide. Students will encounter paper trading account creation, order placement interface, position management, and P&L reporting for the first time with no reference. | RH: Webull paper trading guide — account creation, switching to paper trading mode, placing orders (market, limit, stop), reviewing positions and P&L, order history export. |
| 40 | Finviz setup and usage guide | 0 | 0 | 1 | H | Finviz sector heatmap is used in every DMB from Week 1. The screener, news tab, and futures tab are referenced regularly. FINN assumes familiarity without teaching it. | RH: Finviz guide — heatmap navigation and interpretation, screener setup for basic filters, news tab, futures tab, earnings calendar. |
| 41 | Trade type taxonomy ranked by difficulty | 0 | 2 | 0 | H | FINN teaches one trade type (long equities on Webull paper). A beginner looking at the full trading landscape has no map. Udemy C2 covers scalping → day trading → swing → medium/long-term investment. This doesn't include options, futures, forex, or crypto — which beginners ask about constantly. | RH: "What Kind of Trader Are You?" — full taxonomy covering all 8 trade styles/asset classes: long equities (beginner), short equities (intermediate), options buying (intermediate), swing trading (intermediate), day trading (advanced), futures (advanced), forex (advanced), crypto (beginner–advanced). For each: time horizon, capital requirements, skill level, platform, risk profile, why most beginners fail at it. |
| 42 | Broker selection and comparison | 2 | 1 | 0 | H | Udemy C1 dedicates a full section to broker selection. FINN prescribes Webull with no explanation of why or how it compares. Beginner students who want to eventually use real money need to know their options. | RH: broker comparison table — Webull, TD Ameritrade (ThinkorSwim), Interactive Brokers, Charles Schwab, Robinhood, Tastytrade. Key criteria: commission structure, paper trading availability, platform quality, options support, customer service, account minimums. Include FINN's recommendation note for why Webull is used in class. |
| 43 | News and market information sources | 0 | 1 | 1 | H | FINN's DMB references 10-year yield, VIX, macro calendar, Finviz heatmap — but never maps where students should go to find financial news, macro data, earnings, sentiment indicators on their own. Beginners ask "where do I get information?" constantly. | RH: comprehensive "Information Sources Map" — organized by category (see Section 6 for full outline). |
| 44 | Candlestick pattern visual guide | 3 | 3 | 1 | H | Both Udemy courses teach visual candlestick reading with dedicated time. FINN's W06 encodes patterns as binary features but never teaches the student to identify them visually. Students need to recognize a hammer or engulfing pattern on a live TradingView chart — not just know the variable is a 1 in a DataFrame. | RH: candlestick reference guide — at minimum: Doji (standard, dragonfly, gravestone), Hammer, Inverted Hammer, Hanging Man, Shooting Star, Bullish/Bearish Engulfing, Harami, Morning Star, Evening Star, Three White Soldiers, Three Black Crows. For each: visual description, signal implication, confirmation needed. |
| 45 | Trader's daily personal routine | 1 | 2 | 2 | M | FINN's DMB is a class-format routine. Students need a personal routine they can run independently before and after class — not every student can attend every DMB. | RH: "The Trader's Daily Routine" — pre-market checklist (6:00–9:30 AM), market hours monitoring protocol, post-market review (4:00–6:00 PM). Maps to FINN's DMB structure but formatted as a personal operating guide. |
| 46 | Sentiment indicators (non-AI) | 1 | 0 | 2 | M | FINN covers FinBERT AI sentiment (advanced) and references put/call ratio and VIX term structure in Friday sessions. What's missing: Fear & Greed Index, AAII Investor Survey, and put/call ratio as standalone readable tools with interpretation guidance — before the AI layer. | RH: "Market Sentiment Gauges" — Fear & Greed Index (how to read, what extremes mean), AAII survey (contrarian signal), put/call ratio (below 0.7 = bullish complacency, above 1.0 = fear), VIX level interpretation, short interest ratio. |
| 47 | Fibonacci (beginner application) | 2 | 3 | 1 | M | Fibonacci is on every trader's lips. FINN mentions it without teaching it. The tool is conceptually simple to apply even if the underlying math is not obviously relevant. FINN's honest framing (it's a commonly-used self-fulfilling reference, not magic) is the right approach — but the tool should still be explained. | RH: Fibonacci section — how to draw a retracement in TradingView, key levels (38.2%, 50%, 61.8%, 78.6%), how traders use them as entry/stop/target zones, FINN's honest assessment of statistical validity. |
| 48 | Heikin Ashi (beginner tool) | 0 | 2 | 0 | M | Heikin Ashi are one of the first "interesting" things a new trader finds on a charting platform. They're available in TradingView with one click and show trend more clearly than standard candles. | RH: Heikin Ashi section — what they are, how they differ (averaged OHLC values), when they're useful (trend-following, filtering noise), when they're misleading (they obscure exact price levels, wicks are less reliable), how to switch in TradingView. |
| 49 | Trading psychology primer | 1 | 3 | 2 | M | FINN integrates psychology throughout the journal and the 6 risk rules. Udemy C2 dedicates a full standalone module. A beginner who understands the psychological traps before paper trading begins will make better decisions earlier. | RH: "Trading Psychology" chapter — the 3 dangerous emotions (fear, greed, hope), loss aversion bias, recency bias, confirmation bias, overconfidence after wins, pre-trade and post-trade emotional check framework. |
| 50 | FINN glossary / terminology index | 0 | 0 | 0 | M | FINN uses dense terminology from Week 1 onward (IC, ADF, PFOF, bid-ask spread, OHLCV, Sharpe, drawdown, expectancy, alpha, beta, regime). Neither Udemy course has a formal glossary but their vocabulary is more familiar to beginners. FINN's vocabulary is more technical. | RH: Appendix — FINN Terminology Glossary (50–70 terms). Organized alphabetically with plain-language definitions and the week it first appears. |
| 51 | Multi-timeframe analysis basics | 1 | 3 | 1 | M | Top-down chart reading — daily context, 4hr setup, 1hr entry. Udemy C2 drills this on SP500 extensively. FINN does daily-timeframe analysis in all notebooks. Students building their own strategies may not know how to use shorter timeframes for entry precision. | RH: "Multi-Timeframe Analysis" section — how to structure top-down analysis, what each timeframe reveals, how to align signals across timeframes in TradingView. |

---

## Section 4 — FINN Differentiators (Clear Advantages, No Action Needed)

These are FINN's structural advantages — not covered at any meaningful depth by either Udemy course. FINN wins decisively in every category below.

| # | Topic | FINN Score | Why FINN Wins |
|---|-------|:----------:|---------------|
| 52 | Python-first / code-native | 10/10 | Neither Udemy course touches code. All analysis built in Python from Month 1. |
| 53 | Statistical signal validation (IC, p-value) | 10/10 | IC-first validation is unique to FINN. Neither competitor tests whether signals are real. |
| 54 | Machine learning (XGBoost + SHAP) | 10/10 | No competitor mentions ML. FINN trains, validates, and interprets models on live data. |
| 55 | NLP sentiment analysis (FinBERT) | 10/10 | Neither competitor uses AI for sentiment. FINN integrates it as a quantified signal. |
| 56 | Hypothesis-as-trade intellectual framework | 10/10 | FINN's core intellectual design. Every trade requires specific numbers in a testable form. |
| 57 | Walk-forward backtesting (programmatic) | 10/10 | FINN uses Backtrader with walk-forward methodology. Udemy C1 mentions manual backtesting only. |
| 58 | Portfolio attribution (alpha vs. beta) | 10/10 | Decomposing returns into alpha, beta, and noise. No Udemy course approaches this. |
| 59 | Automated signal pipeline | 10/10 | Pre-market automated data fetch → scoring → alert system built from scratch. Unique to FINN. |
| 60 | Market regime classifier (5 states) | 10/10 | Quantified 5-regime classifier with strategy-selection logic. No Udemy equivalent. |
| 61 | 6-month structured paper trading | 10/10 | Both Udemy courses mention paper trading. FINN lives it for 4 months with performance attribution. |
| 62 | Milestone-based oral assessment | 10/10 | Unique evaluation structure. No multiple choice, no certificate-on-completion. Socratic standard. |
| 63 | Capstone research project | 10/10 | 7-section quantitative strategy report with 20-min presentation + 10-min Q&A. No equivalent. |

---

## Section 5 — Benchmark Scorecard

| Dimension | Udemy C1 | Udemy C2 | FINN | FINN vs. Market |
|-----------|:--------:|:--------:|:----:|:---------------:|
| Visual TA pattern coverage | 9 | 10 | 3 | **Gap** |
| Beginner onboarding (platforms, routine, sources) | 7 | 8 | 2 | **Critical gap** |
| Candlestick visual reading | 9 | 9 | 2 | **Gap** |
| Trade type taxonomy / time horizons | 6 | 9 | 1 | **Gap** |
| Broker guidance | 7 | 5 | 1 | **Gap** |
| Support & Resistance | 7 | 9 | 2 | **Gap** |
| Trendlines | 8 | 8 | 0 | **Gap** |
| Chart patterns (continuation + reversal) | 9 | 9 | 0 | **Gap** |
| Gaps — 4 types | 9 | 0 | 1 | **Gap** |
| Fibonacci | 7 | 9 | 1 | **Gap** |
| Volume analysis (interpretive) | 2 | 9 | 3 | **Moderate gap** |
| Trading psychology (standalone) | 3 | 9 | 4 | **Moderate gap** |
| Order types (complete) | 9 | 7 | 6 | **Minor gap** |
| Multi-timeframe analysis | 2 | 9 | 2 | **Moderate gap** |
| Position sizing / money management | 3 | 8 | 9 | **FINN wins** |
| ATR application | 8 | 1 | 9 | **FINN wins** |
| Backtesting (quantitative) | 4 | 1 | 10 | **FINN wins** |
| Live paper trading (structured) | 3 | 2 | 10 | **FINN wins** |
| Market regime detection | 0 | 4 | 10 | **FINN wins** |
| Statistical signal validation | 0 | 0 | 10 | **FINN wins** |
| Python / code-native | 0 | 0 | 10 | **FINN wins** |
| Machine learning integration | 0 | 0 | 10 | **FINN wins** |
| AI/NLP sentiment | 0 | 0 | 10 | **FINN wins** |
| Assessment rigor | 1 | 5 | 10 | **FINN wins** |
| Capstone / final deliverable | 0 | 2 | 10 | **FINN wins** |

**Overall beginner-accessibility score:** Udemy C1: 7/10 · Udemy C2: 8/10 · FINN: **3/10**
**Overall quantitative depth score:** Udemy C1: 2/10 · Udemy C2: 4/10 · FINN: **10/10**

**Key finding:** FINN is by far the strongest course for quantitative depth, statistical rigor, code-native trading, and structured assessment. It is the weakest of the three for beginner accessibility — specifically for students who have never seen a chart, never opened a brokerage account, and don't know what kind of trader they want to be. The Reference Handbook is the right solution: it fills the beginner foundation layer without changing FINN's advanced curriculum identity.

---

## Section 6 — Gap Priority Tiers

### Tier 1 — Critical (High Priority Gaps) — Reference Handbook Primary

These are absent from FINN and represent foundational beginner needs or market-standard content present in both competitors.

| # | Gap | Why Critical | Destination |
|---|-----|-------------|-------------|
| 1 | Support & Resistance (standalone teaching) | Most taught TA concept. Students cannot read a chart without it. | RH + W02 theory block |
| 2 | Trendlines & channels (drawing methodology) | Market standard. Both Udemy courses treat it as non-optional. | RH + W02 theory block |
| 3 | Gaps — 4 types (naming and interpretation) | FINN detects gaps in code but never explains what type of gap means what. | RH + W02 workshop note |
| 4 | Candlestick pattern visual guide | Students encode patterns they can't identify on a live chart. | RH + W02 live block |
| 5 | TradingView setup guide | Used in every DMB from Day 1 with no instruction. | RH |
| 6 | Webull paper trading setup guide | Prescribed from W09 with no setup guidance anywhere in curriculum. | RH |
| 7 | Finviz usage guide | Used in every DMB, never taught. | RH |
| 8 | Trade type taxonomy (all 8 types, ranked by difficulty) | Beginners have no map. FINN jumps into equities with no context for the full landscape. | RH |
| 9 | Broker comparison table | FINN prescribes Webull without explaining why or what alternatives exist. | RH |
| 10 | Information sources map | Where do beginners go for news, data, sentiment, macro, earnings? FINN never answers this. | RH |
| 11 | Live chart walk-through sessions | Both competitors demonstrate setup identification. FINN never shows a setup being found live. | Format addition to Friday sessions (W05+) |

### Tier 2 — Medium Priority — Reference Handbook + Optional Curriculum Enhancement

| # | Gap | Why Matters | Destination |
|----|-----|-------------|-------------|
| 12 | Chart patterns — continuation | Students encounter these labels constantly. Quick visual guide adds real value. | RH |
| 13 | Chart patterns — reversal | Same as above. Double bottom/top, H&S are universal TA vocabulary. | RH |
| 14 | Fibonacci basics | Most referenced tool in retail TA. FINN should explain it even if skeptically. | RH |
| 15 | Heikin Ashi | Common beginner discovery. Quick explanation prevents misuse. | RH |
| 16 | Volume analysis (interpretive guide) | FINN has the code, not the interpretive framework. | RH + W02 workshop extension |
| 17 | Order types — complete taxonomy | AON, FOK, IOC, GTC missing. Real platforms have these. | RH |
| 18 | Trading psychology (standalone chapter) | Better placed before paper trading begins. Conceptual grounding protects beginners. | RH + W09 Monday brief segment |
| 19 | Emotional journal — pre/post trade fields | Separate emotional state from trade mechanics. Two additional journal fields. | Modify journal template in RH + W09 |
| 20 | Investment time horizons (trade style map) | Beginners need: "what am I, and where do I start?" | RH (part of trade type taxonomy) |
| 21 | Market opening behaviors | Students watch the open every day without formal instruction on how to read it. | RH |
| 22 | Types of trading days | Trending vs. rotational vs. news-driven. Helps students know when to execute vs. stand aside. | RH |
| 23 | Sentiment indicators — non-AI | Fear & Greed, AAII, put/call ratio. Before the AI layer, students need the traditional tools. | RH |
| 24 | Trader's daily routine (personal checklist) | Students need an independent routine that maps to but is separate from the class DMB. | RH |
| 25 | Multi-timeframe analysis basics | Top-down analysis — daily → 4hr → 1hr → 15min. Referenced but never drilled. | RH |
| 26 | Market traps (stop hunts, bull/bear traps) | High-value protection for beginners. FINN mentions stop hunts — needs full treatment. | RH + W02 extension |
| 27 | FINN terminology glossary | Dense vocabulary introduced early. Beginners need a reference. | RH Appendix |

### Tier 3 — Low Priority / Pass (No Action)

| # | Topic | Decision |
|----|-------|---------|
| 28 | Wyckoff methodology | Advanced professional framework. Out of scope. Brief further reading reference in RH. |
| 29 | Market Profile / Volume Profile | Out of scope. Brief further reading reference in RH. |
| 30 | Impulse structures (Course 2 proprietary) | Out of scope. No action. |

---

## Section 7 — Reference Handbook Recommended Structure

Based on this analysis, the Reference Handbook should be organized as follows. This document is a student-facing reference — not a class session plan.

```
FINN Student Reference Handbook
================================

PART 1 — GETTING STARTED
  1.1  What Kind of Trader Are You?
       → Trade style taxonomy (8 styles, ranked by difficulty)
       → Time horizons, capital requirements, skill level, platform per style
       → Where FINN fits and why we start with equities on paper

  1.2  Platform Setup Guides
       → TradingView: account, chart types, indicators, drawing tools, alerts, layouts
       → Webull: paper trading account, order entry, position view, P&L, history export
       → Finviz: heatmap, screener, news tab, futures tab, earnings calendar

  1.3  Broker Comparison
       → Comparison table: Webull, TD Ameritrade, IBKR, Schwab, Robinhood, Tastytrade
       → Key criteria: commissions, paper trading, platform, options, account minimums
       → Why FINN uses Webull for paper trading

PART 2 — READING CHARTS
  2.1  Candlestick Pattern Reference
       → Visual descriptions for 15+ patterns
       → Signal implication and confirmation requirements per pattern
       → How to identify in TradingView

  2.2  Heikin Ashi Candlesticks
       → What they are and how they differ from standard candles
       → When they're useful vs. when they mislead
       → How to switch chart type in TradingView

  2.3  Support & Resistance
       → How to identify and draw S&R zones
       → Horizontal vs. dynamic S&R
       → Testing, retesting, and zone invalidation
       → Common trader behaviors at key levels

  2.4  Trendlines & Channels
       → How to draw correctly (connecting swing lows / swing highs)
       → Uptrend vs. downtrend vs. sideways
       → Price channels and how traders use them
       → False breaks — the filter approach and 1-2-3 rule

  2.5  Chart Patterns
       → Continuation: ascending/descending/symmetrical triangle, flag, pennant, wedge, rectangle
       → Reversal: double bottom, double top, head and shoulders, cup with handle
       → Visual description + typical signal + volume confirmation for each

  2.6  Gaps — 4 Types
       → Breakaway gap (strong directional signal)
       → Runaway / measuring gap (continuation signal)
       → Exhaustion gap (near reversal warning)
       → Island reversal (strong reversal signal)
       → How FINN detects gaps in code vs. how to read them on a live chart

  2.7  Fibonacci Retracements
       → What it is and why traders use it
       → How to draw in TradingView
       → Key levels: 23.6%, 38.2%, 50%, 61.8%, 78.6%
       → FINN's honest assessment: self-fulfilling reference, not magic

  2.8  Volume Reading Guide
       → What volume tells you (and what it doesn't)
       → High volume at breakout vs. high volume at reversal
       → OBV divergence as institutional footprint signal
       → Climactic volume patterns

  2.9  Multi-Timeframe Analysis
       → Top-down framework: daily → 4hr → 1hr → 15min
       → What each timeframe reveals
       → How to align signals across timeframes in TradingView
       → Common mistakes (trading against the higher timeframe)

PART 3 — ORDER TYPES & EXECUTION
  3.1  Complete Order Type Taxonomy
       → Market, Limit, Stop, Stop-Limit, Trailing Stop
       → MOO, MOC (market-on-open, market-on-close)
       → AON (All-or-None), FOK (Fill-or-Kill), IOC (Immediate-or-Cancel)
       → GTC (Good-till-Canceled) vs. Day orders
       → Bracketed orders (OCA — one cancels all)
       → Short sell / Buy-to-Cover
       → When to use each, with Webull equivalents

PART 4 — MARKET CONTEXT
  4.1  The Trader's Daily Routine
       → Pre-market (6:00–9:30 AM): what to check, where to find it, how long to spend
       → Market hours monitoring protocol: position checks, alert management
       → Post-market review (4:00–6:00 PM): journal, hypothesis close, prep for tomorrow

  4.2  Information Sources Map
       — FINANCIAL NEWS —
         Bloomberg (bloomberg.com/markets), Reuters, CNBC, MarketWatch, Benzinga, Seeking Alpha
       — MARKET DATA & CHARTS —
         TradingView, Yahoo Finance, Finviz, Barchart, StockCharts
       — MACRO & ECONOMIC DATA —
         FRED (St. Louis Fed), CME FedWatch Tool, Investing.com Economic Calendar,
         US 10-Year Treasury Yield (CNBC/TradingView), DXY (US Dollar Index)
       — SENTIMENT GAUGES —
         CNN Fear & Greed Index, AAII Investor Sentiment Survey,
         CBOE Put/Call Ratio, VIX term structure (VIX vs. VIX3M),
         Short interest (Finviz, Ortex)
       — EARNINGS & EVENTS —
         Earnings Whispers, Finviz earnings calendar, SEC EDGAR (10-K/10-Q filings)
       — SECTOR & FLOW —
         Finviz sector heatmap, ETF.com (sector ETF flows), Unusual Whales (options flow)

  4.3  Reading the Market Open
       → What happens in the first 30 minutes (and why it matters)
       → Asia-Europe range carry-over
       → Opening range breakout (ORB) concept
       → Opening type classification (gap up/down, flat open)
       → What FINN's DMB hypothesis block looks for at the open

  4.4  Types of Trading Days
       → Trending day: clear direction, news catalyst, high volume — strategies that work
       → Rotational/range day: choppy, no follow-through — strategies to avoid and use
       → News-driven day: volatile, wide spreads, unpredictable — what to do and not do
       → How to identify day type in the first 30–60 minutes

  4.5  Market Traps
       → Bull trap (false breakout above resistance)
       → Bear trap (false breakdown below support)
       → Stop hunt (price sweeps a stop level before reversing)
       → How to spot traps, how to protect against them, how FINN's ATR stops help

PART 5 — TRADING PSYCHOLOGY
  5.1  Psychology Primer
       → The 3 dangerous emotions: fear, greed, hope — how each manifests in a trade
       → Cognitive biases in trading: loss aversion, recency bias, confirmation bias,
         overconfidence, anchoring
       → The pre-trade emotional check (before you place the order)
       → The post-trade reflection (after the trade closes)

  5.2  The FINN Emotional Journal Fields
       → Pre-Trade Emotional State (1–5 scale + one sentence)
       → Post-Trade Reflection (1–3 sentences: what happened, what I felt, what I'd do differently)
       → Why FINN separates emotional tracking from performance tracking

PART 6 — MARKET REFERENCE
  6.1  Sentiment Indicators (Non-AI)
       → Fear & Greed Index: how to read, what extremes (< 25, > 75) mean historically
       → AAII Investor Sentiment Survey: contrarian signal logic
       → Put/Call Ratio: < 0.7 = complacency, > 1.0 = fear — how traders use it
       → VIX levels: < 15 calm, 15–25 normal, 25–35 elevated, > 35 fear
       → Short interest ratio: understanding heavily shorted stocks

  6.2  FINN Terminology Glossary
       → ~60 terms: alpha, ADF test, ATR, beta, bid-ask spread, Calmar ratio, Cohen's d,
         drawdown, expectancy, IC, lookback bias, MACD, market microstructure,
         OHLCV, OBV, PFOF, p-value, regime, Sharpe ratio, slippage, stationarity,
         VWAP, walk-forward testing, and more
       → Alphabetical with plain-language definitions + first-appearance week in FINN
```

---

## Section 8 — W01/W02 Curriculum Additions

Content gaps specific enough to belong in existing curriculum files (not just in the Reference Handbook):

### W01 Monday Theory (currently: asset classes, exchanges, participants, order book)
- **Addition:** Brief S&R introduction — 10 minutes after the order book section. Frame it: "Before you can read a chart, you need to know the two most important concepts in all of TA. We'll go deeper in the handbook — for now, understand what S&R means and why participants cluster around those levels."

### W02 Monday Theory (currently: order types, microstructure, bid-ask, slippage, PFOF)
- **Addition 1:** Trendlines — 15 minutes. Frame it as the visual analog of what we're computing in code. "A trendline is a hypothesis about where the next bounce is likely."
- **Addition 2:** Expand stop hunt reference already present into a 5-minute "Market Traps" mini-section.
- **Note:** Point students to Reference Handbook for deeper chart reading material.

### W02 Workshop (currently: volume ratio flags, gap detection)
- **Addition:** After gap detection — add 5 minutes identifying the type of each flagged gap. "Now that you've found the gaps — what kind are they? Pull up the Reference Handbook, Section 2.6. Look at the gaps your code flagged and classify each one."

---

## Next Steps (Agreed Sequence)

1. **Review this document** — confirm gap priorities, any changes to tier assignments
2. **Build the Reference Handbook** — one document covering all Tier 1 and Tier 2 sections
3. **W01/W02 micro-edits** — add S&R, trendlines, and gap-typing additions to existing files
4. **Friday "Live Chart Walk" format** — design the format addition for W05+ Friday sessions
5. **Journal template update** — add 2 emotional fields to the existing journal template (W09 + Reference Handbook)

---

*Generated: May 8, 2026*
*Sources: `udemy_curriculum_context.md` · `FINN_curriculum_context.md`*
*Scope: Gap analysis only. No curriculum modifications made. Curriculum changes planned for subsequent sessions.*
