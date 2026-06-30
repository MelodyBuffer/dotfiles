#!/usr/bin/env bash
# Dotfiles installer
# Usage: ./install.sh

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Dotfiles location
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.config/dotfiles.backup"

log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Backup and symlink function
backup_and_link() {
    local src="$1"
    local dst="$2"
    local basename basename

    basename=$(basename "$dst")

    if [ -e "$dst" ] || [ -L "$dst" ]; then
        log_warn "Backing up existing $basename to $BACKUP_DIR/"
        cp -f "$dst" "$BACKUP_DIR/$basename" 2>/dev/null || true
        rm -rf "$dst"
    fi

    log_info "Creating symlink: $dst -> $src"
    ln -s "$src" "$dst"
}

# Detect OS
case "$(uname -s)" in
    Linux*)  PLATFORM="linux" ;;
    Darwin*) PLATFORM="macos" ;;
    *)       log_error "Unsupported platform"; exit 1 ;;
esac

log_info "Detected platform: $PLATFORM"

# Install bash config
if [ -f "$DOTFILES_DIR/bash/bashrc" ]; then
    backup_and_link "$DOTFILES_DIR/bash/bashrc" "$HOME/.bashrc"
    log_info "Installed bash config"
fi

# Install zsh config
if [ -f "$DOTFILES_DIR/zsh/zshrc" ]; then
    backup_and_link "$DOTFILES_DIR/zsh/zshrc" "$HOME/.zshrc"
    log_info "Installed zsh config"
fi

log_info "Done! Restart your shell to apply changes."
