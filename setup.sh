#!/usr/bin/env bash
# minimal setup — sources my aliases into the current shell rc
set -euo pipefail
SHELL_RC="${ZDOTDIR:-$HOME}/.zshrc"
[[ -f "$HOME/.bashrc" ]] && SHELL_RC="$HOME/.bashrc"

REPO="$(cd "$(dirname "$0")" && pwd)"
LINE="for f in $REPO/shell/*.sh $REPO/git/*.sh; do source \"\$f\"; done"

grep -qxF "$LINE" "$SHELL_RC" || echo "$LINE" >> "$SHELL_RC"
echo "appended source line to $SHELL_RC"
