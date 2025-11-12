# Security Policy

## Supported Versions

| Version | Supported |
|---------|-----------|
| 1.0.x   | ✅        |
| < 1.0   | ❌        |

## Reporting a Vulnerability

**Do not** open public issues for security vulnerabilities.

**Report privately:**
- Open a [GitHub Security Advisory](https://github.com/vadikmarmeladov/lot-terminal/security/advisories/new)
- Or email the maintainers (see GitHub profile)

**Include:**
- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix (if any)

**Response:**
- Acknowledgment within 48 hours
- Fix and security update release
- Credit in release notes (if desired)

## Best Practices

**For Users:**
- Never commit `.env` files with sensitive data
- Review scripts before piping to bash
- Store secrets in proper secret management tools

**For Developers:**
- Review the source code in `bin/lot`
- LOT Terminal makes no network connections
- All data stored locally in `~/.lot/`

Thank you for helping keep LOT Terminal secure!
