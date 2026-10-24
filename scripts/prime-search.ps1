<#
.SYNOPSIS
    Prime Catalog Search Tool
.DESCRIPTION
    Searches across 3,000+ skills in Prime's local catalogs (Antigravity & Agentic Awesome Skills).
.PARAMETER Query
    Search query keyword (e.g. "react", "audio", "security", "docker").
.PARAMETER Limit
    Maximum number of results to display (default 10).
#>
param(
    [Parameter(Position=0, Mandatory=$true)]
    [string]$Query,
    [int]$Limit = 10,
    [switch]$Json
)

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$rootDir = Split-Path -Parent $scriptDir
$antiPath = Join-Path $rootDir "catalogs/skills-index-antigravity.json"
$agenticPath = Join-Path $rootDir "catalogs/skills-index-agentic.json"

$allSkills = @()

if (Test-Path $antiPath) {
    $antiData = Get-Content -Path $antiPath -Raw | ConvertFrom-Json
    foreach ($item in $antiData) {
        $allSkills += [PSCustomObject]@{
            id = $item.id
            name = $item.name
            category = $item.category
            description = $item.description
            catalog = "antigravity"
        }
    }
}

if (Test-Path $agenticPath) {
    $agenticData = Get-Content -Path $agenticPath -Raw | ConvertFrom-Json
    foreach ($item in $agenticData) {
        $allSkills += [PSCustomObject]@{
            id = $item.id
            name = $item.name
            category = $item.category
            description = $item.description
            catalog = "agentic-core"
        }
    }
}

$cleanQuery = $Query.ToLower()
$results = @()

foreach ($skill in $allSkills) {
    $score = 0
    if ($skill.name -and $skill.name.ToLower().Contains($cleanQuery)) { $score += 10 }
    if ($skill.category -and $skill.category.ToLower().Contains($cleanQuery)) { $score += 5 }
    if ($skill.description -and $skill.description.ToLower().Contains($cleanQuery)) { $score += 2 }

    if ($score -gt 0) {
        $results += [PSCustomObject]@{
            id = $skill.id
            name = $skill.name
            category = $skill.category
            description = $skill.description
            catalog = $skill.catalog
            score = $score
        }
    }
}

$sorted = $results | Sort-Object -Property score -Descending | Select-Object -First $Limit

if ($Json) {
    $sorted | ConvertTo-Json -Depth 4
} else {
    Write-Output "Found $($results.Count) matching skills for query '$Query' (showing top $($sorted.Count)):"
    Write-Output "----------------------------------------------------------------------------------"
    foreach ($r in $sorted) {
        Write-Output "[$($r.catalog.ToUpper())] $($r.name) ($($r.category))"
        $shortDesc = if ($r.description.Length -gt 100) { $r.description.Substring(0, 100) + "..." } else { $r.description }
        Write-Output "  $shortDesc"
        Write-Output ""
    }
}
