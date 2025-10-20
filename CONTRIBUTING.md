Branching and merge rules
-------------------------

This repository enforces these rules to keep a clean history and ensure CI/linters/type checks run before code is merged.

1. Branch naming
   - main branch: `main` (or `master`) — protected.
   - Feature branches: `feature/<ticket>-short-description`.
   - Bugfix branches: `bugfix/<ticket>-short-description`.
   - Release branches: `release/x.y.z`.

2. No direct commits to `main` or `master`
   - Use pull requests for all changes.
   - Locally we recommend installing the provided git hook to prevent accidental direct pushes.

3. CI required before merge
   - GitHub Actions workflow `CI` runs linting and type checks.
   - Branch protection on GitHub should require the `CI` workflow to pass before merging.

How to enable local protection
-----------------------------
Run the installer script to copy hooks into your local `.git/hooks`:

```bash
./scripts/install-git-hooks.sh
```

This installs a `pre-push` hook that blocks pushes from `main`/`master` and validates branch names.

How to enable remote branch protection (GitHub)
-----------------------------------------------
On GitHub, enable Branch protection for `main` (or `master`) and require:
- Require pull request reviews before merging (1 approver)
- Require status checks to pass and select `CI` as required
- Restrict who can push (optional)

If you'd like I can generate the `gh api` command to enable these settings for your repo.
