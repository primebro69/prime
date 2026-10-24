<#
.SYNOPSIS
    Prime Autonomous AI Platform Terminal CLI (PowerShell)
.DESCRIPTION
    Unified command-line entry point for Prime.
    Usage:
        prime "build a REST API"
        prime debate "JWT vs Cookies"
        prime build-agent "Supabase specialist"
        prime search "docker"
#>
param(
    [Parameter(Position=0, ValueFromRemainingArguments=$true)]
    [string[]]$TaskArgs
)

$rootDir = Split-Path -Parent $PSScriptRoot
$prompt = $TaskArgs -join ' '

if ([string]::IsNullOrWhiteSpace($prompt)) {
    Write-Host "Usage: prime <task description | analyze | fix | build | review | debate | build-agent | search>"
    Write-Host "Example: prime 'build a REST API with cursor pagination'"
    exit 0
}

if ($prompt -match '^debate\s+(.+)') {
    $topic = $matches[1]
    & powershell -ExecutionPolicy Bypass -File (Join-Path $rootDir "scripts/prime-debate.ps1") $topic
} elseif ($prompt -match '^build-agent\s+(.+)') {
    $spec = $matches[1]
    & powershell -ExecutionPolicy Bypass -File (Join-Path $rootDir "scripts/prime-agent-builder.ps1") -Prompt $spec
} elseif ($prompt -match '^search\s+(.+)') {
    $query = $matches[1]
    & powershell -ExecutionPolicy Bypass -File (Join-Path $rootDir "scripts/prime-search.ps1") $query
} else {
    & powershell -ExecutionPolicy Bypass -File (Join-Path $rootDir "scripts/prime-router.ps1") $prompt
}
