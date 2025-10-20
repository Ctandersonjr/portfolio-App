#!/usr/bin/env bash
set -euo pipefail

repo_root=$(cd "$(dirname "$0")/.." && pwd)
hook_src="$repo_root/scripts/validate-branch-name.sh"
hook_dest="$repo_root/.git/hooks/pre-push"

if [ ! -d "$repo_root/.git" ]; then
  echo "This directory doesn't look like a git repository. Run this from the repo root."
  exit 1
fi

cat > "$hook_dest" <<'HOOK'
#!/usr/bin/env bash
# pre-push hook: run branch-name validation
"$(dirname "$0")/../../scripts/validate-branch-name.sh"
HOOK

chmod +x "$hook_dest"
echo "Installed pre-push hook to block direct pushes to protected branches."
