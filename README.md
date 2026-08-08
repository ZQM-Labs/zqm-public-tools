# ZQM-Computing public tools

[![Sponsor ZQM-Computing](https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&color=red&logo=githubsponsors&link=https://github.com/sponsors/ZQM-Computing)](https://github.com/sponsors/ZQM-Computing)

Sanitized PowerShell helpers for Windows attestation. These scripts are the public surface of the ZQM attestation kit: no private paths, no secrets, no operational backdoors.

## Usage

PowerShell 5.1+ on Windows 10/11. Defaults are repo-root-relative. Review before changing execution policy.

## Contact

ZQM Computing — zqmcomputing@gmail.com

## Related ZQM repos

- **[zqm-attestation-toolkit](https://github.com/ZQM-Labs/zqm-attestation-toolkit)** — the forensic PowerShell suite these helpers belong to. Checksummed, CMS-signed machine-health reports for auditors, MSPs, and compliance teams.
- **[zqm-attestation-briefs](https://github.com/ZQM-Labs/zqm-attestation-briefs)** — buyer-facing methodology and sample outputs.
- **[zqm-security-policy](https://github.com/ZQM-Labs/zqm-security-policy)** — baseline Windows endpoint posture rules.
- **[zqm-shield](https://github.com/ZQM-Labs/zqm-shield)** — lightweight Windows endpoint security helpers.

## Support

Development is funded commercially — see the toolkit's [FUNDING](https://github.com/ZQM-Labs/zqm-attestation-toolkit/blob/main/.github/FUNDING.yml) for sponsorship, procurement, and no-KYC options. You can also [sponsor ZQM-Computing on GitHub](https://github.com/sponsors/ZQM-Computing).

## Commercial Licensing & Procurement

This repository is free for personal and audit use under its stated license. Enterprise procurement, retainers, and add-on tiers are available:

- Pricing & SKUs: [COMMERCIAL.md](COMMERCIAL.md) · [SKU_CATALOG.md](SKU_CATALOG.md)
- Start a purchase: open a [Purchase request](https://github.com/ZQM-Labs/zqm-public-tools/issues/new?template=purchase_request.yml) issue
- Contact: zqmcomputing@gmail.com

All deliverables are CMS-signed and independently verifiable.

## Integration: zqm-intel-platforms
This repo vendors `zqm-intel-platforms>=0.1.0` as a dependency. Use the shared SIEM/OSINT/CTI wrappers for Splunk HEC, Loki, and Windows-telemetry export defined in that package.
