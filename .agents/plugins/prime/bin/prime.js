#!/usr/bin/env node
/**
 * Prime Autonomous AI Platform CLI
 */
const { spawnSync } = require('child_process');
const path = require('path');

const scriptDir = path.resolve(__dirname, '..', 'scripts');
const routerScript = path.join(scriptDir, 'prime-router.js');

const args = process.argv.slice(2);
const res = spawnSync('node', [routerScript, ...args], { stdio: 'inherit' });
process.exit(res.status || 0);
