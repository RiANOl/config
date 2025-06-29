#!/bin/zsh

set -euo pipefail

cd "$(dirname "$0")"

readonly BASE_DIR="$(pwd)"
readonly ZIM_HOME="$HOME/.zim"

create_symlink() {
    local source="$1"
    local target="$2"
    
    if [[ ! -L "$target" ]]; then
        [[ -f "$target" ]] && mv "$target" "${target}.bak"
        ln -s "$source" "$target"
    fi
}

setup_home_dotfiles() {
    if [[ ! -L "$HOME/.home" ]]; then
        ln -s "$BASE_DIR/home" "$HOME/.home"
    fi

    if [[ -d "$HOME/.home" ]]; then
        for file in "$HOME/.home"/*; do
            [[ -e "$file" ]] || continue
            local filename="$(basename "$file")"
            create_symlink ".home/$filename" "$HOME/$filename"
        done
    fi
}

setup_config_dotfiles() {
    if [[ ! -L "$HOME/.config/config" ]]; then
        ln -s "$BASE_DIR/config" "$HOME/.config/config"
    fi

    if [[ -d "$HOME/.config/config" ]]; then
        for file in "$HOME/.config/config"/*; do
            [[ -e "$file" ]] || continue
            local filename="$(basename "$file")"
            create_symlink "config/$filename" "$HOME/.config/$filename"
        done
    fi
}

setup_zim() {
    if [[ ! -e "$ZIM_HOME/zimfw.zsh" ]]; then
        curl -fsSL --create-dirs -o "$ZIM_HOME/zimfw.zsh" \
            https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
    fi
    
    if [[ ! "$ZIM_HOME/init.zsh" -nt "${ZDOTDIR:-$HOME}/.zimrc" ]]; then
        source "$ZIM_HOME/zimfw.zsh" init -q
    fi
}

main() {
    setup_home_dotfiles
    setup_config_dotfiles
    setup_zim
}

main "$@"
