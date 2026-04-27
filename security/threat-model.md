# Threat Model

## Executive Summary

This document outlines the security threat model for Hiddify, including potential attack vectors, threat actors, and mitigation strategies.

## Scope

This threat model covers:
- Mobile applications (Android, iOS)
- Desktop applications (Windows, macOS, Linux)
- Network communication layer
- Configuration management
- Subscription handling

## Threat Actors

### External Attackers
- **Capability**: Network-level attackers, ISPs, government surveillance
- **Intent**: Intercept traffic, identify user connections, perform traffic analysis
- **Mitigation**: Strong encryption, protocol obfuscation, certificate pinning

### Malware
- **Capability**: Execute arbitrary code on user's device
- **Intent**: Steal credentials, redirect traffic, monitor activity
- **Mitigation**: Code signing, app sandboxing, permission restrictions

### Insider Threats
- **Capability**: Access to code repositories, CI/CD pipelines
- **Intent**: Inject malicious code, compromise releases
- **Mitigation**: Code review, access controls, audit logging

## Key Threat Scenarios

### 1. Man-in-the-Middle (MITM) Attack

**Threat**: Attacker intercepts connection between client and proxy server

**Risk Level**: High

**Mitigation**:
- TLS 1.3 with certificate pinning
- Signature verification for configuration files
- Transport security validation

### 2. Configuration Injection

**Threat**: Malicious configuration files modified in transit or stored

**Risk Level**: High

**Mitigation**:
- Cryptographic signature verification
- Checksum validation
- Secure storage with encryption

### 3. Credential Theft

**Threat**: User credentials or proxy tokens extracted from device

**Risk Level**: Critical

**Mitigation**:
- Keychain/Keystore for credential storage
- Secure memory handling
- No plaintext logging

### 4. DNS Leaks

**Threat**: DNS queries bypass proxy, revealing browsing activity

**Risk Level**: High

**Mitigation**:
- DNS over HTTPS (DoH)
- DNS over QUIC (DoQ)
- Leak detection and prevention

### 5. Traffic Analysis

**Threat**: Attacker analyzes packet patterns to infer user activity

**Risk Level**: Medium

**Mitigation**:
- Packet padding
- Constant bitrate tunneling
- Obfuscation protocols (Hysteria, TUIC)

### 6. Supply Chain Attack

**Threat**: Dependencies or build tools compromised

**Risk Level**: High

**Mitigation**:
- Dependency scanning
- Pinned dependencies
- Signed releases
- Build reproducibility

### 7. Privilege Escalation

**Threat**: App obtains higher privileges than necessary

**Risk Level**: Medium

**Mitigation**:
- Principle of least privilege
- Permission auditing
- VPN permission only when necessary

## Security Controls

### Application Layer

| Control | Implementation | Status |
|---------|----------------|--------|
| Input Validation | All user inputs sanitized | ✅ |
| Output Encoding | Response escaping | ✅ |
| Authentication | Multi-factor support | ✅ |
| Authorization | Role-based access control | ✅ |
| Logging | Audit trail without PII | ✅ |
| Error Handling | Generic error messages | ✅ |

### Network Layer

| Control | Implementation | Status |
|---------|----------------|--------|
| Transport Security | TLS 1.3+ | ✅ |
| Certificate Pinning | Public key pinning | ✅ |
| Protocol Obfuscation | Multiple protocols | ✅ |
| Rate Limiting | Connection throttling | ✅ |

### Data Layer

| Control | Implementation | Status |
|---------|----------------|--------|
| Encryption at Rest | Platform keystore | ✅ |
| Secure Storage | Encrypted database | ✅ |
| Data Minimization | Limited data collection | ✅ |
| Secure Deletion | Overwriting on removal | ✅ |

## Residual Risks

### Accepted Risks

1. **ISP/Network Operator Traffic Analysis**: Encryption prevents content inspection but not metadata analysis
2. **Endpoint Compromise**: If device is fully compromised, all security measures can be bypassed
3. **Zero-day Vulnerabilities**: Unknown exploits may exist in underlying libraries

### Future Mitigations

- Implementation of traffic padding for metadata protection
- Integration of additional obfuscation protocols
- Enhanced anomaly detection
- Memory encryption support

## Testing & Validation

### Regular Security Activities

- [ ] Monthly dependency updates and audits
- [ ] Quarterly penetration testing
- [ ] Semi-annual security code review
- [ ] Annual threat model review

### CI/CD Security

- Automated SAST scanning
- Dependency vulnerability scanning
- License compliance checking
- Build artifact verification

## Incident Response

In case of a security incident:

1. **Assessment**: Determine scope and severity
2. **Containment**: Stop further compromise
3. **Communication**: Notify affected users (if applicable)
4. **Investigation**: Root cause analysis
5. **Remediation**: Develop and deploy fix
6. **Post-Incident**: Update threat model and controls

## Contact & Reporting

For security concerns, please contact: security@hiddify.com

**Do not disclose vulnerabilities publicly without coordination.**

---

*Last Updated: April 27, 2026*
*Next Review: July 27, 2026*
