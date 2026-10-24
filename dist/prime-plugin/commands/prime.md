---
description: "Prime Autonomous AI Platform: Unified engineering harness combining 82 specialist agents, autonomous agent factory, multi-agent debate deliberation, TDD & Superpowers discipline, dual-axis review, browser automation, and 3,000+ curated skills into one intelligent entry point."
argument-hint: "<task | analyze | fix | build | review | debate | build-agent | test | search | /caveman>"
---

# /prime — Master Autonomous Engineering Orchestrator

`/prime` is the single primary command of the **Prime** plugin platform. When you invoke `/prime`, you activate a unified autonomous engineering system that intelligently routes, coordinates, and executes tasks using internal specialist agents, rigorous TDD engineering standards, deep module architecture, and an extensive skills catalog.

---

## Autonomous Execution Protocol

When `/prime` is invoked with any prompt:

```text
/prime [user task description]
```

Follow this 5-stage protocol autonomously:

```
┌────────────────────────────────────────────────────────────────────────┐
│                        STAGE 1: INTENT TRIAGE                          │
│ Classify task intent, domain, risk, and optimal orchestration profile  │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │
┌───────────────────────────────────▼────────────────────────────────────┐
│                    STAGE 2: CAPABILITY SELECTION                       │
│ Locate relevant Specialist Agent(s), Core Skills, & Catalogs           │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │
┌───────────────────────────────────▼────────────────────────────────────┐
│                  STAGE 3: GROUNDING & DEEP BLUEPRINT                   │
│ Inspect codebase first, analyze seams, dependencies, & Fowler smells   │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │
┌───────────────────────────────────▼────────────────────────────────────┐
│                   STAGE 4: TEST-DRIVEN EXECUTION                       │
│ Iron Law: Failing test first -> Minimal code -> Refactor & Verify      │
└───────────────────────────────────┬────────────────────────────────────┘
                                    │
┌───────────────────────────────────▼────────────────────────────────────┐
│             STAGE 5: DUAL-AXIS AUDIT & SYNTHESIS                       │
│ Verify Standards vs Spec, prove working state, report outcomes         │
└────────────────────────────────────────────────────────────────────────┘
```

---

## Stage 1: Intent Triage & Multi-Plugin Dynamic Dispatch

Prime does not treat plugins as generic interchangeable tools. Every task is assigned to its **Best-in-Class Lead Plugin** supported by specialized collaborating plugins (see [PLUGIN-DISPATCH.md](../docs/PLUGIN-DISPATCH.md) and [plugin-dispatch-matrix.json](../catalogs/plugin-dispatch-matrix.json)):

| Profile | Typical User Trigger | Lead Plugin (Specialist Role) | Collaborating Plugins | Execution Route |
| :--- | :--- | :--- | :--- | :--- |
| **A. Health & Auto-Repair** | *"Analyze this project, identify its problems, and implement the necessary fixes."* | **superpowers + ECC** (Co-lead: Defect Detection & Surgical TDD Fixes) | `agent-peer-review`, `claude-mem`, `agents-md` | Deep Scan -> Smell Audit -> Failing Test -> Fix -> Verify |
| **B. Feature Development** | *"Build...", "Create...", "Add feature...", "Implement new API..."* | **superpowers** (Disciplined TDD Engineering & Clean Seams) | `ECC`, `awesome-claude-plugins`, `claude-mem` | Blueprint -> Clean Seams -> TDD Cycle -> Integration Review |
| **C. Defect Resolution** | *"Fix...", "Debug...", "Why is this crashing...", "Resolve build error..."* | **superpowers** (Root Cause & 4-Phase Debugging Engine) | `ECC` (Language build resolvers & silent failure detectors) | Root Cause -> Failing Reproduction Test -> Minimal Fix -> Verification |
| **D. Code Review & Audit** | *"Review this PR/branch...", "Audit recent commits...", "Check against specs"* | **agent-peer-review** (Dual-Axis Blind Pass & Adversarial Review) | `ECC` (Language-specific reviewers), `agents-md` (Governance) | Dual-Axis Pass (Standards vs Spec) -> Security Scan -> Converged Verdict |
| **E. Architecture & Seams** | *"Refactor...", "Redesign module...", "Decouple services...", "Improve seams"* | **superpowers + ECC** (Deep Module Design & Structural Refactoring) | `agent-peer-review`, `claude-mem` | Interface Depth Analysis -> Seam Placement -> Deletion Test |
| **F. Multi-Agent Debate** | *"Debate...", "Discuss trade-offs...", "Group discussion...", "Deliberate..."* | **agent-mediator** (Multi-Agent Deliberation & Consensus Engine) | Panel of 2-4 Domain Specialists | Round 1 Stances -> Round 2 Challenges -> Round 3 Consensus |
| **G. Autonomous Agent Builder**| *"Build an agent for...", "Create specialist agent...", "New agent for X"* | **agent-factory** (Autonomous JIT Agent Synthesizer) | `scripts/prime-agent-builder.ps1` | Stack Analysis -> Synthesize `agents/<name>.md` -> Register & Sync |
| **H. Browser & UI Testing** | *"Test the web page...", "Automate login...", "Scrape data...", "Capture UI"* | **agent-browser** (Native Rust CDP Browser Specialist) | `awesome-claude-plugins` (Aesthetic standards), `ECC` (Frontend) | Launch Headless CDP -> Accessibility Tree -> Interact -> Proof |
| **I. Visual & UI/UX Excellence**| *"Modern UI...", "Design dashboard...", "Make it look premium..."* | **awesome-claude-plugins** (Aesthetics, Typography & Micro-Interactions) | `agent-browser` (Visual QA), `superpowers` (Component modularity) | Curated HSL Palette -> Font Hierarchy -> Micro-Interactions -> Snapshot |
| **J. Skill & Tool Search** | *"Find a skill for...", "Is there a tool that does...", "Search capabilities"* | **agentic-awesome-skills + antigravity** (3,000+ Skills Catalog) | `awesome-claude-plugins` (Top 100 curated recommendations) | Fast search across local indexes -> Match install count & safety |
| **K. High-Density Mode** | *"/caveman", "talk like caveman", "less tokens", "be concise"* | **caveman** (Ultra-Compressed Token Engine) | — | Strip conversational filler while retaining full technical rigor |

---

## Stage 2: Selective Capability Discovery & Lazy-Loaded Dispatch

To prevent context bloat while providing maximum capability:
1. **Never dump entire directories into context blindly.**
2. Consult the dispatch matrix and local catalogs:
   - Multi-Plugin Dispatch Matrix: `catalogs/plugin-dispatch-matrix.json`
   - Specialist Agents: `catalogs/prime-agent-directory.json` or `agents/<agent-name>.md`
   - Antigravity Skills: `catalogs/skills-index-antigravity.json` (889 skills)
   - Agentic Awesome Skills: `catalogs/skills-index-agentic.json` (2,121 skills)
3. Load the specific instruction file before acting:
   - For TDD / Verification: `skills/test-driven-development/SKILL.md`, `skills/verification-before-completion/SKILL.md`
   - For Debugging: `skills/systematic-debugging/SKILL.md`
   - For Codebase Design & Seams: `skills/codebase-design/SKILL.md`
   - For Dual-Axis Review: `skills/code-review/SKILL.md`
   - For Browser Automation: `skills/agent-browser/SKILL.md`
4. If a language specialist applies (e.g., Python, Rust, Go, TypeScript, React, Flutter, Dart, Swift, Java, Kotlin, C++), incorporate that specialist's rules from `agents/<language>-reviewer.md` or `agents/<language>-build-resolver.md`.

---

## Stage 3: Codebase Grounding & Architecture Blueprint

Before modifying or creating any code:
1. **Read and verify existing files**: Never guess or assume file contents, imports, or exports.
2. **Apply Deep Module Discipline** (`codebase-design`):
   - Design deep modules: small interface, rich implementation.
   - Place seams at real points of variation.
   - Avoid shallow pass-through classes or bloated interfaces.
3. **Scan for Fowler Smells**:
   - Check for *Feature Envy*, *Divergent Change*, *Shotgun Surgery*, *Primitive Obsession*, *Duplicated Logic*, *Data Clumps*.
4. **Draft the Implementation Blueprint**:
   - Files to create or modify
   - Clear interfaces and type signatures
   - Concrete test plan demonstrating expected behavior

---

## Stage 4: Test-Driven Autonomous Execution

Follow the **Iron Law of TDD**:
```
NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST
```

1. **RED**: Write a minimal, expressive test demonstrating what the code should do (or reproducing the reported bug).
2. **Verify RED**: Run the test command and confirm that it fails for the expected reason (feature missing, not a typo or syntax error).
3. **GREEN**: Write only the minimal production code necessary to turn the test green.
4. **Verify GREEN**: Re-run test command and confirm all tests pass cleanly.
5. **REFACTOR**: Clean up duplication, improve names, and tighten interfaces while keeping tests green.

*Exceptions*: Throwaway prototypes or pure static configuration files where automated unit tests are technically impossible.

---

## Stage 5: Dual-Axis Verification & Final Synthesis

Before reporting completion to the user:
1. **Deterministic Verification**:
   - Run build / test / lint commands.
   - Ensure terminal exit codes are 0 and logs are clean.
2. **Dual-Axis Review** (`code-review`):
   - **Standards Axis**: Does the code follow repository standards and Fowler smell baselines?
   - **Spec Axis**: Does the code faithfully implement what the user asked for without scope creep?
3. **Synthesize Final Report**:
   - Summary of actions taken and files modified
   - Concrete evidence of test results and build verification
   - Any external prerequisites or account limitations identified honestly
   - Clear, actionable next steps

---

## Multi-Agent Deliberation & Group Debate Protocol

When a task involves controversial trade-offs, high-impact architecture, or when invoked via `/prime debate <topic>`:
1. **Panel Selection**: Select 2 to 4 domain specialist agents (e.g., `Architect`, `Security Reviewer`, `Performance Optimizer`).
2. **Round 1 (Blind Stances)**: Each agent provides an independent domain-specific assessment.
3. **Round 2 (Cross-Examination)**: Agents critique and challenge each other's vulnerabilities and performance bottlenecks.
4. **Round 3 (Consensus Synthesis)**: `agent-mediator` converges on a single, bulletproof agreement addressing all valid points.
5. See [docs/AGENT-DELIBERATION.md](../docs/AGENT-DELIBERATION.md) and execute via `scripts/prime-debate.ps1`.

---

## Autonomous Agent Factory & Runtime Synthesis

When user asks to create a new specialist agent or invokes `/prime build-agent <prompt>`:
1. `agent-factory` analyzes requirements and stack conventions.
2. Dynamically generates `agents/<agent-name>.md` with full prompt defense baselines and TDD protocols.
3. Automatically updates `catalogs/prime-agent-directory.json` and syncs to distribution packages.
4. Execute via `scripts/prime-agent-builder.ps1`.

---

## Lazy-Loading Architecture (Zero System Overhead)

To protect host computer memory and prevent context window exhaustion:
1. **Never load all agents at once**: Only 1 to 3 agents needed for the active prompt are resolved and loaded into memory.
2. **Lightweight Registry**: All 82 agents are indexed in `catalogs/prime-agent-directory.json` (~30KB), consuming 0 MB background RAM.
3. **Just-In-Time Lifecycle**: Specialist agents are activated for the task and immediately released upon turn completion.
4. See [docs/LAZY-LOADING.md](../docs/LAZY-LOADING.md) for full benchmarks.

---

## Direct Command Fallback & Subagent Delegation

- **If Subagents are available**: Dispatch parallel subagents for independent tasks (e.g., Standards reviewer and Spec reviewer running concurrently).
- **If Subagents are unavailable or restricted**: Execute the specialist instructions inline sequentially without erroring.
- **Honest Dependency Reporting**: If a tool or external CLI is missing (e.g., `agent-browser` binary, Docker, external API key), explain the prerequisite clearly with installation instructions.

