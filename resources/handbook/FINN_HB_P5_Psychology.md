# FINN Student Reference Handbook
## Part 5 — Trading Psychology
### The Trader You Are vs. The Trader You Think You Are

**Part of:** FINN Knowledge Base Library
**Cross-references:** `ig_trading_psychology.html` · `FINN_Glossary.md`
**First referenced:** Week 9 (psychology primer, emotional journal fields) · Week 10 (bias audit) · All weeks (pre/post trade check)

The market does not care about your feelings. But your feelings determine your decisions — and your decisions determine your results. Most traders who fail do not fail because they didn't know enough about charts or indicators. They fail because they couldn't manage the gap between what the rules said and what their emotions wanted.

This section is not about becoming emotionless. It is about understanding your emotional patterns well enough that they stop being surprises, and start being data.

---

## §5.1 — Psychology Primer

### Why Psychology Matters More Than You Think

Consider two traders with identical strategies and identical signals:

- **Trader A** follows the rules precisely. Entry at signal, stop at ATR-based level, size at 2% risk.
- **Trader B** knows the rules but adjusts them in the moment. Moves the stop "just this once" because the setup "feels strong." Adds size when confident. Exits early when nervous.

After 50 trades, Trader A has the backtest results. Trader B has a different strategy — one that has never been tested, that changes with their mood, that is optimized for emotional comfort rather than returns.

The strategy is not the edge. The consistent execution of the strategy is the edge.

### The Two Competing Systems

Behavioral finance research (Kahneman, Thaler) identifies two cognitive systems operating simultaneously:

| System | Description | Speed | Accuracy |
|--------|-------------|-------|---------|
| **System 1 (Fast)** | Intuitive, emotional, pattern-matching, automatic | Instant | Optimized for survival, not for markets |
| **System 2 (Slow)** | Deliberate, analytical, rule-following, effortful | Slow | Better for complex decisions |

Markets punish System 1 thinking. The "obvious" trade is usually the trap (see Handbook §4.5). The setup that "feels right" is often the one everyone else is taking — which means it is already priced in or being hunted.

FINN's systematic approach is a deliberate System 2 framework imposed on a domain where System 1 dominates. The rules, the journal, the IC tests — these are all tools to override System 1 with System 2 when it counts.

### The Performance Curve

Emotional state affects trading performance in a predictable curve:

```
Performance
    |          ___
    |        /     \
    |       /       \
    |      /         \
    |_____/           \______
    |
    +-- Low arousal         High arousal
        (bored, flat)       (anxious, excited, revenge-trading)

Optimal zone: alert, focused, mildly engaged — not excited, not fearful
```

**Too low:** Boredom leads to overtrading — taking setups that don't meet criteria just to "be in the market."

**Too high:** Anxiety or excitement leads to impulsive decisions — entries without signals, stops moved after entry, exits on noise.

**Optimal:** Alert, present, following the checklist. The pre-trade emotional check (§5.4) targets this zone.

### The Journal as the Mirror

The only way to know your psychological patterns is to document them before outcomes are known. This is why FINN's journal structure requires:

1. **Pre-trade reasoning** — written before entry, while System 2 is engaged
2. **Post-trade reflection** — written immediately after close, before System 1 rewrites the story

Memory is reconstructive. After a winning trade, you remember the analysis being crisp and confident. After a losing trade, you remember hesitation and doubt. The journal captures what actually happened, not what your memory reconstructs.

---

## §5.2 — The 3 Dangerous Emotions

Three emotional states account for the majority of rule deviations in retail trading. Each has a specific manifestation, a specific cost, and a specific countermeasure.

### Emotion 1: Fear

**What it looks like in trading:**
- Exiting a winning trade too early ("I'll take the profit before it disappears")
- Not entering a valid signal ("The setup is there but something feels off")
- Reducing position size on the best setups because they feel risky
- Avoiding a strategy after a losing streak even when the signal is still valid

**The cost:**
Fear cuts winning trades short and keeps you out of your best opportunities. A strategy with a 0.55 win rate and 2:1 reward-to-risk depends on letting winners run. Fear converts it into a 0.55 win rate with 1:1 reward-to-risk — and destroys the edge.

**The countermeasure:**

| Action | Implementation |
|--------|---------------|
| Pre-define the exit | Profit target and stop-loss set at entry, before fear has anything to react to |
| Review IC evidence | When fear says "this setup doesn't work," the IC table says what the data shows |
| Reduce size, not signal | If a signal is valid but fear is high, trade half size — do not skip the trade |
| Track fear-driven exits | Journal entry: "Exited at [price] due to fear. Rule said [price]. Difference: [$ and %]." After 20 entries, calculate the cost of fear. |

### Emotion 2: Greed

**What it looks like in trading:**
- Holding a winning trade past the target ("It's going higher, I can feel it")
- Adding to a position without a signal because it's working
- Increasing position size after a winning streak ("I'm hot right now")
- Ignoring stop-losses because the loss "isn't real until you sell"

**The cost:**
Greed turns winning trades into breakevens or losses, and converts a controlled drawdown into a catastrophic one. A 3% position held through a stop becomes a 10% position when greed says "it'll come back."

**The countermeasure:**

| Action | Implementation |
|--------|---------------|
| Hard exit rules | OCO bracket at entry — profit target and stop are live orders, not intentions |
| No position sizing by feel | Position size calculated from ATR and risk percentage before entry; no adjustment mid-trade |
| Streak awareness | After 3+ consecutive wins, do a rules audit before the next trade — confirm you're still following the system, not riding euphoria |
| Journal the hold-past-target | "Held past target at [price]. Final exit: [price]. Cost of greed: [$ and %]." |

### Emotion 3: Revenge

**What it looks like in trading:**
- Trading immediately after a loss to "get it back"
- Increasing position size after a loss to recover faster
- Taking low-quality setups because you need to make P&L
- Abandoning the strategy because "it's not working today"

**The cost:**
Revenge trading is the fastest path from a controlled loss to a catastrophic one. A trader who loses 2% and then revenge trades can easily lose another 5–8% in the same session — turning a bad day into a blowup.

**The countermeasure:**

| Action | Implementation |
|--------|---------------|
| Daily loss limit | Hard rule: if you lose X% in a day, stop trading. FINN default: 3% daily loss limit. Non-negotiable. |
| Mandatory pause | After any loss, wait 10 minutes before placing the next order. No exceptions. |
| The revenge trade audit | Before any trade that follows a loss, ask: "Would I take this trade if I hadn't just lost money?" If no — don't take it. |
| Journal the impulse | Even if you don't act on the revenge impulse, log it: "Felt urge to revenge trade after [loss]. Did not act. Checked next signal: [valid/invalid]." |

---

## §5.3 — Cognitive Biases in Trading

Cognitive biases are systematic errors in thinking that arise from how the brain processes information. In trading, they are costly — and they are invisible until you know to look for them.

### The Core Biases

| Bias | What It Is | How It Manifests in Trading | Countermeasure |
|------|-----------|---------------------------|----------------|
| **Confirmation Bias** | Seeking information that confirms existing beliefs; ignoring contradicting evidence | You're long AAPL and only read bullish analysis; you ignore bearish signals that fire | Devil's advocate rule: for every trade, write one reason it could fail before entry |
| **Loss Aversion** | Losses feel ~2× more painful than equivalent gains feel good | Holding losers far longer than winners; refusing to cut losses | Pre-defined stops that execute automatically (bracket orders eliminate the choice) |
| **Recency Bias** | Overweighting recent events relative to historical base rates | After 3 losing trades, believing "the strategy is broken"; after 3 winners, believing you can't lose | Minimum sample size rule: never change strategy parameters on fewer than 30 trade observations |
| **Overconfidence** | Overestimating your own skill or the reliability of your analysis | Taking larger positions than the rules allow; skipping the IC test because "I know this setup" | Position sizing rules enforced before every trade; IC test required before every new signal type |
| **Anchoring** | Over-relying on the first piece of information encountered | "I bought at $50, so I'll hold until it gets back to $50" | Evaluate current price against current signals, not your cost basis — the market doesn't know what you paid |
| **Availability Bias** | Judging probability by how easily an example comes to mind | Overweighting a vivid recent event ("the last breakout was a trap, so this one will be too") | IC data, not memory, determines signal validity |
| **Hindsight Bias** | Believing after the fact that you "knew" the outcome | "I knew that trade was going to work" — leading to overconfidence next time | Journal pre-trade reasoning before entry; compare to post-trade memory |
| **Gambler's Fallacy** | Believing a random sequence must "balance out" | "I've had 4 losing trades; a winner is due" | Each trade is independent. Edge comes from IC over large samples, not from streak correction. |
| **Sunk Cost Fallacy** | Continuing because of past investment, not future expected value | Holding a losing position because "I've already lost too much to sell now" | Exit decision based on current signal only. Past losses are gone. The only question is: what does the signal say now? |

### The Bias Audit (Monthly Practice)

At each monthly milestone, review your last 20–30 trades for bias signatures:

| Pattern to look for | Bias it suggests |
|--------------------|-----------------|
| Losers held significantly longer than winners | Loss aversion |
| Position sizes that drift larger after wins | Overconfidence |
| Multiple rule deviations in the same direction | Confirmation bias (ignoring contrary signals) |
| Strategy changes after fewer than 20 trades | Recency bias |
| Stop-losses moved after entry | Loss aversion + anchoring |

Flag each one. Quantify the cost. Treat it as a calibration problem — the system needs a parameter adjustment, and the parameter is your behavior.

---

## §5.4 — Pre/Post Trade Emotional Check

The check is a structured pause built into your routine. It takes 60–90 seconds. It prevents most emotional rule deviations before they happen.

### Pre-Trade Check (Before Every Entry)

Run this before submitting any order:

**1. Signal check**
> "Does this setup meet all of my entry criteria — signal score threshold, technical conditions, and volume confirmation?"

If any criterion is missing: **do not enter.** A setup that almost qualifies is not a setup.

**2. Risk check**
> "Have I calculated position size based on my ATR stop and 2% risk rule? Is my stop-loss level set? Is my profit target set?"

If these aren't calculated: **calculate them now, before you enter.** Do not enter without a defined exit on both sides.

**3. Emotional state check**
> "What is my emotional state right now? Rate it 1–5 for each: Anxiety (1=calm, 5=anxious). Confidence (1=doubtful, 5=overconfident). Composure (1=agitated, 5=settled)."

| State | Score | Action |
|-------|-------|--------|
| Anxiety ≥ 4 | High anxiety | Reduce position size by 50% or stand aside |
| Confidence = 5 | Overconfidence | Double-check all criteria; verify you're not skipping steps |
| Composure ≤ 2 | Agitated | Do not trade. Stand aside until composure score ≥ 3. |

**4. Context check**
> "Is there a scheduled macro event in the next 60 minutes (FOMC, CPI, NFP, earnings)? If yes — should I be entering a new position right now?"

Major macro releases can invalidate any technical setup in seconds. Default: do not initiate new positions within 30 minutes of a scheduled high-impact event.

**5. Bias check**
> "Am I taking this trade because the signal fired, or because I want to trade? Am I taking this specific entry because of evidence, or because of a feeling?"

One honest answer required. If the answer is "feeling" — stand aside.

### Post-Trade Check (After Every Close)

Run this immediately after a position closes:

**1. Rule adherence**
> "Did I follow my entry rules exactly? Did I follow my exit rules exactly? If I deviated — why, and what was the cost?"

Quantify every deviation: "Exited 15 minutes early. Missed $X additional profit." No soft language. Exact numbers.

**2. Signal validation**
> "Was the signal valid at entry? In hindsight, was there any information available at entry time that I ignored?"

Hindsight is not fair grounds for self-criticism. Only flag information that was available and observable before entry.

**3. Emotional state log**
> "What emotion was most present during this trade? Did it affect my behavior?"

Log the emotion even if it didn't affect behavior. Over 50 trades, you'll see patterns.

**4. Learning capture**
> "What is the one thing this trade taught me?"

One sentence. Write it. This is the data that compounds.

---

## §5.5 — FINN Emotional Journal Fields

These fields are required additions to the FINN trading journal starting Week 9. They are not optional — they are the mechanism by which psychology becomes measurable.

### Required Journal Fields

Every trade entry in the FINN journal must include:

**At Entry:**

| Field | Format | Example |
|-------|--------|---------|
| Pre-trade emotional state | Anxiety / Confidence / Composure, each 1–5 | Anxiety: 2 / Confidence: 3 / Composure: 4 |
| Signal criteria met | Checklist: all criteria Y/N | Signal score: Y · Technical: Y · Volume: Y |
| Position size calculation | "$X risk / ATR stop = N shares" | "$100 risk / $1.42 ATR stop = 70 shares" |
| Hypothesis | One sentence: "I expect ___ because ___" | "I expect a breakout continuation because volume confirms the level and the signal score is 0.71" |
| Potential failure condition | One sentence: "This trade fails if ___" | "This trade fails if price closes back below $47.50 within 2 candles" |

**At Exit:**

| Field | Format | Example |
|-------|--------|---------|
| Rule adherence | "Followed / Deviated" + details if deviated | "Deviated: exited at $49.20 instead of $49.80 target — anxiety triggered early exit" |
| P&L | Actual vs. expected (based on target) | "Actual: +$142. Expected: +$183. Gap: -$41 (early exit)" |
| Primary emotion during trade | One word + 1–2 sentence description | "Anxiety. Price consolidated for 20 min near entry and I nearly exited before the move developed." |
| Post-trade learning | One sentence | "Consolidation near entry is not a failure signal — give the trade time to develop." |

### Aggregate Tracking (Monthly)

At each monthly milestone review, compute:

| Metric | How to Calculate | What It Tells You |
|--------|-----------------|-----------------|
| **Rule adherence rate** | Followed trades / Total trades | Below 80% = psychological interference is material |
| **Cost of deviations** | Sum of (actual P&L − rule-compliant P&L) for all deviated trades | Quantifies what emotions are costing you per month |
| **Emotion-P&L correlation** | Average P&L on high-anxiety trades vs. low-anxiety trades | Tells you if your anxiety is predictive of bad outcomes or just noise |
| **Bias frequency** | Count of each bias type flagged per month | Identifies your highest-priority behavioral adjustment |

### The Psychological Edge

A trader who documents their emotional state and rule adherence over 100 trades has something most traders never build: a dataset about themselves. That dataset tells you:

- Which emotional states predict poor execution (and how to adjust size accordingly)
- Which biases are most costly in dollar terms (and which to prioritize eliminating)
- Whether your intuition has any signal value, or whether it is pure noise

FINN requires this data not because psychology is soft — but because it is the most underexplored source of edge in retail trading. The market's behavior is hard to predict. Your own behavior is measurable, improvable, and entirely within your control.

Document it. Measure it. Improve it.

---

*FINN Student Reference Handbook — Part 5: Trading Psychology*
*Built: Session B3.a (May 8, 2026)*
*Next: Part 6 — Market Reference (`FINN_HB_P6_MarketReference.md`) — Session B3.b*
