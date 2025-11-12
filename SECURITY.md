# Security Policy

## Supported Versions

We release patches for security vulnerabilities for the following versions:

| Version | Supported          |
| ------- | ------------------ |
| 1.0.x   | :white_check_mark: |
| < 1.0   | :x:                |

## Reporting a Vulnerability

We take the security of LOT Terminal seriously. If you discover a security vulnerability, please follow these steps:

### 1. Do Not Publicly Disclose

Please do **not** open a public issue or discussion about the vulnerability until it has been addressed.

### 2. Report the Vulnerability

Report security vulnerabilities by:

- **Opening a GitHub Security Advisory**: https://github.com/vadikmarmeladov/lot-terminal/security/advisories/new
- **Or** creating a private issue by emailing the maintainers (see GitHub profile)

### 3. Provide Details

When reporting, please include:

- Description of the vulnerability
- Steps to reproduce the issue
- Potential impact
- Suggested fix (if you have one)
- Your contact information for follow-up

### 4. What to Expect

- **Acknowledgment**: We will acknowledge receipt of your report within 48 hours
- **Assessment**: We will assess the vulnerability and determine its severity
- **Fix**: We will work on a fix and keep you informed of progress
- **Release**: Once fixed, we will release a security update
- **Credit**: We will credit you in the release notes (if desired)

## Security Best Practices for Users

### 1. Settings and Environment Files

- **Never commit** `.env` files containing sensitive information
- **Review** settings files before sharing or backing them up
- **Use** `.gitignore` to prevent accidental commits of sensitive data

### 2. Installation

- **Verify** the source when installing: only use the official repository
- **Check** the install script before piping to bash:
  ```bash
  curl -sSL https://raw.githubusercontent.com/vadikmarmeladov/lot-terminal/main/install.sh | less
  ```
- **Review** the code in `bin/lot` if you have concerns

### 3. Permissions

- LOT Terminal creates files in `~/.lot/` with standard user permissions
- The installer may request sudo for system-wide installation
- **Review** permission requests before accepting

### 4. Hardware Projects

- **Be cautious** with firmware code from untrusted sources
- **Review** all code before flashing to hardware
- **Test** in safe environments before deploying

### 5. Logs

- Logs are stored locally in `~/.lot/logs/`
- **Review** logs before sharing, as they may contain sensitive information
- Use `lot logs clear` to remove old logs

## Known Security Considerations

### 1. Bash Execution

LOT Terminal is a bash script that:
- Modifies files in your home directory (`~/.lot/`)
- May modify shell configuration files (`.bashrc`, `.zshrc`)
- Executes commands with user permissions

**Mitigation**: Review the source code before installation.

### 2. Settings Storage

Settings are stored in plain text `.env` files:
- Files are readable by your user account
- Files are in a hidden directory (`~/.lot/`)

**Mitigation**: Do not store highly sensitive data in settings. Use proper secret management tools for sensitive credentials.

### 3. No Network Communication

LOT Terminal itself does **not** make network connections. It:
- Does not send telemetry
- Does not phone home
- Does not auto-update

The only network use is during installation (downloading from GitHub).

## Scope

### In Scope

- Vulnerabilities in the LOT Terminal code (`bin/lot`, `install.sh`)
- Security issues with file permissions
- Path traversal vulnerabilities
- Code injection vulnerabilities
- Unauthorized file access

### Out of Scope

- Issues with user-created hardware projects
- Third-party tools used with LOT Terminal
- Social engineering attacks
- Physical security of hardware
- Vulnerabilities in bash itself

## Security Updates

Security updates will be:
- Released as soon as possible after verification
- Documented in CHANGELOG.md
- Announced via GitHub releases
- Tagged with security labels

## Disclosure Policy

- **Private Disclosure**: Report privately, we fix privately
- **Public Disclosure**: After fix is released and users have time to update
- **Coordinated**: We work with reporters to coordinate disclosure timing

## Questions?

If you have questions about this security policy, please:
- Open a GitHub Discussion (for general security questions)
- Contact maintainers privately (for sensitive topics)

## Recognition

We appreciate security researchers who:
- Follow responsible disclosure practices
- Provide detailed reports
- Help make LOT Terminal more secure

Contributors will be recognized in:
- Release notes (if desired)
- CONTRIBUTORS.md
- Security advisories

Thank you for helping keep LOT Terminal and its users safe!
