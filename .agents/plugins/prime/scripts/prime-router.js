#!/usr/bin/env node
/**
 * Prime Multi-Plugin Dynamic Dispatch & Autonomous Router (Node.js engine)
 */
const fs = require('fs');
const path = require('path');

const rootDir = path.resolve(__dirname, '..');
const catalogPath = path.join(rootDir, 'catalogs', 'prime-agent-directory.json');

const args = process.argv.slice(2);
const isJson = args.includes('--json');
const promptArg = args.filter(a => a !== '--json').join(' ').toLowerCase().trim();

let profile = 'general-engineering';
let profileTitle = 'General Engineering & Architecture';
let leadPlugin = 'superpowers';
let leadPluginRole = 'Disciplined TDD Engineering & Clean Seams';
let collaboratingPlugins = ['ECC', 'agents-md', 'claude-mem'];
let primarySkills = ['prime', 'codebase-design', 'test-driven-development'];
let recommendedAgents = ['code-architect', 'code-reviewer', 'tdd-guide'];
let workflow = [
  '1. [claude-mem] Inspect past architectural context and conventions',
  '2. [superpowers:codebase-design] Design deep module boundaries and clean seams',
  '3. [superpowers:test-driven-development] Apply Red-Green-Refactor TDD cycle (Iron Law)',
  '4. [ECC:code-reviewer] Verify correctness and execute quality review'
];

if (/analyze.*project|identify.*problem|health.*check|audit.*fix|find.*bugs.*fix/.test(promptArg)) {
  profile = 'health-and-repair';
  profileTitle = 'Full-System Audit & Autonomous Auto-Repair';
  leadPlugin = 'superpowers + ECC';
  leadPluginRole = 'Full-System Exploration, Defect Detection & Surgical TDD Fixes';
  collaboratingPlugins = ['agent-peer-review', 'claude-mem', 'agents-md'];
  primarySkills = ['prime', 'systematic-debugging', 'test-driven-development', 'verification-before-completion', 'codebase-design'];
  recommendedAgents = ['code-explorer', 'code-reviewer', 'silent-failure-hunter', 'build-error-resolver', 'refactor-cleaner'];
  workflow = [
    '1. [ECC:code-explorer] Deep scan: Inspect directory tree, manifests, and recent commits',
    '2. [superpowers:codebase-design] Structural audit: Detect Fowler smells (feature envy, shotgun surgery)',
    '3. [ECC:build-error-resolver] Static & runtime checks: Run linters, compilers, and test suites',
    '4. [superpowers:systematic-debugging] Root cause formulation: Isolate failure triggers',
    '5. [superpowers:test-driven-development] Surgical TDD fixes: Write failing test first, then implement green fix',
    '6. [agent-peer-review] Dual-axis verification: Verify both repo standards and spec compliance',
    '7. [claude-mem] Persist resolved defects and new architectural invariants'
  ];
} else if (/build|create|implement|add feature|develop|new api|endpoint/.test(promptArg)) {
  profile = 'feature-development';
  profileTitle = 'Autonomous Feature Implementation';
  leadPlugin = 'superpowers';
  leadPluginRole = 'Test-Driven Feature Development & Interface Depth';
  collaboratingPlugins = ['ECC', 'awesome-claude-plugins', 'claude-mem'];
  primarySkills = ['prime', 'brainstorming', 'codebase-design', 'test-driven-development', 'verification-loop'];
  recommendedAgents = ['planner', 'code-architect', 'tdd-guide', 'doc-updater'];
  workflow = [
    '1. [superpowers:brainstorming] Restate requirements and establish acceptance criteria',
    '2. [ECC:code-architect] Design deep module boundaries, data flow, and file layout',
    '3. [superpowers:test-driven-development] Execute Red-Green-Refactor TDD cycle for all logic',
    '4. [superpowers:verification-before-completion] Run regression suite and verify documentation'
  ];
} else if (/fix|bug|defect|error|exception|crash|failing|broken/.test(promptArg)) {
  profile = 'defect-resolution';
  profileTitle = 'Defect Resolution & Root Cause Debugging';
  leadPlugin = 'superpowers';
  leadPluginRole = 'Systematic 4-Phase Root Cause Investigation & Reproduction';
  collaboratingPlugins = ['ECC', 'claude-mem'];
  primarySkills = ['prime', 'systematic-debugging', 'test-driven-development', 'verification-before-completion'];
  recommendedAgents = ['build-error-resolver', 'silent-failure-hunter', 'code-reviewer'];
  workflow = [
    '1. [superpowers:systematic-debugging] Problem statement & root cause analysis',
    '2. [superpowers:test-driven-development] Write failing reproduction test (Iron Law)',
    '3. [ECC:build-error-resolver] Implement minimal surgical fix to pass test',
    '4. [superpowers:verification-before-completion] Confirm all tests green with clean logs'
  ];
} else if (/review|audit|diff|pr |pull request|compare against spec|standards/.test(promptArg)) {
  profile = 'code-review';
  profileTitle = 'Dual-Axis Code Review & Security Audit';
  leadPlugin = 'agent-peer-review';
  leadPluginRole = 'Symmetric Blind-Pass Review & Per-Issue Stance Debate';
  collaboratingPlugins = ['ECC', 'agents-md'];
  primarySkills = ['prime', 'code-review', 'codex-peer-review', 'security-review'];
  recommendedAgents = ['code-reviewer', 'security-reviewer', 'codex-peer-reviewer'];
  workflow = [
    '1. [agent-peer-review] Round 0: Blind independent pass on staged/unstaged diff',
    '2. [agent-peer-review] Standards axis: Review against coding standards and code smell baselines',
    '3. [agent-peer-review] Spec axis: Review against user requirements and acceptance criteria',
    '4. [ECC:security-reviewer] Security scan: Check for OWASP Top 10 vulnerabilities',
    '5. [agent-peer-review] Synthesize converged, unmasked verdict'
  ];
} else if (/browser|web test|click|form|scrape|screenshot|ui test|e2e/.test(promptArg)) {
  profile = 'browser-automation';
  profileTitle = 'Browser Automation & Web QA';
  leadPlugin = 'agent-browser';
  leadPluginRole = 'CDP Native Browser Automation & Visual Proof Verification';
  collaboratingPlugins = ['ECC', 'superpowers'];
  primarySkills = ['prime', 'agent-browser'];
  recommendedAgents = ['e2e-runner', 'frontend-patterns'];
  workflow = [
    '1. [agent-browser] Verify browser availability and start headless CDP session',
    '2. [agent-browser] Inspect accessibility tree snapshot with compact @eN element refs',
    '3. [agent-browser] Execute user interactions (click, fill form, navigate)',
    '4. [agent-browser] Capture screenshot and visual regression proof'
  ];
} else if (/ui|ux|design|aesthetic|frontend beauty|dark mode/.test(promptArg)) {
  profile = 'ui-ux-design';
  profileTitle = 'World-Class UI/UX Design & Aesthetic Polish';
  leadPlugin = 'awesome-claude-plugins';
  leadPluginRole = 'UI/UX Pro Max & Impeccable Design Standards';
  collaboratingPlugins = ['ECC', 'superpowers', 'agent-browser'];
  primarySkills = ['prime', 'frontend-patterns', 'awesome-plugins-guide'];
  recommendedAgents = ['frontend-patterns', 'e2e-runner'];
  workflow = [
    '1. [awesome-claude-plugins] Consult curated color palettes, typography (Inter/Outfit), and dark modes',
    '2. [superpowers] Build modular accessible components with clean seams',
    '3. [awesome-claude-plugins] Add fluid micro-interactions, transitions, and hover states',
    '4. [agent-browser] Visually verify responsive viewports (desktop, tablet, mobile)'
  ];
} else if (/find skill|search skill|is there a skill|how do i/.test(promptArg)) {
  profile = 'skill-discovery';
  profileTitle = 'Agent Skills Ecosystem Discovery';
  leadPlugin = 'agentic-awesome-skills & antigravity-awesome-skills';
  leadPluginRole = '3,000+ Skills Catalog Search & Ecosystem Recommendation';
  collaboratingPlugins = ['awesome-claude-plugins'];
  primarySkills = ['prime', 'find-skills', 'awesome-plugins-guide'];
  recommendedAgents = ['docs-lookup'];
  workflow = [
    '1. [agentic-skills] Search local 3,000+ skills catalog in catalogs/',
    '2. [find-skills] Query skills.sh leaderboard and reputable sources',
    '3. [awesome-plugins] Match top-rated, safe, battle-tested options with install commands'
  ];
}

const result = {
  profile,
  profileTitle,
  prompt: promptArg,
  leadPlugin,
  leadPluginRole,
  collaboratingPlugins,
  primarySkills,
  recommendedAgents,
  workflow,
  ironLawTdd: 'NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST'
};

if (isJson) {
  console.log(JSON.stringify(result, null, 2));
} else {
  console.log('=================================================================');
  console.log(` PRIME MULTI-PLUGIN DISPATCHER: ${profileTitle}`);
  console.log('=================================================================');
  console.log(`Target Profile:         ${profile}`);
  console.log(`Lead Plugin:            ${leadPlugin} (${leadPluginRole})`);
  console.log(`Collaborating Plugins:  ${collaboratingPlugins.join(', ')}`);
  console.log(`Specialist Agents:      ${recommendedAgents.join(', ')}`);
  console.log(`Active Skills:          ${primarySkills.join(', ')}`);
  console.log('Iron Law Standard:      NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST\n');
  console.log('Specialized Collaborative Pipeline:');
  workflow.forEach(w => console.log(`  ${w}`));
  console.log('=================================================================');
}
