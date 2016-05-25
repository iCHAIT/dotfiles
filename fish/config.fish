# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme robbyrussell

# pipsi
set -x PATH /Users/chaitanyagupta/.local/bin $PATH
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins bundler z

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

set -x PATH /Users/chaitanyagupta/bin/Sencha/Cmd/5.1.2.52 $PATH

set -x PATH /Users/chaitanyagupta/bin/jruby/bin $PATH

set -x PATH /Library/Frameworks/Python.framework/Versions/2.7/bin $PATH

set -x SENCHA_CMD_3_0_0 /Users/chaitanyagupta/bin/Sencha/Cmd/5.1.2.52


#bower
set -x PATH /usr/local/bin/bower

#Go-lang
set -x GOPATH $HOME/Go/

#thefuck
function fuck -d 'Correct your previous console command'
    set -l exit_code $status
    set -l eval_script (mktemp 2>/dev/null ; or mktemp -t 'thefuck')
    set -l fucked_up_command $history[1]
    thefuck $fucked_up_command > $eval_script
    . $eval_script
    rm $eval_script
    if test $exit_code -ne 0
        history --delete $fucked_up_command
    end
end

# Aliases


# Python
alias py="python"
alias py2="python2"
alias py3="python3"

# Virtualenv
alias venv="virtualenv"

# autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and . /usr/local/share/autojump/autojump.fish

# fisher
for file in ~/.config/fish/conf.d/*.fish
    source $file
end

# powerline
# function fish_prompt
#     ~/powerline-shell.py $status --shell bare ^/dev/null
# end

# Serve a directory
alias pysrv="python3 -m http.server "

# ranger
alias r "ranger"

# ptpython

alias ptpy "ptpython"

# Quick Ping!
alias pingu="ping 8.8.8.8"

# postgresql
alias psqld "pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"

#subliminal
alias sub "subliminal -l en -- "

# go repo's
alias cheat "go/src/github.com/user/bin/cheat"
alias noti "go/src/github.com/user/bin/noti"


# Git

alias gs "git status"
alias gp "git push"
alias gpf "git push --force"
alias ga "git add"
alias gc "git commit"
alias gpl "git pull"
alias gdf "git diff"
alias gdc "git diff --cached"
alias gch "git checkout"
alias gr "git reset HEAD"

alias gl ""

alias gb "git branch"
alias grbi "git rebase -i master"

alias gst "git stash"
alias gstp "git stash pop"

alias gca "git commit --amend"
