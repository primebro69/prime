# Contributing to Prime

Thank you for your interest in contributing to **Prime: Universal Autonomous AI Engineering Platform**! We welcome community contributions from developers, researchers, and AI engineers across the globe.

---

## Code of Conduct

We are committed to providing a welcoming, inclusive, and harassment-free environment for all contributors. Please treat everyone with respect, professionalism, and constructive feedback.

---

## How Can You Contribute?

You can contribute to Prime in several high-impact areas:

1. **New Specialist Agents**: Add new domain agents to `agents/` and register them in `catalogs/prime-agent-directory.json`.
2. **Curated Skills**: Expand skill runbooks and patterns in `skills/`.
3. **Cross-Platform Adapters**: Improve integration for emerging AI coding environments.
4. **Validation Suite**: Add edge-case tests to `scripts/prime-validate.ps1`.
5. **Documentation & Guides**: Refine `COMMANDS.md`, `INSTALL.md`, or architectural whitepapers.

---

## Development Workflow

### 1. Prerequisites
- Git
- PowerShell (Windows) or Bash (macOS/Linux)
- Node.js (Optional, for running npm/npx tooling)

### 2. Fork & Clone
```bash
git clone https://github.com/nazmulhasina228-ux/prime.git
cd prime
```

### 3. Verify Current Suite
Before writing code, verify that all existing platform tests pass:
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\prime-validate.ps1
```
Expected output: **58 Passed | 0 Failed | 0 Warnings**.

### 4. Create a Feature Branch
```bash
git checkout -b feature/your-feature-name
```

### 5. Follow the Iron Law of TDD
- Always write reproduction tests or validation entries first.
- Implement your changes with clean seams and zero coupling.
- Ensure all project text is written in 100% pure English.

### 6. Synchronize Packages
Whenever adding new agents, skills, or rules, synchronize the distributables:
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-dist.ps1
```

### 7. Run Full Verification
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\prime-validate.ps1
```

### 8. Submit a Pull Request
- Push your branch to GitHub.
- Open a Pull Request against the `main` branch.
- Detail the rationale, changes made, and paste the output of `prime-validate.ps1`.

---

## Agent Contribution Standards

When creating a new specialist agent in `agents/<agent-name>.md`:
- Include clean YAML frontmatter (`name`, `description`).
- Specify strict behavioral boundaries, negative constraints, and prompt-injection defense baselines.
- Define explicit verification criteria and expected output formats.
- Register the agent entry in `catalogs/prime-agent-directory.json`.

---

## License

By contributing to Prime, you agree that your contributions will be licensed under the [MIT License](LICENSE).
