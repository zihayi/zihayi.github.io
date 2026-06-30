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

function Run-GitHttp {
  & git -c http.version=HTTP/1.1 @args
  if ($LASTEXITCODE -ne 0) {
    throw "git $($args -join ' ') failed"
  }
}

$repoRoot = Split-Path -Parent $PSScriptRoot
Set-Location -LiteralPath $repoRoot

& "$PSScriptRoot\sync-relative-assets.ps1"

Run-Git status --short

Run-GitHttp pull --rebase --autostash origin main

$changes = & git status --porcelain
if ($changes) {
  Run-Git add -A
  Run-Git commit -m $Message
} else {
  "No local changes to commit."
}

Run-GitHttp push origin main

"Uploaded to GitHub successfully."
