# Prime Quality Gate & Deterministic Verification

This rule enforces completion criteria for any task executed under Prime.

---

## 1. Deterministic Verification Loop
- Never declare a task complete without proving correctness.
- Execute project build, test, and lint commands.
- Verify that terminal execution exits with code 0 and pristine logs.
- If an automated test suite exists, all tests must pass.

## 2. Dual-Axis Review Gate (`code-review`)
- Measure diff against two distinct axes:
  1. **Standards Axis**: Adherence to repository conventions, clean seams, and code smell baselines.
  2. **Spec Axis**: Faithfulness to the user's initial objective, preventing scope creep and unrequested side effects.
- Report both axes side-by-side without allowing one to mask the other.

## 3. Honest Limitations Reporting
- If a dependency, tool (e.g. `agent-browser`), or service account is missing, identify the exact prerequisite rather than claiming it succeeded.
- Deliver clear verification summaries citing exact file paths and test outputs.
