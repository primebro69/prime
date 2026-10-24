# Updates catalogs/prime-agent-directory.json from all agents in agents/*.md
$ErrorActionPreference = "Stop"

$workspaceRoot = Split-Path -Parent $PSScriptRoot
$agentsDir = Join-Path $workspaceRoot "agents"
$catalogFile = Join-Path $workspaceRoot "catalogs/prime-agent-directory.json"

Write-Host "Scanning agents in $agentsDir..."
$agentFiles = Get-ChildItem -Path $agentsDir -Filter "*.md" | Sort-Object Name

$agentList = @()

foreach ($file in $agentFiles) {
    $content = Get-Content $file.FullName -Raw
    
    $name = $file.BaseName
    $description = ""
    $domain = "general"
    $model = "sonnet"
    $tools = "Read, Grep, Glob, Bash"
    
    if ($content -match '(?ms)^---\s*\r?\n(.*?)\r?\n---') {
        $fm = $matches[1]
        if ($fm -match 'name:\s*([^\r\n]+)') { $name = $matches[1].Trim() }
        if ($fm -match 'description:\s*([^\r\n]+)') { $description = $matches[1].Trim() }
        if ($fm -match 'model:\s*([^\r\n]+)') { $model = $matches[1].Trim() }
        if ($fm -match 'tools:\s*([^\r\n]+)') { $tools = $matches[1].Trim() }
    }
    
    # Infer domain if not explicit
    if ($name -match 'resolver|fix|debug|hunter') { $domain = "debugging" }
    elseif ($name -match 'reviewer|review|audit|evaluator') { $domain = "review" }
    elseif ($name -match 'architect|planner|designer|seam') { $domain = "architecture" }
    elseif ($name -match 'runner|tester|tdd|e2e') { $domain = "testing" }
    elseif ($name -match 'factory|builder|generator|operator') { $domain = "orchestration" }
    elseif ($name -match 'browser|automator') { $domain = "automation" }
    elseif ($name -match 'database|migration') { $domain = "data" }
    elseif ($name -match 'ui|ux|frontend|a11y') { $domain = "ui-ux" }
    
    $agentList += [PSCustomObject]@{
        name = $name
        file = $file.Name
        description = $description
        domain = $domain
        model = $model
        tools = $tools
    }
}

$jsonOutput = $agentList | ConvertTo-Json -Depth 4
[System.IO.File]::WriteAllText($catalogFile, $jsonOutput, [System.Text.Encoding]::UTF8)

Write-Host "Updated catalog with $($agentList.Count) agents at $catalogFile."
