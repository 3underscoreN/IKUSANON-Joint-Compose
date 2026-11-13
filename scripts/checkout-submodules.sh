#!/usr/bin/env bash
set -euo pipefail

# Align submodule working branches with the parent branch:
#
#   main (joint compose) -> apps/web main, apps/bot main
#   dev  (joint compose) -> apps/web dev,  apps/bot dev
#
# Git checks submodules out at the commits recorded by the parent branch. Run
# this after switching parent branches to also put the submodule working trees
# on the matching branch:
#
#   ./scripts/checkout-submodules.sh

parent_branch="$(git rev-parse --abbrev-ref HEAD)"

case "$parent_branch" in
  main) submodule_branch="main" ;;
  dev) submodule_branch="dev" ;;
  *)
    echo "No submodule branch mapping for parent branch '$parent_branch'." >&2
    echo "Supported parent branches: main, dev" >&2
    exit 1
    ;;
esac

git submodule sync --recursive
git submodule update --init --recursive

for path in apps/web apps/bot; do
  if [ ! -d "$path/.git" ] && [ ! -f "$path/.git" ]; then
    echo "Missing submodule working tree at $path." >&2
    echo "Run: git submodule update --init --recursive" >&2
    exit 1
  fi

  echo "==> $path: checkout $submodule_branch"
  git -C "$path" checkout "$submodule_branch"
done

echo "Submodules are on '$submodule_branch' (matching parent '$parent_branch')."
