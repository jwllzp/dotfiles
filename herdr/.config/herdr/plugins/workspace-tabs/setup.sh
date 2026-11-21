#!/bin/sh
# On workspace.created: make the tabs listed in TABS.
# Plain POSIX sh + awk: no bash, no jq. Works with dash, busybox, macOS/Linux sh.
set -eu

HERDR=${HERDR_BIN_PATH:-herdr}

# One tab per line: "label|command". Empty command = plain shell.
# The first line reuses the workspace's default tab; the rest are created in order.
TABS='claude|claude
nvim|nvim .
terminal|'

h() { "$HERDR" "$@" </dev/null; }

# json_get KEY: print every string value of "KEY":"..." from stdin, one per line.
# Herdr emits compact single-line JSON, so a scan is enough (no jq needed).
json_get() {
  awk -v k="$1" '{
    s = $0; pat = "[{,]\"" k "\":\"[^\"]*\""
    while (match(s, pat)) {
      print substr(s, RSTART + length(k) + 5, RLENGTH - length(k) - 6)
      s = substr(s, RSTART + RLENGTH)
    }
  }'
}
first_of() { json_get "$1" | sed -n 1p; }

nap() { sleep 0.1 2>/dev/null || sleep 1; }

ev=${HERDR_PLUGIN_EVENT_JSON:-}
ws_id=$(printf '%s\n' "$ev" | first_of workspace_id)
ws_id=${ws_id:-${HERDR_WORKSPACE_ID:-}}
[ -n "$ws_id" ] || { echo "no workspace id in event" >&2; exit 1; }

# cwd: worktree checkout, else the root pane's cwd
cwd=$(printf '%s\n' "$ev" | first_of checkout_path)
first_pane=
i=0
while [ $i -lt 20 ]; do
  panes=$(h pane list --workspace "$ws_id")
  first_pane=$(printf '%s\n' "$panes" | first_of pane_id)
  [ -n "$cwd" ] || cwd=$(printf '%s\n' "$panes" | first_of cwd)
  [ -n "$first_pane" ] && [ -n "$cwd" ] && break
  i=$((i + 1)); nap
done

tabs=$(h tab list --workspace "$ws_id")
has() { case $tabs in *"\"label\":\"$1\""*) return 0 ;; esac; return 1; }

missing=0
for name in $(printf '%s\n' "$TABS" | cut -d'|' -f1); do has "$name" || missing=1; done
[ "$missing" = 1 ] || exit 0 # already seeded

first_tab=$(printf '%s\n' "$tabs" | first_of tab_id)

n=0
printf '%s\n' "$TABS" | while IFS='|' read -r name cmd; do
  [ -n "$name" ] || continue
  n=$((n + 1))
  has "$name" && continue
  if [ $n -eq 1 ]; then
    h tab rename "$first_tab" "$name" >/dev/null
    pane=$first_pane
  else
    if [ -n "$cwd" ]; then
      res=$(h tab create --workspace "$ws_id" --label "$name" --no-focus --cwd "$cwd")
    else
      res=$(h tab create --workspace "$ws_id" --label "$name" --no-focus)
    fi
    pane=$(printf '%s\n' "$res" | first_of pane_id)
  fi
  [ -z "$cmd" ] || h pane run "$pane" "$cmd" >/dev/null
done

h tab focus "$first_tab" >/dev/null
