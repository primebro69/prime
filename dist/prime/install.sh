#!/usr/bin/env bash
# Prime Universal Automated Installer (Linux & macOS)
# Can be executed locally: ./install.sh
# Or remotely: curl -fsSL https://raw.githubusercontent.com/<user>/<repo>/main/install.sh | bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$SCRIPT_DIR"

echo "================================================================="
echo " INSTALLING PRIME AUTONOMOUS AI PLATFORM (UNIX/MACOS)"
echo "================================================================="

# 1. Target Directories
PRIME_HOME="$HOME/.prime"
PRIME_BIN="$PRIME_HOME/bin"
GLOBAL_ANTIGRAVITY="$HOME/.gemini/config/plugins/prime"
GLOBAL_SKILL="$HOME/.gemini/config/skills/prime"
GLOBAL_CLAUDE="$HOME/.claude/plugins/prime"
LOCAL_BIN="$HOME/.local/bin"

mkdir -p "$PRIME_HOME" "$PRIME_BIN" "$GLOBAL_ANTIGRAVITY" "$GLOBAL_SKILL" "$GLOBAL_CLAUDE" "$LOCAL_BIN"

# 2. Deploy Platform Files
echo "--> Deploying Prime Core Engine & 82 Specialist Agents..."
DIST_SOURCE="$ROOT_DIR/dist/prime"
if [ ! -d "$DIST_SOURCE" ]; then
    DIST_SOURCE="$ROOT_DIR"
fi

cp -R "$DIST_SOURCE"/* "$GLOBAL_ANTIGRAVITY/" 2>/dev/null || true
if [ -f "$ROOT_DIR/skills/prime/SKILL.md" ]; then
    cp "$ROOT_DIR/skills/prime/SKILL.md" "$GLOBAL_SKILL/"
fi
cp -R "$DIST_SOURCE"/* "$GLOBAL_CLAUDE/" 2>/dev/null || true

# 3. CLI Executable
echo "--> Installing CLI Executables..."
if [ -f "$ROOT_DIR/bin/prime" ]; then
    cp "$ROOT_DIR/bin/prime" "$PRIME_BIN/prime"
    chmod +x "$PRIME_BIN/prime"
    cp "$ROOT_DIR/bin/prime" "$LOCAL_BIN/prime"
    chmod +x "$LOCAL_BIN/prime"
fi

# 4. PATH Verification
if [[ ":$PATH:" != *":$LOCAL_BIN:"* ]] && [[ ":$PATH:" != *":$PRIME_BIN:"* ]]; then
    echo "Notice: Add $LOCAL_BIN or $PRIME_BIN to your PATH in ~/.bashrc or ~/.zshrc:"
    echo 'export PATH="$HOME/.local/bin:$HOME/.prime/bin:$PATH"'
fi

echo "================================================================="
echo " PRIME INSTALLATION COMPLETED SUCCESSFULLY!"
echo "================================================================="
echo "Available in all coding agents and terminal:"
echo "  • Slash Command in Antigravity / Claude Code: /prime <task>"
echo "  • In Cursor / Windsurf / Roo Code: /prime <task>"
echo "  • In Terminal: prime <task>"
echo "================================================================="
