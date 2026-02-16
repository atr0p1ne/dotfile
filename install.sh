#!/usr/bin/env bash
set -e

log() { printf "[INFO] %s\n" "$1"; }

detect_os() {
  if [ "$(uname)" = "Darwin" ]; then
    echo "macos"
    return
  fi

  if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "$ID"
    return
  fi

  echo "unknown"
}

install_stow() {
  if command -v stow >/dev/null 2>&1; then
    log "stow already installed"
    return
  fi

  os=$(detect_os)
  log "Detected OS: $os"

  case "$os" in
  arch)
    sudo pacman -Sy --needed stow
    ;;
  macos)
    if ! command -v brew >/dev/null 2>&1; then
      echo "Homebrew not found. Install brew first."
      exit 1
    fi
    brew install stow
    ;;
  *)
    echo "Unsupported OS. Install stow manually."
    exit 1
    ;;
  esac
}

main() {
  install_stow
  stow -d config -t "$HOME" -R nvim tmux zsh
  log "Done."
}

main "$@"
