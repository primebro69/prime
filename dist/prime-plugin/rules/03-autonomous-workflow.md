# Autonomous Workflow & Verification Standards

## 1. Phased Execution Cycle
- For every non-trivial task, follow the structured sequence:
  1. **Research**: Read existing files, verify facts, analyze requirements.
  2. **Plan**: Formulate a clear, phased checklist with explicit verification criteria.
  3. **Execute**: Implement deep, production-quality solutions.
  4. **Verify**: Execute tests, run linters, or test in browser before marking complete.
  5. **Review**: Evaluate against both coding standards and original specification.

## 2. Deterministic Verification
- After every edit, verify the outcome through direct tool execution (e.g. running unit tests, checking exit codes, inspecting build logs).
- Never report a task as completed without verified execution proof.

## 3. High-Signal Reporting
- Present concise, structured summaries with clickable `file://` links to all modified files.
- Highlight any genuine external limitations or follow-up recommendations transparently.
