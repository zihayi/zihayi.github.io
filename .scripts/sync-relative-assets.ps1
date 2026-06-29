$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot

function Sync-AssetDirectory {
  param(
    [string]$SourceDir,
    [string]$TargetDir
  )

  $targetParent = Split-Path -Parent $TargetDir
  New-Item -ItemType Directory -Force -Path $targetParent | Out-Null

  if (Test-Path -LiteralPath $TargetDir) {
    Remove-Item -LiteralPath $TargetDir -Recurse -Force
  }

  Copy-Item -LiteralPath $SourceDir -Destination $TargetDir -Recurse
}

$postsDir = Join-Path $repoRoot "_posts"
if (Test-Path -LiteralPath $postsDir) {
  Get-ChildItem -LiteralPath $postsDir -Filter "*.md" -File | ForEach-Object {
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
    $assetsDir = Join-Path $_.DirectoryName "$baseName.assets"
    if ((Test-Path -LiteralPath $assetsDir) -and ($baseName -match "^(\d{4})-(\d{2})-(\d{2})-(.+)$")) {
      $targetDir = Join-Path $repoRoot ("posts\{0}\{1}\{2}\{3}\{4}.assets" -f $Matches[1], $Matches[2], $Matches[3], $Matches[4], $baseName)
      Sync-AssetDirectory -SourceDir $assetsDir -TargetDir $targetDir
    }
  }
}

$notesDir = Join-Path $repoRoot "_notes"
if (Test-Path -LiteralPath $notesDir) {
  Get-ChildItem -LiteralPath $notesDir -Filter "*.md" -File | ForEach-Object {
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
    $assetsDir = Join-Path $_.DirectoryName "$baseName.assets"
    if (Test-Path -LiteralPath $assetsDir) {
      $targetDir = Join-Path $repoRoot ("notes\{0}\{0}.assets" -f $baseName)
      Sync-AssetDirectory -SourceDir $assetsDir -TargetDir $targetDir
    }
  }
}
