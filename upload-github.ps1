param(
  [string]$Message = "Update Site"
)

$ErrorActionPreference = "Stop"

& "$PSScriptRoot\upload-github-core.ps1" -Message $Message
if ($LASTEXITCODE -ne 0) {
  exit $LASTEXITCODE
}
