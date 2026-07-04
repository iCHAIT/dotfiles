#!/bin/sh
# Set up a machine from these dotfiles. Safe to re-run.
DIR=$(cd "$(dirname "$0")" && pwd)

# Homebrew
if ! command -v brew >/dev/null 2>&1; then
	echo "Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Tools the zsh config expects
brew install starship zoxide eza bat git-lfs

# Git
ln -sf "$DIR/git/gitconfig" ~/.gitconfig
ln -sf "$DIR/git/gitignore_global" ~/.gitignore_global

# Zsh
ln -sf "$DIR/zsh/zshrc" ~/.zshrc

# Starship prompt
mkdir -p ~/.config
ln -sf "$DIR/starship/starship.toml" ~/.config/starship.toml

# Ghostty terminal
mkdir -p ~/.config/ghostty
ln -sf "$DIR/ghostty/config" ~/.config/ghostty/config

# Claude Code (global settings, memory, statusline)
mkdir -p ~/.claude
ln -sf "$DIR/claude/CLAUDE.md" ~/.claude/CLAUDE.md
ln -sf "$DIR/claude/settings.json" ~/.claude/settings.json
ln -sf "$DIR/claude/statusline-command.sh" ~/.claude/statusline-command.sh

# VS Code
VSCODE_USER="$HOME/Library/Application Support/Code/User"
mkdir -p "$VSCODE_USER"
ln -sf "$DIR/vscode/settings.json" "$VSCODE_USER/settings.json"
ln -sf "$DIR/vscode/keybindings.json" "$VSCODE_USER/keybindings.json"

echo "Done. Open a new terminal to load the shell config."
