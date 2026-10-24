# scripts/publish-github.ps1
# Automates Git initialization, initial commit, and remote setup for GitHub publishing.

[CmdletBinding()]
param(
    [string]$RepoUrl = "",
    [string]$CommitMessage = "feat: release Prime Autonomous AI Platform v1.0.0 (82 Specialist Agents, Deliberation Engine, Universal Adapters)"
)

$ErrorActionPreference = "Stop"

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "       PRIME - GITHUB REPOSITORY PUBLISHER v1.0.0         " -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host ""

# 1. Locate Git executable
$gitPath = ""
if (Get-Command git -ErrorAction SilentlyContinue) {
    $gitPath = "git"
} elseif (Test-Path "$env:LOCALAPPDATA\Programs\Git\cmd\git.exe") {
    $gitPath = "$env:LOCALAPPDATA\Programs\Git\cmd\git.exe"
} elseif (Test-Path "C:\Program Files\Git\cmd\git.exe") {
    $gitPath = "C:\Program Files\Git\cmd\git.exe"
}

if (-not $gitPath) {
    Write-Host "ERROR: Git executable was not found on your system." -ForegroundColor Red
    Write-Host "Please install Git from https://git-scm.com/download/win" -ForegroundColor Yellow
    exit 1
}

$ver = & $gitPath --version
Write-Host "Git detected: $ver" -ForegroundColor Green

# 2. Check Git configuration
$userName = & $gitPath config user.name 2>$null
$userEmail = & $gitPath config user.email 2>$null

if (-not $userName) {
    Write-Host "Configuring local git user.name to 'Prime AI Team'" -ForegroundColor Gray
    & $gitPath config user.name "Prime AI Team"
}
if (-not $userEmail) {
    Write-Host "Configuring local git user.email to 'prime@autonomous-ai.local'" -ForegroundColor Gray
    & $gitPath config user.email "prime@autonomous-ai.local"
}

# 3. Initialize Git repository if needed
if (-not (Test-Path ".git")) {
    Write-Host "Initializing new Git repository..." -ForegroundColor Cyan
    & $gitPath init
    & $gitPath branch -M main
} else {
    Write-Host "Git repository already initialized." -ForegroundColor Green
}

# 4. Stage and commit files
Write-Host "Staging repository files..." -ForegroundColor Cyan
& $gitPath add .

$status = & $gitPath status --porcelain
if ($status) {
    Write-Host "Creating release commit..." -ForegroundColor Cyan
    & $gitPath commit -m $CommitMessage
    Write-Host "Commit created successfully!" -ForegroundColor Green
} else {
    Write-Host "Working directory is clean. No uncommitted changes." -ForegroundColor Green
}

# 5. Remote and Push Instructions
Write-Host ""
Write-Host "----------------------------------------------------------" -ForegroundColor DarkGray
if ($RepoUrl) {
    Write-Host "Setting remote origin to: $RepoUrl" -ForegroundColor Cyan
    $existingRemote = & $gitPath remote get-url origin 2>$null
    if ($existingRemote) {
        & $gitPath remote set-url origin $RepoUrl
    } else {
        & $gitPath remote add origin $RepoUrl
    }
    Write-Host "Pushing to origin main..." -ForegroundColor Cyan
    & $gitPath push -u origin main
    Write-Host "Successfully published to GitHub: $RepoUrl" -ForegroundColor Green
} else {
    Write-Host "NEXT STEPS TO PUBLISH TO YOUR GITHUB ACCOUNT:" -ForegroundColor Yellow
    Write-Host "1. Go to https://github.com/new and create a new repository (e.g. 'prime')" -ForegroundColor White
    Write-Host "2. Copy the repository URL (e.g. https://github.com/<USERNAME>/prime.git)" -ForegroundColor White
    Write-Host "3. Run this command in your terminal:" -ForegroundColor White
    Write-Host "   git remote add origin https://github.com/<USERNAME>/prime.git" -ForegroundColor Cyan
    Write-Host "   git push -u origin main" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Or re-run this script with the -RepoUrl parameter:" -ForegroundColor Gray
    Write-Host "   .\scripts\publish-github.ps1 -RepoUrl 'https://github.com/<USERNAME>/prime.git'" -ForegroundColor Gray
}
Write-Host "----------------------------------------------------------" -ForegroundColor DarkGray
Write-Host ""
