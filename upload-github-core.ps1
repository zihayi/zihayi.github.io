param(
  [string]$Message = "Update Site"
)

$ErrorActionPreference = "Stop"

function Run-Git {
  & git @args
  if ($LASTEXITCODE -ne 0) {
    throw "git $($args -join ' ') failed"
  }
}

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location -LiteralPath $repoRoot

Run-Git status --short

$changes = & git status --porcelain
if ($changes) {
  Run-Git add -A
  Run-Git commit -m $Message
} else {
  "No local changes to commit."
}

Run-Git pull --rebase origin main
Run-Git push origin main

"Uploaded to GitHub successfully."
