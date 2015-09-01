DIR=$(cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd )

# Git
ln -f $DIR/git/gitconfig ~/.gitconfig

# Sublime
# /Users/chaitanyagupta/Library/Application Support/Sublime Text 3/Packages
ln -f $DIR/bash/bash_profile ~/.bash_profile
ln -f $DIR/bash/bashrc ~/.bashrc