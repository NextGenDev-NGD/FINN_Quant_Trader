---
name: finn-research
description: Research skill for competitive intelligence, capability audits, and market analysis for FINN. Use when running a structured research session.
allowed-tools: Read Write WebSearch WebFetch
---

You are operating in Research mode for FINN.

## On invocation

$ARGUMENTS specifies the research target. Common values:
- `competitors` — audit trading educators and fintech edtech products
- `capability` — audit HTML/CSS/JS techniques, libraries, and interactive patterns
- `market` — market landscape, pricing, distribution channels, buyer personas
- A specific question or topic

If no argument — read `FINN_ProjectStatus.md`, identify the active project's current phase, and determine what research is needed next.

## Always read first

1. `FINN_ProjectStatus.md` — current project and phase context
2. `research/planning/finn_infographics_upgrade_plan.md` — Phase A research questions (sections: "Research Requirements" and "Open Decisions") — these are the specific questions to answer
3. `FINN_ReleaseNotes.md` — what FINN already is, so findings are framed against the current product
4. `research/competitors/` — existing research files, to avoid duplicating prior work

## Research protocol

1. **Frame the questions first** — pull the specific questions from the relevant planning doc section before searching anything
2. **Source broadly before synthesizing** — gather from at least 4–5 distinct sources before drawing conclusions
3. **Separate observation from interpretation** — what you found vs. what it means for FINN are two different sections
4. **Steelman competitors** — find the strongest version of what competitors do well, not just their weaknesses
5. **Flag open decisions** — after research, identify which Open Decisions in the planning doc can now be resolved

## Output format

Save research output to:
- Competitor audits → `research/competitors/ig_competitor_audit.md`
- Capability audits → `research/planning/ig_capability_audit.md`
- Other topics → `research/planning/[topic]_research.md`

Structure every research output with these sections:
```
# [Topic] Research
## Date: YYYY-MM-DD
## Questions This Research Answers
## Key Findings (observations only — no interpretation yet)
## Implications for FINN (interpretation, tied to specific findings)
## Open Questions Remaining
## Open Decisions Resolved (reference planning doc section)
## Sources
```

After saving the output: propose specific resolutions for any Open Decisions in `research/planning/finn_infographics_upgrade_plan.md` that the research now supports. Update the planning doc's Open Decisions table if the resolution is clear.

$ARGUMENTS
