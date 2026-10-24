# Project Guidelines & Autonomous Execution Standard

## Core Rule: Master Plugin & Quality Standards Reference
Before executing any task, plan, or code modification requested by the user, ALWAYS consult and adhere to the engineering standards and best practices established in the local `awesome-claude-plugins` library (`awesome-claude-plugins/README.md`).

The goal is to deliver the highest quality, professional, battle-tested, and best-in-class output every single time.

---

## 1. Engineering Excellence & Precision (Karpathy & Superpowers Standard)
- **Deep Investigation First**: Never assume file contents or directory structures. Always read and verify existing files and dependencies before editing.
- **No Half-Baked Code**: Avoid placeholders, TODOs without implementation, or truncated snippets. Deliver complete, production-grade solutions.
- **Architectural Clarity**: Break down complex problems logically. Write clean, modular, maintainable, and strongly typed code where applicable.
- **Defensive Error Handling**: Ensure robust error boundaries, graceful fallbacks, and clear feedback.

## 2. Visual & UX Excellence (UI/UX Pro Max & Impeccable Standard)
When generating or editing user interfaces, web applications, or visualizations:
- **World-Class Aesthetics**: Use modern typography (Inter, Outfit, Roboto), rich color palettes (curated HSL/dark mode), and clean layouts. Avoid generic browser defaults and basic styling.
- **Fluid Micro-Interactions**: Incorporate subtle hover effects, transitions, and state changes to make interfaces feel alive and responsive.
- **Mobile-First & Responsive**: Ensure layouts seamlessly adapt to desktop, tablet, and mobile viewports.

## 3. Persistent Planning & Verification (Manus & Compound Engineering Standard)
- **Step-by-Step Execution**: For non-trivial tasks, follow a structured workflow: Research -> Plan -> Execute -> Verify.
- **Deterministic Verification**: Verify every build, script execution, or code edit immediately after making changes. Check terminal logs and confirm output correctness before marking the task complete.
- **Preserve Documentation & Context**: Retain important docstrings, comments, and project conventions across edits.

## 4. Specialized Tooling & Domain Plugins
Whenever working on specialized domains, check the Top 100 library in `awesome-claude-plugins/README.md`:
- **Crypto & Trading**: Utilize proven unified standards like `ccxt` for exchange integration, market data, and order routing.
- **Agent Intelligence & Context**: Apply structured memory patterns, prompt-chaining, and clean state isolation.
- **Documentation & Workflows**: Generate clear, clean Markdown documentation, reports, and architecture guides.
