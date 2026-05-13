# FINN Project Status
## Last Updated: May 12, 2026

One-file answer to: "what are we building, where are we, and what's next?"
Load at the start of any session where a multi-session project is active.
Update `Status`, `Progress`, and `Next session` fields at the END of each work session.

---

## Active Projects

### Infographics Upgrade — Visual Product Rebuild (v1 → v2)
**Status:** 🟡 In progress — Phase D Session D2 next (3 net-new social files)
**Planning doc:** `research/planning/finn_infographics_upgrade_plan.md`
**Progress:** 12 / 16 sessions complete

**Last completed:** Phase D Session D1 — 2 net-new social-first tools (May 13, 2026). Built `ig_pattern_quiz.html` and `ig_risk_calculator.html`.
- `ig_pattern_quiz.html`: 10-question candlestick identification drill. Questions progress from single-candle (Hammer, Shooting Star, Doji, Hanging Man, Inverted Hammer, Dragonfly Doji) to two-candle (Bullish/Bearish Engulfing) to three-candle (Morning Star, Evening Star). Each question: inline SVG candle visual, 4 multiple-choice options, correct/wrong feedback with full explanation, progress bar. End screen: score, percentage, FINN verdict by band (10/10 → pass →  near-miss → not ready), retry button. v2 design system, metric strip, social mode, FINN voice, stagger reveal, v2 footer.
- `ig_risk_calculator.html`: Live position sizing and risk management calculator. Inputs: account size, risk%, entry price, stop loss, target price. Outputs auto-calculate: dollar risk, stop distance ($+%), position size (shares), position value, portfolio allocation %, R:R ratio with animated gauge, potential gain. Direction detection (long/short) from stop vs. entry. Risk level indicator bar (green ≤2% / amber 2–4% / red >4%). Expectancy calculator: win rate + avg win/loss → expectancy per trade with verdict. 6 FINN risk rules grid. FINN voice, social mode, stagger reveal, v2 footer.

**Next session (Phase D — Session D2):**
Build 3 remaining net-new social-first files: `ig_market_regime.html` + `ig_trade_anatomy.html` + `ig_bias_cards.html`
- `ig_market_regime.html`: Bull/Bear/Choppy regime identification framework — visual card with detection criteria per regime and strategy adjustments
- `ig_trade_anatomy.html`: Single trade entry-to-exit visual walkthrough — step breakdown from signal to sizing to entry to management to exit
- `ig_bias_cards.html`: 9 cognitive biases as social-shareable flip card deck — front (bias name + definition), back (trading manifestation + FINN countermeasure)

*Full phase sequence, technical architecture, and content plan: see `research/planning/finn_infographics_upgrade_plan.md`*

---

## Completed Projects

### Knowledge Base Build — Gap Integration (Tier 1 + Tier 2)
**Completed:** May 10, 2026
**What was done:** 19-session build integrating all knowledge base resources (glossary, 6-part handbook, 26 infographics) into the FINN curriculum at point-of-use. Resources added at three layers: monthly files (Sessions D1–D2), weekly files (E1–E4), and daily files (F1–F2). Daily integration covers D001–D015 (Weeks 1–5); D016+ not yet created.
**Key files created:** `resources/FINN_ResourceIndex.md`, `resources/FINN_Glossary.md`, `resources/handbook/FINN_HB_P1–6.md` (6 parts), 26 infographic HTML files in `resources/infographics/`
**Planning doc:** `research/planning/finn_kb_execution_plan.md`

### CLAUDE.md Restructuring — Persona Loading Rule
**Completed:** May 8, 2026
**What was done:** Removed the "Session Startup Protocol" (grid command: auto-date-calculation, auto-daily-file-load, auto-session-briefing). Replaced with a minimal "Persona Loading Rule" — `FINN_Soul.md` loads unconditionally at session start, no auto-calculations, no unsolicited briefings.
**File changed:** `CLAUDE.md`

### Market Research — Competitor Curriculum Analysis
**Completed:** May 8, 2026
**What was built:** Full competitor analysis against two Udemy trading courses.
**Key files created:**
- `research/competitors/udemy_curriculum_context.md`
- `research/competitors/FINN_curriculum_context.md`
- `research/planning/finn_gap_analysis.md`
- `research/planning/finn_kb_execution_plan.md`

---

## How to Use This File

**At session start:** Read this file. Identify the active project, current session, and next steps. Load the planning doc if the task requires deeper context.

**At session end:** Update the active project's `Status`, `Progress` counter, `Last completed`, and `Next session` fields to reflect what was done.

**When a project completes:** Move it from Active → Completed with a one-paragraph summary. Archive the planning doc path for reference.

**New project:** Add a new entry block under Active Projects before starting work. Link to the planning doc.
