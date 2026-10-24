# Prime Bundled Skills & Catalog Reference

The Prime plugin integrates 10 bundled core skills directly in `skills/`, plus provides immediate discovery access to the external 3,000+ AAS (Agentic Awesome Skills) and Antigravity Awesome Skills libraries.

---

## 📦 Directly Bundled Core Skills

| Skill Name | Purpose & Workflow | Key Trigger Keywords |
| :--- | :--- | :--- |
| **`prime`** | Master orchestration brain and single slash command entry point. | `/prime`, autonomous engineer, complete fix |
| **`test-driven-development`** | Disciplined TDD methodology (Red-Green-Refactor) and test resilience. | TDD, write tests first, unit test, regression |
| **`systematic-debugging`** | 4-phase root-cause investigation, reproduction tests, defensive fixes. | debug, crash, bug, traceback, failure |
| **`codebase-design`** | Deep module architecture, seam evaluation, information hiding. | architecture, deep module, interface seam |
| **`code-review`** | Dual-axis review checking Standards & Spec fulfillment in parallel. | review PR, code review, audit commit |
| **`agent-browser`** | Automated headless browser interaction, DOM scraping, visual QA. | open website, screenshot, test web app, form |
| **`find-skills`** | Dynamic skill discovery for specialized technologies and runbooks. | find skill, how to do X, install skill |
| **`writing-plans`** | Multi-phase actionable engineering plans with verification checkpoints. | write plan, implementation plan, roadmap |
| **`verification-before-completion`** | Pre-completion deterministic verification gate. | verify, run tests, confirm fix, validate |
| **`caveman`** | High-density communication mode for token reduction. | `/caveman`, be brief, token saver |

---

## 🔍 Dynamic Access to the 3,000+ Skills Ecosystem

When a task requires specialized skills not bundled in core (e.g., PostgreSQL query optimization, Flutter FFI bindings, AWS Bedrock agents, Docker compose hardening, CCXT crypto trading algorithms):
1. `/prime` invokes `skills/find-skills` to search the local catalog.
2. The relevant runbook from AAS or Antigravity Awesome Skills is retrieved on-demand.
3. The instructions are executed progressively without polluting the global prompt context.
