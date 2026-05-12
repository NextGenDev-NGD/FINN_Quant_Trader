# FINN Infographics Upgrade — Architecture Plan
## Project: Visual Product Rebuild (v1 → v2)
## Created: May 10, 2026

---

## Project Goal

Upgrade 26 static HTML reference files into a polished, interactive visual product suite that serves three distribution channels:
1. **Social media content** — shareable, screenshot-ready cards for Twitter/X, LinkedIn, Instagram (Phase 1 priority)
2. **FINN course integration** — enhanced in-session reference tools (existing callouts preserved)
3. **Standalone sellable product** — bundled toolkit for individual traders and other educators (Phase 2 spin-out)

**Tech constraint:** All files remain self-contained HTML/CSS/JS. No build pipeline. No external CDN dependencies. Each file opens in a browser and works offline.

---

## Current State Assessment

### What exists
- 26 `.html` files in `resources/infographics/`
- Fully self-contained (inline CSS + minimal JS)
- GitHub dark palette: `#0d1117` bg, `#161b22` card, `#30363d` border
- Static tables, CSS-div candle visuals, badge components
- `@media print` styles included
- No animations, no interactivity beyond CSS `:hover` on table rows
- No shared template — each file is fully independent
- `max-width: 1200px` centered, `14px` base font

### Current file inventory (26 files)
| File | Topic | Social Tier |
|------|-------|-------------|
| `ig_candlestick_patterns.html` | Single/two/three-candle patterns | T1 |
| `ig_chart_patterns_continuation.html` | Flag, pennant, triangle, wedge | T1 |
| `ig_chart_patterns_reversal.html` | H&S, double top/bottom, cup & handle | T1 |
| `ig_performance_metrics.html` | Sharpe, Sortino, IC, drawdown, win rate | T1 |
| `ig_trading_psychology.html` | Emotions, biases, countermeasures | T1 |
| `ig_quant_workflow.html` | 9-step FINN workflow | T1 |
| `ig_risk_rules.html` | 6 non-negotiable rules | T1 |
| `ig_trade_types.html` | 8 styles ranked by horizon/capital/skill | T1 |
| `ig_gap_types.html` | Common/Breakaway/Runaway/Exhaustion | T2 |
| `ig_volume_analysis.html` | Breakout/reversal/OBV/climactic patterns | T2 |
| `ig_support_resistance.html` | Zone drawing, strength, role reversal | T2 |
| `ig_trendlines.html` | Drawing method, channels, false breaks | T2 |
| `ig_fibonacci.html` | Key levels, drawing steps, extensions | T2 |
| `ig_market_traps.html` | Bull/bear trap, stop hunt, false breakout | T2 |
| `ig_order_types.html` | 16 order types, use cases, risks | T2 |
| `ig_market_open.html` | Asia-Europe range, gap scenarios, first 30 min | T2 |
| `ig_trading_day_types.html` | Trending, rotational, news-driven | T2 |
| `ig_heikin_ashi.html` | Formula, signals, strategy filter | T2 |
| `ig_sentiment_indicators.html` | VIX, Fear & Greed, AAII, Put/Call | T2 |
| `ig_platform_tradingview.html` | Chart types, watchlists, indicators, layout | T3 |
| `ig_platform_finviz.html` | Heatmap, screener, news, futures workflow | T3 |
| `ig_platform_webull.html` | Paper trading, order entry, stops, OCO | T3 |
| `ig_broker_comparison.html` | 6 brokers × 8 criteria | T3 |
| `ig_info_sources.html` | 5 categories × 20+ sources | T3 |
| `ig_multi_signal.html` | Architecture, scoring, regime-conditional | T3 |
| `ig_mtf_analysis.html` | 4-timeframe top-down framework | T3 |

**Social Tier definition:**
- **T1** — High visual appeal, broad audience, emotional/conceptual resonance. Upgrade first.
- **T2** — Strong educational value, moderate visual complexity. Upgrade in Phase E.
- **T3** — Deep reference material, niche audience. Upgrade last or package as premium download.

---

## Target State

### What v2 looks like
1. **Animated load sequences** — content enters on scroll or page load (CSS + vanilla JS)
2. **Interactive states** — hover reveals, click-to-expand detail panels, tab switching between views
3. **Quiz/drill mode** — pattern recognition exercises, flashcard flips, self-test prompts (T1 files only in Phase C)
4. **Social media mode** — fixed-dimension layout (`1200×675px`) triggered by body class, optimized for screenshots and screen recordings
5. **Micro-animations** — counters, progress fills, highlight pulses on key data points
6. **Polished visual system** — upgraded typography, gradient accents, glassmorphism cards, consistent spacing scale

### What stays the same
- Self-contained `.html` files — no build step, no CDN
- FINN dark theme palette (extended, not replaced)
- `resources/infographics/` path — existing course callouts are not broken
- `@media print` support
- File naming convention `ig_[topic].html`

---

## Technical Architecture

### Design System v2 — CSS Variables Extension
```css
:root {
  /* Existing palette — preserved */
  --bg: #0d1117;
  --card: #161b22;
  --border: #30363d;
  --text: #e6edf3;
  --blue: #58a6ff;
  --green: #3fb950;
  --red: #f85149;
  --amber: #d29922;
  --muted: #8b949e;

  /* New additions */
  --card-elevated: #1c2128;       /* Hover / elevated card state */
  --blue-glow: rgba(88,166,255,0.12);  /* Background highlight */
  --green-glow: rgba(63,185,80,0.12);
  --red-glow: rgba(248,81,73,0.12);
  --gradient-header: linear-gradient(135deg, #161b22 0%, #1c2128 100%);

  /* Spacing scale */
  --sp-xs: 4px; --sp-sm: 8px; --sp-md: 16px;
  --sp-lg: 24px; --sp-xl: 40px;

  /* Typography scale */
  --text-xs: 11px; --text-sm: 12px; --text-base: 14px;
  --text-md: 16px; --text-lg: 20px; --text-xl: 28px;

  /* Animation timing */
  --ease-out: cubic-bezier(0.16, 1, 0.3, 1);
  --dur-fast: 150ms; --dur-med: 300ms; --dur-slow: 500ms;
}
```

### Social Media Mode
Add a `.social` class to `<body>` to lock the layout to screenshot dimensions:
```css
body.social {
  width: 1200px;
  min-height: 675px;   /* Twitter/X 16:9 */
  overflow: hidden;
  /* Disable scroll, collapse to card */
}
body.social.square {
  width: 1080px;
  min-height: 1080px;  /* Instagram 1:1 */
}
```
Each file gets a `<!-- SOCIAL MODE: add class="social" to <body> for screenshot -->` comment at top.

### Animation System (no library required)
All animations use CSS transitions + a lightweight vanilla JS pattern:

```js
// Intersection Observer for scroll-triggered reveals
const observer = new IntersectionObserver((entries) => {
  entries.forEach(e => {
    if (e.isIntersecting) e.target.classList.add('visible');
  });
}, { threshold: 0.1 });
document.querySelectorAll('.reveal').forEach(el => observer.observe(el));
```

```css
.reveal { opacity: 0; transform: translateY(16px); transition: opacity var(--dur-slow) var(--ease-out), transform var(--dur-slow) var(--ease-out); }
.reveal.visible { opacity: 1; transform: translateY(0); }
```

For counters and progress fills — vanilla JS with `requestAnimationFrame`. No library dependency.

**Decision point (resolve in Phase A research):** Whether to inline Anime.js (~7KB minified) for complex sequences on T1 files. Decision gate: if CSS-only achieves 80% of the visual target, skip it.

### Interactive Component Patterns

**Tab switcher** (zero dependencies):
```html
<div class="tabs">
  <button class="tab active" data-tab="bullish">Bullish</button>
  <button class="tab" data-tab="bearish">Bearish</button>
</div>
<div class="tab-content active" id="tab-bullish">...</div>
<div class="tab-content" id="tab-bearish">...</div>
```

**Flashcard / quiz card:**
```html
<div class="card flip-card" onclick="this.classList.toggle('flipped')">
  <div class="front">Pattern name + visual</div>
  <div class="back">Signal, conditions, context</div>
</div>
```
CSS 3D flip using `transform: rotateY(180deg)`.

**Click-to-reveal detail panel:**
```html
<tr class="expandable" onclick="this.nextElementSibling.classList.toggle('open')">
  <td>Hammer</td> ...
</tr>
<tr class="detail-row"><td colspan="5">Extended detail content...</td></tr>
```

**Animated counter** (for metrics like "Win Rate 42%"):
```js
function animateCounter(el, target, suffix='') {
  let start = 0;
  const step = () => {
    start += Math.ceil(target / 40);
    if (start >= target) { el.textContent = target + suffix; return; }
    el.textContent = start + suffix;
    requestAnimationFrame(step);
  };
  requestAnimationFrame(step);
}
```

### Chart Integration
For files that benefit from actual chart visualizations (performance metrics, volume analysis, quant workflow):
- **Chart.js** (minified, ~200KB) inlined as a `<script>` block inside the HTML file
- Only include where charts are genuinely needed — estimated 6-8 files
- All chart data is hardcoded (no API calls) — static illustrative examples

### File Template Structure (v2)
Every upgraded file follows this structure:
```
1. DOCTYPE + head (meta, title, inline styles)
2. CSS variables block (design system)
3. Component CSS (reusable patterns)
4. Page-specific CSS
5. body
   ├── .page wrapper
   │   ├── .header (FINN logo, title, subtitle, tags)
   │   ├── [content sections with .reveal on each major block]
   │   └── .footer (FINN attribution, version, date)
6. Inline JS (Intersection Observer, interactive handlers)
7. <!-- SOCIAL MODE comment -->
```

---

## Content Architecture

### Phase C — T1 Upgrade Sequence (8 files, high social priority)
Order is deliberate — each builds on established component patterns:

| # | File | Key Upgrade | New Interactive Element |
|---|------|-------------|------------------------|
| 1 | `ig_trade_types.html` | Visual cards with gradient icons, animated entry | Tab filter by time horizon |
| 2 | `ig_performance_metrics.html` | Animated counters, "good/bad" visual gauges | Scenario calculator (input win rate → see Sharpe estimate) |
| 3 | `ig_risk_rules.html` | Bold typographic treatment, rule cards with visual weight | Click to expand rationale for each rule |
| 4 | `ig_quant_workflow.html` | Step-flow diagram with animated connectors | Click each step to expand detail panel |
| 5 | `ig_trading_psychology.html` | Emotion cards with color-coded intensity, bias wheel | Flip cards (bias name → manifestation → countermeasure) |
| 6 | `ig_candlestick_patterns.html` | Animated candle visuals (CSS), larger pattern previews | Quiz mode — show candle, click to identify |
| 7 | `ig_chart_patterns_continuation.html` | SVG pattern diagrams (inline), before/after price paths | Tab by pattern family |
| 8 | `ig_chart_patterns_reversal.html` | Same system as continuation | Tab by pattern family |

### Phase E — T2 Upgrade Sequence (11 files)
Standard upgrade template applied — animations + reveal + click-to-expand. No quiz mode unless content naturally supports it.

Order: `ig_gap_types` → `ig_volume_analysis` → `ig_support_resistance` → `ig_trendlines` → `ig_fibonacci` → `ig_market_traps` → `ig_order_types` → `ig_market_open` → `ig_trading_day_types` → `ig_heikin_ashi` → `ig_sentiment_indicators`

### Phase F — T3 Upgrades + Packaging (7 files)
Platform guides and deep reference tools. Upgrade focuses on visual polish and better information hierarchy rather than interactivity. Bundle as "FINN Pro Reference Pack" for standalone sale.

### Phase D — Net-New Social-First Content
New files built for social distribution first, course integration second:

| File (proposed) | Format | Topic |
|-----------------|--------|-------|
| `ig_pattern_quiz.html` | Interactive quiz | 10-question candlestick identification drill |
| `ig_risk_calculator.html` | Interactive tool | Position size + stop-loss calculator |
| `ig_market_regime.html` | Visual card | Bull/Bear/Choppy regime identification framework |
| `ig_trade_anatomy.html` | Step breakdown | Single trade entry-to-exit visual walkthrough |
| `ig_bias_cards.html` | Flip card deck | 9 cognitive biases — social-shareable card format |
| `ig_sector_rotation.html` | Flow diagram | Animated sector rotation cycle |

---

## Social Media Architecture

### Platform Specs
| Platform | Primary Dimension | Format | Role | Notes |
|----------|-----------------|--------|------|-------|
| YouTube | 1280 × 720px (16:9) | Video overlay, chapter slide, thumbnail | Long-term brand + AdSense revenue | Infographics as visual assets inside videos; Shorts at 1080×1920 |
| Facebook | 1080 × 1080px (1:1) | Section-by-section image posts; video ads | Paid acquisition + course conversion | Never post full infographic as one image — post sections individually |
| LinkedIn | 1200 × 627px | Carousel screenshot (one concept per slide) | Professional credibility + organic engagement | Near-identical to Twitter/X; 21.77% carousel engagement rate |
| Instagram | 1080 × 1080px | Carousel screenshot + Reels overlay | Visual discovery | Reels for reach; carousels for engagement |
| Twitter/X | 1200 × 675px | Screenshot or screen recording | Thought leadership + thread distribution | `body.social` class |
| Instagram Stories / TikTok / YouTube Shorts / Facebook Reels | 1080 × 1920px | Screen recording or animated pan | Broad awareness | `body.social.vertical` — future phase |

### Screenshot Workflow (no tooling required)
1. Open HTML file in Chrome
2. Set zoom to 100%, window to target width
3. DevTools → `Ctrl+Shift+P` → "Capture full size screenshot"
4. Or: add `body.social` class, capture at exact dimensions

### Content Strategy by Platform (resolved from Phase A research)
- **YouTube**: FINN infographics as chapter slide backgrounds and explainer overlays inside long-form tutorials. Shorts (15–60 sec) as animated infographic previews for discovery. Thumbnail design using FINN visual system. Long-form finance CPM: $15–$50+. Hybrid Shorts + long-form strategy for reach + revenue.
- **Facebook**: Paid ad → free webinar → course funnel (standard for $100–$1,000 products). Organic group content (80/20 value/promo). Post infographics section-by-section (one readable panel per post = 3–5 posts per infographic). Lead Gen Ads with Instant Forms for email capture. Target: interest stacking + Lookalike Audiences.
- **LinkedIn**: One concept per carousel slide. Professional framing ("How quants measure edge," "The IC test every trader should run"). Question in copy = +77% comments. 3–5 posts per week. 21.77% median engagement on carousels.
- **Instagram**: Reels (15–30 sec) for reach and discovery. Carousels for engagement and saves. Caption drives engagement, visual stops the scroll. 1080×1080px square social mode.
- **Twitter/X**: Single-concept cards, thread-based frameworks, "did you know" quiz hooks. Anti-promotional credibility stance earns organic reshares.

---

## Phase Architecture & Session Plan

### Phase A — Research (2 sessions)
**Session A1:** Competitor audit
- Top 10 trading educators on Twitter/X, LinkedIn, Instagram — catalog content types, visual styles, engagement patterns
- Fintech edtech products (Investopedia, TradingView Learn, tastytrade) — what interactive tools exist
- Output: `research/competitors/ig_competitor_audit.md`

**Session A2:** Capability audit
- Deep research on HTML/CSS/JS interactive patterns for financial content
- Animation libraries: CSS-only vs. Anime.js vs. GSAP Lite — size, capability, self-contained viability
- Chart.js inline usage patterns
- Output: `research/planning/ig_capability_audit.md`
- Output: Updated Open Decisions section of this document (decisions resolved)

### Phase B — Design System (2 sessions)
**Session B1:** Build `ig_TEMPLATE_v2.html`
- Full design system file: all CSS variables, all component classes, all JS patterns
- Not a published infographic — a development reference and copy-paste source
- Includes: social mode, animation system, all interactive components, Chart.js integration example

**Session B2:** Build first T1 file with new system (`ig_trade_types.html`)
- Proves the template works end-to-end
- Validates social dimensions
- Any system issues surface here before 7 more T1 upgrades

### Phase C — T1 Upgrades (4 sessions)
- Sessions C1–C4: 2 files per session (files 2–8 from T1 sequence)
- Each session: upgrade 2 infographics, commit, test screenshot in social dimensions

### Phase D — Net-New Social Content (2 sessions)
- Session D1: `ig_pattern_quiz.html` + `ig_risk_calculator.html` (interactive tools)
- Session D2: `ig_market_regime.html` + `ig_trade_anatomy.html` + `ig_bias_cards.html`

### Phase E — T2 Upgrades (4 sessions)
- Sessions E1–E4: ~3 files per session
- Standard upgrade template — less custom work per file than T1

### Phase F — T3 Upgrades + Packaging (2 sessions)
- Session F1: Platform guides + deep reference upgrades
- Session F2: Bundle packaging — `FINN_Pro_Reference_Pack.zip`, standalone distribution prep

**Total: ~16 sessions.** Same scale as the KB build.

---

## Open Decisions

These must be resolved in Phase A before Phase B begins. Update this section after Phase A research.

| # | Decision | Options | Resolution |
|---|----------|---------|------------|
| 1 | Animation library | CSS-only vs. inline Anime.js (~7KB) | ⬜ Pending Phase A Session A2 (capability audit) |
| 2 | Chart integration | Chart.js inline vs. pure CSS charts | ⬜ Pending Phase A Session A2 (capability audit) |
| 3 | Platform priority | Twitter/X vs. LinkedIn vs. Instagram | ✅ **Platform role map (not a ranked list — each has a distinct function):** YouTube = long-term brand equity + AdSense revenue + course funnel anchor. Facebook = paid acquisition engine (Ad → webinar → course, 12× ROAS documented). LinkedIn = organic professional credibility (21.77% carousel engagement). Instagram = visual discovery (Reels reach + carousel engagement). Twitter/X = thought leadership + thread distribution. Source: ig_competitor_audit.md |
| 4 | Quiz mode scope | T1 only vs. all tiers | ⬜ Pending Phase B validation |
| 5 | Standalone packaging | ZIP download vs. Gumroad vs. Teachable | ⬜ Pending user decision (Gumroad recommended — established trading education audience, free lead magnet + paid bundle model validated by market) |
| 6 | SVG vs. CSS for pattern diagrams | CSS divs (current) vs. inline SVG | ✅ **CSS for simple elements** (current system preserved), **inline SVG for complex pattern diagrams** (candlestick formations, annotated chart patterns). TradingView uses SVG as industry standard; static PNG competitors use raster. SVG enables screenshot-quality at any resolution. Source: ig_competitor_audit.md |
| 7 | Vertical format | Build Stories/TikTok variants in Phase D or later | ⬜ Pending user decision |
| 8 | Content design per platform | Which platform to design content for first, cadence, format specifics | ⬜ **Deferred — return after build phases.** User leans YouTube. Core audience: day traders + people learning to day trade. All platform research is complete in `ig_competitor_audit.md` and ready when this decision is revisited. |

---

## Research Requirements for Phase A

### Competitor Audit (Session A1) — Questions to answer
1. Who are the top 10 financial/trading educators on each platform? What content format performs best for each?
2. What visual patterns repeat in high-engagement fintech educational content? (color, layout, information density, animation style)
3. What does interactive trading education look like at the product level? (Investopedia tools, TradingView Learn, Options Profit Calculator, etc.)
4. Are there existing "infographic product packs" being sold? At what price point? What's included?
5. What content topics get the most engagement in the trading education space on social?

### Capability Audit (Session A2) — Questions to answer
1. What is the file size ceiling for self-contained HTML before it becomes impractical to share? (~500KB? ~1MB?)
2. Anime.js vs. GSAP Lite vs. CSS — what's the real capability delta for the types of animations we need?
3. Can Chart.js be inlined and still produce clean, themeable charts within a 200KB budget?
4. What are the best vanilla JS patterns for quiz/flashcard interactivity without a framework?
5. Are there open-source fintech HTML components worth studying or adapting?

---

## File & Folder Organization

### No changes to existing structure
All 26 current files stay at `resources/infographics/ig_[topic].html` — course callouts are not broken.

### New files added alongside
- `resources/infographics/ig_TEMPLATE_v2.html` — development reference only, not distributed
- `resources/infographics/ig_[topic].html` — upgraded in-place (same filename)
- New social-first content: same `ig_[topic].html` naming pattern
- Future: `resources/infographics/social/` subfolder for standalone distribution package

### Version tracking
No version numbers in filenames. Git history is the version record. CHANGELOG tracks each upgrade session.

---

## Dependencies

- **Phase A must complete before Phase B.** Design decisions depend on research findings.
- **Phase B Session B2 must complete before Phase C.** Template is validated before scaling.
- **Phase D is independent.** Net-new content can run in parallel with Phase E if needed.
- **Phase F depends on Phase E complete.** Packaging requires all files at v2 quality.

---

## Success Criteria

| Milestone | Definition |
|-----------|-----------|
| Phase B complete | `ig_TEMPLATE_v2.html` exists. `ig_trade_types.html` is upgraded, screenshot-ready at 1200×675px, and has at least one interactive element |
| Phase C complete | All 8 T1 files upgraded. Each is screenshot-tested at Twitter/X dimensions. At least 2 have quiz/interactive mode. |
| Phase D complete | 5 net-new social-first pieces exist and are shareable as standalone files |
| Phase E complete | All 11 T2 files upgraded with animations + reveal system |
| Phase F complete | A distributable product bundle exists (`FINN_Pro_Reference_Pack`) containing all 26 upgraded files + 6 new files, with a landing page / README |

---

*Planning doc for FINN Infographics Upgrade project.*
*Update Open Decisions section after Phase A research completes.*
*Session progress tracked in `FINN_ProjectStatus.md`.*
