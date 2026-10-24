# Prime Multi-Plugin Specialization & Dispatch Architecture

In the Prime ecosystem, multiple industry-leading plugins are integrated into a single unified harness. Rather than treating plugins as generic tools, **Prime routes specific tasks to the specific plugin that excels at that exact domain**.

---

## 🏛️ Plugin Specialization Map

```text
┌─────────────────────────────────────────────────────────────────────────────┐
│                            TASK DISPATCH MATRIX                             │
└──────────────────────────────────────┬──────────────────────────────────────┘
                                       │
     ┌─────────────────────────────────┼─────────────────────────────────┐
     │                                 │                                 │
┌────▼─────────────┐       ┌───────────▼─────────┐       ┌───────────────▼────┐
│   superpowers    │       │         ECC         │       │ agent-peer-review  │
│  TDD, Debugging, │       │ 69 Specialist Agents│       │ Dual-AI Blind Pass │
│  Verification,   │       │ Multi-Language Build│       │ Multi-Perspective  │
│  Seam Design     │       │ Resolvers & Review  │       │ Adversarial Audit  │
└──────────────────┘       └─────────────────────┘       └────────────────────┘
     │                                 │                                 │
┌────▼─────────────┐       ┌───────────▼─────────┐       ┌───────────────▼────┐
│  agent-browser   │       │     claude-mem      │       │     agents-md      │
│  Fast Chrome CDP │       │ Persistent Memory   │       │ Universal Rules    │
│  Accessibility   │       │ Decision History    │       │ Repository         │
│  Tree Web QA     │       │ Context Retention   │       │ Governance         │
└──────────────────┘       └─────────────────────┘       └────────────────────┘
     │                                 │                                 │
┌────▼─────────────┐       ┌───────────▼─────────┐                       │
│ awesome-plugins  │       │ agentic-skills (AAS)│                       │
│ UI/UX Perfection │       │ 3,000+ Skills Index │◄──────────────────────┘
│ Karpathy LLM Stds│       │ Niche Tech Runbooks │
│ Crypto Tooling   │       │ Instant Search      │
└──────────────────┘       └─────────────────────┘
```

---

## 1. Domain Specializations

### 🧪 `superpowers` (The Software Engineering Engine)
- **Best at**: Iron Law TDD, systematic 4-phase bug investigation, clean seam design, verification before completion, subagent task isolation.
- **When Dispatched**:
  - Writing any production code, feature implementation, or bug fixes.
  - Formulating failing tests before touching implementation code.
  - Verifying build and test results deterministically before claiming completion.

### 🌐 `ECC` (The Specialist Agent & Multi-Language Operating System)
- **Best at**: 69 specialist agents, language-specific compilers and build resolvers (Python, Rust, Go, TypeScript, Java, Kotlin, Swift, Flutter, C++, C#, Django, FastAPI), deep codebase exploration.
- **When Dispatched**:
  - Tasks requiring domain-specific language compilers or framework hygiene.
  - Multi-agent architecture blueprints (`code-architect`, `planner`, `gan-planner`).
  - Silent failure hunting, unhandled promise resolution, and dead code cleanup.

### ⚖️ `agent-peer-review` (The Dual-AI Adversarial Reviewer)
- **Best at**: Symmetric blind-pass code reviews, multi-perspective debates, adversarial verification of security-critical changes.
- **When Dispatched**:
  - Pull request audits, branch reviews, major refactoring proposals.
  - Architectural decisions where single-pass validation has blind spots.

### 🧠 `claude-mem` (The Persistent Context Engine)
- **Best at**: Cross-session memory, retaining architectural decisions across days/weeks, transcript observation, project continuity.
- **When Dispatched**:
  - Long-running multi-stage projects.
  - Recalling why an architectural choice or seam was chosen in a previous turn.

### 🖥️ `agent-browser` (The Browser Automation & Web QA Specialist)
- **Best at**: Native Rust-powered CDP browser automation, accessibility-tree snapshots (`@eN` refs), interactive form filling, visual regression screenshots.
- **When Dispatched**:
  - Testing web applications, verifying UI rendering in a real browser.
  - Web scraping, automated browser QA, Electron app automation.

### 📐 `agents-md` (The Governance & Standards Authority)
- **Best at**: Establishing clear repository rules, instruction boundary defense, and universal agent conventions.
- **When Dispatched**:
  - Setting up project standards (`AGENTS.md`, `GEMINI.md`).
  - Verifying that code and agent actions stay within documented boundaries.

### 🎨 `awesome-claude-plugins` (The Aesthetic & Best Practices Consultant)
- **Best at**: World-class UI/UX design (curated dark modes, typography, micro-interactions), Karpathy LLM engineering principles, crypto exchange standards (`ccxt`).
- **When Dispatched**:
  - Building beautiful, engaging frontends that impress at first glance.
  - Developing algorithmic trading or crypto market data systems.

### 📚 `agentic-awesome-skills` & `antigravity-awesome-skills` (The Universal Skill Catalogs)
- **Best at**: Instant on-demand search across 3,000+ battle-tested skills for specialized libraries (Docker, AWS, GraphQL, Three.js, Redis, PyTorch).
- **When Dispatched**:
  - Finding runbooks and checklists for niche tools and integrations.

---

## 2. Multi-Plugin Collaborative Pipelines

For complex engineering tasks, Prime orchestrates multiple plugins in a unified pipeline:

```text
User: "/prime Analyze this project, identify its problems, and implement the necessary fixes."

Pipeline:
1. Context Check (claude-mem)           -> Load existing project decisions & architecture context
2. Exploration & Smells (ECC)            -> code-explorer & silent-failure-hunter scan code
3. Seams & Standards (superpowers)       -> codebase-design analyzes interface depth & seams
4. Autonomous Fixes (superpowers)       -> test-driven-development writes failing tests first & fixes
5. Language Builds (ECC)                -> <language>-build-resolver confirms pristine compilation
6. Web/UI Proof (agent-browser)         -> agent-browser captures visual verification if web app
7. Dual-Axis Audit (agent-peer-review)  -> Standards vs Spec review confirms zero regression
8. Memory Persist (claude-mem)          -> Records fixed defects and new patterns for future sessions
```
