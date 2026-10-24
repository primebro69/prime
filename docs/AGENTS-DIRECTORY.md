# Prime Specialist Agents Directory (69 Agents)

This directory provides an exhaustive catalog of all 69 specialist agents bundled within Prime. Each agent is defined by a dedicated Markdown definition file in `agents/` containing prompt defense baselines, tool allowlists, model tiers, and operational runbooks.

---

## 🏛️ Architecture & Planning Agents

| Agent | File | Domain | Tools | Focus & Description |
| :--- | :--- | :--- | :--- | :--- |
| **`code-architect`** | `agents/code-architect.md` | Architecture | Read, Grep, Glob, Bash | Analyzes existing code organization to design feature blueprints with file layouts, interfaces, and build order. |
| **`architect`** | `agents/architect.md` | Architecture | Read, Grep, Glob | Enterprise software architecture, clean architecture, microservices, and Domain-Driven Design (DDD). |
| **`planner`** | `agents/planner.md` | Planning | Read, Grep, Glob | Step-by-step implementation plans, milestone breakdown, risk assessment, and complexity estimation. |
| **`gan-planner`** | `agents/gan-planner.md` | Generative Systems | Read, Grep, Glob | Generative architecture network planner for multi-agent synthesis. |
| **`gan-generator`** | `agents/gan-generator.md` | Generative Systems | Read, Write, Edit | Generative agent implementing multi-model blueprints. |
| **`gan-evaluator`** | `agents/gan-evaluator.md` | Generative Systems | Read, Grep, Glob | Discriminator agent evaluating generated code against specification targets. |
| **`a11y-architect`** | `agents/a11y-architect.md` | Accessibility | Read, Grep, Glob | WCAG 2.2 accessibility architecture, semantic HTML, and ARIA tree design. |
| **`network-architect`** | `agents/network-architect.md` | Infrastructure | Read, Grep, Glob | Network topology, VPCs, subnets, and routing table architecture. |
| **`homelab-architect`** | `agents/homelab-architect.md` | Infrastructure | Read, Grep, Glob | Self-hosted infrastructure, Docker Compose, Pi-hole, and WireGuard. |
| **`chief-of-staff`** | `agents/chief-of-staff.md` | Coordination | Read, Grep, Glob | Multi-agent coordination, milestone tracking, and task delegation. |

---

## 🔍 Code Review, Quality & Security Agents

| Agent | File | Domain | Tools | Focus & Description |
| :--- | :--- | :--- | :--- | :--- |
| **`code-reviewer`** | `agents/code-reviewer.md` | Review | Read, Grep, Glob, Bash | High-confidence (>80%) code review checking quality, maintainability, and security. |
| **`security-reviewer`** | `agents/security-reviewer.md` | Security | Read, Grep, Glob, Bash | Vulnerability detection, OWASP Top 10, sanitization, and secrets leakage defense. |
| **`database-reviewer`** | `agents/database-reviewer.md` | Database | Read, Grep, Glob | SQL query optimization, index design, schema normalization, and migration safety. |
| **`codex-peer-reviewer`** | `agents/codex-peer-reviewer.md` | Peer Review | Read, Bash | Multi-AI blind-debate peer review coordinator. |
| **`comment-analyzer`** | `agents/comment-analyzer.md` | Quality | Read, Grep, Glob | Comment drift detection, docstring freshness, and documentation accuracy. |
| **`conversation-analyzer`** | `agents/conversation-analyzer.md` | Context | Read, Grep | Session context drift, token budgeting, and instruction adherence. |
| **`rag-pipeline-reviewer`** | `agents/rag-pipeline-reviewer.md` | AI/ML | Read, Grep, Glob | RAG embedding models, chunking strategies, and similarity thresholds. |
| **`mle-reviewer`** | `agents/mle-reviewer.md` | AI/ML | Read, Grep, Glob | Machine learning pipelines, model training hygiene, and dataset leakage. |
| **`network-config-reviewer`** | `agents/network-config-reviewer.md` | Infrastructure | Read, Grep, Glob | Firewall rules, BGP routing policies, and network ACLs. |
| **`healthcare-reviewer`** | `agents/healthcare-reviewer.md` | Compliance | Read, Grep, Glob | HIPAA compliance, PHI data isolation, and HL7/FHIR health data protocols. |
| **`agent-evaluator`** | `agents/agent-evaluator.md` | Evaluation | Read, Grep, Glob | Benchmark evaluation for AI agents, accuracy scoring, and regression checks. |

---

## 🛠️ Debugging, Refactoring & Error Resolvers

| Agent | File | Domain | Tools | Focus & Description |
| :--- | :--- | :--- | :--- | :--- |
| **`build-error-resolver`** | `agents/build-error-resolver.md` | Debugging | Read, Edit, Bash | Compiler errors, missing modules, package conflicts, and build failures. |
| **`silent-failure-hunter`** | `agents/silent-failure-hunter.md` | Debugging | Read, Grep, Glob | Unhandled promises, swallowed exceptions, and silent null pointer bugs. |
| **`refactor-cleaner`** | `agents/refactor-cleaner.md` | Refactoring | Read, Edit, Grep | Fowler smell remediation, dead code elimination, and SOLID principles. |
| **`code-simplifier`** | `agents/code-simplifier.md` | Refactoring | Read, Edit, Grep | Removal of over-engineering, reducing cyclomatic complexity. |
| **`code-explorer`** | `agents/code-explorer.md` | Exploration | Read, Grep, Glob | Rapid codebase navigation, call-path tracing, and dependency mapping. |
| **`type-design-analyzer`** | `agents/type-design-analyzer.md` | Typing | Read, Grep, Glob | Type system strictness, invariant encoding, and primitive obsession fixes. |
| **`network-troubleshooter`** | `agents/network-troubleshooter.md` | Network | Read, Bash | Network latency, packet drop, and DNS connectivity troubleshooting. |

---

## 💻 Language & Framework Build & Review Specialists

| Domain | Reviewer Agent | Build Resolver Agent | Description |
| :--- | :--- | :--- | :--- |
| **Python** | `python-reviewer.md` | `django-build-resolver.md`, `pytorch-build-resolver.md` | Python PEP 8, typing, Django ORM, and FastAPI architecture. |
| **FastAPI / Django**| `fastapi-reviewer.md`, `django-reviewer.md` | - | Web framework security, async handlers, and database models. |
| **TypeScript / Node**| `typescript-reviewer.md` | - | Strict typing, async/await, and event loop performance. |
| **React** | `react-reviewer.md` | `react-build-resolver.md` | Hooks hygiene, reconciliation, and Next.js / Vite build resolution. |
| **Vue** | `vue-reviewer.md` | - | Vue 3 Composition API, reactivity, and Pinia stores. |
| **Go** | `go-reviewer.md` | `go-build-resolver.md` | Idiomatic Go, goroutine safety, error handling, and `go build`. |
| **Rust** | `rust-reviewer.md` | `rust-build-resolver.md` | Ownership, borrowing, lifetimes, Cargo builds, and zero-cost abstractions. |
| **Flutter / Dart** | `flutter-reviewer.md` | `dart-build-resolver.md` | Widget trees, state management, and pubspec dependency resolution. |
| **Java** | `java-reviewer.md` | `java-build-resolver.md` | Spring Boot, JVM memory tuning, Maven, and Gradle builds. |
| **Kotlin** | `kotlin-reviewer.md` | `kotlin-build-resolver.md` | Kotlin coroutines, flows, multiplatform, and build scripts. |
| **Swift / iOS** | `swift-reviewer.md` | `swift-build-resolver.md` | SwiftUI, Swift 6 concurrency, actors, and Xcode project setups. |
| **C++** | `cpp-reviewer.md` | `cpp-build-resolver.md` | Modern C++ (C++20/23), RAII, memory management, and CMake. |
| **C# / F#** | `csharp-reviewer.md`, `fsharp-reviewer.md` | - | .NET runtime, LINQ, async patterns, and functional programming. |
| **PHP** | `php-reviewer.md` | - | Modern PHP 8+, Laravel patterns, and Composer management. |
| **HarmonyOS** | - | `harmonyos-app-resolver.md` | ArkTS, DevEco Studio, and OpenHarmony build resolution. |

---

## 🧪 Testing, Documentation & Operations Agents

| Agent | File | Domain | Tools | Focus & Description |
| :--- | :--- | :--- | :--- | :--- |
| **`tdd-guide`** | `agents/tdd-guide.md` | Testing | Read, Edit, Bash | TDD coaching, red-green-refactor cycles, and test assertions. |
| **`e2e-runner`** | `agents/e2e-runner.md` | Testing | Read, Bash | End-to-end browser testing, test runners, and session validation. |
| **`pr-test-analyzer`** | `agents/pr-test-analyzer.md` | Testing | Read, Grep, Glob | Test coverage regression, missing test assertions, and PR test analysis. |
| **`performance-optimizer`** | `agents/performance-optimizer.md` | Performance | Read, Grep, Bash | Memory profiling, algorithmic complexity, and cache optimization. |
| **`loop-operator`** | `agents/loop-operator.md` | Autonomous | Read, Edit, Bash | Autonomous loop checkpointing, state tracking, and termination gates. |
| **`harness-optimizer`** | `agents/harness-optimizer.md` | Operations | Read, Grep | Agent harness context reduction and prompt optimization. |
| **`opensource-forker`** | `agents/opensource-forker.md` | Open Source | Read, Bash | Fork management, upstream rebasing, and patch synchronization. |
| **`opensource-packager`** | `agents/opensource-packager.md` | Open Source | Read, Edit, Bash | Release bundling, SemVer management, and package publishing. |
| **`opensource-sanitizer`** | `agents/opensource-sanitizer.md` | Security | Read, Grep | Sensitive data redaction, credential scrubbing, and IP compliance. |
| **`doc-updater`** | `agents/doc-updater.md` | Documentation | Read, Edit, Grep | Synchronizing documentation with code changes and API contracts. |
| **`docs-lookup`** | `agents/docs-lookup.md` | Documentation | Read, Grep, Web | Official documentation lookup and API grounding. |
| **`seo-specialist`** | `agents/seo-specialist.md` | SEO | Read, Edit | Semantic HTML tags, OpenGraph, JSON-LD schema, and performance. |
| **`marketing-agent`** | `agents/marketing-agent.md` | Marketing | Read, Write | Technical product communication, release notes, and announcements. |
