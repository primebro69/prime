# Prime Plugin Manifest & Architecture Validator (PowerShell)
# Deterministically tests schema compliance for Claude Code, Google Antigravity, and OpenAI Codex.

$pluginRoot = (Resolve-Path "$PSScriptRoot\..").Path
$errors = @()
$passed = 0

function Assert-Check($condition, $message) {
    if (-not $condition) {
        $script:errors += "❌ $message"
        Write-Host "❌ $message" -ForegroundColor Red
    } else {
        $script:passed++
        Write-Host "✅ $message" -ForegroundColor Green
    }
}

Write-Host "=== Prime Plugin Automated Validation Suite (PowerShell) ===`n" -ForegroundColor Cyan

# 1. Root plugin.json
$rootManifestPath = Join-Path $pluginRoot "plugin.json"
Assert-Check (Test-Path $rootManifestPath) "Root plugin.json exists"
if (Test-Path $rootManifestPath) {
    try {
        $rootJson = Get-Content $rootManifestPath -Raw | ConvertFrom-Json
        Assert-Check ($rootJson.name -eq "prime") 'Root manifest has name "prime"'
        Assert-Check (-not [string]::IsNullOrEmpty($rootJson.version)) 'Root manifest has valid version string'
        Assert-Check (-not [string]::IsNullOrEmpty($rootJson.description)) 'Root manifest has description'
    } catch {
        $errors += "❌ Root plugin.json is invalid JSON: $_"
    }
}

# 2. .claude-plugin/plugin.json
$claudeManifestPath = Join-Path $pluginRoot ".claude-plugin\plugin.json"
Assert-Check (Test-Path $claudeManifestPath) ".claude-plugin/plugin.json exists"
if (Test-Path $claudeManifestPath) {
    try {
        $claudeJson = Get-Content $claudeManifestPath -Raw | ConvertFrom-Json
        Assert-Check ($claudeJson.name -eq "prime") 'Claude manifest has name "prime"'
        Assert-Check (-not [string]::IsNullOrEmpty($claudeJson.version)) 'Claude manifest has mandatory version'
        Assert-Check ($claudeJson.commands -is [System.Array]) 'Claude manifest "commands" field is strictly an ARRAY'
        Assert-Check ($claudeJson.skills -is [System.Array]) 'Claude manifest "skills" field is strictly an ARRAY'
        Assert-Check ($null -eq $claudeJson.agents) 'Claude manifest avoids illegal "agents" field (auto-loaded by convention)'
        Assert-Check ($null -eq $claudeJson.hooks) 'Claude manifest avoids illegal "hooks" field (auto-loaded by convention)'
        Assert-Check ($null -ne $claudeJson.mcpServers) 'Claude manifest defines mcpServers object'
    } catch {
        $errors += "❌ .claude-plugin/plugin.json is invalid JSON: $_"
    }
}

# 3. .codex-plugin/plugin.json
$codexManifestPath = Join-Path $pluginRoot ".codex-plugin\plugin.json"
Assert-Check (Test-Path $codexManifestPath) ".codex-plugin/plugin.json exists"
if (Test-Path $codexManifestPath) {
    try {
        $codexJson = Get-Content $codexManifestPath -Raw | ConvertFrom-Json
        Assert-Check ($codexJson.name -eq "prime") 'Codex manifest has name "prime"'
        Assert-Check ($null -ne $codexJson.interface) 'Codex manifest defines interface object'
    } catch {
        $errors += "❌ .codex-plugin/plugin.json is invalid JSON: $_"
    }
}

# 4. Master Slash Command
$primeCmdPath = Join-Path $pluginRoot "commands\prime.md"
Assert-Check (Test-Path $primeCmdPath) "Master slash command commands/prime.md exists"
if (Test-Path $primeCmdPath) {
    $content = Get-Content $primeCmdPath -Raw
    Assert-Check ($content.Length -gt 200) "commands/prime.md has complete instructions"
    Assert-Check ($content.Contains("/prime")) "commands/prime.md documents /prime usage"
}

# 5. Master Skill
$primeSkillPath = Join-Path $pluginRoot "skills\prime\SKILL.md"
Assert-Check (Test-Path $primeSkillPath) "Master skill skills/prime/SKILL.md exists"
if (Test-Path $primeSkillPath) {
    $content = Get-Content $primeSkillPath -Raw
    Assert-Check ($content.StartsWith("---")) "skills/prime/SKILL.md starts with YAML frontmatter"
    Assert-Check ($content.Contains("name: prime")) "skills/prime/SKILL.md defines name: prime"
}

# 6. Bundled Skills Check
$skillsDir = Join-Path $pluginRoot "skills"
if (Test-Path $skillsDir) {
    $skills = Get-ChildItem -Path $skillsDir -Directory
    Write-Host "`nFound $($skills.Count) bundled skills: $($skills.Name -join ', ')" -ForegroundColor Yellow
    foreach ($skill in $skills) {
        $sPath = Join-Path $skill.FullName "SKILL.md"
        Assert-Check (Test-Path $sPath) "Skill `"$($skill.Name)`" contains valid SKILL.md"
    }
}

# 7. Bundled Specialist Agents Check
$agentsDir = Join-Path $pluginRoot "agents"
if (Test-Path $agentsDir) {
    $agents = Get-ChildItem -Path $agentsDir -Filter "*.md"
    Write-Host "`nFound $($agents.Count) specialist agents: $($agents.Name -join ', ')" -ForegroundColor Yellow
    foreach ($agent in $agents) {
        $aContent = Get-Content $agent.FullName -Raw
        Assert-Check ($aContent.StartsWith("---") -and $aContent.Contains("name:")) "Agent `"$($agent.Name)`" has valid YAML frontmatter"
    }
}

# 8. Rules Check
$rulesDir = Join-Path $pluginRoot "rules"
if (Test-Path $rulesDir) {
    $rules = Get-ChildItem -Path $rulesDir -Filter "*.md"
    Write-Host "`nFound $($rules.Count) engineering rules: $($rules.Name -join ', ')" -ForegroundColor Yellow
    Assert-Check ($rules.Count -ge 3) "At least 3 core rules are present"
}

Write-Host "`n================================================" -ForegroundColor Cyan
Write-Host "Results: $passed checks passed, $($errors.Count) errors." -ForegroundColor $(if ($errors.Count -eq 0) { "Green" } else { "Red" })

if ($errors.Count -gt 0) {
    Write-Host "`nFailures:`n$($errors -join "`n")" -ForegroundColor Red
    exit 1
} else {
    Write-Host "🎉 ALL PLUGIN VALIDATION CHECKS PASSED DETERMINISTICALLY!" -ForegroundColor Green
    exit 0
}
