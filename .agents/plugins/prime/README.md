# Prime — Unified Autonomous Engineering AI Plugin

> **One Master Plugin. One Master Slash Command: `/prime`.**

Prime is an enterprise-grade AI plugin that unifies the top software engineering harnesses, TDD methodologies, dual-axis code reviews, and over 3,000+ specialized agentic skills into a single installable package.

---

## ✨ Features

- **Single Master Entry Point (`/prime`)**: Eliminates the cognitive load of memorizing dozens of separate slash commands.
- **Disciplined Software Engineering**: Integrated TDD workflows from *Superpowers*, enforcing test-first development and deterministic verification.
- **Dual-Axis Peer Review**: Parallel audits evaluating both code quality standards and exact user specification fulfillment.
- **Deep Module Architecture**: Practical guidelines for designing simple, expressive interfaces hiding rich internal implementations.
- **Autonomous Specialist Agents**: 7 pre-configured specialist personas (`prime-orchestrator`, `code-reviewer`, `architect`, `tdd-engineer`, `security-reviewer`, `performance-optimizer`, `browser-automator`).
- **3,000+ Skills Ecosystem**: Instant on-demand discovery across AAS and Antigravity Awesome Skills libraries.
- **Triple-Platform Native**: Engineered to run seamlessly in **Google Antigravity**, **Claude Code**, and **OpenAI Codex**.

---

## 📁 Plugin Structure

```
prime-plugin/
├── plugin.json                 # Google Antigravity & root manifest
├── .claude-plugin/             # Claude Code native packaging
│   └── plugin.json             # Validated Claude manifest (strict array shapes)
├── .codex-plugin/              # OpenAI Codex manifest
│   └── plugin.json
├── commands/                   # Claude Code slash commands
│   └── prime.md                # The /prime master command
├── skills/                     # Reusable skills & runbooks
│   ├── prime/                  # Master /prime skill engine
│   ├── test-driven-development/# TDD red-green-refactor workflow
│   ├── systematic-debugging/   # Root-cause investigation methodology
│   ├── codebase-design/        # Deep module architecture design
│   ├── code-review/            # Dual-axis peer review engine
│   ├── agent-browser/          # Browser automation CLI
│   ├── find-skills/            # Dynamic skill discovery
│   ├── writing-plans/          # Structured implementation plans
│   ├── verification-before-completion/ # Deterministic verification gate
│   └── caveman/                # High-density communication mode
├── agents/                     # Specialist agent personas
│   ├── prime-orchestrator.md   # Conductor and autonomous workflow runner
│   ├── code-reviewer.md        # Standards & spec reviewer
│   ├── architect.md            # Deep module designer
│   ├── tdd-engineer.md         # Test-first engineer
│   ├── security-reviewer.md    # Security & vulnerability auditor
│   ├── performance-optimizer.md# Latency and memory optimizer
│   └── browser-automator.md    # E2E web automation tester
├── rules/                      # Enforced engineering standards
│   ├── 01-engineering-excellence.md
│   ├── 02-ui-ux-perfection.md
│   └── 03-autonomous-workflow.md
├── hooks/                      # Lifecycle hooks
│   └── hooks.json
├── references/                 # In-depth architectural guides
│   ├── skills-catalog.md
│   └── plugins-architecture.md
├── scripts/                    # Validation & diagnostic tools
│   └── validate-plugin.js
├── INSTALL.md                  # Step-by-step installation instructions
└── README.md                   # This document
```

---

## ⚡ Quickstart

Install the plugin and run:
```bash
/prime Analyze this project, identify its problems, and implement the necessary fixes.
```
