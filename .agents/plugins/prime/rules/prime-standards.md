# Prime Engineering & Architecture Standards

These standards govern all code generation, refactoring, and system modification executed under the Prime plugin platform.

---

## 1. Deep Investigation First
- Never guess file contents, dependencies, or directory layouts.
- Read and verify existing source files before proposing or writing modifications.
- Understand the callers, imports, and execution context before touching an interface.

## 2. Deep Module & Clean Seam Discipline (`codebase-design`)
- **Depth**: Strive for deep modules where a substantial amount of behavior is hidden behind a simple, high-leverage interface.
- **Seams**: Introduce seams only where variation is genuine. Avoid premature or speculative layers.
- **The Deletion Test**: If deleting a module causes complexity to vanish rather than scatter into callers, the module was shallow pass-through. Remove it.

## 3. The Iron Law of Test-Driven Development (`test-driven-development`)
```
NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST
```
- **RED**: Write an automated test demonstrating required behavior or reproducing a defect.
- **Verify RED**: Watch the test fail for the exact expected reason (not syntax or typo).
- **GREEN**: Write minimal production code to pass the test.
- **Verify GREEN**: Confirm all tests pass cleanly.
- **REFACTOR**: Remove duplication, tighten types, and maintain clean seams.

## 4. Code Smell Baseline (Fowler Heuristics)
Scan for and eliminate:
- **Feature Envy**: Methods reaching excessively into external object data.
- **Shotgun Surgery**: Changes forcing scattered small edits across disparate files.
- **Divergent Change**: A single module changing for multiple unrelated business reasons.
- **Data Clumps / Primitive Obsession**: Raw primitives standing in place of a rich domain type.
- **Repeated Switches**: Duplicate branch cascades that should be polymorphic or map-driven.

## 5. Security & Defensive Programming
- Sanitize and validate all external inputs at the boundary.
- Never hardcode or leak secrets, API keys, or credentials.
- Defend against OWASP Top 10 vulnerabilities (injection, XSS, broken auth, SSRF).
