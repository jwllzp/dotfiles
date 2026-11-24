#!/bin/sh
# Print the active workspace's name for the tab bar status area
# (tab_bar_right command entry in config.toml). Useful with the sidebar hidden.
#   root checkout / plain workspace -> <workspace label>
#   linked worktree                 -> <parent workspace label>-<worktree dir name>
# The parent is the non-worktree workspace of the same repo (falls back to the repo name).
HERDR=${HERDR_BIN_PATH:-herdr}

"$HERDR" workspace list </dev/null | awk -v want="${HERDR_WORKSPACE_ID:-}" '
function field(obj, k,   p) {
  p = "\"" k "\":(\"[^\"]*\"|true|false)"
  if (!match(obj, p)) return ""
  v = substr(obj, RSTART + length(k) + 3, RLENGTH - length(k) - 3)
  gsub(/^"|"$/, "", v)
  return v
}
{
  s = $0
  while (match(s, /\{"active_tab_id"[^{}]*("worktree":\{[^{}]*\})?[^{}]*\}/)) {
    o = substr(s, RSTART, RLENGTH); s = substr(s, RSTART + RLENGTH)
    n++
    id[n] = field(o, "workspace_id"); label[n] = field(o, "label")
    focused[n] = field(o, "focused"); linked[n] = field(o, "is_linked_worktree")
    key[n] = field(o, "repo_key"); repo[n] = field(o, "repo_name")
    path[n] = field(o, "checkout_path")
  }
}
END {
  for (i = 1; i <= n; i++) if (want != "" ? id[i] == want : focused[i] == "true") { t = i; break }
  if (!t) exit
  if (linked[t] != "true") { print label[t]; exit }
  parent = repo[t]
  for (i = 1; i <= n; i++) if (i != t && key[i] == key[t] && linked[i] != "true") { parent = label[i]; break }
  wt = path[t]; sub(/\/+$/, "", wt); sub(/.*\//, "", wt)
  print parent "-" wt
}'
