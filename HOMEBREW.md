# Homebrew Distribution Guide

This guide explains how to distribute LOT Terminal via Homebrew.

## For Users

### Installation

```bash
# Add the LOT Terminal tap
brew tap vadikmarmeladov/lot

# Install LOT Terminal
brew install lot

# Verify installation
lot version
```

### Updating

```bash
# Update Homebrew
brew update

# Upgrade LOT Terminal
brew upgrade lot
```

### Uninstallation

```bash
brew uninstall lot
brew untap vadikmarmeladov/lot
```

## For Maintainers

### Setting Up the Homebrew Tap

1. **Create a Homebrew tap repository**

```bash
# Create a new repository named: homebrew-lot
# GitHub URL will be: github.com/vadikmarmeladov/homebrew-lot
```

2. **Add the formula to the tap**

```bash
# Clone your tap repository
git clone https://github.com/vadikmarmeladov/homebrew-lot.git
cd homebrew-lot

# Create Formula directory
mkdir -p Formula

# Copy the formula
cp /path/to/lot-terminal/Formula/lot.rb Formula/

# Commit and push
git add Formula/lot.rb
git commit -m "Add LOT Terminal formula"
git push origin main
```

### Creating a Release

1. **Tag a release in lot-terminal repository**

```bash
cd lot-terminal
git tag -a v1.0.0 -m "Release v1.0.0"
git push origin v1.0.0
```

2. **Create GitHub release**

Go to: https://github.com/vadikmarmeladov/lot-terminal/releases/new
- Choose the tag (v1.0.0)
- Add release notes
- Publish release

3. **Calculate the SHA256**

```bash
# Download the release tarball
curl -L https://github.com/vadikmarmeladov/lot-terminal/archive/refs/tags/v1.0.0.tar.gz -o lot-1.0.0.tar.gz

# Calculate SHA256
shasum -a 256 lot-1.0.0.tar.gz

# Copy the hash
```

4. **Update the formula with the SHA256**

Edit `homebrew-lot/Formula/lot.rb`:
```ruby
sha256 "paste-the-actual-sha256-here"
```

5. **Commit and push the updated formula**

```bash
cd homebrew-lot
git add Formula/lot.rb
git commit -m "Update SHA256 for v1.0.0"
git push origin main
```

### Testing the Formula

```bash
# Test installation locally
brew install --build-from-source Formula/lot.rb

# Test the formula
brew test lot

# Audit the formula
brew audit --strict lot
```

### Updating for New Releases

For each new release:

1. Update version in `lot.rb`:
```ruby
url "https://github.com/vadikmarmeladov/lot-terminal/archive/refs/tags/v1.1.0.tar.gz"
```

2. Calculate and update SHA256
3. Commit and push to homebrew-lot repository

## Formula Structure

The formula (`Formula/lot.rb`) includes:

- **desc**: Brief description
- **homepage**: Project URL
- **url**: Download URL for the release
- **sha256**: Checksum for verification
- **license**: MIT
- **install**: Installation steps
- **test**: Verification commands
- **caveats**: Post-installation message

## Benefits of Homebrew Distribution

### For Users:
- ✅ **Easy installation** - Single command
- ✅ **Automatic updates** - `brew upgrade`
- ✅ **Clean uninstallation** - `brew uninstall`
- ✅ **Dependency management** - Handled by Homebrew
- ✅ **Trusted source** - From official tap

### For Project:
- ✅ **Professional distribution** - Industry-standard method
- ✅ **Wider reach** - Accessible to Homebrew users
- ✅ **Version management** - Easy to maintain versions
- ✅ **Still open source** - Users can contribute
- ✅ **No compilation** - Simple bash script

## Alternative: Homebrew Core

To submit to the main Homebrew repository (homebrew-core):

1. Formula must meet [acceptance criteria](https://docs.brew.sh/Acceptable-Formulae)
2. Project should be stable and well-maintained
3. Submit PR to [homebrew-core](https://github.com/Homebrew/homebrew-core)

Requirements:
- Stable releases
- 75+ stars on GitHub (or notable/widely-used)
- Active maintenance
- No security issues

## Notes

- **Both methods are open source**: Installing via Homebrew doesn't mean users aren't participating in open source - they're just using a convenient package manager
- **Contributing**: Users can still fork, modify, and contribute regardless of installation method
- **Source code**: Always available on GitHub
- **Transparency**: Formula shows exactly what's being installed

## Resources

- [Homebrew Documentation](https://docs.brew.sh/)
- [Creating Taps](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap)
- [Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- [Python for Formula Authors](https://docs.brew.sh/Python-for-Formula-Authors)

---

**Questions?** Open an issue in the [lot-terminal](https://github.com/vadikmarmeladov/lot-terminal) repository.
