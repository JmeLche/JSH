#!/bin/sh
set -e

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$HOME/.config/jsh/current" "$HOME/.config/jsh/backups" "$HOME/.local/bin"

cp "$ROOT_DIR/platforms/mac.zsh" "$HOME/.config/jsh/current/mac.zsh"
cp "$ROOT_DIR/platforms/mac.zsh" "$HOME/.config/jsh/current/mac.zsh.default"
cp "$ROOT_DIR/bin/jsh" "$HOME/.local/bin/jsh"

chmod +x "$HOME/.local/bin/jsh"

grep -q 'source ~/.config/jsh/current/mac.zsh' "$HOME/.zshrc" 2>/dev/null || \
echo 'source ~/.config/jsh/current/mac.zsh' >> "$HOME/.zshrc"

echo "✓ JSH installed"
