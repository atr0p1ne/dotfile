#!/usr/bin/env bash
set -e

log() { printf "[INFO] %s\n" "$1"; }
warn() { printf "[WARN] %s\n" "$1"; }

DRY_RUN=0

usage() {
  cat <<USAGE
Usage: $0 [--dry-run|-n]

Options:
  -n, --dry-run    Preview stow changes without modifying files
USAGE
}

parse_args() {
  while [ $# -gt 0 ]; do
    case "$1" in
    -n | --dry-run)
      DRY_RUN=1
      ;;
    -h | --help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      usage
      exit 1
      ;;
    esac
    shift
  done
}

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
  debian | ubuntu)
    sudo apt update
    sudo apt install -y stow
    ;;
  fedora)
    sudo dnf install -y stow
    ;;
  *)
    echo "Unsupported OS. Install stow manually."
    exit 1
    ;;
  esac
}

stow_packages() {
  default_packages=(nvim tmux zsh)
  available_packages=()

  for pkg in "${default_packages[@]}"; do
    if [ -d "config/$pkg" ]; then
      available_packages+=("$pkg")
    else
      warn "Skipping missing package: config/$pkg"
    fi
  done

  if [ ${#available_packages[@]} -eq 0 ]; then
    echo "No stow packages found under config/."
    exit 1
  fi

  stow_args=(-d config -t "$HOME" -R)
  if [ "$DRY_RUN" -eq 1 ]; then
    stow_args+=(-n -v)
    log "Running in dry-run mode"
  fi

  log "Stowing packages: ${available_packages[*]}"
  stow "${stow_args[@]}" "${available_packages[@]}"
}

main() {
  parse_args "$@"
  install_stow
  stow_packages
  log "Done."
}

main "$@"
