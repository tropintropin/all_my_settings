#!/bin/zsh -f

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Deploy tropin.one
# @raycast.mode fullOutput
# @raycast.packageName System Tools

# Optional parameters:
# @raycast.icon 🌐
# @raycast.needsConfirmation false

set -eu
set -o pipefail

cd ~/tropin || exit 1

git fetch origin

git switch dev
git pull --rebase origin dev

if git diff --quiet origin/main..dev; then
  echo "✅ Нет изменений для деплоя"
  exit 0
fi

gh pr create --base main --head dev --fill
sleep 3
gh pr merge --merge

echo "✅ CI прошёл, за его ходом см.: gh run watch"
