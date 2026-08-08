# zqm-public-tools

Public PowerShell/Python tooling for Windows fleet attestation and system reporting.

## About

`zqm-public-tools` is the public-facing surface of the ZQM Computing toolchain. It ships MIT/Apache-2.0/ISC-licensed scripts for system report generation, attestation baseline collection, and fulfillment bot automation.

## Installation

```bash
pip install -r requirements.txt
python scripts/fulfill_bot.py --help
```

PowerShell scripts require PowerShell 5.1+ on Windows.

## Usage

```powershell
# System report
.\scripts/Get-SystemReport.ps1 -OutputPath .\evidence/

# Attestation baseline
.\scripts/Invoke-AttestationBaseline.ps1 -Endpoint .\evidence/

# Fulfillment bot
python scripts/fulfill_bot.py --dry-run --sku ATTESTATION-SCAN
```

## Features

- `Get-SystemReport.ps1` — full workstation telemetry export
- `Invoke-AttestationBaseline.ps1` — TPM/BitLocker/driver baseline collector
- `fulfill_bot.py` — SKU-aware automated fulfillment with GitHub issue integration
- JSON schema validation via jsonschema
- Rich console output for operator workflows
- Sample deliverables and cert fixtures for offline testing

## Integration: zqm-intel-platforms

This repo integrates with `zqm-intel-platforms` for shared OSINT/CTI/SIEM/Windows-telemetry primitives.

## License

MIT/Apache-2.0/BSD-3 unless otherwise noted.

## Contact

Alex Zelenski — zqmcomputing@gmail.com
Brand: ZQM Computing / ZQM-Labs
