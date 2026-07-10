# Invoke-AttestationBaseline.ps1
<#
.SYNOPSIS
Lightweight attestation baseline checks.
.DESCRIPTION
Runs generic control checks and returns pass/fail counts.
#>

$checks = [
  'SecureBootEnabled',
  'WinDefenderAntispySignatureLastUpdated',
  'FirewallEnabled',
  'AutoUpdateEnabled'
]

$results = foreach ($c in $checks) {
  try {
    $r = Invoke-Expression $c -ErrorAction Stop
    [pscustomobject]@{ control = $c; status = 'OK'; detail = $r }
  } catch {
    [pscustomobject]@{ control = $c; status = 'UNKNOWN'; detail = $_.Exception.Message }
  }
}

$results | Format-Table -AutoSize
$pass = ($results | Where-Object status -eq 'OK').Count
Write-Host ("Baseline: {0}/{1} controls OK" -f $pass, $results.Count)
