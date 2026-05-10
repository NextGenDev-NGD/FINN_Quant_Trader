---
name: finn-design
description: UIX/Frontend skill for building and upgrading FINN infographics. Use when working on HTML files in resources/infographics/.
allowed-tools: Read Edit Write Glob Grep
---

You are operating in UIX/Frontend build mode for the FINN Infographics Upgrade project.

## On invocation

If $ARGUMENTS specifies a filename or topic — work on that specific infographic.
If no argument — read `FINN_ProjectStatus.md` and report the current phase, next file in sequence, and what the upgrade requires.

## Always read first

1. `research/planning/finn_infographics_upgrade_plan.md` — full technical architecture: design system v2, social media mode, animation system, component patterns, upgrade sequence, open decisions
2. The target file at `resources/infographics/$ARGUMENTS` (or next in sequence if no argument)

## Design system rules (v2)

**Preserve existing palette — extend, never replace:**
```css
--bg: #0d1117; --card: #161b22; --border: #30363d;
--text: #e6edf3; --blue: #58a6ff; --green: #3fb950;
--red: #f85149; --amber: #d29922; --muted: #8b949e;
```

**Add new variables to every upgraded file:**
```css
--card-elevated: #1c2128;
--blue-glow: rgba(88,166,255,0.12);
--green-glow: rgba(63,185,80,0.12);
--red-glow: rgba(248,81,73,0.12);
--ease-out: cubic-bezier(0.16, 1, 0.3, 1);
--dur-fast: 150ms; --dur-med: 300ms; --dur-slow: 500ms;
```

## Every upgraded file must include

**1. Social media mode** (add to CSS and comment at top of file):
```html
<!-- SOCIAL MODE: add class="social" to <body> for 1200×675px screenshot -->
```
```css
body.social { width: 1200px; min-height: 675px; overflow: hidden; }
body.social.square { width: 1080px; min-height: 1080px; }
```

**2. Scroll-triggered reveal animation** (vanilla JS — no library):
```css
.reveal { opacity: 0; transform: translateY(16px); transition: opacity var(--dur-slow) var(--ease-out), transform var(--dur-slow) var(--ease-out); }
.reveal.visible { opacity: 1; transform: translateY(0); }
```
```js
const obs = new IntersectionObserver(entries => entries.forEach(e => { if (e.isIntersecting) e.target.classList.add('visible'); }), { threshold: 0.1 });
document.querySelectorAll('.reveal').forEach(el => obs.observe(el));
```

**3. Updated footer** — include FINN attribution, version tag, and date.

## Interactive components (use where content supports it)

- **Tab switcher** — for multi-category content (e.g., bullish/bearish patterns)
- **CSS flip cards** — `onclick="this.classList.toggle('flipped')"` with CSS 3D transform for definition → detail reveals
- **Click-to-expand table rows** — row click toggles a `.detail-row` open/closed
- **Animated counters** — for numeric metrics (win rate, IC, Sharpe values)
- **Chart.js inline** — only where a chart is genuinely needed; inline the minified script, never CDN

## Hard constraints

- No external CDN links — all JS and CSS must be inline
- File must work offline — open in a browser, no server required
- Use Edit tool for upgrades to existing files; Write only for net-new files
- Do not break existing course callout links — filenames are fixed

## After completing a file

Confirm the social mode layout is clean at 1200×675px. Note any open decisions from the planning doc that this file's build resolved or surfaced.

$ARGUMENTS
