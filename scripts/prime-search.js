#!/usr/bin/env node
/**
 * Prime Catalog Search Tool (Node.js engine)
 */
const fs = require('fs');
const path = require('path');

const rootDir = path.resolve(__dirname, '..');
const antiPath = path.join(rootDir, 'catalogs', 'skills-index-antigravity.json');
const agenticPath = path.join(rootDir, 'catalogs', 'skills-index-agentic.json');

const args = process.argv.slice(2);
const query = args.filter(a => !a.startsWith('--')).join(' ').toLowerCase().trim();
const limitIndex = args.indexOf('--limit');
const limit = limitIndex !== -1 && args[limitIndex + 1] ? parseInt(args[limitIndex + 1], 10) : 10;
const isJson = args.includes('--json');

if (!query) {
  console.log('Usage: prime-search <query> [--limit N] [--json]');
  process.exit(1);
}

let allSkills = [];

if (fs.existsSync(antiPath)) {
  try {
    const data = JSON.parse(fs.readFileSync(antiPath, 'utf8'));
    data.forEach(s => allSkills.push({ ...s, catalog: 'antigravity' }));
  } catch (e) {}
}

if (fs.existsSync(agenticPath)) {
  try {
    const data = JSON.parse(fs.readFileSync(agenticPath, 'utf8'));
    data.forEach(s => allSkills.push({ ...s, catalog: 'agentic-core' }));
  } catch (e) {}
}

const results = [];
allSkills.forEach(s => {
  let score = 0;
  if (s.name && s.name.toLowerCase().includes(query)) score += 10;
  if (s.category && s.category.toLowerCase().includes(query)) score += 5;
  if (s.description && s.description.toLowerCase().includes(query)) score += 2;
  if (score > 0) results.push({ ...s, score });
});

results.sort((a, b) => b.score - a.score);
const top = results.slice(0, limit);

if (isJson) {
  console.log(JSON.stringify(top, null, 2));
} else {
  console.log(`Found ${results.length} matching skills for query '${query}' (showing top ${top.length}):`);
  console.log('----------------------------------------------------------------------------------');
  top.forEach(r => {
    console.log(`[${r.catalog.toUpperCase()}] ${r.name} (${r.category})`);
    const shortDesc = r.description ? (r.description.length > 100 ? r.description.slice(0, 100) + '...' : r.description) : '';
    console.log(`  ${shortDesc}\n`);
  });
}
