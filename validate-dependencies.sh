#!/usr/bin/env bash
#
# Dependency Validation Script for Neovim Configuration
# This script checks if all dependencies are installed and configured correctly.
# Installation is delegated to chezmoi configuration.
#
# Usage: ./validate-dependencies.sh
#

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Track missing dependencies
MISSING_CORE=()
MISSING_RECOMMENDED=()
MISSING_PYTHON_PACKAGES=()
MISSING_OPTIONAL=()

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
  OS="macos"
elif [[ -f /etc/debian_version ]] || command -v apt &>/dev/null; then
  OS="linux"
else
  OS="unknown"
fi

# Logging functions
success() {
  echo -e "${GREEN}✓${NC} $1"
}

missing() {
  echo -e "${RED}✗${NC} $1"
}

warn() {
  echo -e "${YELLOW}!${NC} $1"
}

info() {
  echo -e "${GREEN}[INFO]${NC} $1"
}

section() {
  echo ""
  echo "========================================"
  echo "$1"
  echo "========================================"
}

# Check command existence
check_command() {
  local cmd=$1
  local display_name=${2:-$1}

  if command -v "$cmd" &>/dev/null; then
    success "$display_name installed"
    return 0
  else
    missing "$display_name not found"
    return 1
  fi
}

# Check Python package
check_python_package() {
  local pkg=$1

  if pip3 show "$pkg" &>/dev/null 2>&1; then
    success "$pkg (Python package) installed"
    return 0
  else
    missing "$pkg (Python package) not found"
    return 1
  fi
}

# Check Homebrew package (macOS only)
check_brew_package() {
  local pkg=$1
  local display_name=${2:-$1}

  if [[ "$OS" == "macos" ]]; then
    if brew list "$pkg" &>/dev/null 2>&1; then
      success "$display_name installed (via Homebrew)"
      return 0
    else
      missing "$display_name not found (brew list $pkg failed)"
      return 1
    fi
  fi
  return 0
}

# Check apt package (Linux only)
check_apt_package() {
  local pkg=$1
  local display_name=${2:-$1}

  if [[ "$OS" == "linux" ]]; then
    if dpkg -l | grep -q "^ii  $pkg "; then
      success "$display_name installed (via apt)"
      return 0
    else
      missing "$display_name not found (dpkg check failed)"
      return 1
    fi
  fi
  return 0
}

section "System Information"
echo "OS: $OS"
if [[ "$OS" == "macos" ]]; then
  echo "Platform: $(uname -s) $(uname -r)"
elif [[ "$OS" == "linux" ]]; then
  echo "Platform: $(uname -s) $(uname -r)"
  if [[ -f /etc/os-release ]]; then
    echo "Distribution: $(grep PRETTY_NAME /etc/os-release | cut -d'"' -f2)"
  fi
fi

section "Package Manager"
if [[ "$OS" == "macos" ]]; then
  if ! check_command brew "Homebrew"; then
    MISSING_CORE+=("homebrew")
    echo ""
    warn "Install Homebrew from: https://brew.sh/"
  fi
elif [[ "$OS" == "linux" ]]; then
  check_command apt "APT package manager"
fi

section "Core Dependencies"
# Neovim
if check_command nvim "Neovim"; then
  NVIM_VERSION=$(nvim --version | head -n 1 | cut -d' ' -f2)
  echo "  Version: $NVIM_VERSION"
else
  MISSING_CORE+=("neovim")
fi

# Git
if ! check_command git "Git"; then
  MISSING_CORE+=("git")
fi

# Ripgrep
if ! check_command rg "ripgrep"; then
  MISSING_CORE+=("ripgrep")
fi

# fd (note: fd-find on Ubuntu installs as fdfind)
if [[ "$OS" == "linux" ]]; then
  if ! check_command fd "fd" && ! check_command fdfind "fd-find"; then
    MISSING_CORE+=("fd-find")
    warn "  Note: On Ubuntu, install 'fd-find' package and create symlink: ln -sf \$(which fdfind) ~/.local/bin/fd"
  elif command -v fdfind &>/dev/null && ! command -v fd &>/dev/null; then
    warn "  'fdfind' is installed but 'fd' symlink is missing"
    warn "  Create symlink: mkdir -p ~/.local/bin && ln -sf \$(which fdfind) ~/.local/bin/fd"
  fi
else
  if ! check_command fd "fd"; then
    MISSING_CORE+=("fd")
  fi
fi

# fzf
if ! check_command fzf "fzf"; then
  MISSING_CORE+=("fzf")
fi

section "Recommended Tools"
# Lazygit
if ! check_command lazygit "lazygit"; then
  MISSING_RECOMMENDED+=("lazygit")
fi

# Delta
if ! check_command delta "delta"; then
  MISSING_RECOMMENDED+=("delta")
fi

# Tree
if ! check_command tree "tree"; then
  MISSING_RECOMMENDED+=("tree")
fi

# gnu-sed (macOS only - BSD sed works but GNU sed is preferred for some operations)
if [[ "$OS" == "macos" ]]; then
  if ! check_brew_package gnu-sed "GNU sed"; then
    MISSING_RECOMMENDED+=("gnu-sed")
    warn "  Note: macOS has BSD sed by default, GNU sed is recommended for better compatibility"
  fi
fi

section "Node.js and npm"
if check_command node "Node.js"; then
  NODE_VERSION=$(node --version)
  echo "  Version: $NODE_VERSION"
else
  MISSING_CORE+=("node")
fi

if check_command npm "npm"; then
  NPM_VERSION=$(npm --version)
  echo "  Version: $NPM_VERSION"
else
  MISSING_CORE+=("npm")
fi

section "Python Environment"
if check_command python3 "Python 3"; then
  PYTHON_VERSION=$(python3 --version)
  echo "  Version: $PYTHON_VERSION"
else
  MISSING_CORE+=("python3")
fi

if check_command pip3 "pip3"; then
  PIP_VERSION=$(pip3 --version | cut -d' ' -f2)
  echo "  Version: $PIP_VERSION"
else
  MISSING_CORE+=("pip3")
fi

# Python packages for Neovim
if command -v pip3 &>/dev/null; then
  echo ""
  echo "Python packages for Neovim:"
  for pkg in pynvim jupyter ipykernel; do
    if ! check_python_package "$pkg"; then
      MISSING_PYTHON_PACKAGES+=("$pkg")
    fi
  done
fi

section "Build Tools"
# GCC
if ! check_command gcc "GCC"; then
  MISSING_CORE+=("gcc")
fi

# On Linux, check for build-essential
if [[ "$OS" == "linux" ]]; then
  check_apt_package build-essential "build-essential"
fi

section "Optional Development Tools"
# Java
if command -v java &>/dev/null && java -version &>/dev/null 2>&1; then
  JAVA_VERSION=$(java -version 2>&1 | head -n 1)
  success "Java installed"
  echo "  Version: $JAVA_VERSION"
else
  missing "Java not found"
  MISSING_OPTIONAL+=("java")
fi

# CMake
if check_command cmake "CMake"; then
  CMAKE_VERSION=$(cmake --version | head -n 1 | cut -d' ' -f3)
  echo "  Version: $CMAKE_VERSION"
else
  MISSING_OPTIONAL+=("cmake")
fi

# Go
if check_command go "Go"; then
  GO_VERSION=$(go version | cut -d' ' -f3)
  echo "  Version: $GO_VERSION"
else
  MISSING_OPTIONAL+=("go")
fi

# Rust
if check_command rustc "Rust"; then
  RUST_VERSION=$(rustc --version | cut -d' ' -f2)
  echo "  Version: $RUST_VERSION"
  check_command cargo "Cargo (Rust package manager)"
else
  MISSING_OPTIONAL+=("rust")
fi

# Summary
section "Validation Summary"

if [[ ${#MISSING_CORE[@]} -eq 0 ]]; then
  success "All core dependencies are installed!"
else
  missing "Missing core dependencies (${#MISSING_CORE[@]}):"
  for dep in "${MISSING_CORE[@]}"; do
    echo "    - $dep"
  done
fi

if [[ ${#MISSING_PYTHON_PACKAGES[@]} -gt 0 ]]; then
  missing "Missing Python packages (${#MISSING_PYTHON_PACKAGES[@]}):"
  for pkg in "${MISSING_PYTHON_PACKAGES[@]}"; do
    echo "    - $pkg"
  done
fi

if [[ ${#MISSING_RECOMMENDED[@]} -gt 0 ]]; then
  warn "Missing recommended tools (${#MISSING_RECOMMENDED[@]}):"
  for dep in "${MISSING_RECOMMENDED[@]}"; do
    echo "    - $dep"
  done
fi

if [[ ${#MISSING_OPTIONAL[@]} -gt 0 ]]; then
  warn "Missing optional tools (${#MISSING_OPTIONAL[@]}):"
  for dep in "${MISSING_OPTIONAL[@]}"; do
    echo "    - $dep"
  done
fi

echo ""
if [[ ${#MISSING_CORE[@]} -eq 0 ]] && [[ ${#MISSING_PYTHON_PACKAGES[@]} -eq 0 ]]; then
  info "Your Neovim configuration should work correctly!"
  echo ""
  info "Next steps:"
  echo "  1. Open Neovim with 'nvim'"
  echo "  2. Lazy.nvim will automatically install plugins"
  echo "  3. Mason will install language servers"
  echo "  4. Treesitter will compile parsers on first use"
  exit 0
else
  echo ""
  warn "Some dependencies are missing. Please install them via your chezmoi configuration."
  echo ""
  info "To install missing dependencies, update your chezmoi config to include:"
  if [[ "$OS" == "macos" ]]; then
    echo "  - Homebrew packages: ${MISSING_CORE[@]} ${MISSING_RECOMMENDED[@]}"
  elif [[ "$OS" == "linux" ]]; then
    echo "  - APT packages: ${MISSING_CORE[@]} ${MISSING_RECOMMENDED[@]}"
  fi
  if [[ ${#MISSING_PYTHON_PACKAGES[@]} -gt 0 ]]; then
    echo "  - Python packages: ${MISSING_PYTHON_PACKAGES[@]}"
  fi
  exit 1
fi
