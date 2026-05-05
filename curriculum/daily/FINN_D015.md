# FINN — Day 15
## Friday · May 15, 2026 · Week 5 of 24
### Topic: Statistics Applied — Market Autopsy Through a Statistical Lens

```
MORNING   9:00–10:00 AM EST   60 min   Student-led brief + autocorrelation observation table
EVENING   8:00–9:30  PM EST   90 min   30 min retrospective · 35 min market autopsy · 15 min derivatives window · 10 min next week preview & close
```

> **Prep:** Hypothesis log reviewed — all Week 5 hypotheses ready for audit. TradingView with SPY daily chart loaded. Autocorrelation observation table from DMB assignment ready. Assign next week's DMB rotation. Note: mention Memorial Day (May 25) tonight — Week 7 Monday is a holiday, async package distributed in advance.

---

# MORNING — Daily Market Brief
## 9:00–10:00 AM

---

**9:00 | PRE-MARKET SCAN** `15 min`

Standard checklist. "Before tonight: review this week's SPY price action. Using what we know about autocorrelation — did Monday's return direction predict Tuesday's? Did Wednesday's predict Thursday's? Build a simple table of daily returns and the next-day direction. Bring it tonight."

> **ES, NQ, YM Futures**
> **VIX** — where did it finish this week versus Monday?
> **Macro calendar** — anything today?
> **Earnings calendar**
> **Finviz sector heatmap** — weekly sector summary
> **10-year yield** — net weekly change
> **Bitcoin** — net weekly change

---

**9:15 | STUDENT-LED BRIEF** `20 min`

Student rotation. Coaching feedback after the brief.

---

**9:35 | HYPOTHESIS SETTING** `15 min`

"Add Friday hypotheses. Reference the week's open entries. Did any of your statistical hypotheses from Monday get tested — even informally — by this week's price action? What did you observe?"

---

**9:50 | OBSERVATION ASSIGNMENT** `10 min`

"Complete your autocorrelation table before class tonight: daily returns for SPY Mon–Thu and the next-day direction. Just a simple table in your notes. We'll use it in the market autopsy."

---

---

# EVENING — Review & Market Session
## 8:00–9:30 PM

```
8:00  Retrospective — Week 5 concepts          30 min
8:30  Market Autopsy — statistical lens        35 min
9:05  Derivatives Window                       15 min
9:20  Next Week Preview & Close                10 min
```

---

**8:00 | RETROSPECTIVE** `30 min`

1. "Explain the null hypothesis. Give me a null hypothesis for a real trading signal you'd want to test — not RSI, something you came up with."

2. "What is the ADF test testing? Why do we run it on returns but not prices?"

3. "The IC of a signal is 0.03. p-value is 0.08. Should you trade it? Walk me through your reasoning — statistical significance AND practical significance."

4. "In Wednesday's notebook, we used `shift(-5)` to compute forward returns. Why is it absolutely forbidden to use `shift(-N)` as a feature in a live model?"

5. "What is the multiple testing problem? Give me a concrete example of how it produces false positives in trading research."

---

**8:30 | MARKET AUTOPSY** `35 min`

**Hypothesis Audit (10 min)**

Close all Week 5 hypotheses. Focus on any statistical hypotheses students framed Monday. "Did your statistical hypothesis hold up this week? Could we even test it with 5 days of data? What sample size would you actually need?"

**Chart Review — Statistical Lens (15 min)**

Pull up SPY daily chart. "What was the daily return each day this week? Let's compute the week's autocorrelation manually — did each day's direction predict the next?

If Monday was up 0.8%, what would a momentum hypothesis predict for Tuesday? What actually happened? Is one week enough data to draw conclusions? Why not?"

Walk through VIX behavior: "VIX moved from ___ to ___. If we had a hypothesis that 'weeks with VIX > 20 produce lower mean SPY returns' — where would we even start to test it? What data would we need? What's the right test?"

Have a student read their autocorrelation table from the DMB assignment. Then: "What pattern, if any, do you see? Is one week of data enough to conclude anything?"

**Sector Rotation (10 min)**

Apply the statistical frame: "Which sectors outperformed this week? Is that consistent with what we'd predict given this week's macro backdrop? How would you test whether sector rotation is predictable?"

---

**9:05 | DERIVATIVES WINDOW** `15 min`

Standard derivatives checklist. Add statistical framing: "The put/call ratio this week averaged ___. Over the last 4 weeks it has been: ___, ___, ___, ___. Is there a pattern? Could we test whether elevated P/C ratio predicts next-week returns? What's the hypothesis?"

*(Don't test it yet — plant the seed. This becomes a student Milestone 2 option.)*

---

**9:20 | NEXT WEEK PREVIEW & CLOSE** `10 min`

"Next week: technical indicators as data features — the engine of our feature matrix. This is where we bridge from statistics to strategy building."

**Assign reading:**
- Wiki Section 5.1 — Full indicators table (all 10 indicators)
- Wiki Section 5.2 — Candlestick patterns as features
- Wiki Section 4.3 — Code Pattern 2 (pandas-ta indicator setup)

**DMB rotation:** Assign next week's leads.

**Memorial Day notice:** "Week 7 Monday (May 25) is Memorial Day — class is cancelled. An async fallback package will be distributed in advance. Plan for it now."

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

## DELIVERABLES

| What | When |
|------|------|
| Weekly Review Log | Tonight 11:59 PM |
| Hypothesis Outcome Record (all Week 5 hypotheses closed) | Tonight 11:59 PM |
| Pre-reading: Wiki 5.1, 5.2, 4.3 | Before Monday May 18 |

---

*Day 15 · Friday May 15, 2026 · Draws from `FINN_W05.md`*
