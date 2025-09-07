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

Selfcare Subscription Terminal Manager
EOF
echo -e "${NC}"

print_status "Starting LOT installation..."

# Debug information
print_status "Debug Information:"
echo "Current user: $(whoami)"
echo "Install directory: $INSTALL_DIR"
echo "Current directory: $(pwd)"

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

# Rest of the script remains the same...
