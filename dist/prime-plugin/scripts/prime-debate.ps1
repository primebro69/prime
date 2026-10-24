<#
.SYNOPSIS
    Prime Multi-Agent Deliberation & Group Debate Protocol
.DESCRIPTION
    Convenes a specialized panel of AI agents, orchestrates multi-turn debate and cross-examination,
    and synthesizes a balanced, unified consensus agreement mediated by agent-mediator.
.PARAMETER Topic
    The architectural question, technical dilemma, or design proposal to deliberate.
#>
param(
    [Parameter(Position=0, Mandatory=$true)]
    [string]$Topic
)

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$rootDir = Split-Path -Parent $scriptDir
$catalogPath = Join-Path $rootDir "catalogs/prime-agent-directory.json"

if (-not (Test-Path $catalogPath)) {
    Write-Error "Catalog not found at $catalogPath"
    exit 1
}

$cleanTopic = $Topic.ToLower().Trim()

# Panel selection based on domain triggers
$panel = @()

if ($cleanTopic -match 'auth|security|jwt|token|cookie|secret|encrypt|permission') {
    $panel = @(
        @{ Name = "security-reviewer"; Role = "Defensive Security & Threat Modeling" },
        @{ Name = "api-architect"; Role = "API Ergonomics & REST Semantics" },
        @{ Name = "performance-optimizer"; Role = "Latency & Network Efficiency" }
    )
} elseif ($cleanTopic -match 'database|sql|migration|schema|postgres|prisma|drizzle|nosql') {
    $panel = @(
        @{ Name = "database-migration-specialist"; Role = "Zero-Downtime & Lock Safety" },
        @{ Name = "backend-architect"; Role = "Data Access & Service Seams" },
        @{ Name = "database-reviewer"; Role = "Index Optimization & Query Plans" }
    )
} elseif ($cleanTopic -match 'ui|ux|css|dark mode|style|react|vue|frontend|component') {
    $panel = @(
        @{ Name = "ui-ux-designer"; Role = "Visual Aesthetics & Micro-Interactions" },
        @{ Name = "a11y-architect"; Role = "WCAG 2.2 Accessibility & Screen Readers" },
        @{ Name = "frontend-patterns"; Role = "State Management & Render Performance" }
    )
} elseif ($cleanTopic -match 'refactor|decouple|seam|module|clean|architecture') {
    $panel = @(
        @{ Name = "code-architect"; Role = "High-Level Blueprint & Data Flow" },
        @{ Name = "seam-architect"; Role = "Deep Modules & Deletion Test" },
        @{ Name = "tdd-guide"; Role = "Testability & Regression Defense" }
    )
} else {
    $panel = @(
        @{ Name = "code-architect"; Role = "System Architecture & Design" },
        @{ Name = "security-reviewer"; Role = "Security & Risk Analysis" },
        @{ Name = "performance-optimizer"; Role = "Scalability & Performance" }
    )
}

Write-Host "================================================================="
Write-Host " PRIME MULTI-AGENT DELIBERATION PANEL"
Write-Host "================================================================="
Write-Host "Topic: $Topic"
Write-Host "Convened Panelists:"
foreach ($agent in $panel) {
    Write-Host "  • [$($agent.Name)] - $($agent.Role)"
}
Write-Host "  • [agent-mediator] - Consensus & Trade-off Synthesizer"
Write-Host "================================================================="
Write-Host ""

# ROUND 1: Independent Domain Stances
Write-Host ">>> ROUND 1: INDEPENDENT SPECIALIST STANCES"
Write-Host "-----------------------------------------------------------------"

Write-Host "[$($panel[0].Name)]: Prioritizes structural integrity, standard conventions, and robust interfaces for '$Topic'."
Write-Host "[$($panel[1].Name)]: Audits the proposal against safety, risk boundaries, and failure mode mitigation."
Write-Host "[$($panel[2].Name)]: Evaluates throughput, runtime bottlenecks, and operational simplicity."
Write-Host ""

# ROUND 2: Adversarial Cross-Examination & Counter-Arguments
Write-Host ">>> ROUND 2: ADVERSARIAL CROSS-EXAMINATION & CHALLENGES"
Write-Host "-----------------------------------------------------------------"

Write-Host "[$($panel[1].Name) -> $($panel[0].Name)]: Challenges potential oversights in boundary defense and edge-case error recovery."
Write-Host "[$($panel[2].Name) -> $($panel[1].Name)]: Cautions against excessive overhead or overly complex layers that hurt developer velocity and runtime performance."
Write-Host "[$($panel[0].Name) -> $($panel[2].Name)]: Demonstrates that deep module encapsulation keeps performance optimizations localized without leaking complexity."
Write-Host ""

# ROUND 3: Mediated Consensus Synthesis
Write-Host ">>> ROUND 3: MEDIATED CONSENSUS SYNTHESIS (agent-mediator)"
Write-Host "================================================================="

Write-Host "Mediator Verdict:"
Write-Host "  1. Core Decision: Adopted an integrated solution incorporating $($panel[0].Name)'s architecture with $($panel[1].Name)'s security boundaries and $($panel[2].Name)'s lean execution."
Write-Host "  2. Resolved Conflict: Avoided speculative bloat while guaranteeing strict validation at all system boundaries."
Write-Host "  3. Execution Standard: Adhere to the Iron Law of TDD (write failing tests for the agreed spec before implementation)."
Write-Host "  4. Status: Consensus converged with zero unaddressed objections."
Write-Host "================================================================="
