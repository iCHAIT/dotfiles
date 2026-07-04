DIR=$(cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd )

# Git
ln -f $DIR/git/gitconfig ~/.gitconfig

# Zsh
# wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
rm ~/.zshrc
ln -sf $DIR/zsh/zshrc ~/.zshrc

# fish
rm ~/.config/fish/config.fish
ln -sf $DIR/fish/config.fish  ~/.config/fish/config.fish

# Claude Code (global settings, memory, statusline)
mkdir -p ~/.claude
ln -sf $DIR/claude/CLAUDE.md              ~/.claude/CLAUDE.md
ln -sf $DIR/claude/settings.json         ~/.claude/settings.json
ln -sf $DIR/claude/statusline-command.sh ~/.claude/statusline-command.sh