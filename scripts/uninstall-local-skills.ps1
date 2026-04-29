Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$targetRoot = Join-Path $env:USERPROFILE ".agents\skills"
$skillNames = @(
    "workflow-baseline",
    "workflow-refine",
    "workflow-breakdown",
    "workflow-implement"
)

if (-not (Test-Path -LiteralPath $targetRoot)) {
    throw "Skills target directory not found: $targetRoot"
}

foreach ($skillName in $skillNames) {
    $targetPath = Join-Path $targetRoot $skillName
    if (-not (Test-Path -LiteralPath $targetPath)) {
        continue
    }

    $item = Get-Item -LiteralPath $targetPath -Force
    if ($item.LinkType -ne "Junction") {
        throw "Target exists and is not a junction: $targetPath"
    }

    [System.IO.Directory]::Delete($targetPath)
}

Write-Output "Uninstalled local skill junctions under $targetRoot"
