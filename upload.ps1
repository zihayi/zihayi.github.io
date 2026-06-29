param(
  [string]$Message = "Update Site"
)

$ErrorActionPreference = "Stop"

& "$PSScriptRoot\.scripts\github-upload.ps1" -Message $Message
if ($LASTEXITCODE -ne 0) {
  exit $LASTEXITCODE
}
