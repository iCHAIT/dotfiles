# dotfiles

My dot files shared between machines for ZSH, Claude, git, macOS etc

## Setup on a new machine

```sh
git clone https://github.com/iCHAIT/dotfiles.git ~/Documents/Code/dotfiles
cd ~/Documents/Code/dotfiles
sh setup.sh
```

`setup.sh` installs Homebrew (if missing), the CLI tools the shell expects
(`starship`, `zoxide`, `eza`, `bat`, `git-lfs`), and the apps this repo
configures (Ghostty, VS Code), then symlinks the configs into your home
directory and reinstalls VS Code extensions. Safe to re-run. Edit files here
and changes apply live; commit and push to sync across machines.

## Fonts

VS Code and Ghostty both use **JetBrains Mono**, installed automatically by
`setup.sh` via `brew install --cask font-jetbrains-mono`. The VS Code config
lists `SF Mono` / `Monaco` as fallbacks if it's ever missing.
