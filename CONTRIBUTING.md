# Contributing to LOT Terminal

Thank you for your interest in contributing to LOT Terminal! <‰

We welcome contributions from everyone. By participating in this project, you agree to abide by our code of conduct (be respectful, collaborative, and constructive).

## < Ways to Contribute

- = **Report bugs** - Open an issue describing the problem
- =¡ **Suggest features** - Share your ideas for improvements
- =Ý **Improve documentation** - Fix typos, add examples, clarify instructions
- =' **Submit code** - Fix bugs or implement new features
- <¨ **Share hardware projects** - Show what you've built with LOT Terminal
- =¬ **Help others** - Answer questions in discussions

## =€ Getting Started

### 1. Fork and Clone

```bash
# Fork the repository on GitHub, then clone your fork
git clone https://github.com/YOUR-USERNAME/lot-terminal.git
cd lot-terminal

# Add upstream remote
git remote add upstream https://github.com/vadikmarmeladov/lot-terminal.git
```

### 2. Create a Branch

```bash
# Create a descriptive branch name
git checkout -b feature/add-new-command
# or
git checkout -b fix/logging-bug
# or
git checkout -b docs/improve-readme
```

### 3. Make Your Changes

- Edit the code in `bin/lot`
- Update documentation if needed
- Test your changes locally

### 4. Test Your Changes

```bash
# Install locally for testing
bash install.sh

# Test the functionality
lot init
lot help
# ... test your specific changes
```

### 5. Commit Your Changes

```bash
# Stage your changes
git add .

# Commit with a clear message
git commit -m "Add new hardware export command"
```

**Commit Message Guidelines:**
- Use present tense ("Add feature" not "Added feature")
- Be descriptive but concise
- Reference issues when applicable (#123)

Examples:
```
Add hardware project export functionality
Fix logging bug in user creation
Update README with new examples
Improve error handling in settings command
```

### 6. Push and Create Pull Request

```bash
# Push to your fork
git push origin feature/add-new-command

# Create a Pull Request on GitHub
# Go to: https://github.com/YOUR-USERNAME/lot-terminal
# Click "New Pull Request"
```

## =Ý Pull Request Guidelines

### PR Description Should Include:

- **What**: Brief description of changes
- **Why**: Reason for the changes
- **How**: How you implemented it (if complex)
- **Testing**: How you tested it
- **Issues**: Links to related issues

### Example PR Description:

```markdown
## What
Adds a new `lot hardware export` command to create shareable archives of hardware projects.

## Why
Users requested an easy way to package and share their hardware projects.

## How
- Added export_hardware() function to bin/lot
- Creates tar.gz archive with all project files
- Includes option to exclude large files

## Testing
- Created test project
- Ran `lot hardware export test-project`
- Verified archive contents
- Tested on Linux and macOS

## Related Issues
Closes #42
```

## <¯ Development Guidelines

### Code Style

LOT Terminal is written in **pure bash**. Please follow these conventions:

**Variables:**
```bash
# Use uppercase for global/environment variables
LOT_HOME="${HOME}/.lot"

# Use lowercase for local variables
local project_name="$1"
```

**Functions:**
```bash
# Use descriptive names with underscores
create_user() {
    local username="$1"
    # ...
}
```

**Error Handling:**
```bash
# Check for required arguments
if [ -z "$username" ]; then
    log_error "Username required"
    exit 1
fi

# Use set -e for early exit on errors (already set in script)
```

**Logging:**
```bash
# Use logging functions consistently
log_info "Starting process..."
log_success "Process completed"
log_error "Process failed"
log_warning "Process has warnings"
```

### File Organization

- **bin/lot** - Main executable script (all code in one file)
- **install.sh** - Installation script
- **README.md** - Main documentation
- **HARDWARE.md** - Hardware development guide
- **CONTRIBUTING.md** - This file
- **CHANGELOG.md** - Version history
- **LICENSE** - MIT license

### Testing Checklist

Before submitting a PR, verify:

- [ ] Code runs without errors
- [ ] All existing commands still work
- [ ] New features are documented
- [ ] Help text is updated if needed
- [ ] Error messages are clear and helpful
- [ ] Logging is appropriate
- [ ] No hardcoded paths (use variables)
- [ ] Works on Linux and macOS (if possible)

## = Reporting Bugs

### Before Reporting

1. Check existing issues
2. Test with latest version
3. Try to reproduce consistently

### Bug Report Template

```markdown
## Description
Clear description of the bug

## Steps to Reproduce
1. Run `lot init`
2. Run `lot user create test`
3. Error occurs

## Expected Behavior
What should happen

## Actual Behavior
What actually happens

## Environment
- OS: Linux/macOS/other
- Bash version: `bash --version`
- LOT Terminal version: `lot version`

## Additional Context
Any other relevant information
```

## =¡ Suggesting Features

We love new ideas! When suggesting a feature:

1. **Check existing issues** - Maybe it's already planned
2. **Describe the use case** - Why is this needed?
3. **Propose a solution** - How should it work?
4. **Consider alternatives** - Are there other ways?

### Feature Request Template

```markdown
## Feature Description
What feature do you want?

## Use Case
Why do you need this feature?
Who would benefit from it?

## Proposed Solution
How should it work?
Example commands/usage

## Alternatives Considered
Other ways to solve this problem

## Additional Context
Mockups, examples, references
```

## <¨ Contributing Hardware Projects

### Share Your Builds

We'd love to see what you've built with LOT Terminal!

1. **Document your project** in your hardware directory
2. **Take photos** of your build
3. **Share on GitHub** Discussions
4. **Tag us** on social media

### Example Projects Welcome

If you've created a complete example project:

1. Create project with `lot hardware init`
2. Document thoroughly
3. Submit PR with project template
4. We may feature it in the README

## = Code Review Process

### What to Expect

1. **Initial review** within a few days
2. **Feedback** - We may request changes
3. **Discussion** - Let's collaborate!
4. **Approval** - Once everything looks good
5. **Merge** - Your contribution is live!

### Responding to Feedback

- Be open to suggestions
- Ask questions if unclear
- Make requested changes
- Update your PR

## <Æ Recognition

### Contributors

All contributors are recognized in:
- GitHub contributors page
- Future CONTRIBUTORS.md file
- Release notes (for significant contributions)

### Types of Contributions

We value all contributions equally:
- Code contributions
- Documentation improvements
- Bug reports
- Feature suggestions
- Community support
- Testing and feedback

## =Ú Resources

### Learning Bash

- [Bash Reference Manual](https://www.gnu.org/software/bash/manual/)
- [ShellCheck](https://www.shellcheck.net/) - Bash linting tool
- [Bash Guide](https://mywiki.wooledge.org/BashGuide)

### Git and GitHub

- [GitHub Docs](https://docs.github.com/)
- [Git Book](https://git-scm.com/book/en/v2)
- [How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit/)

### Open Source

- [Open Source Guide](https://opensource.guide/)
- [First Contributions](https://firstcontributions.github.io/)

## =¬ Communication

### GitHub Discussions

- Ask questions
- Share ideas
- Show your projects
- Help others

### Issues

- Bug reports
- Feature requests
- Documentation issues

### Pull Requests

- Code contributions
- Documentation updates

## – License

By contributing to LOT Terminal, you agree that your contributions will be licensed under the MIT License.

## =O Thank You

Thank you for contributing to LOT Terminal! Every contribution, no matter how small, helps make this project better for everyone.

**Happy Contributing!** =€

---

Questions? Open a [GitHub Discussion](https://github.com/vadikmarmeladov/lot-terminal/discussions) or [Issue](https://github.com/vadikmarmeladov/lot-terminal/issues).
