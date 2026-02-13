# ----- Oh My Zsh installation directory --------------------------------------
export ZSH="$HOME/.local/share/oh-my-zsh"

# ----- Theme -----------------------------------------------------------------
ZSH_THEME="robbyrussell"

# ----- Oh-My-Zsh Update ------------------------------------------------------
# --- Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode auto

# --- Uncomment the following line to change how often to auto-update (in days)
zstyle ':omz:update' frequency 7

# ----- Plugins ---------------------------------------------------------------
plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-completions)

# ----- Oh My Zsh installation ------------------------------------------------
source $ZSH/oh-my-zsh.sh

# ----- Package management helpers (Arch Linux) -------------------------------
if [[ -f /etc/arch-release ]]; then
  # command-not-found support via pkgfile
  if [[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]]; then
    source /usr/share/doc/pkgfile/command-not-found.zsh
  fi
fi

# ----- Load custom aliases ---------------------------------------------------
if [ -f $HOME/.zsh_aliases ]; then
    source $HOME/.zsh_aliases
fi

# ----- Misc ------------------------------------------------------------------
# ---- Language environment
export LANG=en_US.UTF-8

# ----- Local Overrides -------------------------------------------------------
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
[ -f "$HOME/.config/zsh/local.zsh" ] && source "$HOME/.config/zsh/local.zsh"
