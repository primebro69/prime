---
name: prime
description: "Master autonomous AI engineering platform. Activates when user invokes /prime, asks for full-project analysis, architecture planning, TDD implementation, dual-axis code review, browser automation, or multi-specialist agent orchestration."
---

# Prime — Master Autonomous Engineering Skill

The **Prime** skill is the central operational brain of the Prime platform. It unifies 82 specialist agents, an autonomous agent factory, multi-agent debate deliberation, rigorous TDD engineering discipline, deep module architecture, and an extensive skills catalog into one coherent autonomous system.

When activated (either via `/prime` or natural language intent), follow this structured workflow.

---

## 1. Intent Analysis & Multi-Plugin Dynamic Dispatch

Prime does not treat plugins as generic tools. For any incoming task, Prime dynamically assigns the **Best-in-Class Lead Plugin** supported by specialized collaborating plugins (see [docs/PLUGIN-DISPATCH.md](../../docs/PLUGIN-DISPATCH.md), [docs/AGENT-DELIBERATION.md](../../docs/AGENT-DELIBERATION.md), and [catalogs/plugin-dispatch-matrix.json](../../catalogs/plugin-dispatch-matrix.json)):

1. **Full-System Audit & Auto-Repair** -> Lead: `superpowers + ECC` (Deep scan, Fowler smell audit, failing tests, surgical fixes, and verification).
2. **Autonomous Feature Implementation** -> Lead: `superpowers` (Blueprint, deep seams, TDD cycle, and quality review).
3. **Defect Resolution & Debugging** -> Lead: `superpowers` (4-phase root cause analysis, failing reproduction test, minimal fix, regression check).
4. **Dual-Axis Code Review** -> Lead: `agent-peer-review` (Standards adherence and spec compliance reported side-by-side without masking).
5. **Multi-Agent Deliberation & Debate** -> Lead: `agent-mediator` (3-round adversarial debate between domain specialists to reach bulletproof consensus).
6. **Autonomous Agent Factory** -> Lead: `agent-factory` (On-demand JIT agent synthesis, catalog registration, and lazy-loaded distribution).
7. **Browser Automation & Web QA** -> Lead: `agent-browser` (Headless Chrome via CDP, accessibility snapshots, and verification).
8. **Visual & UI/UX Excellence** -> Lead: `awesome-claude-plugins` (Aesthetics, typography, HSL palettes, and micro-interactions).
9. **Skill & Tool Discovery** -> Lead: `agentic-awesome-skills + antigravity` (Query 3,000+ indexed skills across Antigravity and Agentic catalogs).
10. **High-Density Mode** -> Lead: `caveman` (Compressed, token-efficient communication).

Consult [routing-table.md](references/routing-table.md) for full trigger mappings.

---

## 2. Progressive Capability Loading & Specialist Routing

Do not load unrelated bulky files into context. Selectively inspect the exact resources needed:
- **Multi-Plugin Dispatch Matrix**: `catalogs/plugin-dispatch-matrix.json`
- **Specialist Agent Definitions**: Consult [agents-matrix.md](references/agents-matrix.md) to pick the relevant agent(s) located in `agents/<agent-name>.md`.
- **Engineering Runbooks**:
  - TDD Iron Law: `skills/test-driven-development/SKILL.md`
  - Systematic Debugging: `skills/systematic-debugging/SKILL.md`
  - Codebase Seams & Depth: `skills/codebase-design/SKILL.md`
  - Dual-Axis Review: `skills/code-review/SKILL.md`
  - Browser Automation: `skills/agent-browser/SKILL.md`
  - Skill Discovery: `skills/find-skills/SKILL.md`
  - High-Efficiency Mode: `skills/caveman/SKILL.md`
- **Language-Specific Guidance**: Check `agents/<language>-reviewer.md` and `agents/<language>-build-resolver.md`.

---

## 3. Engineering Standards & The Iron Law of TDD

When writing or changing code, adhere strictly to Prime's Core Standards:

### The Iron Law
```
NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST
```
- **RED**: Write a minimal test demonstrating the required behavior or reproducing the bug.
- **Verify RED**: Run the test and confirm it fails for the expected reason.
- **GREEN**: Write only the minimal production code needed to make the test pass.
- **Verify GREEN**: Confirm all tests pass with pristine logs.
- **REFACTOR**: Remove duplication, tighten interfaces, and keep tests green.

### Deep Modules & Clean Seams (`codebase-design`)
- **Depth**: High ratio of behavior to interface complexity (small interface, deep implementation).
- **Seams**: Place seams only where behavior actually varies across callers or adapters.
- **The Deletion Test**: If deleting the module causes complexity to reappear across multiple callers, the module is earning its keep.

---

## 4. Verification & Reporting

Before reporting completion to the user:
1. **Deterministic Verification**: Execute test suites, linters, or build commands. Confirm exit code 0.
2. **Dual-Axis Review**: Check both repository standards and original specification requirements.
3. **Honest Reporting**: Summarize changes with file links, report test outputs, and state any external constraints or missing prerequisites transparently.
