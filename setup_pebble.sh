#!/bin/bash

# Pebble Project Setup Script
# This script creates a modular AI project structure for Pebble

# Ensure the script is run from the desired parent directory
set -e

# Project name
PROJECT_NAME="pebble"

# Create project root directory
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Create component directories
COMPONENTS=(
    "chisel"
    "pebblenet"
    "firestarter"
    "echostone"
    "mammothfeeder"
    "stonetablet"
    "cavepaint"
    "tests"
    "scripts"
    "data"
)

# Create directories and initial files
for component in "${COMPONENTS[@]}"; do
    mkdir -p "$component"
    
    # Create __init__.py in each module
    touch "$component/__init__.py"
    
    # Create a module-specific Python file
    touch "$component/${component}.py"
    
    # Create README.md for major folders
    if [[ "$component" != "data" ]]; then
        cat > "$component/README.md" << EOF
# ${component^} Module

## Overview
Description of the ${component^} module in the Pebble project.

## Responsibilities
- List key responsibilities of this module
EOF
    fi
done

# Create root README.md
cat > "README.md" << EOF
# Pebble Project

## Overview
Pebble is a small, interpretable LLM system with modular components.

## Project Structure
- \`chisel/\`: Tokenizer module
- \`pebblenet/\`: Model definition (Transformer core)
- \`firestarter/\`: Training loop
- \`echostone/\`: Text generation
- \`mammothfeeder/\`: Dataset + batching
- \`stonetablet/\`: Configuration & hyperparams
- \`cavepaint/\`: Logging + metrics
- \`tests/\`: Unit tests for each module
- \`scripts/\`: CLI tools or setup commands

## Setup
1. Create a virtual environment
2. Install dependencies: \`pip install -r requirements.txt\`
3. Run tests: \`pytest tests/\`
EOF

# Create .gitignore
cat > ".gitignore" << EOF
# Python
__pycache__/
*.py[cod]
*\$py.class
*.so
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST

# Environment
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/

# ML Specific
*.pt
*.pth
*.chkpt

# OS
.DS_Store
.AppleDouble
.LSOverride

# Data
data/

# IDE
.vscode/
.idea/
*.swp
*.swo
EOF

# Create requirements.txt
cat > "requirements.txt" << EOF
torch>=1.8.0
numpy>=1.20.0
tqdm>=4.60.0
matplotlib>=3.4.0
tokenizers>=0.10.0
pytest>=6.2.0  # For testing
EOF

# Create pyproject.toml for Poetry
cat > "pyproject.toml" << EOF
[tool.poetry]
name = "pebble"
version = "0.1.0"
description = "A small, interpretable LLM system"
authors = ["Your Name <your.email@example.com>"]

[tool.poetry.dependencies]
python = "^3.8"
torch = "^1.8.0"
numpy = "^1.20.0"
tqdm = "^4.60.0"
matplotlib = "^3.4.0"
tokenizers = "^0.10.0"

[tool.poetry.dev-dependencies]
pytest = "^6.2.0"

[build-system]
requires = ["poetry-core>=1.0.0"]
build-backend = "poetry.core.masonry.api"
EOF

# Create a basic test file
cat > "tests/test_pebble.py" << EOF
import pytest

def test_placeholder():
    """Placeholder test to ensure test infrastructure works."""
    assert True, "Basic test passed"
EOF

# Make the script executable
chmod +x "$0"

echo "Pebble project structure created successfully in $PROJECT_NAME/"
echo "Next steps:"
echo "1. Create a virtual environment: python3 -m venv .venv"
echo "2. Activate the environment: source .venv/bin/activate"
echo "3. Install dependencies: pip install -r requirements.txt"