# Security Policy

## Overview

Hiddify is committed to maintaining the security and integrity of our applications and services. This document outlines our security practices, vulnerability disclosure policy, and guidelines for security-related contributions.

## Security Features

### Built-in Security Components

- **End-to-End Encryption**: All connections utilize industry-standard encryption protocols
- **Certificate Pinning**: Prevents man-in-the-middle attacks
- **Secure Configuration**: Regular security audits and penetration testing
- **Privacy by Design**: Minimal data collection, transparent logging practices

### Supported Security Protocols

- **TLS 1.3**: For secure HTTPS connections
- **AEAD Ciphers**: Advanced encryption for data protection
- **Perfect Forward Secrecy**: Ensures past sessions remain secure
- **DNSSEC**: Validates DNS responses

## Vulnerability Disclosure

### Reporting Security Issues

We take all security concerns seriously. If you discover a security vulnerability, please **do not** open a public GitHub issue.

Instead, please report security vulnerabilities by:

1. **Email**: Send details to `security@hiddify.com` with the subject line "Security Vulnerability Report"
2. **Describe the vulnerability**: Include a clear description of the issue, affected components, and potential impact
3. **Provide proof of concept**: Include steps to reproduce or a working proof of concept if possible
4. **Timeline**: Allow us a reasonable timeframe (typically 90 days) to address the issue before public disclosure

### Response Timeline

- **Acknowledgment**: We'll acknowledge receipt of your report within 48 hours
- **Investigation**: We'll investigate and work on a fix (typically within 7-14 days)
- **Release**: Security patches will be released as soon as possible
- **Disclosure**: We'll coordinate responsible disclosure with credit given to the reporter

## Security Updates

### Staying Updated

- Subscribe to our [security advisories](https://github.com/iAlien369-design/hiddify-app/security/advisories)
- Follow our [releases page](https://github.com/iAlien369-design/hiddify-app/releases)
- Enable notifications for security alerts in your repository settings

### Supported Versions

| Version | Status | Support Ends |
|---------|--------|-------------|
| 1.x     | Active | Ongoing     |
| 0.x     | Legacy | 2026-12-31  |

## Security Best Practices

### For Users

1. **Keep Updated**: Always use the latest version of Hiddify
2. **Verify Authenticity**: Download from official sources only
3. **Use Strong Passwords**: If using authentication features
4. **Report Issues**: Use the vulnerability disclosure process above

### For Developers

1. **Code Review**: All changes go through security review
2. **Dependency Scanning**: Regular checks for vulnerable dependencies
3. **Static Analysis**: Automated code analysis for vulnerabilities
4. **Testing**: Comprehensive security test coverage

## Security Tools & Services

We utilize the following security tools:

- **GitHub Security**: Dependabot, Secret scanning, Security advisories
- **SAST Tools**: Static Application Security Testing
- **Dependency Audit**: Regular npm/pub audit checks
- **Code Signing**: All releases are cryptographically signed

## Known Security Considerations

### Important Notes

- This is a proxy application designed for privacy and circumvention purposes
- Users are responsible for compliance with local laws and regulations
- The application does not provide anonymity (VPN disclaimer)
- Server logging and retention policies vary by service provider

## Contact

- **Security Email**: security@hiddify.com
- **Project Maintainer**: [@iAlien369-design](https://github.com/iAlien369-design)
- **Issue Tracker**: [GitHub Issues](https://github.com/iAlien369-design/hiddify-app/issues)

## References

- [OWASP Security Guidelines](https://owasp.org/)
- [CWE/SANS Top 25](https://cwe.mitre.org/top25/)
- [National Cybersecurity Center (UK) Guidance](https://www.ncsc.gov.uk/)
