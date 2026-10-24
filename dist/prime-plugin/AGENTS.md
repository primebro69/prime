# Project Guidelines & Autonomous Execution Standard

## Core Rule: Master Plugin & Quality Standards Reference
Before executing any task, plan, or code modification requested by the user, ALWAYS consult and adhere to the engineering standards and best practices established in the local `plugins` directory:
- [awesome-claude-plugins](file:///c:/Users/Tecno/OneDrive/Desktop/Prime/plugins/awesome-claude-plugins/README.md): Top 100 AI plugins, frameworks, and tools.
- [superpowers](file:///c:/Users/Tecno/OneDrive/Desktop/Prime/plugins/superpowers): Disciplined software engineering, TDD, and agentic workflows.
- [agent-peer-review](file:///c:/Users/Tecno/OneDrive/Desktop/Prime/plugins/agent-peer-review): Comprehensive dual-axis review (Standards & Spec).
- [agents.md](file:///c:/Users/Tecno/OneDrive/Desktop/Prime/plugins/agents-md): Universal agent-native conventions and guidelines.
- [claude-mem](file:///c:/Users/Tecno/OneDrive/Desktop/Prime/plugins/claude-mem): Persistent session context and memory retention patterns.
- [ECC](file:///c:/Users/Tecno/OneDrive/Desktop/Prime/plugins/ECC): Complete Agent Harness Operating System, workflows, prompts, and autonomous agent capabilities.
- [antigravity-awesome-skills](file:///c:/Users/Tecno/OneDrive/Desktop/Prime/plugins/antigravity-awesome-skills): Curated library of 889+ universal agentic skills tailored for Antigravity IDE and Claude Code.
- [agentic-awesome-skills](file:///c:/Users/Tecno/OneDrive/Desktop/Prime/plugins/agentic-awesome-skills): AAS Core containing 2,121+ battle-tested skills, local catalog search, MCP server, and workflows.

The primary goal is to deliver the highest quality, professional, battle-tested, and best-in-class output every single time.

---

## 1. Engineering Excellence & Precision (Karpathy & Superpowers Standard)
- **Deep Investigation First**: Never assume file contents or directory structures. Always read and verify existing files and dependencies before editing.
- **Deep Modules & Interface Clarity** (via `codebase-design`): Keep interfaces simple, expressive, and implementations deep. Minimize coupling and hide implementation details behind clean boundaries.
- **No Half-Baked Code**: Avoid placeholders, TODOs without implementation, or truncated snippets. Deliver complete, production-grade solutions.
- **Defensive Error Handling**: Ensure robust error boundaries, graceful fallbacks, and clear feedback.

## 2. Visual & UX Excellence (UI/UX Pro Max & Impeccable Standard)
When generating or editing user interfaces, web applications, or visualizations:
- **World-Class Aesthetics**: Use modern typography (Inter, Outfit, Roboto), rich color palettes (curated HSL/dark mode), and clean layouts. Avoid generic browser defaults and basic styling.
- **Fluid Micro-Interactions**: Incorporate subtle hover effects, transitions, and state changes to make interfaces feel alive and responsive.
- **Mobile-First & Responsive**: Ensure layouts seamlessly adapt to desktop, tablet, and mobile viewports.

## 3. Persistent Planning & Verification (Manus & Compound Engineering Standard)
- **Step-by-Step Execution**: For non-trivial tasks, follow a structured workflow: Research -> Plan -> Execute -> Verify.
- **Deterministic Verification**: Verify every build, script execution, or code edit immediately after making changes. Check terminal logs and confirm output correctness before marking the task complete.
- **Peer Review & Standards Verification** (via `code-review`): Ensure changes strictly follow the repository standards and fully fulfill the user's specification.

## 4. Specialized Skills & Capabilities
- **Browser Automation** (via `agent-browser`): When testing web apps, capturing screenshots, scraping, or running interactive browser workflows, utilize the `agent-browser` CLI and skills.
- **Skill Discovery** (via `find-skills`): Proactively discover or install additional specialized skills when the user seeks extended functionality.
- **Concise / High-Efficiency Mode** (via `caveman`): When the user requests `/caveman` or asks for brevity/token reduction, transition into high-density communication without compromising technical substance.
- **Crypto & Trading**: Utilize proven unified standards like `ccxt` for exchange integration, market data, and order routing (see [projects/crypto-trading-bot](file:///c:/Users/Tecno/OneDrive/Desktop/Prime/projects/crypto-trading-bot)).
