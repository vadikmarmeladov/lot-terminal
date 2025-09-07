#!/bin/bash

# LOT Terminal Manager Installer
# Usage: curl -sSL 
https://raw.githubusercontent.com/yourusername/lot-terminal/main/install.sh 
| bash

set -e

# Configuration
REPO_USER="yourusername"  # Replace with your GitHub username
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

Selfcare Subscription Terminal Manager
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
    print_warning "Nano not found. Installing nano is recommended for full 
functionality."
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

# Download the script
print_status "Downloading LOT script..."
DOWNLOAD_URL="https://raw.githubusercontent.com/$REPO_USER/$REPO_NAME/$VERSION/bin/lot"

if curl -sSL "$DOWNLOAD_URL" -o "$INSTALL_DIR/$SCRIPT_NAME"; then
    print_success "Downloaded successfully"
else
    print_error "Failed to download LOT script"
    print_error "Please check the repository URL: $DOWNLOAD_URL"
    exit 1
fi

# Make executable
chmod +x "$INSTALL_DIR/$SCRIPT_NAME"
print_success "Made script executable"

# Add to PATH if needed (user install only)
if [[ "$INSTALL_DIR" == "$HOME/bin" ]]; then
    # Check if already in PATH
    if ! echo "$PATH" | grep -q "$HOME/bin"; then
        # Add to shell profile
        SHELL_PROFILE=""
        if [ -f "$HOME/.bashrc" ]; then
            SHELL_PROFILE="$HOME/.bashrc"
        elif [ -f "$HOME/.bash_profile" ]; then
            SHELL_PROFILE="$HOME/.bash_profile"
        elif [ -f "$HOME/.zshrc" ]; then
            SHELL_PROFILE="$HOME/.zshrc"
        elif [ -f "$HOME/.profile" ]; then
            SHELL_PROFILE="$HOME/.profile"
        fi

        if [ -n "$SHELL_PROFILE" ]; then
            echo "" >> "$SHELL_PROFILE"
            echo "# Added by LOT installer" >> "$SHELL_PROFILE"
            echo "export PATH=\"\$HOME/bin:\$PATH\"" >> "$SHELL_PROFILE"
            print_success "Added $HOME/bin to PATH in $SHELL_PROFILE"
            print_warning "Please run: source $SHELL_PROFILE or restart 
your terminal"
        else
            print_warning "Could not detect shell profile. Please add 
$HOME/bin to your PATH manually."
        fi
    fi
fi

# Initialize LOT
print_status "Initializing LOT..."
if "$INSTALL_DIR/$SCRIPT_NAME" init; then
    print_success "LOT initialized successfully"
else
    print_error "Failed to initialize LOT"
    exit 1
fi

# Success message
echo ""
print_success "LOT installation completed!"
echo ""
echo -e "${CYAN}Quick Start:${NC}"
echo "  lot help                 # Show all commands"
echo "  lot nano $(whoami)            # Create your first user profile"
echo "  lot list                 # List all users"
echo "  lot stats                # View subscription statistics"
echo ""
echo -e "${CYAN}Configuration:${NC}"
echo "  lot config               # Edit global settings"
echo "  Config file: ~/.lot/.env"
echo "  User profiles: ~/.lot/users/"
echo ""
echo -e "${CYAN}Documentation:${NC}"
echo "  Repository: https://github.com/$REPO_USER/$REPO_NAME"
echo "  Issues: https://github.com/$REPO_USER/$REPO_NAME/issues"
echo ""

# Test installation
if command -v lot &> /dev/null || command -v "$INSTALL_DIR/$SCRIPT_NAME" 
&> /dev/null; then
    print_success "LOT is ready to use!"
    
    # Show version if possible
    if "$INSTALL_DIR/$SCRIPT_NAME" --version &> /dev/null; then
        VERSION_OUTPUT=$("$INSTALL_DIR/$SCRIPT_NAME" --version)
        echo "Installed version: $VERSION_OUTPUT"
    fi
else
    print_warning "LOT installed but not found in PATH. You may need to 
restart your terminal."
    echo "Or run directly: $INSTALL_DIR/$SCRIPT_NAME"
fi
