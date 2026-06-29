#!/bin/sh
mkdir -p "$HOME/.config/jsh/current" "$HOME/.config/jsh/backups" "$HOME/.local/bin"

cp platforms/mac.zsh "$HOME/.config/jsh/current/mac.zsh"
cp bin/jsh "$HOME/.local/bin/jsh"
chmod +x "$HOME/.local/bin/jsh"

grep -q 'source ~/.config/jsh/current/mac.zsh' "$HOME/.zshrc" || \
echo 'source ~/.config/jsh/current/mac.zsh' >> "$HOME/.zshrc"

echo "✓ JSH installed"
