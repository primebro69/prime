# Prime Multi-Agent Deliberation & Group Conversation Protocol

In complex software engineering, single-agent architectures suffer from **confirmation bias** and **domain blindness**. For instance, an Architect may propose an elegant abstraction that introduces unacceptable latency for the Performance Optimizer, or a rapid feature developer might expose an API that violates the Security Reviewer's threat model.

Prime solves this with the **Multi-Agent Deliberation & Group Debate Protocol** (`agent-mediator`). Specialist agents engage in structured multi-turn conversation, challenge assumptions, debate trade-offs, and synthesize a single unified, bulletproof decision.

---

## 🏛️ Deliberation Architecture (3-Round Consensus Engine)

```text
┌─────────────────────────────────────────────────────────────────────────────┐
│                            TASK / ARCHITECTURE TOPIC                        │
└──────────────────────────────────────┬──────────────────────────────────────┘
                                       │
                                       ▼
                         [Selection of Specialist Panel]
                     (e.g., Architect, Security, Performance)
                                       │
 ┌─────────────────────────────────────┴─────────────────────────────────────┐
 │ ROUND 1: INDEPENDENT STANCES                                              │
 │ Each specialist agent formulates their ideal proposal strictly through    │
 │ their domain lens without seeing peer answers yet (Blind Pass).           │
 └─────────────────────────────────────┬─────────────────────────────────────┘
                                       │
 ┌─────────────────────────────────────▼─────────────────────────────────────┐
 │ ROUND 2: ADVERSARIAL CROSS-EXAMINATION & CHALLENGE                        │
 │ Agents review each other's proposals.                                     │
 │ • Security challenges Architect's exposed endpoints.                      │
 │ • Performance critiques Security's cryptographic overhead.                │
 │ • TDD Guide demands mockable interfaces and deterministic seams.          │
 └─────────────────────────────────────┬─────────────────────────────────────┘
                                       │
 ┌─────────────────────────────────────▼─────────────────────────────────────┐
 │ ROUND 3: MEDIATED CONSENSUS SYNTHESIS (agent-mediator)                    │
 │ The Agent Mediator synthesizes all valid points, eliminates fragile ideas,│
 │ and delivers a unified, compromise-free architecture blueprint.           │
 └───────────────────────────────────────────────────────────────────────────┘
```

---

## 👥 Specialist Panel Presets

Depending on the nature of the task, Prime convenes the optimal agent panel:

| Domain Scenario | Specialist Panel | Primary Friction Point |
| :--- | :--- | :--- |
| **System Architecture** | `code-architect`, `security-reviewer`, `performance-optimizer` | Elegance & Flexibility vs Attack Surface vs Latency |
| **Data Storage & Schema** | `backend-architect`, `database-reviewer`, `database-migration-specialist` | Query Ergonomics vs Zero-Downtime Safety vs Index Lock Risk |
| **Frontend & UI/UX** | `ui-ux-designer`, `a11y-architect`, `frontend-patterns` | Modern Aesthetics & Micro-Animations vs WCAG 2.2 vs DOM Load |
| **API & Integrations** | `api-architect`, `security-reviewer`, `tdd-guide` | RESTful Purity vs Authorization Guardrails vs Mockable Contracts |
| **Code Review Dispute** | `code-reviewer`, `codex-peer-reviewer`, `seam-architect` | Repo Standards vs Original User Spec vs Deep Seam Hygiene |

---

## 💬 Execution Example: Authentication Session Storage

```text
Topic: "Where should session tokens be stored in our single-page application?"

Panel:
- Agent 1: frontend-patterns (Client Developer)
- Agent 2: security-reviewer (Defensive Security)
- Agent 3: performance-optimizer (Latency & Network)
- Mediator: agent-mediator (Consensus Synthesizer)

--- ROUND 1 (Initial Stances) ---
[frontend-patterns]:
"Store in browser localStorage so client-side React components can easily read user claims without extra network roundtrips."

[security-reviewer]:
"REJECT localStorage! Any XSS vulnerability immediately leads to permanent token theft. Tokens must be stored in HttpOnly, Secure, SameSite=Strict cookies."

[performance-optimizer]:
"HttpOnly cookies are sent on every asset request if not scoped to /api. We must avoid bloating static image requests with auth cookies."

--- ROUND 2 (Cross-Examination & Challenge) ---
[frontend-patterns -> security-reviewer]:
"If tokens are HttpOnly cookies, how does the frontend know user role and permissions for UI rendering without calling the backend on every navigation?"

[security-reviewer -> frontend-patterns]:
"Separate authentication from authorization metadata! Store the sensitive refresh/session token in an HttpOnly cookie. Expose a non-sensitive user profile (name, permissions) in memory or client storage."

[performance-optimizer -> security-reviewer]:
"Scope the cookie path to `/api/v1` so static asset requests (CSS, JS, fonts) remain lightweight and cookieless."

--- ROUND 3 (Consensus Agreement by agent-mediator) ---
[agent-mediator]:
"CONSENSUS REACHED:
1. Primary Auth Token: Secure, HttpOnly, SameSite=Strict cookie scoped to `/api`.
2. Frontend Profile Metadata: In-memory React Context for instant permission rendering, hydrated on startup via `/api/me`.
3. Token Refresh: Handled via silent background rotation at `/api/auth/refresh`.
4. Verification: Unit test auth cookie attributes; E2E test XSS injection resilience."
```

---

## ⚡ How to Trigger Multi-Agent Deliberation

### 1. Natural Language via `/prime`
```bash
/prime debate Should we use REST or GraphQL for our new service?
```
or
```bash
/prime group discussion on how to decouple the billing module
```

### 2. Standalone CLI Script
```powershell
powershell -ExecutionPolicy Bypass -File scripts/prime-debate.ps1 "REST vs GraphQL for mobile apps"
```
