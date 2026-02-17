# Dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## What this repo manages

Current stow packages in this repo are stored under `config/<package>` and include:

- `zsh`
- `nvim` (if present)
- `tmux` (if present)

## Prerequisites

- `git`
- `stow`
- `zsh` (for shell config)
- [Oh My Zsh](https://ohmyz.sh/) at `~/.local/share/oh-my-zsh`
- Zsh plugins used by `.zshrc`:
  - `zsh-syntax-highlighting`
  - `zsh-autosuggestions`
  - `zsh-completions`

Also recommended for aliases in `.zsh_aliases`:

- `lsd`, `tree`, `bat`, `trash-cli`, `rsync`, `lsof`

## Install

```bash
./install.sh
```

The installer will:

1. Detect OS
2. Install `stow` when possible
3. Stow available packages from `config/` into `$HOME`

## Dry run (preview symlinks)

```bash
./install.sh --dry-run
```

This runs `stow` in no-op mode to preview changes without writing symlinks.

## Supported OS auto-install for stow

- Arch Linux (`pacman`)
- macOS (`brew`)
- Debian/Ubuntu (`apt`)
- Fedora (`dnf`)

On unsupported systems, install `stow` manually and rerun the script.

## Local overrides (not committed)

`.zshrc` will source these files if present:

- `~/.zshrc.local`
- `~/.config/zsh/local.zsh`

Use those for machine-specific secrets or settings.

## Uninstall / rollback

From this repo root:

```bash
stow -d config -t "$HOME" -D zsh nvim tmux
```

Only include package names that exist in your `config/` directory.
