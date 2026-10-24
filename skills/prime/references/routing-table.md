# Prime Multi-Plugin Dynamic Routing Table & Execution Profiles

This reference maps incoming user objectives to their optimal **Lead Plugin**, **Collaborating Plugins**, specialist agents, skills, and verification stages.

See [docs/PLUGIN-DISPATCH.md](../../docs/PLUGIN-DISPATCH.md) and [catalogs/plugin-dispatch-matrix.json](../../catalogs/plugin-dispatch-matrix.json) for full architectural specifications.

---

## 1. Multi-Plugin Profile Matrix

### Profile 1: Full-System Audit & Autonomous Auto-Repair
- **Triggers**: "analyze this project, identify its problems, and implement the necessary fixes", "audit and fix", "health check", "scan codebase"
- **Lead Plugin**: `superpowers + ECC` (Co-lead: Full-System Exploration, Defect Detection & Surgical TDD Fixes)
- **Collaborating Plugins**: `agent-peer-review`, `claude-mem`, `agents-md`
- **Specialists**: `code-explorer`, `code-reviewer`, `security-reviewer`, `silent-failure-hunter`, `build-error-resolver`, `refactor-cleaner`
- **Core Skills**: `prime`, `systematic-debugging`, `test-driven-development`, `verification-before-completion`, `codebase-design`
- **Protocol**:
  1. `[ECC:code-explorer]` Deep scan: Inspect directory tree, manifests, and architecture.
  2. `[superpowers:codebase-design]` Structural audit: Detect Fowler smells (shotgun surgery, feature envy, primitive obsession).
  3. `[ECC:build-error-resolver]` Static check: Run linters, compilers, and test suites.
  4. `[superpowers:systematic-debugging]` Formulate prioritized defect list & root cause hypotheses.
  5. `[superpowers:test-driven-development]` Apply fixes using strict TDD (failing test reproducing each defect first).
  6. `[agent-peer-review]` Final dual-axis verification (Standards vs Spec).

### Profile 2: Autonomous Feature Implementation
- **Triggers**: "build", "create", "implement", "add feature", "develop"
- **Lead Plugin**: `superpowers` (Disciplined Software Engineering & Deep Seams)
- **Collaborating Plugins**: `ECC`, `awesome-claude-plugins`, `claude-mem`
- **Specialists**: `planner`, `code-architect`, `tdd-guide`, `doc-updater`, `<language>-reviewer`
- **Core Skills**: `prime`, `brainstorming`, `codebase-design`, `test-driven-development`, `verification-loop`
- **Protocol**:
  1. `[superpowers:brainstorming]` Requirements restatement and boundary identification.
  2. `[ECC:code-architect]` Architecture blueprint (deep module design, interface first, minimal surface).
  3. `[superpowers:test-driven-development]` Red-Green-Refactor TDD loop for all business logic (Iron Law).
  4. `[ECC:<language>-build-resolver]` Compiler and build sanity verification.
  5. `[superpowers:verification-before-completion]` Integration and regression verification.

### Profile 3: Defect Resolution & Debugging
- **Triggers**: "fix bug", "resolve error", "failing test", "crash", "investigate exception", "why is this broken"
- **Lead Plugin**: `superpowers` (Systematic 4-Phase Root Cause & TDD Fix Engine)
- **Collaborating Plugins**: `ECC` (Language build resolvers & silent failure detection)
- **Specialists**: `build-error-resolver`, `silent-failure-hunter`, `systematic-debugging`, `<language>-build-resolver`
- **Core Skills**: `prime`, `systematic-debugging`, `test-driven-development`
- **Protocol**:
  1. Phase 1: Problem description & root cause analysis (no guessing).
  2. Phase 2: Write failing reproduction test (Iron Law).
  3. Phase 3: Minimal surgical fix.
  4. Phase 4: Verification and regression check.

### Profile 4: Code Review & Spec Compliance
- **Triggers**: "review", "audit PR", "compare against spec", "check standards", "review branch"
- **Lead Plugin**: `agent-peer-review` (Dual-Axis Blind Pass & Adversarial Reviewer)
- **Collaborating Plugins**: `ECC` (Language-specific reviewers), `agents-md` (Governance rules)
- **Specialists**: `code-reviewer`, `codex-peer-reviewer`, `security-reviewer`, `<language>-reviewer`
- **Core Skills**: `prime`, `code-review`, `codex-peer-review`, `verification-before-completion`
- **Protocol**:
  1. Diff extraction (`git diff` or commit log).
  2. Standards axis: measure against repo standards and Fowler smell baselines.
  3. Spec axis: measure against user spec / acceptance criteria.
  4. Deliver independent findings without cross-axis masking.

### Profile 5: Browser Automation & Web QA
- **Triggers**: "test website", "open browser", "click button", "fill form", "take screenshot", "scrape web"
- **Lead Plugin**: `agent-browser` (Native Rust-Powered Chrome CDP Specialist)
- **Collaborating Plugins**: `awesome-claude-plugins` (UI/UX visual standards), `ECC` (Frontend reviewers)
- **Specialists**: `browser-automator`, `e2e-runner`, `frontend-patterns`
- **Core Skills**: `prime`, `agent-browser`
- **Protocol**:
  1. Verify `agent-browser` availability.
  2. Inspect accessibility tree snapshots (`@eN` refs).
  3. Execute browser interactions.
  4. Capture visual proofs / screenshots.

### Profile 6: Skill & Capability Discovery
- **Triggers**: "find skill", "how do I do X", "is there a tool for X", "search skills", "explore plugins"
- **Lead Plugin**: `agentic-awesome-skills` + `antigravity-awesome-skills` (3,000+ Skills Catalog)
- **Collaborating Plugins**: `awesome-claude-plugins` (Top 100 curated recommendations)
- **Core Skills**: `prime`, `find-skills`
- **Protocol**:
  1. Fast query across `catalogs/skills-index-*.json`.
  2. Filter by star rating, safety, and battle-tested install counts.
  3. Present actionable recommendation with usage instructions.

### Profile 7: Visual & UI/UX Excellence
- **Triggers**: "ui design", "frontend styling", "modern look", "beautiful ui", "dashboard design"
- **Lead Plugin**: `awesome-claude-plugins` (World-Class Aesthetics, Typography & Micro-Interactions)
- **Collaborating Plugins**: `agent-browser` (Visual rendering validation), `superpowers` (Component modularity)
- **Specialists**: `frontend-patterns`, `react-reviewer`, `code-architect`
- **Core Skills**: `prime`, `frontend-patterns`, `codebase-design`
- **Protocol**:
  1. Apply curated palette (modern dark mode, HSL harmonious colors).
  2. Modern typography (Outfit, Inter, Roboto).
  3. Micro-interactions and responsive flex/grid layouts.
  4. Visual proof via browser snapshot.

### Profile 8: High-Density Communication
- **Triggers**: "/caveman", "talk like caveman", "less tokens", "be brief"
- **Lead Plugin**: `caveman` (Ultra-Compressed Token Engine)
- **Core Skills**: `prime`, `caveman`
- **Protocol**:
  1. Strip conversational filler, greetings, and empty narration.
  2. Retain all technical rigor, error codes, and code blocks.

