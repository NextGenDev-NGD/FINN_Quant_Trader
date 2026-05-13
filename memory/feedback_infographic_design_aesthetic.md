---
name: Infographic Design Aesthetic — TradingView Reference
description: User's standing design direction for all FINN v2 infographic upgrades — modern, interactive, TradingView-inspired visual language
type: feedback
---

Infographics must be modern, interactive, and visually captivating — modeled on TradingView's design aesthetic. Target audience: 20s through early 40s–50s who are familiar with and attracted to professional trading platform UX.

**Why:** The v1 infographics look like educational slides. The v2 goal is "pro trader tool" — something that feels like it was built by a serious product team, not a classroom.

**How to apply:** Every infographic upgrade (B2 onward) must pass this bar before shipping:
1. Does it look like something a serious trader would screenshot and share?
2. Does it feel interactive — do hover states and animations reward attention?
3. Does it read instantly — is financial data formatted with tabular numerics and visual gauges?

**Specific TradingView design traits to model:**
- Glassmorphism panels on elevated cards (`backdrop-filter: blur()` + semi-transparent bg)
- Gradient accent borders on chart panels and key sections (top-border gradient strip)
- Tabular numeric rendering (`font-variant-numeric: tabular-nums`) on all financial data
- Live indicator dots (pulsing green/amber dot for "active signal" status)
- Signal strength gauges (horizontal fill bars for IC, Sharpe, win rate)
- Compact metric strip header (TV-style data row at top — key numbers at a glance)
- Hover crosshair on SVG charts (JS-driven vertical cursor line)
- Tooltip panels on hover (dark overlay showing detail on data points)
- Smooth micro-animations everywhere — nothing static, nothing jarring
- Color consistency: green = confirmed/positive, red = caution/negative, blue = neutral/info, amber = warning
