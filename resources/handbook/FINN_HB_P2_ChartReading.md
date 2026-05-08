# FINN Student Reference Handbook
## Part 2 — Chart Reading
### Reading What the Market Actually Says

**Part of:** FINN Knowledge Base Library
**Cross-references:** `ig_candlestick_patterns.html` · `ig_support_resistance.html` · `ig_trendlines.html` · `ig_chart_patterns_continuation.html` · `ig_chart_patterns_reversal.html` · `ig_gap_types.html` · `ig_heikin_ashi.html`
**First referenced:** Week 1 (candlesticks, S&R) · Week 2 (trendlines, gaps) · Week 6 (patterns, Heikin Ashi)

Chart reading is pattern recognition applied to price and volume data. Every pattern in this section is a hypothesis, not a guarantee. A hammer candle at support does not mean the stock will go up — it means buying pressure was present at that level. The IC test tells you whether that pattern predicts positive forward returns in your universe. The chart pattern gives you a setup to test.

Read this section as a reference. When you see a pattern in the wild, come back here to confirm what it means — then test whether it actually works on your tickers.

---

## §2.1 — Candlestick Reference

A candlestick represents one period of price action: open, high, low, and close (OHLC).

**Anatomy:**
- **Body** — the filled rectangle between open and close. Bullish body (close > open) is typically white/green. Bearish body (close < open) is typically black/red.
- **Upper wick** — the thin line above the body, from the top of the body to the period high.
- **Lower wick** — the thin line below the body, from the bottom of the body to the period low.

A long body = strong directional commitment. A long wick = price traveled far in that direction but was rejected. A short wick = little rejection. No wick on one side = price opened or closed at the extreme.

### Single-Candle Patterns

| Pattern | Body | Wicks | Signal | Context Required |
|---------|------|-------|--------|-----------------|
| **Bullish Marubozu** | Large, bullish | None or minimal | Strong buying pressure — bulls in control | Strongest at base of consolidation |
| **Bearish Marubozu** | Large, bearish | None or minimal | Strong selling pressure — bears in control | Strongest at top of rally |
| **Hammer** | Small, lower half of range | Lower wick ≥ 2× body; minimal upper wick | Bullish reversal — buyers rejected a low | Must appear after a downtrend or at support |
| **Inverted Hammer** | Small, upper half of range | Upper wick ≥ 2× body; minimal lower wick | Potential bullish reversal — buyers tested higher | Must appear after a downtrend; needs next-candle confirmation |
| **Hanging Man** | Small, lower half of range | Lower wick ≥ 2× body; minimal upper wick | Bearish reversal — same shape as Hammer at top | Must appear after an uptrend or at resistance |
| **Shooting Star** | Small, upper half of range | Upper wick ≥ 2× body; minimal lower wick | Bearish reversal — sellers rejected a rally | Must appear after an uptrend or at resistance |
| **Doji** | Near-zero (open ≈ close) | Wicks on both sides | Indecision — neither side controls | Significance depends on prior trend and what follows |
| **Dragonfly Doji** | Near-zero, at top of range | Long lower wick, no upper wick | Bullish indecision — buyers recovered all losses | Strongest at support after downtrend |
| **Gravestone Doji** | Near-zero, at bottom of range | Long upper wick, no lower wick | Bearish indecision — sellers recovered all gains | Strongest at resistance after uptrend |
| **Spinning Top** | Small body, centered | Wicks on both sides, roughly equal | Indecision — neither side wins decisively | Context and next candle determine meaning |

**Hammer vs. Hanging Man:** Identical shape. Meaning is determined entirely by position in trend. At the bottom of a downtrend = Hammer (bullish). At the top of an uptrend = Hanging Man (bearish).

### Two-Candle Patterns

| Pattern | Description | Signal | Confirmation |
|---------|-------------|--------|-------------|
| **Bullish Engulfing** | Small bearish candle followed by a larger bullish candle whose body fully engulfs the prior body | Bullish reversal | Next candle closes higher; volume on the engulfing candle higher than prior |
| **Bearish Engulfing** | Small bullish candle followed by a larger bearish candle whose body fully engulfs the prior body | Bearish reversal | Next candle closes lower; volume on the engulfing candle higher than prior |
| **Bullish Harami** | Large bearish candle followed by a small bullish candle that fits inside the prior body | Potential bullish reversal — less powerful than Engulfing | Requires next-candle confirmation; more of a pause signal |
| **Bearish Harami** | Large bullish candle followed by a small bearish candle that fits inside the prior body | Potential bearish reversal | Requires next-candle confirmation |
| **Tweezer Bottom** | Two candles with matching or near-matching lows at support | Bullish reversal — double rejection of a low | Strongest when second candle is bullish after bearish first |
| **Tweezer Top** | Two candles with matching or near-matching highs at resistance | Bearish reversal — double rejection of a high | Strongest when second candle is bearish after bullish first |

### Three-Candle Patterns

| Pattern | Description | Signal | Confirmation |
|---------|-------------|--------|-------------|
| **Morning Star** | Large bearish candle → small indecision candle (gap or small body) → large bullish candle closing into the first candle's body | Strong bullish reversal | Volume: highest on the third candle; appears after a downtrend |
| **Evening Star** | Large bullish candle → small indecision candle → large bearish candle closing into the first candle's body | Strong bearish reversal | Volume: highest on the third candle; appears after an uptrend |
| **Three White Soldiers** | Three consecutive large bullish candles, each opening within the prior body and closing near its own high | Strong continuation of uptrend | Watch for declining volume on the third candle — can signal exhaustion |
| **Three Black Crows** | Three consecutive large bearish candles, each opening within the prior body and closing near its own low | Strong continuation of downtrend | Watch for declining volume on the third candle |

### Candlestick Interpretation Rules

1. **Context is everything.** A hammer at support after a 3-week downtrend is meaningful. A hammer in the middle of a sideways range is noise.
2. **Confirmation is required.** A single candle is never a signal. Wait for the next candle to confirm direction before entering.
3. **Volume amplifies the signal.** High-volume reversal candles are more significant than low-volume ones.
4. **Test it.** Before trading any candlestick pattern, run the IC analysis on your target tickers. "The pattern looks bullish" is not enough — show me the IC.

---

## §2.2 — Support & Resistance

Support and resistance are price zones where the balance between buyers and sellers has historically shifted. They are not lines — they are zones. Price does not bounce off a line to the penny. It reacts within a range.

### Defining Support and Resistance

**Support:** A price zone where buying pressure has been strong enough to stop or reverse a downward move. The zone represents a level where buyers outnumbered sellers historically.

**Resistance:** A price zone where selling pressure has been strong enough to stop or reverse an upward move. The zone represents a level where sellers outnumbered buyers historically.

**Role reversal:** When price breaks through support, that level often becomes new resistance. When price breaks through resistance, that level often becomes new support. This is one of the most reliable patterns in technical analysis.

### Types of Support and Resistance

| Type | Description | Example |
|------|-------------|---------|
| **Horizontal S&R** | Price reacted at a specific price level multiple times | $150 rejected three times |
| **Dynamic S&R (Moving Averages)** | Price uses a moving average as a floor or ceiling | Price bounces off the 50 EMA |
| **Psychological levels** | Round numbers where human psychology creates clustering | $100, $200, $500 |
| **Prior swing highs/lows** | The most recent pivot point in price | Last week's high = overhead resistance |
| **Gap levels** | Gap-open levels often act as support or resistance | Breakaway gap left untested |
| **Fibonacci levels** | Retracement levels drawn from a swing high to low | 61.8% retracement holds as support |

### How to Draw S&R Zones

1. Use the **daily chart** as your primary reference. Weekly chart for major levels.
2. Look for price areas where price has **touched, paused, or reversed multiple times**.
3. Draw a zone (not a single line) that encompasses those reaction points. The zone width is typically a few percent.
4. Use the **close of candles** to confirm levels — wicks can spike through; bodies typically respect the level.

**Strength indicators — a level is stronger when:**
- It has been tested 3+ times without breaking
- Volume was elevated at each test
- The level has held over multiple months or years
- It served as both support and resistance (role reversal confirmed)

### Invalidation

A support level is **invalidated** when price closes below it on above-average volume. A wick through a level is a test. A close below it is a break.

Do not hold a long position below an invalidated support level. The market just told you your thesis was wrong. Log it. Move on.

---

## §2.3 — Trendlines

A trendline is a straight line connecting sequential price pivots that visualizes the direction and pace of a trend.

### Drawing Trendlines

**Uptrend trendline:** Connect a sequence of **higher lows**. Draw the line along the bottom of the candle bodies (use wicks as guides but anchor on bodies). The line acts as dynamic support.

**Downtrend trendline:** Connect a sequence of **lower highs**. Draw the line along the top of the candle bodies. The line acts as dynamic resistance.

**Minimum requirement:** 2 touch points to draw the line. A trendline with only 2 touches is tentative. 3 or more touches confirms the line is meaningful.

### Channels

When price oscillates between two parallel trendlines — one support, one resistance — you have a channel. Buy near the support trendline, sell or exit near the resistance trendline (or let the channel play out). Channel breaks are significant signals.

**Ascending channel:** Both lines slope upward. Bullish bias. A break below the lower line is a warning signal.
**Descending channel:** Both lines slope downward. Bearish bias. A break above the upper line is a warning signal.
**Horizontal channel (range):** Price consolidates between two flat levels. Wait for the breakout.

### Trendline Breaks

A trendline break occurs when price closes on the other side of the line with conviction.

**Rules for a valid break:**
1. Price closes beyond the trendline (not just a wick)
2. Volume is above average on the break candle
3. Price does not immediately return inside the trendline (the break holds)

**A trendline break is a signal — not automatically an entry.** It tells you the trend is changing. It does not tell you where to enter. Wait for: a retest of the broken trendline from the other side (which often confirms role reversal), or a new pattern to develop.

### False Breaks

A false break (also called a "fakeout") occurs when price appears to break a trendline but reverses back inside. False breaks are deliberately engineered by institutional participants to flush out retail stops. If price breaks your trendline, triggers your stop, and then reverses — that is not a failure of your analysis. It is a reminder that no single signal is definitive.

---

## §2.4 — Continuation Patterns

Continuation patterns form when a trend pauses, consolidates, and then resumes in the same direction. The pause is the market catching its breath. The direction that matters is the prior trend — not the shape of the consolidation.

In all continuation patterns: **confirm the breakout** before entering. Volume on the breakout should exceed the average volume during consolidation.

### Pattern Reference

**Flag**
- **Shape:** A sharp, near-vertical price move (the "flagpole") followed by a tight consolidation that drifts slightly against the trend (the "flag"). The flag is a parallelogram shape — two roughly parallel trendlines, slightly counter-trend.
- **Signal:** Continuation in the direction of the flagpole
- **Target:** Measure the height of the flagpole and project it from the breakout point
- **Confirmation:** Breakout in trend direction on above-average volume

**Pennant**
- **Shape:** A sharp move (flagpole) followed by a symmetrical triangle consolidation where both highs and lows converge to a point
- **Signal:** Continuation in the direction of the flagpole
- **Target:** Flagpole height projected from the breakout
- **Confirmation:** Breakout in trend direction on above-average volume. Pennants typically break within 1–3 weeks.

**Symmetrical Triangle**
- **Shape:** Converging trendlines where price makes lower highs and higher lows, forming a triangle pointing to the right. Neither buyers nor sellers dominant.
- **Signal:** Neutral — breaks in either direction are possible. Slight bias toward the prior trend.
- **Target:** Triangle height projected from breakout
- **Confirmation:** Close outside the triangle with volume

**Ascending Triangle**
- **Shape:** Flat resistance ceiling with rising support. Buyers are becoming more aggressive (higher lows) while sellers hold a fixed level.
- **Signal:** Bullish — the flat resistance will typically break upward
- **Target:** Height of the triangle projected upward
- **Confirmation:** Break above the flat resistance on volume

**Descending Triangle**
- **Shape:** Flat support floor with falling resistance. Sellers becoming more aggressive while buyers hold a fixed floor.
- **Signal:** Bearish — the flat support will typically break downward
- **Confirmation:** Break below the flat support on volume

**Rectangle (Range)**
- **Shape:** Price consolidates horizontally between two flat S&R levels for an extended period
- **Signal:** Continuation in the prior trend direction on breakout; or a range-trading opportunity while inside
- **Confirmation:** Close outside the range on above-average volume

**Rising Wedge**
- **Shape:** Both support and resistance lines slope upward, but resistance rises faster — lines converging upward
- **Signal:** Bearish reversal or bearish continuation (in a downtrend context)
- **Confirmation:** Break below the lower trendline

**Falling Wedge**
- **Shape:** Both lines slope downward, support falling faster — lines converging downward
- **Signal:** Bullish reversal or bullish continuation (in an uptrend context)
- **Confirmation:** Break above the upper trendline

---

## §2.5 — Reversal Patterns

Reversal patterns signal that the current trend is losing momentum and a new trend in the opposite direction is beginning. They require more patience than continuation patterns — the reversal needs to complete fully before entering.

**Key rule:** Never trade a reversal pattern until the neckline breaks and closes on volume. Entering before the break means entering against the current trend.

### Pattern Reference

**Double Top**
- **Shape:** Price rallies to a high, pulls back, rallies again to approximately the same high, then pulls back again. Two peaks at roughly the same level with a trough between them (the "neckline").
- **Signal:** Bearish reversal — sellers defended the same resistance level twice
- **Entry:** On close below the neckline
- **Target:** Measure the height from the neckline to the tops; project that distance downward from the neckline break

**Double Bottom**
- **Shape:** Price falls to a low, bounces, falls again to approximately the same low, then bounces again. Two troughs at roughly the same level with a peak between them (the neckline).
- **Signal:** Bullish reversal — buyers defended the same support level twice
- **Entry:** On close above the neckline
- **Target:** Height from the bottoms to the neckline projected upward from the neckline break

**Head and Shoulders (H&S)**
- **Shape:** Three peaks — a smaller left shoulder, a higher middle peak (the head), and a smaller right shoulder roughly equal in height to the left. A neckline connects the troughs between the shoulders and the head.
- **Signal:** Bearish reversal — a major topping pattern
- **Entry:** On close below the neckline on above-average volume
- **Target:** Height from the head to the neckline projected downward from the neckline break
- **Note:** Right shoulder forming below the left shoulder (asymmetric H&S) is considered a stronger bearish signal

**Inverse Head and Shoulders**
- **Shape:** Mirror image of H&S — three troughs with a lower middle trough (head) and two higher troughs (shoulders)
- **Signal:** Bullish reversal
- **Entry:** On close above the neckline with volume
- **Target:** Height from the head to the neckline projected upward

**Cup and Handle**
- **Shape:** A rounded U-shaped base (the cup) formed over weeks to months, followed by a shorter, downward-sloping consolidation (the handle). The handle should retrace 30–50% of the cup's depth at most.
- **Signal:** Bullish continuation or reversal — a constructive base-building pattern
- **Entry:** On break above the handle's upper trendline / above the prior high (the cup's rim)
- **Target:** Depth of the cup projected upward from the breakout
- **Volume:** Should decline during the handle and surge on the breakout

**Rounding Bottom (Saucer)**
- **Shape:** A slow, gradual U-shaped curve in price over weeks to months — no sharp V-shaped recovery
- **Signal:** Bullish reversal — slow accumulation by institutional buyers
- **Entry:** When price breaks above the resistance zone at the top of the rounded curve
- **Note:** Low-volume pattern during formation; volume expands significantly on breakout

---

## §2.6 — Gap Types

A gap is a price discontinuity — the open of a session is significantly above or below the prior session's close, leaving a range of prices where no trades occurred.

Gaps are significant because they represent conviction: buyers or sellers were so imbalanced that no transaction price existed in the gap zone. How a stock behaves after the gap tells you a great deal about the strength of that conviction.

### The Four Gap Types

**Common Gap**
- **When:** Normal market condition; no particular catalyst
- **Appearance:** Small gap, typically < 1% in large-cap stocks; forms within a trading range
- **Behavior:** Fills quickly — price returns to the pre-gap level within days
- **Signal:** Low significance. These gaps are noise.
- **FINN action:** Note it, do not trade it as a standalone signal

**Breakaway Gap**
- **When:** Price breaks out of a consolidation range or through a major S&R level with a gap
- **Appearance:** Gap up above resistance (bullish) or gap down below support (bearish); typically accompanied by high volume
- **Behavior:** Often does not fill quickly — the gap represents a genuine shift in supply/demand
- **Signal:** High significance. A breakaway gap on high volume signals the start of a new trend.
- **FINN action:** Consider the gap level as new support (gap up) or resistance (gap down); trade in the direction of the gap

**Runaway Gap (Continuation Gap)**
- **When:** Occurs in the middle of an established trend; no specific catalyst
- **Appearance:** Gap in the direction of the trend, often on elevated volume; price is already trending
- **Behavior:** Fills eventually but not immediately; signals trend continuation
- **Signal:** Moderate significance. Confirms the trend has momentum.
- **FINN action:** Runaway gaps roughly mark the midpoint of the total move — useful for target estimation

**Exhaustion Gap**
- **When:** Occurs near the end of a sustained trend — price gaps in the trend direction but with diminishing conviction
- **Appearance:** Gap in trend direction; volume may be elevated but reversal follows quickly (within 1–5 sessions)
- **Behavior:** Fills quickly and often completely; price reverses
- **Signal:** High significance as a reversal warning. A gap that immediately reverses and fills is likely exhaustion.
- **FINN action:** Watch the days after the gap — if price reverses back into the gap on high volume, it is likely an exhaustion gap; consider fading or exiting existing positions

### Gap Fill Concept

A gap "fills" when price returns to trade within the gap zone, eventually covering the full distance of the gap. Historical data shows most gaps fill eventually. This creates a potential mean-reversion trade: when a common or exhaustion gap forms, the gap fill is a quantifiable hypothesis. Test the IC before trading it.

### FINN Gap Detection Code Reference (Week 2 Workshop)
```python
df['gap'] = df['Open'] - df['Close'].shift(1)
df['gap_pct'] = df['gap'] / df['Close'].shift(1) * 100
df['gap_up'] = df['gap_pct'] > 0.5
df['gap_down'] = df['gap_pct'] < -0.5
```

Gap classification (Breakaway vs. Runaway vs. Exhaustion) requires manual context assessment — the code identifies where gaps occur; you classify them using volume and trend context.

---

## §2.7 — Heikin Ashi

Heikin Ashi is a modified candlestick chart type that uses averaged OHLC values to smooth price noise. The name means "average bar" in Japanese.

### How Heikin Ashi Is Calculated

| Value | Formula |
|-------|---------|
| HA Close | (Open + High + Low + Close) ÷ 4 |
| HA Open | (Prior HA Open + Prior HA Close) ÷ 2 |
| HA High | Max(High, HA Open, HA Close) |
| HA Low | Min(Low, HA Open, HA Close) |

Because HA values depend on prior values, each candle incorporates information from all prior candles. This creates the smoothing effect.

### Visual Properties

- **Trending up strongly:** Long bullish bodies, no lower wicks (buyers fully in control)
- **Uptrend losing momentum:** Bullish bodies with lower wicks appearing
- **Transition / indecision:** Small bodies with wicks on both sides (similar to Doji)
- **Trending down strongly:** Long bearish bodies, no upper wicks
- **Downtrend losing momentum:** Bearish bodies with upper wicks appearing

### When to Use Heikin Ashi

**Use HA for:**
- Identifying whether a trend is intact (consecutive same-color HA candles = trend is clean)
- Filtering out noise when you need a quick visual on trend direction across a watchlist
- Spotting trend transitions (when HA candles switch from no-wick to both-wick)

**Do not use HA for:**
- Entry timing — HA prices are not real prices. Your entry is at a market or limit price based on actual OHLCV data.
- Stop-loss placement — stops must be set at real price levels, not HA levels
- Gap analysis — HA averages eliminate gaps, making them invisible

### Standard vs. Heikin Ashi: Side-by-Side Rule

Always verify any HA-based observation against the standard candlestick chart before acting. HA shows you the trend. Standard candles show you the actual price levels — the S&R zones, the gap levels, the stop locations.

**In FINN:** HA is used as a filtering tool in the pre-trade scan. If the HA chart shows choppy mixed-color candles, that ticker is likely in a low-quality trend environment — lower the position size or skip the setup entirely.

---

## Summary — Part 2 Quick Reference

| Concept | Key Rule | Cross-Reference |
|---------|---------|-----------------|
| Candlesticks | Confirmation required; context determines meaning | `ig_candlestick_patterns.html` |
| Support & Resistance | Zones, not lines; role reversal is the most reliable pattern | `ig_support_resistance.html` |
| Trendlines | 3+ touches; break requires close + volume | `ig_trendlines.html` |
| Continuation Patterns | Enter on confirmed breakout only, not during formation | `ig_chart_patterns_continuation.html` |
| Reversal Patterns | Wait for neckline break before entering | `ig_chart_patterns_reversal.html` |
| Gap Types | Common (noise) · Breakaway (trend start) · Runaway (mid-trend) · Exhaustion (reversal) | `ig_gap_types.html` |
| Heikin Ashi | Trend filter only — not for entry, stops, or gap analysis | `ig_heikin_ashi.html` |

---

*Previous: Part 1 — Getting Started | `handbook/FINN_HB_P1_GettingStarted.md`*
*Next: Part 3 — Order Execution | `handbook/FINN_HB_P3_OrderExecution.md` | Built: Session B2*

---

*FINN_HB_P2_ChartReading.md — Student Reference Handbook Part 2*
*Built: Session B1 (May 8, 2026) | Gaps addressed: #1 (candlesticks), #3 (trendlines), #4 (S&R), #5/#6 (chart patterns), #15 (gaps), #18 (Heikin Ashi)*
