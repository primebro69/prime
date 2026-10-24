# Synchronizes all distribution packages and local/global plugin directories
$ErrorActionPreference = "Stop"

$workspaceRoot = Split-Path -Parent $PSScriptRoot

$targets = @(
    (Join-Path $workspaceRoot ".agents/plugins/prime"),
    (Join-Path $env:USERPROFILE ".gemini/config/plugins/prime"),
    (Join-Path $workspaceRoot "dist/prime"),
    (Join-Path $workspaceRoot "dist/prime-plugin")
)

Write-Host "Syncing files across targets..."

foreach ($t in $targets) {
    if (Test-Path $t) {
        Write-Host "  -> Updating $t"
        Copy-Item (Join-Path $workspaceRoot "commands/prime.md") -Destination (Join-Path $t "commands/prime.md") -Force
        Copy-Item (Join-Path $workspaceRoot "COMMANDS.md") -Destination (Join-Path $t "COMMANDS.md") -Force
        Copy-Item (Join-Path $workspaceRoot "INSTALL.md") -Destination (Join-Path $t "INSTALL.md") -Force
        Copy-Item (Join-Path $workspaceRoot "install.ps1") -Destination (Join-Path $t "install.ps1") -Force
        Copy-Item (Join-Path $workspaceRoot "install.sh") -Destination (Join-Path $t "install.sh") -Force
        
        $targetPrimeSkill = Join-Path $t "skills/prime"
        if (Test-Path $targetPrimeSkill) {
            $refDir = Join-Path $targetPrimeSkill "references"
            if (-not (Test-Path $refDir)) { New-Item -ItemType Directory -Path $refDir -Force | Out-Null }
            Copy-Item (Join-Path $workspaceRoot "skills/prime/SKILL.md") -Destination (Join-Path $targetPrimeSkill "SKILL.md") -Force
            Copy-Item (Join-Path $workspaceRoot "skills/prime/references/routing-table.md") -Destination (Join-Path $targetPrimeSkill "references/routing-table.md") -Force
        }
        
        $targetAgents = Join-Path $t "agents"
        if (Test-Path $targetAgents) {
            Copy-Item (Join-Path $workspaceRoot "agents/*.md") -Destination $targetAgents -Force
        }
        
        $targetCatalogs = Join-Path $t "catalogs"
        if (Test-Path $targetCatalogs) {
            Copy-Item (Join-Path $workspaceRoot "catalogs/*.*") -Destination $targetCatalogs -Force
        }
        
        $targetDocs = Join-Path $t "docs"
        if (Test-Path $targetDocs) {
            Copy-Item (Join-Path $workspaceRoot "docs/*.*") -Destination $targetDocs -Force
        }
        
        $targetScripts = Join-Path $t "scripts"
        if (Test-Path $targetScripts) {
            Copy-Item (Join-Path $workspaceRoot "scripts/*.*") -Destination $targetScripts -Force
        }
        
        # Cross-platform IDE and agent configuration files
        $crossFiles = @(".cursorrules", ".windsurfrules", ".clinerules", ".roomodes", ".aider.conf.yml")
        foreach ($cf in $crossFiles) {
            $src = Join-Path $workspaceRoot $cf
            if (Test-Path $src) {
                Copy-Item $src -Destination (Join-Path $t $cf) -Force
            }
        }

        # Directories: .cursor, .continue, .github, bin
        $crossDirs = @(".cursor", ".continue", ".github", "bin")
        foreach ($cd in $crossDirs) {
            $srcDir = Join-Path $workspaceRoot $cd
            if (Test-Path $srcDir) {
                $destDir = Join-Path $t $cd
                if (-not (Test-Path $destDir)) { New-Item -ItemType Directory -Path $destDir -Force | Out-Null }
                Copy-Item "$srcDir/*" -Destination $destDir -Recurse -Force
            }
        }
        
        $targetLock = Join-Path $t "skills-lock.json"
        if (Test-Path $targetLock) {
            Copy-Item (Join-Path $workspaceRoot "skills-lock.json") -Destination $targetLock -Force
        }
    }
}

# Explicit agent skill copies
$agentSkillDir = Join-Path $workspaceRoot ".agents/skills/prime"
if (Test-Path $agentSkillDir) {
    Copy-Item (Join-Path $workspaceRoot "skills/prime/SKILL.md") -Destination (Join-Path $agentSkillDir "SKILL.md") -Force
    Copy-Item (Join-Path $workspaceRoot "skills/prime/references/routing-table.md") -Destination (Join-Path $agentSkillDir "references/routing-table.md") -Force
}

$globalSkillDir = Join-Path $env:USERPROFILE ".gemini/config/skills/prime"
if (Test-Path $globalSkillDir) {
    Copy-Item (Join-Path $workspaceRoot "skills/prime/SKILL.md") -Destination (Join-Path $globalSkillDir "SKILL.md") -Force
    Copy-Item (Join-Path $workspaceRoot "skills/prime/references/routing-table.md") -Destination (Join-Path $globalSkillDir "references/routing-table.md") -Force
}

# Re-create the distributable ZIP
$zipPath = Join-Path $workspaceRoot "dist/prime-plugin-v1.0.0.zip"
$distPrime = Join-Path $workspaceRoot "dist/prime"

if (Test-Path $zipPath) {
    Remove-Item $zipPath -Force
}

Write-Host "Creating updated ZIP at $zipPath..."
Compress-Archive -Path "$distPrime/*" -DestinationPath $zipPath -Force

Write-Host "Synchronization and packaging completed successfully!"
