# Prime Universal Cross-Platform Compatibility Guide

Prime is engineered from the ground up to be **universal and tool-agnostic**. When published to GitHub or cloned into any project, Prime automatically lights up and registers the `/prime` slash command across all major AI coding agents, IDEs, and CLI tools.

---

## 🌐 Supported Coding Agents & Platforms Matrix

| AI Coding Agent / IDE | Discovery Mechanism | Slash Command | Integration Files |
| :--- | :--- | :--- | :--- |
| **Google Antigravity IDE** | Native plugin manifest & skills-lock | `/prime` (in chat autocomplete) | `plugin.json`, `skills-lock.json`, `.agents/` |
| **Claude Code (Anthropic)** | Native Claude Code plugin system | `/prime` (in CLI slash menu) | `.claude-plugin/plugin.json`, `commands/prime.md` |
| **OpenAI Codex / ChatGPT** | Codex interface manifest & agent rules | `/prime` | `.codex-plugin/plugin.json`, `AGENTS.md` |
| **Cursor IDE** | Cursor Composer & Chat rules engine | `/prime`, `@prime` | `.cursorrules`, `.cursor/rules/prime.mdc` |
| **Windsurf (Codeium Cascade)** | Cascade workspace rules | `/prime` | `.windsurfrules` |
| **Roo Code (Roo Cline)** | Custom specialist mode system | Switch to **Prime** mode or `/prime` | `.roomodes` |
| **Cline** | Cline agent instruction standards | `/prime` | `.clinerules` |
| **Continue.dev** | Custom slash commands & prompts | `/prime` (in autocomplete) | `.continue/config.json`, `.continue/prompts/prime.prompt` |
| **GitHub Copilot** | Workspace repository instructions | `@workspace /prime` | `.github/copilot-instructions.md` |
| **Aider & OpenCode** | Aider auto-load conventions | `/prime` instructions | `.aider.conf.yml` |
| **Terminal CLI (Windows/macOS/Linux)**| Direct command-line binary | `prime <task>` | `bin/prime.cmd`, `bin/prime.ps1`, `bin/prime` |

---

## 🛠️ Platform-Specific Setup & How It Works

### 1. Google Antigravity IDE
- **How it works**: Antigravity automatically detects `plugin.json` in root and registers skills from `skills-lock.json` and `.agents/skills/`.
- **User Experience**: Typing `/prime` in the chat input opens the autocomplete menu with full parameter hints.

### 2. Claude Code (Anthropic CLI)
- **How it works**: When installed via `claude plugin install .` or `claude plugin install <github-repo>`, Claude Code reads `.claude-plugin/plugin.json` and exposes `commands/prime.md`.
- **User Experience**: Typing `/prime` in Claude Code CLI invokes the 5-stage autonomous execution protocol.

### 3. Cursor IDE
- **How it works**: Cursor loads `.cursorrules` in the root workspace and modern `.cursor/rules/prime.mdc`.
- **User Experience**: Typing `/prime [task]` in Cursor Composer or Chat immediately directs the agent to execute TDD, deep seams, and multi-plugin routing.

### 4. Windsurf / Codeium Cascade
- **How it works**: Cascade automatically reads `.windsurfrules` at the start of any conversation.
- **User Experience**: Typing `/prime [task]` triggers Cascade to follow the Prime protocol with failing test reproduction and deterministic verification.

### 5. Roo Code (Roo Cline)
- **How it works**: Roo Code detects `.roomodes` and adds the **Prime Orchestrator** mode to the mode dropdown with all necessary tool permissions.
- **User Experience**: Select the **Prime** mode or type `/prime` to execute autonomous engineering with 82 specialist agents.

### 6. Cline
- **How it works**: Cline automatically inspects `.clinerules` in the project root.
- **User Experience**: Enforces the Iron Law of TDD and modular seams whenever `/prime` is invoked.

### 7. Continue.dev (VS Code / JetBrains)
- **How it works**: `.continue/config.json` declares the custom command `"prime"` mapped to `.continue/prompts/prime.prompt`.
- **User Experience**: Type `/prime` in Continue's prompt bar and it autocompletes with the Prime system prompt.

### 8. GitHub Copilot
- **How it works**: Copilot reads `.github/copilot-instructions.md` for workspace context.
- **User Experience**: `@workspace /prime [task]` applies the complete Prime engineering standard.

### 9. Aider & OpenCode
- **How it works**: `.aider.conf.yml` configures Aider to automatically load `AGENTS.md` and `COMMANDS.md`.

### 10. Standalone Terminal CLI
- **How it works**: Direct executable wrappers in `bin/`:
  - Windows: `.\bin\prime.cmd "build a feature"`
  - PowerShell: `.\bin\prime.ps1 "debate SQL vs NoSQL"`
  - Linux/macOS: `./bin/prime "analyze project"`
