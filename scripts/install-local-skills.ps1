Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$sourceRoot = Join-Path $repoRoot "skills"
$targetRoot = Join-Path $env:USERPROFILE ".agents\skills"
$skillNames = @(
    "workflow-baseline",
    "workflow-refine",
    "workflow-breakdown",
    "workflow-implement"
)

if (-not (Test-Path -LiteralPath $sourceRoot)) {
    throw "Source skills directory not found: $sourceRoot"
}

New-Item -ItemType Directory -Force -Path $targetRoot | Out-Null

foreach ($skillName in $skillNames) {
    $sourcePath = Join-Path $sourceRoot $skillName
    if (-not (Test-Path -LiteralPath $sourcePath)) {
        throw "Skill source not found: $sourcePath"
    }

    $targetPath = Join-Path $targetRoot $skillName
    if (Test-Path -LiteralPath $targetPath) {
        $item = Get-Item -LiteralPath $targetPath -Force
        if ($item.LinkType -ne "Junction") {
            throw "Target exists and is not a junction: $targetPath"
        }

        $resolvedTarget = [System.IO.Path]::GetFullPath($item.Target)
        $expectedTarget = [System.IO.Path]::GetFullPath($sourcePath)
        if ($resolvedTarget -ne $expectedTarget) {
            throw "Target exists but points elsewhere: $targetPath -> $resolvedTarget"
        }

        continue
    }

    New-Item -ItemType Junction -Path $targetPath -Target $sourcePath | Out-Null
}

Write-Output "Installed local skill junctions under $targetRoot"
