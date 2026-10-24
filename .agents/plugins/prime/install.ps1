# Prime Universal Automated Installer (Windows PowerShell)
# Can be executed locally: .\install.ps1
# Or remotely: irm https://raw.githubusercontent.com/<user>/<repo>/main/install.ps1 | iex
$ErrorActionPreference = "Stop"

$workspaceRoot = $PSScriptRoot
if ([string]::IsNullOrWhiteSpace($workspaceRoot)) {
    $workspaceRoot = Get-Location
}

Write-Host "=================================================================" -ForegroundColor Cyan
Write-Host " INSTALLING PRIME AUTONOMOUS AI PLATFORM" -ForegroundColor Cyan
Write-Host "=================================================================" -ForegroundColor Cyan

# 1. Target Directories
$primeHome = Join-Path $env:USERPROFILE ".prime"
$primeBin = Join-Path $primeHome "bin"
$globalAntigravity = Join-Path $env:USERPROFILE ".gemini/config/plugins/prime"
$globalAntigravitySkill = Join-Path $env:USERPROFILE ".gemini/config/skills/prime"
$globalClaude = Join-Path $env:USERPROFILE ".claude/plugins/prime"

@($primeHome, $primeBin, $globalAntigravity, $globalAntigravitySkill, $globalClaude) | ForEach-Object {
    if (-not (Test-Path $_)) { New-Item -ItemType Directory -Path $_ -Force | Out-Null }
}

# 2. Copy Platform Files
Write-Host "--> Deploying Prime Core Engine & 82 Specialist Agents..." -ForegroundColor Yellow
$distSource = Join-Path $workspaceRoot "dist/prime"
if (-not (Test-Path $distSource)) {
    $distSource = $workspaceRoot
}

# Copy to Antigravity
if (Test-Path $distSource) {
    Copy-Item "$distSource/*" -Destination $globalAntigravity -Recurse -Force
    if (Test-Path "$workspaceRoot/skills/prime/SKILL.md") {
        Copy-Item "$workspaceRoot/skills/prime/SKILL.md" -Destination "$globalAntigravitySkill/SKILL.md" -Force
    }
    Copy-Item "$distSource/*" -Destination $globalClaude -Recurse -Force
}

# Copy Binaries
Write-Host "--> Installing CLI Executables (prime.cmd, prime.ps1)..." -ForegroundColor Yellow
$binSource = Join-Path $workspaceRoot "bin"
if (Test-Path $binSource) {
    Copy-Item "$binSource/*.*" -Destination $primeBin -Force
}

# 3. Add to User PATH
Write-Host "--> Configuring System Environment PATH..." -ForegroundColor Yellow
$userPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::User)
if ($userPath -notlike "*$primeBin*") {
    [Environment]::SetEnvironmentVariable("Path", "$userPath;$primeBin", [EnvironmentVariableTarget]::User)
    $env:Path = "$env:Path;$primeBin"
    Write-Host "    [OK] Added $primeBin to User PATH" -ForegroundColor Green
} else {
    Write-Host "    [OK] PATH already configured" -ForegroundColor Green
}

# 4. Success Message
Write-Host "=================================================================" -ForegroundColor Cyan
Write-Host " PRIME INSTALLATION COMPLETED SUCCESSFULLY!" -ForegroundColor Green
Write-Host "=================================================================" -ForegroundColor Cyan
Write-Host "Available everywhere in your terminal and AI coding agents:"
Write-Host "  • Slash Command in Antigravity / Claude Code: /prime <task>"
Write-Host "  • In Cursor Composer / Chat: /prime <task>"
Write-Host "  • In Windsurf / Cascade: /prime <task>"
Write-Host "  • In Roo Code / Cline: Select 'Prime' Mode"
Write-Host "  • In Terminal (CMD / PowerShell): prime <task>"
Write-Host "-----------------------------------------------------------------"
Write-Host "Try it now: prime 'analyze this project and fix defects'"
Write-Host "================================================================="
