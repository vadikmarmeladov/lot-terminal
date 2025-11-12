#!/bin/bash

# LOT Terminal Manager Installer
# Usage: curl -sSL https://raw.githubusercontent.com/vadikmarmeladov/lot-terminal/main/install.sh | bash

set -e

# Configuration
REPO_USER="vadikmarmeladov"  # Updated to your actual GitHub username
REPO_NAME="lot-terminal"
SCRIPT_NAME="lot"
VERSION="main"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# Print colored output
print_status() {
    echo -e "${CYAN}[LOT]${NC} $1"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

# Header
echo -e "${CYAN}"
cat << 'EOF'
 _     ___  _____
| |   / _ \|_   _|
| |  | | | | | |
| |__| |_| | | |
|_____\___/  |_|

LOT Terminal – an open-source platform for self-care hardware
EOF
echo -e "${NC}"

print_status "Starting LOT installation..."

# Check requirements
print_status "Checking system requirements..."

# Check for bash
if ! command -v bash &> /dev/null; then
    print_error "Bash is required but not installed"
    exit 1
fi

# Check for nano
if ! command -v nano &> /dev/null; then
    print_warning "Nano not found. Installing nano is recommended for full functionality."
    echo "Install nano with:"
    echo "  macOS: brew install nano"
    echo "  Ubuntu/Debian: sudo apt-get install nano"
    echo "  CentOS/RHEL: sudo yum install nano"
    echo ""
fi

# Check for curl
if ! command -v curl &> /dev/null; then
    print_error "curl is required but not installed"
    exit 1
fi

# Determine install directory
if [[ $EUID -eq 0 ]]; then
    INSTALL_DIR="/usr/local/bin"
    print_status "Installing system-wide to $INSTALL_DIR (requires root)"
else
    INSTALL_DIR="$HOME/bin"
    mkdir -p "$INSTALL_DIR"
    print_status "Installing to user directory $INSTALL_DIR"
fi

# Create LOT configuration directory
LOT_CONFIG_DIR="$HOME/.lot"
mkdir -p "$LOT_CONFIG_DIR/users"
print_status "Created configuration directory: $LOT_CONFIG_DIR"

# Download the script
print_status "Downloading LOT script..."
DOWNLOAD_URL="https://raw.githubusercontent.com/$REPO_USER/$REPO_NAME/$VERSION/bin/lot"

# Add verbose curl for debugging
print_status "Attempting to download from: $DOWNLOAD_URL"
if curl -v -L "$DOWNLOAD_URL" -o "$INSTALL_DIR/$SCRIPT_NAME" 2>&1; then
    print_success "Downloaded successfully"
else
    print_error "Failed to download LOT script"
    print_error "Please check the repository URL: $DOWNLOAD_URL"
    exit 1
fi

# Make executable
chmod +x "$INSTALL_DIR/$SCRIPT_NAME"
print_success "Made script executable"

# Add to PATH if needed
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    print_warning "Adding $INSTALL_DIR to PATH..."

    # Detect shell
    if [ -n "$BASH_VERSION" ]; then
        SHELL_RC="$HOME/.bashrc"
    elif [ -n "$ZSH_VERSION" ]; then
        SHELL_RC="$HOME/.zshrc"
    else
        SHELL_RC="$HOME/.profile"
    fi

    # Add to PATH in shell config
    if [ -f "$SHELL_RC" ]; then
        echo "" >> "$SHELL_RC"
        echo "# Added by LOT Terminal installer" >> "$SHELL_RC"
        echo "export PATH=\"\$PATH:$INSTALL_DIR\"" >> "$SHELL_RC"
        print_success "Added to PATH in $SHELL_RC"
        print_warning "Run 'source $SHELL_RC' or restart your terminal"
    fi
fi

# Run initialization
print_status "Initializing LOT Terminal..."
if "$INSTALL_DIR/$SCRIPT_NAME" init; then
    print_success "Initialization complete!"
else
    print_warning "Initialization had some issues, but installation succeeded"
fi

# Success message
echo ""
echo -e "${GREEN}╔════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║${NC}     LOT Terminal installed successfully!      ${GREEN}║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${CYAN}Quick Start:${NC}"
echo "  lot help        - Show all commands"
echo "  lot config      - Edit your settings"
echo "  lot user create - Create a user profile"
echo "  lot hardware    - Start hardware development"
echo ""
echo -e "${YELLOW}Developer Playground:${NC}"
echo "  ✓ Open source backend system"
echo "  ✓ Settings & logs via .env files"
echo "  ✓ Hardware development tools"
echo "  ✓ Terminal-first experience"
echo ""
echo -e "${BLUE}Note:${NC} This does NOT provide access to lot-systems.com"
echo ""
echo -e "${CYAN}Configuration:${NC} $HOME/.lot/"
echo -e "${CYAN}Repository:${NC} https://github.com/$REPO_USER/$REPO_NAME"
echo ""
