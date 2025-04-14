# Pebble Project

## Overview
Pebble is a small, interpretable LLM system with modular components.

## Project Structure
- `chisel/`: Tokenizer module
- `pebblenet/`: Model definition (Transformer core)
- `firestarter/`: Training loop
- `echostone/`: Text generation
- `mammothfeeder/`: Dataset + batching
- `stonetablet/`: Configuration & hyperparams
- `cavepaint/`: Logging + metrics
- `tests/`: Unit tests for each module
- `scripts/`: CLI tools or setup commands

## Setup
1. Create a virtual environment
2. Install dependencies: `pip install -r requirements.txt`
3. Run tests: `pytest tests/`
