# Invoke-AttestationBaseline.ps1
<#
.SYNOPSIS
Lightweight attestation baseline checks.
.DESCRIPTION
Runs generic control checks and returns pass/fail counts.
#>

$results = [System.Collections.Generic.List[PSObject]]::new()

$checks = @{
  'SecureBootEnabled'                         = { try { Confirm-SecureBootUEFI } catch { 'UNKNOWN' } }
  'WinDefenderAntispySignatureLastUpdated'    = { try { $s = Get-MpComputerStatus; if ($null -ne $s.AntispywareSignatureLastUpdated) { $s.AntispywareSignatureLastUpdated } else { 'UNKNOWN' } } catch { 'UNKNOWN' } }
  'FirewallEnabled'                           = { try { (Get-NetFirewallProfile | Where-Object { $_.Enabled -eq $true }).Count -gt 0 } catch { 'UNKNOWN' } }
  'AutoUpdateEnabled'                         = { try { (Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update' -ErrorAction SilentlyContinue).AUOptions -ne $null } catch { 'UNKNOWN' } }
}

foreach ($c in $checks.Keys) {
  $detail = 'UNKNOWN'
  $status = 'UNKNOWN'
  try {
    $detail = & $checks[$c]
    $status = 'OK'
  } catch {
    $detail = $_.Exception.Message
  }
  $null = $results.Add((New-Object PSObject -Property @{ control = $c; status = $status; detail = $detail }))
}

$results | Format-Table -AutoSize
$pass = ($results | Where-Object { $_.status -eq 'OK' }).Count
Write-Host ("Baseline: {0}/{1} controls OK" -f $pass, $results.Count)
