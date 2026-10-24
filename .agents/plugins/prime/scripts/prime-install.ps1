<#
.SYNOPSIS
    Prime Universal Autonomous Installer
.DESCRIPTION
    Real, deterministic installer that installs Prime into the local workspace,
    machine-wide global configurations, or external coding agent directories.
.PARAMETER TargetWorkspace
    Path to a target project workspace to install Prime into. Defaults to current directory.
.PARAMETER Global
    If specified, installs Prime machine-wide into global Antigravity, Claude Code, Cursor, and User PATH.
#>
param(
    [string]$TargetWorkspace = ".",
    [switch]$Global
)

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$rootDir = Split-Path -Parent $scriptDir

Write-Host "=================================================================" -ForegroundColor Cyan
Write-Host " PRIME AUTONOMOUS AI PLATFORM - UNIVERSAL INSTALLER" -ForegroundColor Cyan
Write-Host "=================================================================" -ForegroundColor Cyan

# 1. Global System Installation
if ($Global) {
    Write-Host "[1/3] Installing Prime globally for all coding agents..." -ForegroundColor Yellow
    
    # Antigravity Global
    $globalAntigravity = Join-Path $env:USERPROFILE ".gemini/config/plugins/prime"
    $globalAntigravitySkill = Join-Path $env:USERPROFILE ".gemini/config/skills/prime"
    if (-not (Test-Path $globalAntigravity)) { New-Item -ItemType Directory -Path $globalAntigravity -Force | Out-Null }
    if (-not (Test-Path $globalAntigravitySkill)) { New-Item -ItemType Directory -Path $globalAntigravitySkill -Force | Out-Null }
    
    Copy-Item "$rootDir/dist/prime/*" -Destination $globalAntigravity -Recurse -Force
    Copy-Item "$rootDir/skills/prime/SKILL.md" -Destination "$globalAntigravitySkill/SKILL.md" -Force
    Write-Host "  -> Installed in Antigravity Global: $globalAntigravity" -ForegroundColor Green

    # Claude Code Global
    $globalClaude = Join-Path $env:USERPROFILE ".claude/plugins/prime"
    if (-not (Test-Path $globalClaude)) { New-Item -ItemType Directory -Path $globalClaude -Force | Out-Null }
    Copy-Item "$rootDir/dist/prime/*" -Destination $globalClaude -Recurse -Force
    Write-Host "  -> Installed in Claude Code Global: $globalClaude" -ForegroundColor Green

    # User PATH CLI Directory
    $primeBinDir = Join-Path $env:USERPROFILE ".prime/bin"
    if (-not (Test-Path $primeBinDir)) { New-Item -ItemType Directory -Path $primeBinDir -Force | Out-Null }
    Copy-Item "$rootDir/bin/*.*" -Destination $primeBinDir -Force
    
    # Add to User PATH if not already present
    $userPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User)
    if ($userPath -notlike "*$primeBinDir*") {
        [Environment]::SetEnvironmentVariable("Path", "$userPath;$primeBinDir", [EnvironmentVariableTarget]::User)
        $env:Path = "$env:Path;$primeBinDir"
        Write-Host "  -> Added $primeBinDir to User Environment PATH!" -ForegroundColor Green
    } else {
        Write-Host "  -> User PATH already contains $primeBinDir" -ForegroundColor Green
    }
}

# 2. Workspace Installation
$targetResolved = (Resolve-Path $TargetWorkspace).Path
Write-Host "[2/3] Installing Prime into workspace: $targetResolved" -ForegroundColor Yellow

# Ensure destination directories exist
$destPlugin = Join-Path $targetResolved ".agents/plugins/prime"
$destSkill = Join-Path $targetResolved ".agents/skills/prime"
$destCursor = Join-Path $targetResolved ".cursor/rules"
$destContinue = Join-Path $targetResolved ".continue/prompts"
$destGithub = Join-Path $targetResolved ".github"
$destCommands = Join-Path $targetResolved "commands"

@($destPlugin, $destSkill, $destCursor, $destContinue, $destGithub, $destCommands) | ForEach-Object {
    if (-not (Test-Path $_)) { New-Item -ItemType Directory -Path $_ -Force | Out-Null }
}

# Copy workspace integration files
Copy-Item "$rootDir/commands/prime.md" -Destination "$targetResolved/commands/prime.md" -Force
Copy-Item "$rootDir/skills/prime/SKILL.md" -Destination "$destSkill/SKILL.md" -Force
Copy-Item "$rootDir/dist/prime/*" -Destination $destPlugin -Recurse -Force

# Cross-platform rules
Copy-Item "$rootDir/.cursorrules" -Destination "$targetResolved/.cursorrules" -Force
Copy-Item "$rootDir/.cursor/rules/prime.mdc" -Destination "$targetResolved/.cursor/rules/prime.mdc" -Force
Copy-Item "$rootDir/.windsurfrules" -Destination "$targetResolved/.windsurfrules" -Force
Copy-Item "$rootDir/.roomodes" -Destination "$targetResolved/.roomodes" -Force
Copy-Item "$rootDir/.clinerules" -Destination "$targetResolved/.clinerules" -Force
Copy-Item "$rootDir/.continue/config.json" -Destination "$targetResolved/.continue/config.json" -Force
Copy-Item "$rootDir/.continue/prompts/prime.prompt" -Destination "$targetResolved/.continue/prompts/prime.prompt" -Force
Copy-Item "$rootDir/.github/copilot-instructions.md" -Destination "$targetResolved/.github/copilot-instructions.md" -Force
Copy-Item "$rootDir/.aider.conf.yml" -Destination "$targetResolved/.aider.conf.yml" -Force
Copy-Item "$rootDir/COMMANDS.md" -Destination "$targetResolved/COMMANDS.md" -Force
Copy-Item "$rootDir/AGENTS.md" -Destination "$targetResolved/AGENTS.md" -Force
Copy-Item "$rootDir/GEMINI.md" -Destination "$targetResolved/GEMINI.md" -Force

Write-Host "  -> Workspace configuration files installed successfully." -ForegroundColor Green

# 3. Verification
Write-Host "[3/3] Verifying installation..." -ForegroundColor Yellow
$verifyCommand = Join-Path $targetResolved "commands/prime.md"
if (Test-Path $verifyCommand) {
    Write-Host "=================================================================" -ForegroundColor Cyan
    Write-Host " SUCCESS: Prime AI Platform installed successfully!" -ForegroundColor Green
    Write-Host " Activated Slash Command: /prime" -ForegroundColor Green
    Write-Host " Supported Agents: Antigravity, Claude Code, Cursor, Windsurf, Roo Code, Cline, Continue, Copilot, Terminal" -ForegroundColor Green
    Write-Host "=================================================================" -ForegroundColor Cyan
} else {
    Write-Error "Verification failed: $verifyCommand was not found."
    exit 1
}
