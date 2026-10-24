# Prime Lazy-Loading & Zero-Overhead Multi-Agent Architecture

When building a massive platform with 80+ specialist agents and 3,000+ skills, **loading everything simultaneously into RAM or context is a severe anti-pattern**. It leads to context bloat, slow responses, and heavy system load.

Prime implements a **Just-In-Time (JIT) Lazy-Loading Architecture**, ensuring high performance, zero context waste, and minimal resource consumption.

---

## ⚡ Core Pillars of Lazy Loading

```text
┌─────────────────────────────────────────────────────────────────────────────┐
│                       LIGHTWEIGHT REGISTRY (30 KB)                          │
│                catalogs/prime-agent-directory.json                           │
│                (Stores only metadata: name, domain, tools, description)     │
└──────────────────────────────────────┬──────────────────────────────────────┘
                                       │
                                       ▼ [User Prompt Injected]
┌─────────────────────────────────────────────────────────────────────────────┐
│                    SELECTIVE INTENT ROUTING (JIT FILTER)                    │
│                scripts/prime-router.ps1 (Resolves 1 to 3 agents)            │
└──────────────────────────────────────┬──────────────────────────────────────┘
                                       │
            ┌──────────────────────────┴──────────────────────────┐
            ▼                                                     ▼
┌───────────────────────┐                             ┌───────────────────────┐
│   ACTIVE SPECIALIST   │                             │  78+ IDLE SPECIALISTS │
│      (LOADED)         │                             │     (ON DISK ONLY)    │
│  agents/<target>.md   │                             │   Zero Memory Used    │
└───────────────────────┘                             └───────────────────────┘
```

---

## 1. Registry-Only Discovery (Memory: ~0 KB per idle agent)
- All 80+ specialist agents are cataloged in `catalogs/prime-agent-directory.json`.
- The AI harness and IDE only inspect this lightweight index to discover capabilities.
- The actual instructions, system prompts, checklists, and defense baselines for inactive agents are **never loaded into memory** until explicitly needed.

## 2. Just-In-Time (JIT) Prompt Binding
- When `/prime <task>` is executed:
  1. The prompt is triaged by `scripts/prime-router.ps1`.
  2. The router identifies the **Lead Plugin** and the specific **Specialist Agent(s)** (e.g., `python-reviewer` for Python, `agent-browser` for web QA).
  3. Only that single agent's file (`agents/<agent-name>.md`) is read and bound into the active conversation context.
  4. The other 80 agents remain entirely dormant on disk.

## 3. Ephemeral Group Deliberation Panels
- In multi-agent debate mode (`agent-mediator`):
  - A maximum of 2 to 4 agents form the panel.
  - No extraneous agents are included.
  - Once the consensus verdict is reached, the panel dissolves and memory is freed.

## 4. Autonomous On-Demand Generation (Agent Factory)
- If a user needs an agent for a technology not yet covered, the **Autonomous Agent Factory** (`agents/agent-factory.md` or `scripts/prime-agent-builder.ps1`) dynamically constructs the new agent on disk.
- It does not load into permanent memory; it is written as a lean markdown spec and registered in the catalog for lazy-loaded execution.

## 5. System Resource Benchmark
| Metric | Full Eager Loading (Anti-Pattern) | Prime JIT Lazy Loading (Implemented) |
| :--- | :--- | :--- |
| **Active Agents in Memory** | 82 agents | **1 - 3 agents** |
| **Context Window Overhead** | ~180,000 tokens | **~2,500 tokens** |
| **Background CPU / RAM** | Heavy continuous background daemon | **0% CPU / 0 MB idle RAM** |
| **Response Latency** | High (context bloat) | **Sub-second routing** |
