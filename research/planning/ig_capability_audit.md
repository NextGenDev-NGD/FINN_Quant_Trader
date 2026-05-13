# FINN Infographics — Capability Audit
## Phase A, Session A2
## Date: 2026-05-12
## Questions This Research Answers

1. Animation library: CSS-only vs. Anime.js vs. GSAP Lite — capability, size, license
2. Chart.js inline feasibility — size, theming, alternatives
3. Vanilla JS quiz/flashcard patterns — code patterns, browser gotchas
4. Open-source fintech HTML components — what exists, what's missing
5. File size ceiling for self-contained shareable HTML — platform limits, budget

---

## Executive Summary

- **Animation (Q1):** CSS-only + vanilla JS covers all FINN animation needs. Anime.js v4 is 111KB (not 7KB as commonly cited) — too heavy to justify. GSAP has license ambiguity for inlined redistribution. Decision: CSS + vanilla JS only.
- **Charts (Q2):** Chart.js v4 is 220KB inlined — only use in files that genuinely need it. uPlot (~50KB, MIT) is the better default for time-series. Pure inline SVG covers all static/illustrative chart needs with zero KB cost.
- **Quiz/Flashcard (Q3):** CSS 3D flip cards are fully native — ~10 lines CSS + 1 line JS. Multi-question quiz drill is 40–60 lines vanilla JS. No library needed. One Safari gotcha: `-webkit-backface-visibility` required.
- **Fintech components (Q4):** No mature pure HTML/CSS/JS financial component library exists. uPlot and TradingView Lightweight Charts are the strongest lightweight options. Hand-coded inline SVG is the only viable path for illustrative static candlesticks.
- **File size (Q5):** Target ceiling 500KB per file; stretch ceiling 1MB. Email is the only binding constraint (Gmail 25MB). With Chart.js inlined (210KB), 290KB remains at the 500KB target — sufficient for FINN content.

---

## Q1 — Animation Library Decision

### Size Comparison

| Library | Minified (raw) | Min+Gzip | License |
|---------|---------------|----------|---------|
| CSS-only | 0 KB | 0 KB | N/A |
| Anime.js v4.4 | 111 KB | 38 KB | MIT |
| GSAP v3.15 core | 69 KB | 27 KB | Proprietary No-Charge |

> **Note:** The commonly cited "6–7 KB" for Anime.js is the gzip figure from the v2/v3 era. Anime.js v4 is a significant rewrite — 111 KB minified is the current on-disk size that would be inlined.

### License Check

**Anime.js (MIT):** Fully permitted for commercial inline redistribution. Must retain copyright notice. No restrictions on inlining inside a distributed HTML file.

**GSAP No-Charge License (post-April 2025, Webflow acquisition):** Permits use on "websites, web applications, or digital interfaces." Does **not** address inlining the minified source into a redistributable offline file. The permitted-use clause is ambiguous for offline-distributed products. **Do not inline GSAP in files distributed commercially without legal review.**

### CSS-Only Capability: Strengths and Limits

**CSS handles well:**
- Hover transitions and state changes
- Keyframe loops and sequences
- `transform` (translate, rotate, scale, skew)
- Opacity and filter animations
- CSS 3D perspective card flips (native, no JS needed)
- Scroll-driven reveals via `animation-timeline: view()` (Chrome/Edge 2024+, Firefox 2025+)

**CSS falls short on:**
- Counter/number animations (cannot animate text content values)
- Multi-element stagger with precise inter-element delays
- Sequenced timelines with complex dependencies
- Scroll-progress-linked value mapping to arbitrary properties
- Any animation of non-CSS values

### Use-Case Capability Matrix

| Use Case | CSS-Only | Vanilla JS (~20 lines) | Anime.js |
|----------|----------|----------------------|----------|
| Scroll-triggered reveal (fade/slide in) | ✅ Good (modern browsers) | ✅ IntersectionObserver — 10 lines | ✅ |
| Counter number animation | ❌ Not possible | ✅ RAF loop — 20 lines | ✅ |
| CSS 3D card flip | ✅ Native — no JS needed | N/A | Unnecessary |
| Step-flow connector animation | ✅ `stroke-dashoffset` keyframes | ✅ Adequate | ✅ |
| Candlestick bar stagger sequence | ⚠️ Limited sequencing control | ✅ RAF stagger — 30 lines | ✅ Cleaner API |

### Recommendation

**CSS + vanilla JS only.** Anime.js at 111KB cannot be justified on a 500KB file budget. CSS handles 4 of 5 use cases natively. Counter animations and candlestick stagger are solved with ~30 lines of vanilla JS `requestAnimationFrame`. The one case where Anime.js offers a cleaner API (stagger sequencing) does not outweigh 111KB of inlined library weight.

GSAP is eliminated due to license ambiguity for offline redistribution.

---

## Q2 — Chart.js Inline Feasibility

### Size

| Library | Minified (raw) | Min+Gzip | License |
|---------|---------------|----------|---------|
| Chart.js v4 | ~220 KB | ~65 KB | MIT |
| uPlot | ~50 KB | ~17 KB | MIT |
| Frappe Charts | ~60 KB | ~19 KB | MIT |
| ApexCharts | ~425 KB | ~130 KB | Revenue-gated |
| Pure inline SVG | 0 KB | — | N/A |

> **ApexCharts warning:** Free only for organizations under $2M annual revenue. Revenue-gated license is not compatible with a sellable product without paying.

### Chart.js Offline Inline Use

Fully supported. Download `chart.umd.min.js`, paste into a `<script>` tag, configure in a second `<script>`. No server, CDN, or build step required. This is a documented offline/embedded use pattern.

Chart.js is **not** tree-shakeable via a `<script>` tag — you get the full 220KB regardless of which chart types you use.

### Dark Theme Support

Complete theming control via JS config:

```js
Chart.defaults.color = '#e6edf3';
Chart.defaults.borderColor = '#30363d';
Chart.defaults.backgroundColor = '#0d1117';
```

Per-chart overrides via `scales.x/y.grid.color`, `scales.x/y.ticks.color`, `plugins.legend`. Canvas background requires a one-line `beforeDraw` plugin hook. All driven by JS variables — no CSS variables access (Canvas API limitation).

### Chart Types for FINN Content

| FINN Use Case | Best Chart Type |
|--------------|----------------|
| Sharpe ratio / equity curve over time | `line` (multi-dataset) |
| Drawdown visualization | `line` with fill |
| Volume analysis | `bar` |
| IC distribution | `bar` (manual binning) |
| Win rate comparison | `doughnut` or grouped `bar` |

### Recommendation

**Split approach — not blanket Chart.js inlining:**

1. **uPlot** (~50KB, MIT) — default for all time-series charts (Sharpe curve, equity curve, drawdown). Smallest footprint, offline-friendly, OHLC-native.
2. **Chart.js** (~220KB, MIT) — only in files that specifically need doughnut or histogram chart types. Per-file decision, not a template default.
3. **Pure inline SVG** — for all illustrative, static charts (decorative equity curve, example OHLCV bars). Zero KB, screenshot-quality at any resolution.

Estimated files needing Chart.js: 2–3 (performance metrics, possibly volume analysis). The other 23+ files use uPlot or SVG.

---

## Q3 — Vanilla JS Quiz/Flashcard Patterns

### Flip Card — Complete Pattern

```css
.scene { perspective: 800px; }

.card {
  transform-style: preserve-3d;
  transition: transform 0.6s;
  position: relative;
}

.card.is-flipped { transform: rotateY(180deg); }

.card__face {
  position: absolute;
  inset: 0;
  backface-visibility: hidden;
  -webkit-backface-visibility: hidden; /* Safari */
}

.card__face--back { transform: rotateY(180deg); }
```

```js
card.addEventListener('click', () => card.classList.toggle('is-flipped'));
```

That is the complete implementation. `perspective` on the parent container, `preserve-3d` on the card element, `backface-visibility: hidden` on both faces, `rotateY(180deg)` on the back face at rest. One JS line per card.

### Click-to-Reveal Quiz — Minimal Pattern

```js
const questions = [
  { q: "What does IC measure?", a: "Information Coefficient — correlation between predicted and actual returns" },
  { q: "What is a Sharpe ratio above 1.0?", a: "Acceptable risk-adjusted return relative to volatility" }
];
let i = 0;

function render() {
  qEl.textContent = questions[i].q;
  aEl.textContent = '';
  aEl.hidden = true;
}

revealBtn.addEventListener('click', () => {
  aEl.hidden = false;
  aEl.textContent = questions[i].a;
});
nextBtn.addEventListener('click', () => { i = (i + 1) % questions.length; render(); });

render();
```

Approximately 15 functional lines.

### Multi-Question Drill with Score — Realistic Scope

Full implementation covering: question array, index tracker, score counter, render function, click handler (correct/wrong + score increment), next-question advance, results screen — runs to **40–60 lines** of vanilla JS. No library needed.

### Browser Compatibility Gotchas (2025 Status)

| Issue | Status | Fix |
|-------|--------|-----|
| `backface-visibility` support | Broadly supported — no prefix needed Chrome/Firefox | Add `-webkit-backface-visibility: hidden` for Safari (redundant but harmless) |
| Global `*` selector on `backface-visibility` | Crashes iOS Safari/Chrome on older devices | Never apply globally — only on `.card__face` elements |
| `z-index` conflicts with flip | Silent breakage in stacking contexts | Avoid `z-index` on card face elements |
| 20+ cards performance | Not a concern — GPU-composited | Use `IntersectionObserver` to lazy-attach listeners; call `observer.unobserve()` after first intersection |

---

## Q4 — Open-Source Fintech HTML Components

### What Was Found

| Resource | Type | License | Notes |
|----------|------|---------|-------|
| uPlot | Chart library | MIT | ~45KB, OHLC-native, canvas, no deps — best fit |
| TradingView Lightweight Charts | Chart library | Apache 2.0 | ~40KB, full candlestick, canvas — permissive |
| IvanCampos/financial-dashboard | Dashboard reference | — | Vanilla JS, flat HTML, no build step |
| ken2213/financial-dashboard | Dashboard reference | — | Chart.js via CDN, dark mode, JSON data |
| Finance.js | Calculations only | MIT | No charting — formulas only |

### Critical Gap

**No production-quality pure CSS or pure SVG candlestick chart component exists as an open-source library.** The ecosystem uses canvas (Chart.js, uPlot, TradingView LC) or D3 exclusively for OHLCV. One proof-of-concept CodePen exists but is not a reusable library.

**Implication for FINN:** Candlestick visuals in infographic files must be hand-coded as inline SVG per file. This is the correct approach for illustrative educational content (simplified, annotated, not live data) — but there is no open-source starting point to adapt.

### No Dark-Theme Fintech UI Kit Found

No MIT-licensed GitHub-hosted fintech UI kit for dark-theme chart components was found. Commercial options exist (ThemeForest, UI8) but are not open-source. The `fintech-design` GitHub topic surfaces mostly Tailwind/Bootstrap projects requiring a build step.

---

## Q5 — File Size Analysis and Budget

### Platform Limits

| Platform | Limit | Constraint for FINN? |
|----------|-------|---------------------|
| Gmail attachment | 25MB (18MB effective) | No — FINN files will be <1MB |
| Outlook.com | 20MB | No |
| WhatsApp (as document) | 2GB | No |
| Telegram | 2GB (4GB Premium) | No |
| iMessage | 100MB | No |
| Browser instant-open | ~1MB practical | **Yes — the operative ceiling** |

Email is the only platform with a hard limit. For files under 1MB, all platforms are non-binding. The operative ceiling is **browser instant-open behavior**: files above 1MB may prompt a download dialog rather than rendering inline on mobile browsers.

### File Size Budget

| Target Ceiling | Chart.js (if inlined) | Remaining Budget |
|---------------|----------------------|-----------------|
| 500KB | 210KB | **290KB** |
| 1MB | 210KB | **814KB** |

At 500KB with Chart.js inlined, 290KB covers HTML structure, full CSS design system, one small SVG illustration, and FINN content with room to spare. At 1MB, the budget is generous.

**TiddlyWiki community consensus** (the most established single-file HTML community): 500KB is the practical ceiling for "general public consumption." Above 5MB, mobile browser stalls occur. Above 10MB, load-time degradation on older hardware.

### Image Handling Rule

Do not inline base64 images above 10KB — base64 adds 33% size overhead and blocks lazy loading. Use inline SVG instead: no overhead, native browser text parsing, screenshot-quality at any resolution.

### Recommended Budget Per File

| Component | Budget |
|-----------|--------|
| HTML structure + content | 50–80KB |
| CSS design system (full) | 30–40KB |
| Vanilla JS (animations, interactivity) | 5–15KB |
| Inline SVG illustrations | 10–30KB |
| uPlot (if needed) | 50KB |
| Chart.js (if needed) | 210KB |
| **Total target (no Chart.js)** | **~150KB** |
| **Total target (with Chart.js)** | **~350KB** |
| **Hard ceiling** | **500KB** |

---

## Open Decisions Resolved

### Decision #1 — Animation Library

**Resolved: CSS-only + vanilla JS. No library.**

Anime.js v4 is 111KB minified — not 7KB. That eliminates it from a 500KB file budget. GSAP has license ambiguity for offline inlined redistribution. CSS handles 4/5 FINN animation use cases natively. Counter animations and stagger sequencing are solved with ~30–50 lines of vanilla `requestAnimationFrame` code. The capability gap does not justify the file size cost.

### Decision #2 — Chart Integration

**Resolved: Split approach. No blanket Chart.js inlining.**

- **uPlot** (~50KB, MIT): Default chart library for all time-series charts. Used in files that show equity curves, Sharpe over time, drawdown curves.
- **Chart.js** (~220KB, MIT): Used only in files requiring doughnut or histogram types. Per-file decision. Estimated 2–3 files.
- **Pure inline SVG**: Default for all illustrative/decorative/static charts. Zero KB cost, no library dependency, screenshot-quality output.

Basis: Chart.js at 220KB consumes 44% of the 500KB file budget before any content is added. uPlot covers the majority of FINN chart needs at 23% of that cost.

---

## Open Questions Remaining

1. **Anime.js v3 subset:** Anime.js v3 (not v4) was ~16–17KB minified. If v3 is still maintained or can be pinned, the size argument shifts. Worth checking if v3 is viable before permanently closing the door on library use for stagger sequences.
2. **uPlot dark theme examples:** Confirm uPlot dark theming works cleanly before committing it as the default. Needs a test file in Phase B.
3. **TradingView Lightweight Charts offline:** Apache 2.0 license is permissive for commercial use. Confirm it works fully offline (no analytics callbacks requiring network) before using for candlestick visuals.
4. **Hand-coded SVG candlesticks:** Scope the effort. A single reusable SVG candlestick component (bullish/bearish variants, with wick and body) would unblock all T1/T2 pattern files. Build this in Phase B alongside the template.

---

## Sources

- Anime.js v4 — [Bundlephobia](https://bundlephobia.com/package/animejs) | [GitHub](https://github.com/juliangarnier/anime)
- GSAP v3 — [Bundlephobia](https://bundlephobia.com/package/gsap) | [GSAP Standard License](https://gsap.com/community/standard-license/)
- Chart.js — [Bundlephobia](https://bundlephobia.com/package/chart.js) | [Offline discussion](https://github.com/chartjs/Chart.js/discussions/11219)
- uPlot — [GitHub leeoniya/uPlot](https://github.com/leeoniya/uplot)
- Frappe Charts — [Bundlephobia](https://bundlephobia.com/package/frappe-charts)
- TradingView Lightweight Charts — [GitHub](https://github.com/tradingview/lightweight-charts)
- CSS flip card — [DeSandro 3D Transforms](https://3dtransforms.desandro.com/card-flip) | [MDN backface-visibility](https://developer.mozilla.org/en-US/docs/Web/CSS/backface-visibility)
- WhatsApp file limits — [filesize.org](https://filesize.org/limits/whatsapp/)
- Gmail limits — [getinboxzero.com](https://www.getinboxzero.com/blog/post/gmail-attachment-size-limits-workarounds-2026)
- TiddlyWiki size guidance — [talk.tiddlywiki.org](https://talk.tiddlywiki.org/t/how-big-can-a-tiddlywiki-get/9610)
- Pure SVG charts — [CSS-Tricks](https://css-tricks.com/how-to-make-charts-with-svg/)
- GSAP vs Anime.js — [DEV Community](https://dev.to/ahmed_niazy/gsap-vs-animejs-a-comprehensive-guide-ncb)
