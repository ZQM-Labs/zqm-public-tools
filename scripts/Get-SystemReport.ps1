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

$osInfo = Get-CimInstance Win32_OperatingSystem
if ($osInfo) {
  $osCaption = $osInfo.Caption
  $osVersion = $osInfo.Version
  $osBuild = $osInfo.BuildNumber
} else {
  $osCaption = 'Unknown'
  $osVersion = 'Unknown'
  $osBuild = 'Unknown'
}

$boot = 'Unknown'
try {
  $secureBoot = Confirm-SecureBootUEFI -ErrorAction Stop
  if ($secureBoot) {
    $boot = 'UEFI+SecureBoot'
  }
} catch {
  $boot = 'BIOS/Legacy/Unknown'
}

$serviceCount = (Get-Service | Where-Object { $_.Status -ne 'Stopped' }).Count

$report = New-Object PSObject -Property @{
  host     = $env:COMPUTERNAME
  os       = New-Object PSObject -Property @{ Caption = $osCaption; Version = $osVersion; BuildNumber = $osBuild }
  boot     = $boot
  services = $serviceCount
}

if ($OutFile) {
  $report | ConvertTo-Json -Depth 3 | Set-Content -Path $OutFile -Encoding UTF8
}

$report | Format-List
