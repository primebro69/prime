<#
.SYNOPSIS
    Prime Comprehensive Platform & Plugin Validation Suite
.DESCRIPTION
    Validates manifest schemas, single primary slash command compliance, specialist agent
    frontmatters, skill integrity, catalogs, rules, hooks, and routing accuracy.
#>
$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$rootDir = Split-Path -Parent $scriptDir

$passed = 0
$failed = 0
$warnings = 0

function Assert-Check {
    param([string]$Name, [bool]$Condition, [string]$Details = "")
    if ($Condition) {
        Write-Host " [PASS] $Name" -ForegroundColor Green
        $script:passed++
    } else {
        Write-Host " [FAIL] $Name - $Details" -ForegroundColor Red
        $script:failed++
    }
}

function Assert-Warn {
    param([string]$Name, [string]$Details = "")
    Write-Host " [WARN] $Name - $Details" -ForegroundColor Yellow
    $script:warnings++
}

Write-Host "=================================================================" -ForegroundColor Cyan
Write-Host " PRIME AUTONOMOUS AI PLATFORM - COMPREHENSIVE VALIDATION SUITE" -ForegroundColor Cyan
Write-Host "=================================================================" -ForegroundColor Cyan

# 1. Claude Code Native Plugin Manifest
$claudeManifestPath = Join-Path $rootDir ".claude-plugin/plugin.json"
$claudeOk = Test-Path $claudeManifestPath
Assert-Check "Claude Code Manifest Exists" $claudeOk
if ($claudeOk) {
    try {
        $cm = Get-Content -Path $claudeManifestPath -Raw | ConvertFrom-Json
        Assert-Check "Claude Manifest Name is 'prime'" ($cm.name -eq "prime")
        Assert-Check "Claude Manifest Version Present" (![string]::IsNullOrEmpty($cm.version))
        Assert-Check "Claude Manifest 'commands' is Array" ($cm.commands -is [System.Array])
        Assert-Check "Claude Manifest 'skills' is Array" ($cm.skills -is [System.Array])
        Assert-Check "Claude Manifest DOES NOT Have 'agents' Field" ($null -eq $cm.agents) "Strict validator forbids 'agents' in manifest"
        $mcpProps = @($cm.mcpServers.psobject.Properties | Where-Object { $_.MemberType -eq 'NoteProperty' })
        Assert-Check "Claude Manifest 'mcpServers' is Empty Opt-out" ($null -ne $cm.mcpServers -and $mcpProps.Count -eq 0)
    } catch {
        Assert-Check "Claude Manifest JSON Parsable" $false $_.Exception.Message
    }
}

# 2. OpenAI Codex Native Plugin Manifest
$codexManifestPath = Join-Path $rootDir ".codex-plugin/plugin.json"
$codexOk = Test-Path $codexManifestPath
Assert-Check "OpenAI Codex Manifest Exists" $codexOk
if ($codexOk) {
    try {
        $cx = Get-Content -Path $codexManifestPath -Raw | ConvertFrom-Json
        Assert-Check "Codex Manifest Name is 'prime'" ($cx.name -eq "prime")
        Assert-Check "Codex Manifest Interface Exists" ($null -ne $cx.interface)
        Assert-Check "Codex Manifest Skills Path Valid" ($cx.skills -eq "./skills/")
    } catch {
        Assert-Check "Codex Manifest JSON Parsable" $false $_.Exception.Message
    }
}

# 3. Google Antigravity Manifest
$agManifestPath = Join-Path $rootDir "plugin.json"
$agOk = Test-Path $agManifestPath
Assert-Check "Google Antigravity Root Manifest Exists" $agOk
if ($agOk) {
    try {
        $ag = Get-Content -Path $agManifestPath -Raw | ConvertFrom-Json
        Assert-Check "Antigravity Manifest Name is 'prime'" ($ag.name -eq "prime")
    } catch {
        Assert-Check "Antigravity Manifest JSON Parsable" $false $_.Exception.Message
    }
}

# 4. Primary Slash Command Discovery
$primeCmdPath = Join-Path $rootDir "commands/prime.md"
$cmdOk = Test-Path $primeCmdPath
Assert-Check "Single Primary Slash Command 'commands/prime.md' Exists" $cmdOk
if ($cmdOk) {
    $cmdContent = Get-Content -Path $primeCmdPath -Raw
    Assert-Check "Command Has Valid Description Frontmatter" ($cmdContent -match '(?m)^description:\s*')
    Assert-Check "Command References 5-Stage Protocol" ($cmdContent -match 'STAGE 1: INTENT TRIAGE')
    Assert-Check "Command Enforces TDD Iron Law" ($cmdContent -match 'NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST')
}

# 5. Master Skill Integrity
$primeSkillPath = Join-Path $rootDir "skills/prime/SKILL.md"
$skillOk = Test-Path $primeSkillPath
Assert-Check "Master Skill 'skills/prime/SKILL.md' Exists" $skillOk
if ($skillOk) {
    $skillContent = Get-Content -Path $primeSkillPath -Raw
    Assert-Check "Master Skill Frontmatter name is 'prime'" ($skillContent -match '(?m)^name:\s*prime')
    Assert-Check "Master Skill References Routing Table" (Test-Path (Join-Path $rootDir "skills/prime/references/routing-table.md"))
    Assert-Check "Master Skill References Agents Matrix" (Test-Path (Join-Path $rootDir "skills/prime/references/agents-matrix.md"))
}

# 6. Specialist Agents Registry
$agentFiles = Get-ChildItem -Path (Join-Path $rootDir "agents/*.md")
Assert-Check "Specialist Agents Directory Populated" ($agentFiles.Count -ge 68) "Found $($agentFiles.Count) agents"

$invalidAgents = 0
foreach ($af in $agentFiles) {
    $c = Get-Content -Path $af.FullName -Raw
    if (!($c -match '(?ms)^---\s*\r?\n.*?name:\s*.*?description:\s*.*?---')) {
        $invalidAgents++
    }
}
Assert-Check "All Specialist Agents Have Valid YAML Frontmatter" ($invalidAgents -eq 0) "$invalidAgents invalid agents"

$agentDirectoryPath = Join-Path $rootDir "catalogs/prime-agent-directory.json"
Assert-Check "Agent Directory Catalog JSON Exists" (Test-Path $agentDirectoryPath)

# 7. Core Skills Suite
$requiredSkills = @("test-driven-development", "systematic-debugging", "verification-before-completion", "codebase-design", "code-review", "agent-browser", "find-skills", "caveman", "security-review")
$missingSkills = @()
foreach ($rs in $requiredSkills) {
    if (!(Test-Path (Join-Path $rootDir "skills/$rs/SKILL.md"))) {
        $missingSkills += $rs
    }
}
Assert-Check "Required Core Skills Present in skills/" ($missingSkills.Count -eq 0) "Missing: $($missingSkills -join ', ')"

# 8. Curated Catalogs
$antiCat = Join-Path $rootDir "catalogs/skills-index-antigravity.json"
$agenticCat = Join-Path $rootDir "catalogs/skills-index-agentic.json"
Assert-Check "Antigravity Skills Catalog Present" (Test-Path $antiCat)
Assert-Check "Agentic Awesome Skills Catalog Present" (Test-Path $agenticCat)

# 9. Rules and Hooks
Assert-Check "Engineering Standards Rule Exists" (Test-Path (Join-Path $rootDir "rules/prime-standards.md"))
Assert-Check "Quality Gate Rule Exists" (Test-Path (Join-Path $rootDir "rules/quality-gate.md"))
Assert-Check "Claude/Antigravity Hooks Manifest Exists" (Test-Path (Join-Path $rootDir "hooks/hooks.json"))
Assert-Check "Codex Hooks Manifest Exists" (Test-Path (Join-Path $rootDir "hooks/codex-hooks.json"))

# 10. Autonomous Router Functional Test
$routerPath = Join-Path $rootDir "scripts/prime-router.ps1"
try {
    $routeOut = & powershell -ExecutionPolicy Bypass -File $routerPath "Analyze this project, identify its problems, and implement the necessary fixes." -Json | ConvertFrom-Json
    Assert-Check "Router Routes Audit Prompt to 'health-and-repair'" ($routeOut.profile -eq "health-and-repair")
    Assert-Check "Router Recommends Specialist Agents" ($routeOut.recommendedAgents.Count -ge 3)
} catch {
    Assert-Check "Router Execution Functional" $false $_.Exception.Message
}

# 11. Search Functional Test
$searchPath = Join-Path $rootDir "scripts/prime-search.ps1"
try {
    $searchOut = & powershell -ExecutionPolicy Bypass -File $searchPath "react" -Limit 5 -Json | ConvertFrom-Json
    Assert-Check "Catalog Search Returns Matches for 'react'" ($searchOut.Count -gt 0)
} catch {
    Assert-Check "Search Execution Functional" $false $_.Exception.Message
}

# 12. Multi-Agent Deliberation & Lazy Loading Suite
$totalAgentCount = $agentFiles.Count
Assert-Check "Specialist Agent Count Reaches >= 80" ($totalAgentCount -ge 80) "Found: $totalAgentCount agents"
Assert-Check "Multi-Agent Deliberation Engine Exists" (Test-Path (Join-Path $rootDir "scripts/prime-debate.ps1"))
Assert-Check "Autonomous Agent Factory Exists" (Test-Path (Join-Path $rootDir "scripts/prime-agent-builder.ps1"))
Assert-Check "Deliberation Architecture Guide Exists" (Test-Path (Join-Path $rootDir "docs/AGENT-DELIBERATION.md"))
Assert-Check "Lazy-Loading Architecture Guide Exists" (Test-Path (Join-Path $rootDir "docs/LAZY-LOADING.md"))
Assert-Check "Multi-Plugin Dispatch Matrix Exists" (Test-Path (Join-Path $rootDir "catalogs/plugin-dispatch-matrix.json"))
Assert-Check "Master Command Manual 'COMMANDS.md' Exists" (Test-Path (Join-Path $rootDir "COMMANDS.md"))

# 13. Universal Cross-Platform Coding Agent Suite
Assert-Check "Cursor IDE Legacy Rules '.cursorrules' Exists" (Test-Path (Join-Path $rootDir ".cursorrules"))
Assert-Check "Cursor IDE Modern Rules '.cursor/rules/prime.mdc' Exists" (Test-Path (Join-Path $rootDir ".cursor/rules/prime.mdc"))
Assert-Check "Windsurf / Cascade Rules '.windsurfrules' Exists" (Test-Path (Join-Path $rootDir ".windsurfrules"))
Assert-Check "Roo Code Custom Mode '.roomodes' Exists" (Test-Path (Join-Path $rootDir ".roomodes"))
Assert-Check "Cline Rules '.clinerules' Exists" (Test-Path (Join-Path $rootDir ".clinerules"))
Assert-Check "Continue.dev Slash Command Config Exists" (Test-Path (Join-Path $rootDir ".continue/config.json"))
Assert-Check "Continue.dev Prime Prompt Template Exists" (Test-Path (Join-Path $rootDir ".continue/prompts/prime.prompt"))
Assert-Check "GitHub Copilot Instructions Exists" (Test-Path (Join-Path $rootDir ".github/copilot-instructions.md"))
Assert-Check "Aider & OpenCode Configuration Exists" (Test-Path (Join-Path $rootDir ".aider.conf.yml"))
Assert-Check "Universal Cross-Platform Guide Exists" (Test-Path (Join-Path $rootDir "docs/CROSS-PLATFORM.md"))
Assert-Check "Standalone Windows CMD CLI 'bin/prime.cmd' Exists" (Test-Path (Join-Path $rootDir "bin/prime.cmd"))
Assert-Check "Standalone PowerShell CLI 'bin/prime.ps1' Exists" (Test-Path (Join-Path $rootDir "bin/prime.ps1"))
Assert-Check "Standalone Unix Shell CLI 'bin/prime' Exists" (Test-Path (Join-Path $rootDir "bin/prime"))

# 14. Universal Automated Installer Suite
Assert-Check "Automated Windows Installer 'install.ps1' Exists" (Test-Path (Join-Path $rootDir "install.ps1"))
Assert-Check "Automated Linux/macOS Installer 'install.sh' Exists" (Test-Path (Join-Path $rootDir "install.sh"))
Assert-Check "Root Universal Installation Manual 'INSTALL.md' Exists" (Test-Path (Join-Path $rootDir "INSTALL.md"))
Assert-Check "Agent Workspace Installer 'scripts/prime-install.ps1' Exists" (Test-Path (Join-Path $rootDir "scripts/prime-install.ps1"))

$summaryColor = "Green"
if ($failed -gt 0) { $summaryColor = "Red" }
Write-Host "=================================================================" -ForegroundColor Cyan
Write-Host " VALIDATION SUMMARY: $passed Passed | $failed Failed | $warnings Warnings" -ForegroundColor $summaryColor
Write-Host "=================================================================" -ForegroundColor Cyan

if ($failed -gt 0) {
    exit 1
} else {
    exit 0
}
