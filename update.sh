#!/bin/zsh

set -euo pipefail

readonly SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

update_config() {
    cd "$SCRIPT_DIR"
    echo "Updating configuration repository..."
    git pull origin "$(git branch --show-current)"
}

main() {
    update_config
    echo "Configuration updated successfully!"
}

main "$@"
