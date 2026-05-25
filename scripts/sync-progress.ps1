git pull --rebase
git add progress notes experiments

$status = git diff --cached --quiet
if ($LASTEXITCODE -eq 0) {
  Write-Host "No progress changes to commit."
  exit 0
}

git commit -m "update learning progress"
git push
