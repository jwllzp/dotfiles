#!/bin/sh
# Pick a directory under ~/projects with fzf and open it as a new herdr workspace.
# Bound to prefix+N via [[keys.command]] (type = "pane") in config.toml.
set -eu

root=${HERDR_PROJECTS_DIR:-$HOME/projects}

name=$(find "$root" -mindepth 1 -maxdepth 1 -type d ! -name '.*' -exec basename {} \; \
  | sort \
  | fzf --prompt='project> ' --height=100% --reverse) || exit 0

[ -n "$name" ] || exit 0

herdr workspace create --cwd "$root/$name" --label "$name" --focus >/dev/null
