<#
.SYNOPSIS
    Prime Multi-Plugin Dynamic Dispatch & Autonomous Router
.DESCRIPTION
    Analyzes user prompts, identifies target execution profiles, assigns tasks to the best-in-class
    specialized plugin, selects collaborating specialist agents and skills, and generates an actionable execution blueprint.
.PARAMETER Prompt
    The user's task description or command arguments.
.PARAMETER Json
    If specified, outputs the result as a structured JSON object.
#>
param(
    [Parameter(Position=0, Mandatory=$false)]
    [string]$Prompt = "",
    [switch]$Json
)

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$rootDir = Split-Path -Parent $scriptDir
$catalogPath = Join-Path $rootDir "catalogs/prime-agent-directory.json"
$matrixPath = Join-Path $rootDir "catalogs/plugin-dispatch-matrix.json"

if (-not (Test-Path $catalogPath)) {
    Write-Error "Catalog not found at $catalogPath"
    exit 1
}

$cleanPrompt = $Prompt.ToLower().Trim()

# Default Multi-Plugin Mapping
$profile = "general-engineering"
$profileTitle = "General Engineering & Architecture"
$leadPlugin = "superpowers"
$leadPluginRole = "Disciplined TDD Engineering & Clean Seams"
$collaboratingPlugins = @("ECC", "agents-md", "claude-mem")
$primarySkills = @("prime", "codebase-design", "test-driven-development")
$recommendedAgents = @("code-architect", "code-reviewer", "tdd-guide")
$workflowSteps = @(
    "1. [claude-mem] Inspect past architectural context and conventions",
    "2. [superpowers:codebase-design] Design deep module boundaries and clean seams",
    "3. [superpowers:test-driven-development] Apply Red-Green-Refactor TDD cycle (Iron Law)",
    "4. [ECC:code-reviewer] Verify correctness and execute quality review"
)

# Rule-based Profile Matching
if ($cleanPrompt -match 'analyze.*project|identify.*problem|health.*check|audit.*fix|find.*bugs.*fix') {
    $profile = "health-and-repair"
    $profileTitle = "Full-System Audit & Autonomous Auto-Repair"
    $leadPlugin = "superpowers + ECC"
    $leadPluginRole = "Full-System Exploration, Defect Detection & Surgical TDD Fixes"
    $collaboratingPlugins = @("agent-peer-review", "claude-mem", "agents-md")
    $primarySkills = @("prime", "systematic-debugging", "test-driven-development", "verification-before-completion", "codebase-design")
    $recommendedAgents = @("code-explorer", "code-reviewer", "silent-failure-hunter", "build-error-resolver", "refactor-cleaner")
    $workflowSteps = @(
        "1. [ECC:code-explorer] Deep scan: Inspect directory tree, manifests, and recent commits",
        "2. [superpowers:codebase-design] Structural audit: Detect Fowler smells (feature envy, shotgun surgery)",
        "3. [ECC:build-error-resolver] Static & runtime checks: Run linters, compilers, and test suites",
        "4. [superpowers:systematic-debugging] Root cause formulation: Isolate failure triggers",
        "5. [superpowers:test-driven-development] Surgical TDD fixes: Write failing test first, then implement green fix",
        "6. [agent-peer-review] Dual-axis verification: Verify both repo standards and spec compliance",
        "7. [claude-mem] Persist resolved defects and new architectural invariants"
    )
}
elseif ($cleanPrompt -match 'build|create|implement|add feature|develop|new api|endpoint') {
    $profile = "feature-development"
    $profileTitle = "Autonomous Feature Implementation"
    $leadPlugin = "superpowers"
    $leadPluginRole = "Test-Driven Feature Development & Interface Depth"
    $collaboratingPlugins = @("ECC", "awesome-claude-plugins", "claude-mem")
    $primarySkills = @("prime", "brainstorming", "codebase-design", "test-driven-development", "verification-loop")
    $recommendedAgents = @("planner", "code-architect", "tdd-guide", "doc-updater")
    $workflowSteps = @(
        "1. [superpowers:brainstorming] Restate requirements and establish acceptance criteria",
        "2. [ECC:code-architect] Design deep module boundaries, data flow, and file layout",
        "3. [superpowers:test-driven-development] Execute Red-Green-Refactor TDD cycle for all logic",
        "4. [superpowers:verification-before-completion] Run regression suite and verify documentation"
    )
}
elseif ($cleanPrompt -match 'fix|bug|defect|error|exception|crash|failing|broken') {
    $profile = "defect-resolution"
    $profileTitle = "Defect Resolution & Root Cause Debugging"
    $leadPlugin = "superpowers"
    $leadPluginRole = "Systematic 4-Phase Root Cause Investigation & Reproduction"
    $collaboratingPlugins = @("ECC", "claude-mem")
    $primarySkills = @("prime", "systematic-debugging", "test-driven-development", "verification-before-completion")
    $recommendedAgents = @("build-error-resolver", "silent-failure-hunter", "code-reviewer")
    $workflowSteps = @(
        "1. [superpowers:systematic-debugging] Problem statement & root cause analysis",
        "2. [superpowers:test-driven-development] Write failing reproduction test (Iron Law)",
        "3. [ECC:build-error-resolver] Implement minimal surgical fix to pass test",
        "4. [superpowers:verification-before-completion] Confirm all tests green with clean logs"
    )
}
elseif ($cleanPrompt -match 'review|audit|diff|pr |pull request|compare against spec|standards') {
    $profile = "code-review"
    $profileTitle = "Dual-Axis Code Review & Security Audit"
    $leadPlugin = "agent-peer-review"
    $leadPluginRole = "Symmetric Blind-Pass Review & Per-Issue Stance Debate"
    $collaboratingPlugins = @("ECC", "agents-md")
    $primarySkills = @("prime", "code-review", "codex-peer-review", "security-review")
    $recommendedAgents = @("code-reviewer", "security-reviewer", "codex-peer-reviewer")
    $workflowSteps = @(
        "1. [agent-peer-review] Round 0: Blind independent pass on staged/unstaged diff",
        "2. [agent-peer-review] Standards axis: Review against coding standards and code smell baselines",
        "3. [agent-peer-review] Spec axis: Review against user requirements and acceptance criteria",
        "4. [ECC:security-reviewer] Security scan: Check for OWASP Top 10 vulnerabilities",
        "5. [agent-peer-review] Synthesize converged, unmasked verdict"
    )
}
elseif ($cleanPrompt -match 'browser|web test|click|form|scrape|screenshot|ui test|e2e') {
    $profile = "browser-automation"
    $profileTitle = "Browser Automation & Web QA"
    $leadPlugin = "agent-browser"
    $leadPluginRole = "CDP Native Browser Automation & Visual Proof Verification"
    $collaboratingPlugins = @("ECC", "superpowers")
    $primarySkills = @("prime", "agent-browser")
    $recommendedAgents = @("e2e-runner", "frontend-patterns")
    $workflowSteps = @(
        "1. [agent-browser] Verify browser availability and start headless CDP session",
        "2. [agent-browser] Inspect accessibility tree snapshot with compact @eN element refs",
        "3. [agent-browser] Execute user interactions (click, fill form, navigate)",
        "4. [agent-browser] Capture screenshot and visual regression proof"
    )
}
elseif ($cleanPrompt -match 'ui|ux|design|aesthetic|frontend beauty|dark mode') {
    $profile = "ui-ux-design"
    $profileTitle = "World-Class UI/UX Design & Aesthetic Polish"
    $leadPlugin = "awesome-claude-plugins"
    $leadPluginRole = "UI/UX Pro Max & Impeccable Design Standards"
    $collaboratingPlugins = @("ECC", "superpowers", "agent-browser")
    $primarySkills = @("prime", "frontend-patterns", "awesome-plugins-guide")
    $recommendedAgents = @("frontend-patterns", "e2e-runner")
    $workflowSteps = @(
        "1. [awesome-claude-plugins] Consult curated color palettes, typography (Inter/Outfit), and dark modes",
        "2. [superpowers] Build modular accessible components with clean seams",
        "3. [awesome-claude-plugins] Add fluid micro-interactions, transitions, and hover states",
        "4. [agent-browser] Visually verify responsive viewports (desktop, tablet, mobile)"
    )
}
elseif ($cleanPrompt -match 'find skill|search skill|is there a skill|how do i') {
    $profile = "skill-discovery"
    $profileTitle = "Agent Skills Ecosystem Discovery"
    $leadPlugin = "agentic-awesome-skills & antigravity-awesome-skills"
    $leadPluginRole = "3,000+ Skills Catalog Search & Ecosystem Recommendation"
    $collaboratingPlugins = @("awesome-claude-plugins")
    $primarySkills = @("prime", "find-skills", "awesome-plugins-guide")
    $recommendedAgents = @("docs-lookup")
    $workflowSteps = @(
        "1. [agentic-skills] Search local 3,000+ skills catalog in catalogs/",
        "2. [find-skills] Query skills.sh leaderboard and reputable sources",
        "3. [awesome-plugins] Match top-rated, safe, battle-tested options with install commands"
    )
}
elseif ($cleanPrompt -match 'caveman|less token|brief|terse') {
    $profile = "high-density-caveman"
    $profileTitle = "High-Density Communication Mode"
    $leadPlugin = "prime/caveman"
    $leadPluginRole = "Ultra-Compressed Token-Efficient Output"
    $collaboratingPlugins = @("superpowers")
    $primarySkills = @("prime", "caveman")
    $recommendedAgents = @("code-simplifier")
    $workflowSteps = @(
        "1. [caveman] Strip conversational filler, greetings, and narration",
        "2. [caveman] Maintain 100% technical rigor and code exactness"
    )
}

# Language Specialist Detection (ECC)
$matchedLanguageAgents = @()
if ($cleanPrompt -match 'python|django|fastapi|flask|pandas|numpy|pytest') {
    $matchedLanguageAgents += @("python-reviewer", "fastapi-reviewer", "django-reviewer")
    if (-not ($collaboratingPlugins -contains "ECC")) { $collaboratingPlugins += "ECC" }
}
if ($cleanPrompt -match 'typescript|javascript|react|vue|nextjs|node|npm') {
    $matchedLanguageAgents += @("typescript-reviewer", "react-reviewer", "vue-reviewer", "react-build-resolver")
    if (-not ($collaboratingPlugins -contains "ECC")) { $collaboratingPlugins += "ECC" }
}
if ($cleanPrompt -match 'rust|cargo') {
    $matchedLanguageAgents += @("rust-reviewer", "rust-build-resolver")
    if (-not ($collaboratingPlugins -contains "ECC")) { $collaboratingPlugins += "ECC" }
}
if ($cleanPrompt -match 'golang|go lang|go\b') {
    $matchedLanguageAgents += @("go-reviewer", "go-build-resolver")
    if (-not ($collaboratingPlugins -contains "ECC")) { $collaboratingPlugins += "ECC" }
}
if ($cleanPrompt -match 'flutter|dart') {
    $matchedLanguageAgents += @("flutter-reviewer", "dart-build-resolver")
    if (-not ($collaboratingPlugins -contains "ECC")) { $collaboratingPlugins += "ECC" }
}
if ($cleanPrompt -match 'java\b|springboot|gradle|maven') {
    $matchedLanguageAgents += @("java-reviewer", "java-build-resolver")
    if (-not ($collaboratingPlugins -contains "ECC")) { $collaboratingPlugins += "ECC" }
}
if ($cleanPrompt -match 'kotlin') {
    $matchedLanguageAgents += @("kotlin-reviewer", "kotlin-build-resolver")
    if (-not ($collaboratingPlugins -contains "ECC")) { $collaboratingPlugins += "ECC" }
}
if ($cleanPrompt -match 'c\+\+|cpp|clang') {
    $matchedLanguageAgents += @("cpp-reviewer", "cpp-build-resolver")
    if (-not ($collaboratingPlugins -contains "ECC")) { $collaboratingPlugins += "ECC" }
}
if ($cleanPrompt -match 'c#|csharp|\.net|dotnet') {
    $matchedLanguageAgents += @("csharp-reviewer")
    if (-not ($collaboratingPlugins -contains "ECC")) { $collaboratingPlugins += "ECC" }
}
if ($cleanPrompt -match 'swift|ios|xcode') {
    $matchedLanguageAgents += @("swift-reviewer", "swift-build-resolver")
    if (-not ($collaboratingPlugins -contains "ECC")) { $collaboratingPlugins += "ECC" }
}

$allAgents = ($recommendedAgents + $matchedLanguageAgents) | Select-Object -Unique

$result = [PSCustomObject]@{
    profile = $profile
    profileTitle = $profileTitle
    prompt = $Prompt
    leadPlugin = $leadPlugin
    leadPluginRole = $leadPluginRole
    collaboratingPlugins = $collaboratingPlugins
    primarySkills = $primarySkills
    recommendedAgents = $allAgents
    workflow = $workflowSteps
    ironLawTdd = "NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST"
}

if ($Json) {
    $result | ConvertTo-Json -Depth 5
} else {
    Write-Output "================================================================="
    Write-Output " PRIME MULTI-PLUGIN DISPATCHER: $profileTitle"
    Write-Output "================================================================="
    Write-Output "Target Profile:         $profile"
    Write-Output "Lead Plugin:            $leadPlugin ($leadPluginRole)"
    Write-Output "Collaborating Plugins:  $($collaboratingPlugins -join ', ')"
    Write-Output "Specialist Agents:      $($allAgents -join ', ')"
    Write-Output "Active Skills:          $($primarySkills -join ', ')"
    Write-Output "Iron Law Standard:      NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST"
    Write-Output ""
    Write-Output "Specialized Collaborative Pipeline:"
    foreach ($step in $workflowSteps) {
        Write-Output "  $step"
    }
    Write-Output "================================================================="
}
