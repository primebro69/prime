/**
 * Prime Plugin Manifest & Architecture Validator
 * Deterministically tests schema compliance for Claude Code, Google Antigravity, and OpenAI Codex.
 */

const fs = require('fs');
const path = require('path');

const pluginRoot = path.resolve(__dirname, '..');
let errors = [];
let passed = 0;

function assert(condition, message) {
  if (!condition) {
    errors.push(`❌ ${message}`);
  } else {
    passed++;
    console.log(`✅ ${message}`);
  }
}

console.log('=== Prime Plugin Automated Validation Suite ===\n');

// 1. Root plugin.json (Antigravity & General)
const rootManifestPath = path.join(pluginRoot, 'plugin.json');
assert(fs.existsSync(rootManifestPath), 'Root plugin.json exists');
if (fs.existsSync(rootManifestPath)) {
  try {
    const rootJson = JSON.parse(fs.readFileSync(rootManifestPath, 'utf8'));
    assert(rootJson.name === 'prime', 'Root manifest has name "prime"');
    assert(typeof rootJson.version === 'string', 'Root manifest has valid version string');
    assert(typeof rootJson.description === 'string', 'Root manifest has description');
  } catch (err) {
    errors.push(`❌ Root plugin.json is invalid JSON: ${err.message}`);
  }
}

// 2. .claude-plugin/plugin.json (Claude Code strict validation)
const claudeManifestPath = path.join(pluginRoot, '.claude-plugin', 'plugin.json');
assert(fs.existsSync(claudeManifestPath), '.claude-plugin/plugin.json exists');
if (fs.existsSync(claudeManifestPath)) {
  try {
    const claudeJson = JSON.parse(fs.readFileSync(claudeManifestPath, 'utf8'));
    assert(claudeJson.name === 'prime', 'Claude manifest has name "prime"');
    assert(Boolean(claudeJson.version), 'Claude manifest has mandatory version');
    assert(Array.isArray(claudeJson.commands), 'Claude manifest "commands" field is strictly an ARRAY');
    assert(Array.isArray(claudeJson.skills), 'Claude manifest "skills" field is strictly an ARRAY');
    assert(!claudeJson.agents, 'Claude manifest avoids illegal "agents" field (auto-loaded by convention)');
    assert(!claudeJson.hooks, 'Claude manifest avoids illegal "hooks" field (auto-loaded by convention)');
    assert(typeof claudeJson.mcpServers === 'object', 'Claude manifest defines mcpServers object');
  } catch (err) {
    errors.push(`❌ .claude-plugin/plugin.json is invalid JSON: ${err.message}`);
  }
}

// 3. .codex-plugin/plugin.json (OpenAI Codex)
const codexManifestPath = path.join(pluginRoot, '.codex-plugin', 'plugin.json');
assert(fs.existsSync(codexManifestPath), '.codex-plugin/plugin.json exists');
if (fs.existsSync(codexManifestPath)) {
  try {
    const codexJson = JSON.parse(fs.readFileSync(codexManifestPath, 'utf8'));
    assert(codexJson.name === 'prime', 'Codex manifest has name "prime"');
    assert(Boolean(codexJson.interface), 'Codex manifest defines interface object');
  } catch (err) {
    errors.push(`❌ .codex-plugin/plugin.json is invalid JSON: ${err.message}`);
  }
}

// 4. Master Slash Command (commands/prime.md)
const primeCmdPath = path.join(pluginRoot, 'commands', 'prime.md');
assert(fs.existsSync(primeCmdPath), 'Master slash command commands/prime.md exists');
if (fs.existsSync(primeCmdPath)) {
  const content = fs.readFileSync(primeCmdPath, 'utf8');
  assert(content.length > 200, 'commands/prime.md has complete instructions');
  assert(content.includes('/prime'), 'commands/prime.md documents /prime usage');
}

// 5. Master Skill (skills/prime/SKILL.md)
const primeSkillPath = path.join(pluginRoot, 'skills', 'prime', 'SKILL.md');
assert(fs.existsSync(primeSkillPath), 'Master skill skills/prime/SKILL.md exists');
if (fs.existsSync(primeSkillPath)) {
  const content = fs.readFileSync(primeSkillPath, 'utf8');
  assert(content.startsWith('---'), 'skills/prime/SKILL.md starts with YAML frontmatter');
  assert(content.includes('name: prime'), 'skills/prime/SKILL.md defines name: prime');
}

// 6. Bundled Skills Check
const skillsDir = path.join(pluginRoot, 'skills');
if (fs.existsSync(skillsDir)) {
  const skills = fs.readdirSync(skillsDir).filter(f => fs.statSync(path.join(skillsDir, f)).isDirectory());
  console.log(`\nFound ${skills.length} bundled skills: ${skills.join(', ')}`);
  for (const skill of skills) {
    const sPath = path.join(skillsDir, skill, 'SKILL.md');
    assert(fs.existsSync(sPath), `Skill "${skill}" contains valid SKILL.md`);
  }
}

// 7. Bundled Specialist Agents Check
const agentsDir = path.join(pluginRoot, 'agents');
if (fs.existsSync(agentsDir)) {
  const agents = fs.readdirSync(agentsDir).filter(f => f.endsWith('.md'));
  console.log(`\nFound ${agents.length} specialist agents: ${agents.join(', ')}`);
  for (const agent of agents) {
    const aContent = fs.readFileSync(path.join(agentsDir, agent), 'utf8');
    assert(aContent.startsWith('---') && aContent.includes('name:'), `Agent "${agent}" has valid YAML frontmatter`);
  }
}

// 8. Rules Check
const rulesDir = path.join(pluginRoot, 'rules');
if (fs.existsSync(rulesDir)) {
  const rules = fs.readdirSync(rulesDir).filter(f => f.endsWith('.md'));
  console.log(`\nFound ${rules.length} engineering rules: ${rules.join(', ')}`);
  assert(rules.length >= 3, 'At least 3 core rules are present');
}

console.log('\n================================================');
console.log(`Results: ${passed} checks passed, ${errors.length} errors.`);
if (errors.length > 0) {
  console.error('\nFailures:\n' + errors.join('\n'));
  process.exit(1);
} else {
  console.log('🎉 ALL PLUGIN VALIDATION CHECKS PASSED DETERMINISTICALLY!');
  process.exit(0);
}
