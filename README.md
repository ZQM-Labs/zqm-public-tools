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

## CI

[![CI](https://github.com/ZQM-Labs/zqm-public-tools/actions/workflows/ci.yml/badge.svg)](https://github.com/ZQM-Labs/zqm-public-tools/actions)

## Integration: zqm-intel-platforms

`zqm-public-tools` declares `zqm-intel-platforms>=0.1.0` and feeds public tool output into the platform hub for normalization and downstream distribution.

- Hub role: public tool normalization and fulfillment orchestration
- Downstream: zqm-sword, zqm-attestation-toolkit

## License

MIT / Apache-2.0 / ISC — see LICENSE file.

## Contact

Alex Zelenski — zqmcomputing@gmail.com
Brand: ZQM Computing / ZQM-Labs

## Related Repositories

- [ZQM-Labs/zqm-attestation-toolkit](https://github.com/ZQM-Labs/zqm-attestation-toolkit) — Windows attestation, BitLocker, TPM, DFIR, and AI integrity verification
- [ZQM-Labs/pqc-readiness-toolkit](https://github.com/ZQM-Labs/pqc-readiness-toolkit) — post-quantum cryptography readiness for Windows compliance
- [ZQM-Labs/zqm-security-policy](https://github.com/ZQM-Labs/zqm-security-policy) — CIS benchmarks, Windows hardening, and compliance runbooks
- [ZQM-Labs/awesome-windows-attestation](https://github.com/ZQM-Labs/awesome-windows-attestation) — curated DFIR, BitLocker, TPM, and compliance resources
- [ZQM-Computing/mesh-forensics](https://github.com/ZQM-Computing/mesh-forensics) — ZQM LAN evidence collection and incident response
