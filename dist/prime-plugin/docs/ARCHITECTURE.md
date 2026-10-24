# Prime Plugin Platform Architecture

This document describes the internal engineering architecture of **Prime**, explaining how downloaded frameworks, specialist agents, core skills, and catalog indices are synthesized into a unified autonomous plugin.

---

## 🏛️ High-Level System Architecture

```text
┌─────────────────────────────────────────────────────────────────────────────┐
│                            USER / AGENT HARNESS                             │
│               Claude Code   •   Google Antigravity   •   OpenAI Codex       │
└──────────────────────────────────────┬──────────────────────────────────────┘
                                       │
                      Single Entry Point: /prime [task]
                                       │
┌──────────────────────────────────────▼──────────────────────────────────────┐
│                    PRIME AUTONOMOUS ROUTING ENGINE                          │
│                      (scripts/prime-router.ps1 / .js)                       │
│  - Intent Triage: Audit, Feature, Bugfix, Review, Browser, Search, Caveman  │
│  - Progressive Disclosure: Loads only required instructions into context    │
└──────────────┬───────────────────────┬───────────────────────┬──────────────┘
               │                       │                       │
┌──────────────▼──────────┐ ┌──────────▼──────────┐ ┌──────────▼──────────────┐
│  69 SPECIALIST AGENTS   │ │    30 CORE SKILLS   │ │   3,000+ SKILL CATALOGS │
│  - code-architect       │ │  - tdd-development  │ │  - Antigravity index    │
│  - code-reviewer        │ │  - systematic-debug │ │  - Agentic Core index   │
│  - silent-failure-hunter│ │  - codebase-design  │ │  - Live skills.sh query │
│  - build-error-resolver │ │  - code-review      │ └─────────────────────────┘
│  - 28 Language Experts  │ │  - agent-browser    │
└─────────────────────────┘ └─────────────────────┘
               │                       │
┌──────────────▼───────────────────────▼──────────────────────────────────────┐
│                      ENGINEERING GOVERNANCE & GATES                         │
│  - The Iron Law of TDD: No production code without failing test first       │
│  - Deep Module Seams: High leverage at small interfaces (Michael Feathers)  │
│  - Fowler Smell Baseline: Feature envy, shotgun surgery, data clumps        │
│  - Dual-Axis Review: Independent Standards & Spec verification passes       │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 🧩 Architectural Subsystems

### 1. Multi-Platform Manifest Adaptation
Prime adheres to the native plugin specifications of all three major AI harness ecosystems:
- **Claude Code**: Packaged under `.claude-plugin/plugin.json` following strict array formatting for `commands` and `skills`, convention-based auto-discovery for `agents/` (no explicit manifest declaration to prevent schema rejection), and empty `mcpServers` opt-out.
- **Google Antigravity**: Packaged with root `plugin.json` and active workspace discovery under `.agents/plugins/prime/` and `.agents/skills/prime/`.
- **OpenAI Codex**: Packaged under `.codex-plugin/plugin.json` with `interface` metadata and hook configurations.

### 2. Autonomous Intent Triage & Routing
The router (`scripts/prime-router.ps1` and `scripts/prime-router.js`) parses incoming task prompts and maps them into 8 concrete execution profiles:
1. `health-and-repair`: Scans project, identifies defects/smells, writes failing tests, applies surgical fixes, and verifies.
2. `feature-development`: Dispatches `planner` + `code-architect`, designs deep module boundaries, and applies the TDD cycle.
3. `defect-resolution`: Dispatches `systematic-debugging` and `build-error-resolver` with reproduction-first mandates.
4. `code-review`: Dispatches dual-axis reviewers (Standards vs Spec) without mutual contamination.
5. `browser-automation`: Launches headless Chrome via CDP with `@eN` accessibility tree snapshots via `agent-browser`.
6. `skill-discovery`: Searches 3,000+ local indexed skills across `catalogs/`.
7. `high-density-caveman`: Activates compressed communication for token optimization.
8. `general-engineering`: Applies default deep module and TDD discipline.

### 3. Engineering Rigor & Quality Gates
- **TDD Iron Law**: Code written before an automated test is deleted and restarted.
- **Deep Modules**: Modules present small interfaces that hide high-complexity implementations.
- **Dual-Axis Review**: Standards checking (code quality, naming, smells) and Spec checking (functional correctness, missing requirements, scope creep) remain strictly separate.
