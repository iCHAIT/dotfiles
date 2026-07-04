# dotfiles

My dot files shared between machines for ZSH, Claude, git, macOS etc

## Setup on a new machine

```sh
git clone https://github.com/iCHAIT/dotfiles.git ~/Documents/Code/dotfiles
cd ~/Documents/Code/dotfiles
sh setup.sh
```

`setup.sh` installs Homebrew (if missing) and the CLI tools the shell expects
(`starship`, `zoxide`, `eza`, `bat`, `git-lfs`), then symlinks the configs into
your home directory. Safe to re-run. Edit files here and changes apply live;
commit and push to sync across machines.

## Fonts

Configs reference custom fonts not tracked in this repo. Install manually or
configs fall back to defaults:

- **Anka/Coder** (Ghostty terminal)
- **SF Mono** (VS Code) — bundled in macOS Terminal.app; copy
  `SF-Mono-*.otf` from its Resources/Fonts into `~/Library/Fonts/`

TODO: decide whether to vendor these fonts into the repo (`fonts/`) so
`setup.sh` can install them automatically.
