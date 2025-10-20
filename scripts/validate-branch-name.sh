#!/usr/bin/env bash
# Validate current branch name and prevent pushes to protected branches
branch=$(git rev-parse --abbrev-ref HEAD)
protected_regex='^(main|master|release\/.*|hotfix\/.*)$'

if [[ "$branch" =~ $protected_regex ]]; then
  echo "Direct pushes to '${branch}' are blocked. Create a PR instead."
  exit 1
fi

allowed_regex='^(feature|bugfix|release|hotfix)\/[a-z0-9._-]+$|^main$|^master$'
if [[ ! "$branch" =~ $allowed_regex ]]; then
  echo "Invalid branch name: $branch"
  echo "Allowed formats: feature/<name>, bugfix/<name>, release/<x.y.z>, hotfix/<x.y.z>, main, master"
  exit 1
fi

exit 0
