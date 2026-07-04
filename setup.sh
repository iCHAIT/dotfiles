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

# Claude Code (global settings, memory, statusline)
mkdir -p ~/.claude
ln -sf "$DIR/claude/CLAUDE.md" ~/.claude/CLAUDE.md
ln -sf "$DIR/claude/settings.json" ~/.claude/settings.json
ln -sf "$DIR/claude/statusline-command.sh" ~/.claude/statusline-command.sh

echo "Done. Open a new terminal to load the shell config."
