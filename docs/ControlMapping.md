# System Report Snapshot

Intended for endorsable baseline review.
Expected outputs: OS/build, boot config/service counts, file hashes, key-services presence.

Fields
- Hostname: review target hostname only
- OSVersion: Windows build/version
- BootState: SecureBoot + firmware state
- IntegrityHashes: SHA-256 over attested script set
- KeyServices: present/absent for baseline control set

Notes
- No secrets, tokens, or user profile paths.
- No outbound transport; outputs are plain JSON.
- This is a sample file. Real collection logic lives in `ZQM-Computing/zqm-attestation-toolkit`.
