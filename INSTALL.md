# Prime Universal Installation Guide

Prime is a multi-platform autonomous engineering platform. It can be installed into any AI coding agent (**Google Antigravity, Claude Code, Cursor, Windsurf, Roo Code, Cline, Continue.dev, GitHub Copilot**) or installed system-wide for direct terminal access.

---

## ⚡ Method 1: One-Line Automated Installer (Fastest)

Run this single command in your terminal to automatically detect your environment, install Prime's 82 specialist agents, configure IDE slash commands, and add the `prime` CLI to your system PATH:

### On Windows (PowerShell):
```powershell
irm https://raw.githubusercontent.com/primebro69/prime/main/install.ps1 | iex
```
*(If running locally inside a cloned repository: `powershell -ExecutionPolicy Bypass -File .\install.ps1`)*

### On macOS / Linux (Bash):
```bash
curl -fsSL https://raw.githubusercontent.com/primebro69/prime/main/install.sh | bash
```
*(If running locally inside a cloned repository: `./install.sh`)*

---

## 🤖 Method 2: Tell Your AI Coding Agent to Install Prime

If you are already inside **Google Antigravity**, **Claude Code**, **Cursor**, **Windsurf**, or **Roo Code**, simply paste this instruction to your AI assistant:

```text
Please install the Prime Autonomous AI Platform into this workspace from https://github.com/primebro69/prime
Execute the installer:
powershell -ExecutionPolicy Bypass -File .\scripts\prime-install.ps1 -TargetWorkspace "."
```
*(On Linux/macOS: `bash ./scripts/prime-install.sh -TargetWorkspace "."`)*

Your AI agent will execute the script, set up the workspace manifests, and enable `/prime` immediately.

---

## 🚀 Method 3: Claude Code Native Plugin CLI

For users of Anthropic's **Claude Code** CLI:

### From GitHub:
```bash
claude plugin install primebro69/prime
```

### From Local Directory:
```bash
claude plugin install /path/to/prime
```

Claude Code will automatically register `commands/prime.md` and expose `/prime` in your slash command autocomplete menu.

---

## 📦 Method 4: NPM / NPX Global Package

If you have Node.js installed, you can install Prime globally or run it on-demand without installing:

### Run Instant One-Off Tasks via NPX (No Installation Needed):
```bash
npx prime-ai "analyze this project and identify defects"
```

### Install Globally via NPM:
```bash
npm install -g prime-ai
prime "build a REST API with cursor pagination"
```

---

## 💻 Method 5: Git Clone & Manual Setup

If you prefer full control by cloning the repository:

```bash
# 1. Clone the repository
git clone https://github.com/primebro69/prime.git
cd prime

# 2. Run the automated installer
# On Windows:
.\install.ps1

# On macOS / Linux:
./install.sh
```

---

## 🌐 Platform-Specific Behavior After Installation

Once installed, Prime automatically activates across all tools in the project:

| Coding Tool | How to Use |
| :--- | :--- |
| **Google Antigravity** | Type `/prime` in the chat input to see autocomplete with hints. |
| **Claude Code** | Type `/prime` in the CLI slash command menu. |
| **Cursor IDE** | Type `/prime <task>` or `@prime` in Cursor Composer or Chat. |
| **Windsurf / Cascade** | Type `/prime <task>` in the Cascade prompt. |
| **Roo Code (Roo Cline)** | Select **Prime Orchestrator** mode from the mode dropdown or type `/prime`. |
| **Cline** | Type `/prime <task>` in the Cline task prompt. |
| **Continue.dev** | Type `/prime` in the Continue chat autocomplete bar. |
| **GitHub Copilot** | Type `@workspace /prime <task>` in the Copilot Chat panel. |
| **Terminal (CMD / PowerShell / Bash)** | Run `prime <task>` directly anywhere on your system. |

---

## 🧪 Verifying Your Installation

To confirm that Prime is working properly:

```bash
# From any terminal:
prime "test installation"

# Or run the built-in validation test suite (54 automated checks):
powershell -ExecutionPolicy Bypass -File scripts/prime-validate.ps1
```

If you see:
```text
=================================================================
 VALIDATION SUMMARY: 54 Passed | 0 Failed | 0 Warnings
=================================================================
```
Prime is 100% installed, verified, and ready for production engineering!
