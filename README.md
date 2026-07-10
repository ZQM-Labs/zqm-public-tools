# ZQM Public Tools

Curated, reviewed PowerShell utilities for endpoint visibility and baseline integrity reporting.

Files
- `scripts/Get-SystemReport.ps1` — generic endpoint snapshot
- `scripts/Invoke-AttestationBaseline.ps1` — lightweight control checks
- `docs/ControlMapping.md` — maps outputs to CIS/Windows control concepts
- `INTEGRATION.md` — deployment notes for SOC/MSP review

Guidelines
- No secrets, keys, or user-data collection.
- No org-specific paths or host references.
- Use in isolated test endpoints first.
