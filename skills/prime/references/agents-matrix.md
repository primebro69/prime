# Prime Specialist Agents Matrix (69 Agents)

This reference catalogs all specialist agents bundled in the Prime platform, grouped by engineering domain.

---

## 1. Architecture, Planning & Systems (9 Agents)
- **`code-architect`**: Feature architecture blueprints, pattern alignment, and dependency sequencing.
- **`architect`**: Enterprise-scale system design, service boundaries, and technology trade-off evaluations.
- **`planner`**: Step-by-step implementation plans, milestone breakdown, and risk analysis.
- **`gan-planner`**: Generative architecture network planning for multi-model synthesis.
- **`gan-generator`**: Generative multi-agent implementation synthesis.
- **`gan-evaluator`**: Discriminator agent evaluating generated designs against target specs.
- **`a11y-architect`**: WCAG accessibility architecture, ARIA trees, and inclusive design.
- **`network-architect`**: Network topology, subnetting, VPN, and routing architecture.
- **`homelab-architect`**: Self-hosted infrastructure, Docker, Pi-hole, and WireGuard configuration.

## 2. Review, Quality & Security (11 Agents)
- **`code-reviewer`**: Comprehensive code review across quality, security, and maintainability (>80% confidence gate).
- **`security-reviewer`**: Vulnerability detection, OWASP Top 10, sanitization, and secrets leakage defense.
- **`database-reviewer`**: Query performance, indexing, schema design, and migration safety.
- **`comment-analyzer`**: Comment hygiene, drift detection, and documentation accuracy.
- **`conversation-analyzer`**: Prompt and session drift analysis for agent workflows.
- **`rag-pipeline-reviewer`**: Vector embeddings, retrieval chunking, and similarity metrics review.
- **`mle-reviewer`**: Machine learning model evaluation, dataset splits, and loss curves.
- **`network-config-reviewer`**: Firewall rules, BGP configuration, and security ACLs.
- **`healthcare-reviewer`**: HIPAA, PHI data handling, and HL7/FHIR compliance review.
- **`agent-evaluator`**: Evaluation benchmarks for autonomous agents and accuracy scoring.
- **`codex-peer-reviewer`**: Multi-AI symmetric blind-pass peer reviewer.

## 3. Debugging, Errors & Refactoring (7 Agents)
- **`build-error-resolver`**: Compiler errors, missing imports, package version mismatches, and syntax fixes.
- **`silent-failure-hunter`**: Unhandled promise rejections, swallowed errors, and null pointer defects.
- **`refactor-cleaner`**: Fowler smell reduction, dead code removal, and clean architecture alignment.
- **`code-simplifier`**: Over-engineering removal, cyclomatic complexity reduction, and interface simplification.
- **`code-explorer`**: Fast codebase navigation, dependency graphing, and call-path tracing.
- **`type-design-analyzer`**: Static typing hygiene, strictness analysis, and type-level safety.
- **`network-troubleshooter`**: Packet loss, DNS resolution, latency, and connectivity diagnostics.

## 4. Language & Framework Build & Review Specialists (28 Agents)
- **Python**: `python-reviewer`, `django-reviewer`, `django-build-resolver`, `fastapi-reviewer`, `pytorch-build-resolver`
- **TypeScript / JavaScript**: `typescript-reviewer`, `react-reviewer`, `react-build-resolver`, `vue-reviewer`
- **Go**: `go-reviewer`, `go-build-resolver`
- **Rust**: `rust-reviewer`, `rust-build-resolver`
- **Flutter / Dart**: `flutter-reviewer`, `dart-build-resolver`
- **Java / Kotlin**: `java-reviewer`, `java-build-resolver`, `kotlin-reviewer`, `kotlin-build-resolver`
- **C++ / C# / F#**: `cpp-reviewer`, `cpp-build-resolver`, `csharp-reviewer`, `fsharp-reviewer`
- **Swift / Mobile**: `swift-reviewer`, `swift-build-resolver`, `harmonyos-app-resolver`
- **PHP**: `php-reviewer`

## 5. Testing, Verification & Operations (14 Agents)
- **`tdd-guide`**: Test-Driven Development coaching, failing test construction, and red-green verification.
- **`e2e-runner`**: End-to-end testing, Playwright/Cypress execution, and browser session validation.
- **`pr-test-analyzer`**: PR regression analysis, test coverage gaps, and mutation testing.
- **`performance-optimizer`**: Memory leak diagnosis, CPU profiling, and latency reduction.
- **`loop-operator`**: Autonomous loop execution, checkpointing, and termination conditions.
- **`harness-optimizer`**: Agent harness tuning, context budgeting, and tool optimization.
- **`opensource-forker`**: Upstream repository synchronization, patch management, and rebase tracking.
- **`opensource-packager`**: Release bundling, changelog generation, and package publishing.
- **`opensource-sanitizer`**: Secret scrubbing, PII removal, and IP hygiene for public release.
- **`doc-updater`**: Synchronizing documentation with code changes and API updates.
- **`docs-lookup`**: Fast documentation retrieval and official API grounding.
- **`seo-specialist`**: Search engine optimization, meta tags, and structured schema data.
- **`marketing-agent`**: Release messaging, technical copywriting, and feature announcements.
- **`chief-of-staff`**: Multi-agent coordination, milestone tracking, and task delegation.
