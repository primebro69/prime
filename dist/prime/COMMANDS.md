# Prime Master Command Manual & Reference Cheatsheet

Welcome to the **Prime Master Command Manual**. This document provides an exhaustive, categorized reference of all available slash commands, shortcuts, use cases, and terminal CLI scripts supported by the **Prime Autonomous AI Engineering Platform**.

Whether you are working in **Google Antigravity**, **Claude Code**, or **OpenAI Codex**, or executing commands directly from the terminal, this handbook provides ready-to-use commands for every real-world engineering scenario.

---

## 📑 Table of Contents

1. [Quick-Start Top 10 Commands](#1-quick-start-top-10-commands)
2. [Core Slash Command Syntax (`/prime`)](#2-core-slash-command-syntax)
3. [Use Case 1: Codebase Health, Audit & Auto-Repair](#3-codebase-health-audit--auto-repair)
4. [Use Case 2: Feature Development & Clean Architecture](#4-feature-development--clean-architecture)
5. [Use Case 3: Bug Hunting & Deep Diagnostic Debugging](#5-bug-hunting--deep-diagnostic-debugging)
6. [Use Case 4: Multi-Agent Group Deliberation & Debates](#6-multi-agent-group-deliberation--debates)
7. [Use Case 5: Autonomous Agent Factory & Generator](#7-autonomous-agent-factory--generator)
8. [Use Case 6: Dual-Axis Code Review & Security Auditing](#8-dual-axis-code-review--security-auditing)
9. [Use Case 7: World-Class UI/UX & Design Systems](#9-world-class-uiux--design-systems)
10. [Use Case 8: Real Browser Automation & Web QA](#10-real-browser-automation--web-qa)
11. [Use Case 9: Database Architecture & Zero-Downtime Migrations](#11-database-architecture--zero-downtime-migrations)
12. [Use Case 10: Algorithmic Crypto & Trading Systems](#12-algorithmic-crypto--trading-systems)
13. [Use Case 11: 3,000+ Skills Catalog Search & Discovery](#13-3000-skills-catalog-search--discovery)
14. [Use Case 12: High-Density Token-Saver Mode (`/caveman`)](#14-high-density-token-saver-mode)
15. [Direct Terminal CLI Scripts (PowerShell & Node.js)](#15-direct-terminal-cli-scripts)
16. [Custom Command Formulation Guide](#16-custom-command-formulation-guide)

---

## 1. Quick-Start Top 10 Commands

Instant copy-paste commands for the most common engineering workflows:

| Objective | Command | Activated Lead Plugin |
| :--- | :--- | :--- |
| **1. Full-System Audit & Auto-Repair** | `/prime analyze this project, identify its problems, and implement the necessary fixes.` | `superpowers + ECC` |
| **2. Test-Driven Feature Development** | `/prime build a RESTful user authentication service with JWT and bcrypt` | `superpowers` |
| **3. Defect Resolution & Bug Fix** | `/prime fix the unhandled promise rejection in auth controller` | `superpowers` |
| **4. Dual-Axis Code Review** | `/prime review the recent git changes against repository standards and user specs` | `agent-peer-review` |
| **5. Multi-Agent Group Debate** | `/prime debate "JWT in LocalStorage vs HttpOnly Secure Cookies for SPA authentication"` | `agent-mediator` |
| **6. On-Demand Specialist Agent Generator** | `/prime build-agent "Supabase specialist for Row-Level Security and realtime subscriptions"` | `agent-factory` |
| **7. Real Browser Automation & QA** | `/prime test localhost:3000 in browser, verify login form validation, and capture screenshot` | `agent-browser` |
| **8. Premium UI/UX Design System** | `/prime design a modern dark-mode crypto dashboard using Outfit typography and HSL colors` | `awesome-claude-plugins` |
| **9. Search 3,000+ Skills Catalog** | `/prime search docker container hardening` | `AAS Catalog` |
| **10. Token-Saving High-Density Mode** | `/prime /caveman fix build error` | `caveman` |

---

## 2. Core Slash Command Syntax

All Prime autonomous capabilities are accessed through a single unified entry point:

```bash
/prime <your task description or specific subcommand>
```

### Built-in Subcommand Shortcuts:
- `/prime analyze` — Full codebase health scan, Fowler smell audit, and defect auto-repair.
- `/prime build <feature>` — Test-driven feature implementation with clean seams and architecture.
- `/prime fix <issue>` — 4-phase root cause analysis and surgical bug fix with reproduction test.
- `/prime review [branch]` — Dual-axis code review comparing Standards adherence vs Spec compliance.
- `/prime debate "<topic>"` — Multi-agent deliberation panel debating trade-offs and synthesizing consensus.
- `/prime build-agent "<spec>"` — Autonomous on-demand agent synthesizer and catalog registrar.
- `/prime test [url/suite]` — Headless Chrome browser automation or local test runner verification.
- `/prime search <tool/lib>` — Instant sub-second search across 3,000+ curated skills.
- `/prime /caveman <task>` — Ultra-compressed high-density communication saving context tokens.

---

## 3. Codebase Health, Audit & Auto-Repair

> **Lead Plugin**: `superpowers + ECC`  
> **Execution Pipeline**: Scan -> Fowler Smell Detection -> Failing Test -> Minimal Fix -> Verify

### Commands:

```bash
# 1. Full-system codebase scan and autonomous defect repair
/prime analyze this project, identify its problems, and implement the necessary fixes.

# 2. Architectural code smell and seam improvement audit
/prime scan this codebase for Fowler smells (shotgun surgery, feature envy, primitive obsession) and suggest seam improvements.

# 3. Silent failure and unhandled error detection
/prime hunt for silent failures, empty catch blocks, unhandled promise rejections, and missing error boundaries.

# 4. Dependency hygiene and outdated package security audit
/prime inspect package manifests, check for deprecated dependencies, security advisories, and verify build reproducibility.

# 5. Test coverage audit and missing test generation
/prime analyze test suite coverage, identify untested critical business logic, and generate failing tests first.

# 6. Dead code and unused export cleanup
/prime find all unused imports, dead functions, unreferenced types, and safely clean them up without breaking build.
```

---

## 4. Feature Development & Clean Architecture

> **Lead Plugin**: `superpowers` (Iron Law of TDD Engine)  
> **Execution Pipeline**: Requirements -> Deep Seams -> Failing Test (RED) -> Minimal Code (GREEN) -> Refactor

### Commands:

```bash
# 1. Production-grade RESTful API service implementation
/prime build a production-grade REST API for product catalog with cursor pagination, rate limiting, and RFC 7807 error format.

# 2. Deep module caching layer with small interface
/prime create a Redis caching layer for user sessions with a minimal interface and deep implementation that passes the Deletion Test.

# 3. Typesafe database access repository pattern
/prime implement a repository pattern for Order processing using Prisma/Drizzle with atomic transaction boundaries.

# 4. Real-time resilient WebSocket service
/prime build a resilient WebSocket notification service with automatic reconnection, heartbeat ping/pong, and room-based broadcasting.

# 5. Role-Based Access Control (RBAC) middleware
/prime create an RBAC authorization middleware supporting roles (admin, editor, viewer) and granular permission claims.

# 6. Secure multipart file upload pipeline
/prime implement a multipart secure file upload pipeline with MIME validation, size limits, and cloud presigned URL generation.
```

---

## 5. Bug Hunting & Deep Diagnostic Debugging

> **Lead Plugin**: `superpowers` (Systematic 4-Phase Debugging Engine)  
> **Execution Pipeline**: Problem Statement -> Root Cause Hypothesis -> Failing Reproduction Test -> Surgical Fix -> Regression Proof

### Commands:

```bash
# 1. Resolve runtime crash or undefined property exception
/prime fix the runtime exception "Cannot read properties of undefined (reading 'map')" in user dashboard.

# 2. TypeScript compilation or type error resolution
/prime resolve the TypeScript build failure TS2345: Argument of type 'string' is not assignable to parameter of type 'number'.

# 3. Node.js event listener memory leak resolution
/prime debug and fix the Node.js memory leak caused by unremoved EventEmitter listeners in the streaming socket handler.

# 4. Concurrency race condition resolution
/prime resolve the race condition where simultaneous payment requests result in duplicate charges.

# 5. Database connection pool exhaustion fix
/prime fix database connection pool timeout "TimeoutError: ResourceRequest timed out" under high concurrency.

# 6. Circular dependency decoupling
/prime detect circular dependency warnings across services and introduce a clean interface seam to decouple them.
```

---

## 6. Multi-Agent Group Deliberation & Debates

> **Lead Plugin**: `agent-mediator`  
> **Execution Pipeline**: Panel Convened -> Round 1: Independent Stances -> Round 2: Adversarial Challenges -> Round 3: Mediated Consensus

### Commands:

```bash
# 1. Authentication storage strategy debate
/prime debate "JWT stored in LocalStorage vs HttpOnly Secure SameSite Cookies for Single-Page Applications"

# 2. Database technology and architecture debate
/prime debate "PostgreSQL relational schema vs MongoDB document store for high-volume analytics event streaming"

# 3. API architectural pattern debate
/prime debate "REST API with cursor pagination vs GraphQL Federation for mobile client consumption"

# 4. Frontend state management debate
/prime debate "Zustand vs Redux Toolkit vs React Context for medium-sized enterprise dashboards"

# 5. Infrastructure deployment strategy debate
/prime debate "Serverless micro-functions (AWS Lambda / Cloudflare Workers) vs Containerized long-running services (Docker / ECS)"

# 6. Free-form architectural group discussion
/prime group discussion on how to decouple our monolithic billing service into a standalone microservice without user disruption.
```

---

## 7. Autonomous Agent Factory & Generator

> **Lead Plugin**: `agent-factory`  
> **Execution Pipeline**: Requirements Analysis -> Synthesize `agents/<name>.md` -> Register in Catalog -> Zero-Overhead JIT Sync

### Commands:

```bash
# 1. Generate Supabase and Row-Level Security specialist agent
/prime build-agent "Supabase specialist for Row-Level Security, PostgreSQL triggers, and realtime client subscriptions"

# 2. Generate Stripe billing and webhook architect agent
/prime build-agent "Stripe payment architect for subscription billing, webhook signature verification, and SCA 3D-Secure flows"

# 3. Generate Three.js and WebGL shader architect agent
/prime build-agent "Three.js and WebGL shader architect for 3D canvas rendering and GPU fragment performance"

# 4. Generate Kubernetes and DevOps infrastructure agent
/prime build-agent "Kubernetes DevOps specialist for Helm charts, ingress controllers, resource limits, and horizontal pod autoscaling"

# 5. Generate LangChain and RAG vector retrieval agent
/prime build-agent "LangChain and RAG architect for vector embeddings, Chroma/Pinecone retrieval, and prompt context chunking"

# 6. Generate TailwindCSS layout optimization specialist agent
/prime build-agent "TailwindCSS optimization specialist for container queries, dynamic theme tokens, and purge-safe typography"
```

---

## 8. Dual-Axis Code Review & Security Auditing

> **Lead Plugin**: `agent-peer-review`  
> **Execution Pipeline**: Round 0 Blind Diff Pass -> Axis 1 (Standards) -> Axis 2 (Spec) -> Security Scan -> Converged Report

### Commands:

```bash
# 1. Complete dual-axis PR review against standards and spec
/prime review this PR branch against repository coding standards and the user's issue specification.

# 2. Detailed audit of recent git commits
/prime audit the last 3 git commits for Fowler smells, interface bloat, regression risks, and spec completeness.

# 3. OWASP Top 10 security audit
/prime security review this codebase for OWASP Top 10 vulnerabilities (SQL injection, XSS, CSRF, SSRF, broken auth).

# 4. Secret leakage and credentials audit
/prime scan all files and git history for hardcoded secrets, private keys, authorization tokens, or exposed environment variables.

# 5. API input validation and sanitization review
/prime review all API input validation handlers to ensure strict schema enforcement (Zod/Joi) and safe boundary sanitization.
```

---

## 9. World-Class UI/UX & Design Systems

> **Lead Plugin**: `awesome-claude-plugins` (UI/UX Pro Max)  
> **Execution Pipeline**: Curated HSL Palette -> Font Hierarchy (Outfit/Inter) -> Micro-Interactions -> Viewport Responsive Grid

### Commands:

```bash
# 1. Modern dark-mode cryptocurrency analytics dashboard
/prime design a modern dark-mode crypto analytics dashboard with curated HSL colors, Outfit typography, and live ticker charts.

# 2. Mobile-first SaaS landing page
/prime build a captivating SaaS landing page with glassmorphism cards, fluid micro-animations, and 320px-to-4K responsiveness.

# 3. Fully accessible navigation bar (WCAG 2.2 AAA)
/prime implement a fully accessible (WCAG 2.2 AAA) dropdown navigation bar with keyboard navigation, ARIA states, and smooth transitions.

# 4. Interactive clean data table with sorting and filtering
/prime create an ultra-clean data table component with sticky headers, column sorting, search filtering, and skeleton loading states.

# 5. Modern registration form with inline validation states
/prime design a modern registration form with floating labels, inline real-time validation badges, and accessible error tooltips.
```

---

## 10. Real Browser Automation & Web QA

> **Lead Plugin**: `agent-browser` (Native Rust-Powered Chrome CDP)  
> **Execution Pipeline**: Launch Headless Chrome -> Accessibility Snapshot (`@eN`) -> Action Sequence -> Visual Screenshot Evidence

### Commands:

```bash
# 1. Fill login form and capture screenshot evidence
/prime open http://localhost:3000, fill out the login form with test credentials, submit, and capture screenshot of dashboard.

# 2. Validate button interactivity and toast notifications
/prime test the checkout button flow on http://localhost:3000/cart and confirm that the success toast appears without console errors.

# 3. Accessibility tree audit and tap target inspection
/prime snapshot the accessibility tree of the homepage and report all missing aria-labels, broken tab-indexes, and tap targets.

# 4. Cross-viewport visual regression verification
/prime capture screenshots of http://localhost:3000 across mobile (375x667), tablet (768x1024), and desktop (1440x900) viewports.

# 5. Structured web scraping and data extraction
/prime navigate to the documentation page and extract the API endpoint table as structured JSON.
```

---

## 11. Database Architecture & Zero-Downtime Migrations

> **Lead Plugin**: `database-migration-specialist` + `database-reviewer`  
> **Execution Pipeline**: Expand -> Backfill in Batches -> Switch -> Contract -> Test Rollback

### Commands:

```bash
# 1. Zero-downtime expand-and-contract column rename
/prime design a zero-downtime expand-and-contract database migration to rename 'phone' to 'phone_number' on a 10M-row users table.

# 2. Lock-safe non-blocking concurrent index creation
/prime generate a lock-safe migration to add a compound index on orders(user_id, created_at) using CREATE INDEX CONCURRENTLY.

# 3. Idempotent data normalization with reversible rollback
/prime write an up/down migration script that normalizes address data with a guaranteed idempotent rollback script.

# 4. Slow query analysis and EXPLAIN ANALYZE optimization
/prime analyze slow database queries, inspect EXPLAIN ANALYZE execution plans, and recommend index strategies.

# 5. Foreign key deadlock prevention and cascading deletion audit
/prime audit database foreign key relationships to prevent inadvertent cascading deletes and deadlocks under concurrency.
```

---

## 12. Algorithmic Crypto & Trading Systems

> **Lead Plugin**: `crypto-trading-architect` + `ccxt`  
> **Execution Pipeline**: Exchange Abstraction -> Rate Limit Pool -> Risk Limit Guardrails -> Paper Trading Verification

### Commands:

```bash
# 1. CCXT multi-exchange ticker aggregation
/prime build a cryptocurrency price ticker service connecting to Binance and Coinbase via CCXT with automatic rate limiting.

# 2. Real-time L2 order book aggregator and spread calculator
/prime implement a real-time order book aggregator that streams L2 depth and calculates bid-ask spread and market impact.

# 3. Portfolio risk management and stop-loss engine
/prime design an execution risk-management engine that enforces maximum portfolio risk per trade, slippage caps, and trailing stop-loss.

# 4. Quantitative backtesting harness on historical OHLCV data
/prime create a simulation framework to backtest a moving average crossover strategy against historical OHLCV 1-hour candles.
```

---

## 13. 3,000+ Skills Catalog Search & Discovery

> **Lead Plugin**: `AAS Catalog` + `antigravity-awesome-skills`  
> **Execution Pipeline**: Query Inverted Index -> Filter Safe & Battle-Tested -> Present Checklist & Install Path

### Commands:

```bash
# 1. Search Docker container patterns
/prime search docker container patterns

# 2. Search AWS and serverless deployment skills
/prime search aws lambda serverless deployment

# 3. Search Flutter state management and layouts
/prime search flutter responsive layout state management

# 4. Search PyTorch and machine learning optimization
/prime search pytorch model quantization optimization

# 5. Search GraphQL schema stitching and federation
/prime search graphql schema stitching federation

# 6. Search Web Vitals, LCP, and performance tuning
/prime search core web vitals LCP INP optimization
```

---

## 14. High-Density Token-Saver Mode (`/caveman`)

> **Lead Plugin**: `caveman`  
> **Execution Pipeline**: Strip Conversational Filler -> Compress Markdown -> Maximize Technical Output Density

### Commands:

```bash
# 1. Ultra-compressed bug fix
/prime /caveman fix build error in auth service

# 2. High-density code review
/prime /caveman review last commit

# 3. Compressed architecture blueprint
/prime /caveman design redis pubsub queue

# 4. Concise test plan formulation
/prime /caveman write test plan for billing webhook
```

---

## 15. Direct Terminal CLI Scripts

If you want to execute Prime autonomous pipelines directly from **PowerShell** or the terminal:

### 1. Test Dynamic Prompt Routing:
```powershell
powershell -ExecutionPolicy Bypass -File scripts/prime-router.ps1 "build a fullstack nextjs app"
```

### 2. Run Multi-Agent Deliberation & Debate:
```powershell
powershell -ExecutionPolicy Bypass -File scripts/prime-debate.ps1 "SQL vs NoSQL for analytics"
```

### 3. Generate a New Specialist Agent:
```powershell
powershell -ExecutionPolicy Bypass -File scripts/prime-agent-builder.ps1 -Name "kafka-streaming-architect" -Description "Specialist for Apache Kafka event brokers, partition offsets, and consumer groups"
```

### 4. Search the 3,000+ Skills Catalog:
```powershell
powershell -ExecutionPolicy Bypass -File scripts/prime-search.ps1 "redis caching" -Limit 5
```

### 5. Run the 41-Check Platform Validation Suite:
```powershell
powershell -ExecutionPolicy Bypass -File scripts/prime-validate.ps1
```

### 6. Synchronize All Distribution Packages:
```powershell
powershell -ExecutionPolicy Bypass -File scripts/sync-dist.ps1
```

---

## 16. Custom Command Formulation Guide

You can easily compose custom `/prime` commands for any project by following this 3-part formula:

```text
/prime [Action Verb] + [Specific Domain or Tech Stack] + [Clear Acceptance Criteria or Output]
```

### Examples:
1. `/prime [build] [a shopping cart service in TypeScript] [with full TDD test coverage and clean seams]`
2. `/prime [fix] [the race condition in payment webhook] [by reproducing with a failing test first]`
3. `/prime [debate] ["Prisma ORM vs raw Kysely queries"] [focusing on query performance and migration safety]`
4. `/prime [review] [the authentication branch] [for OWASP Top 10 vulnerabilities and spec compliance]`

Prime autonomously analyzes your prompt, assigns the best Lead Plugin and Specialist Agents, executes with Iron Law TDD discipline, and verifies all outcomes deterministically.
