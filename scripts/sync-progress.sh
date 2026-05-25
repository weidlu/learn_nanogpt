#!/usr/bin/env bash
set -euo pipefail

git pull --rebase
git add progress notes experiments

if git diff --cached --quiet; then
  echo "No progress changes to commit."
  exit 0
fi

git commit -m "update learning progress"
git push
