#!/bin/zsh

set -euo pipefail

readonly SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

update_config() {
    cd "$SCRIPT_DIR"
    git pull origin "$(git branch --show-current)"
}

main() {
    echo "Updating configuration repository..."
    update_config
    echo "Configuration updated successfully!"
}

main "$@"
