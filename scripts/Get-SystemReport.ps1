# Get-SystemReport.ps1
<#
.SYNOPSIS
Collects generic endpoint baseline facts for attestation review.
.DESCRIPTION
Returns OS, boot, and service facts without reading secrets or user data.
.PARAMETER OutFile
Optional JSON export path.
.EXAMPLE
.\Get-SystemReport.ps1 -OutFile .\baseline.json
#>
param(
  [string]$OutFile
)

$report = [ordered]@{
  host     = $env:COMPUTERNAME
  os       = (Get-CimInstance Win32_OperatingSystem) | Select-Object Caption, Version, BuildNumber
  boot     = (Confirm-SecureBootUEFI -ErrorAction SilentlyContinue) ? 'UEFI+SecureBoot' : 'BIOS/Legacy/Unknown'
  services = (Get-Service | Where-Object { $_.Status -ne 'Stopped' }).Count
}

if ($OutFile) {
  $report | ConvertTo-Json -Depth 3 | Set-Content -Path $OutFile -Encoding UTF8
}

$report | Format-List
