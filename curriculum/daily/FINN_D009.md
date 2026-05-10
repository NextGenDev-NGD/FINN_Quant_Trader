# FINN — Day 9
## Friday · May 1, 2026 · Week 3 of 24
### Topic: Metrics in Context, Market Autopsy & Milestone 1 Preview

```
MORNING   9:00–10:00 AM EST   60 min   Student-led brief
EVENING   8:00–9:30  PM EST   90 min   30 min retrospective · 35 min market autopsy · 15 min derivatives · 10 min M1 preview + close
```

> **Prep:** All Week 3 hypotheses ready for audit. SPY weekly Sharpe calculation from DMB observation in hand. TradingView with SPY daily chart ready. Milestone 1 preview content prepared.

---

# MORNING — Daily Market Brief
## 9:00–10:00 AM

---

**9:00 | PRE-MARKET SCAN** `15 min`

Standard checklist. "Today we close Week 3. Milestone 1 is one week from today — May 8. Tonight we preview exactly what that assessment looks like."

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

Add Friday hypotheses. Reference the week's open entries. "You have the tools from Wednesday's notebook — one of your hypotheses today should include a metric. Try calculating SPY's approximate weekly Sharpe using the last 5 days of returns. We'll use it tonight."

---

**9:50 | OBSERVATION ASSIGNMENT** `10 min`

"Before tonight: calculate SPY's approximate weekly Sharpe using the last 5 daily returns from this week. You have the `sharpe_ratio()` function from Wednesday. Write the number down — we use it as a live example in the market autopsy."

---

---

# EVENING — Review & Market Session
## 8:00–9:30 PM

```
8:00  Retrospective — Week 3 concepts      30 min
8:30  Market autopsy — metrics applied     35 min
9:05  Derivatives window                   15 min
9:20  Milestone 1 preview + close          10 min
```

---

**8:00 | RETROSPECTIVE** `30 min`

1. "Recite the 9-step quant workflow from memory. Every step."

> **Resource:** [ig_quant_workflow.html](../../resources/infographics/ig_quant_workflow.html) — Visual reference for workflow recall. Check your answers against this before class.

2. "What is the Sharpe ratio telling you that a simple return figure cannot? Give me the formula and explain each term."

3. "In Wednesday's notebook — why do we multiply standard deviation by √252? Explain the math, not just the rule."

4. "Max drawdown of −28%. Sharpe of 1.1. Is this a good strategy? Defend your answer with reasoning."

5. "What is expectancy? Give me a strategy with a 35% win rate that is still profitable. Show the math."

---

**8:30 | MARKET AUTOPSY** `35 min`

**Hypothesis Audit (10 min)**

Close all this week's hypotheses. Standard protocol: outcome, post-mortem, "what signal would have told you earlier?" Document every entry before leaving tonight.

**Chart Review — Metrics Applied (15 min)**

"This week we think about the market's behavior in metric terms.

SPY's weekly return was ___%. Its high-low range was ___%. The weekly drawdown from Monday's open to the lowest intraday point was ___%. These are the same metrics we implemented Wednesday — now we're reading them on real data."

> **Resource:** [ig_performance_metrics.html](../../resources/infographics/ig_performance_metrics.html) — Use this reference while reading today's live metric values.

"The student who calculated the weekly Sharpe in the DMB observation — read the number to the class."

[Take the number. Then:]

"Is a single-week Sharpe meaningful? Why not?"

> *Answer: No. Sharpe requires many observations to be statistically reliable. Five data points is not a signal — it's noise. This is the setup for Month 2: when you grasp intuitively that more data produces more reliable metrics, formal hypothesis testing will land immediately.*

**Sector Rotation (10 min)**

Finviz heatmap — standard weekly review. "What's the story this week? Does sector behavior match macro conditions? Is there any consistency from last week's rotation, or a reversal?"

---

**9:05 | DERIVATIVES WINDOW** `15 min`

Continue observation. "Does VIX tend to move before weekends? Why might institutions hedge specifically before a two-day close? What risk are they protecting against that doesn't exist during the trading week?"

---

**9:20 | MILESTONE 1 PREVIEW + CLOSE** `10 min`

"Milestone 1 is next Friday, May 8. Twenty minutes each, one on one. Any topic from Weeks 1–3 is fair game."

"I will ask you to:
- Explain a concept as if you're teaching it to someone who wasn't here
- Interpret a chart output or data result
- Walk through an order scenario or a metric calculation
- Tell me what the data says — not what you think the answer should be"

"There are no trick questions. If you did the work, you pass. If you memorized definitions without understanding them, you will struggle — because I will ask follow-up questions until the understanding either appears or doesn't."

**Weekend preparation:**
- All three weekly review logs
- Cornell notes from all three Monday sessions
- Full glossary — every term
- Practice explaining the 9-step workflow out loud, to yourself or a partner

**Monday review session:** "Monday we use the entire 90 minutes as a live M1 prep session — drilling concepts, answering questions, making sure everyone is ready. Come with your weakest areas identified."

**DMB rotation for Week 4:** Assign all three leads.

**Weekly One-Liner:**
> *"This week I learned ___, and next week I want to understand ___."*

---

## DELIVERABLES

| What | When |
|------|------|
| Weekly Review Log | Tonight 11:59 PM |
| Hypothesis Outcome Record (all Week 3 hypotheses closed) | Tonight 11:59 PM |
| M1 preparation — review Weeks 1–3 | This weekend |

---

*Day 9 · Friday May 1, 2026 · Draws from `FINN_W03.md`*
