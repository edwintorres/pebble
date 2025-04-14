# 📜 stonetablet – Configuration Module for Pebble

**`stonetablet`** is Pebble’s configuration module. It acts as the central source of truth for all hyperparameters, file paths, and runtime options. It is designed to be easily editable and readable via YAML or JSON formats.

This module makes the entire Pebble system more reproducible, configurable, and decoupled from hard-coded constants.

---

## ✨ Responsibilities

`stonetablet` is responsible for:

- Loading configuration from YAML or JSON files
- Validating required config fields
- Providing typed access to config values
- Supplying default values where appropriate

---

## 📦 Module Layout

```text
stonetablet/
├── __init__.py
└── stonetablet.py
```

---

## 🔌 External Dependencies

- `yaml` (PyYAML)
- `json`
- `typing`, `os`, `copy`

---

## 🧩 Interfaces & Contracts

This module exposes a `load_config()` function and an optional `Config` class.

### `load_config`
```python
def load_config(path: str) -> dict:
```
- Loads config from `.yaml` or `.json`
- Returns a dictionary
- Can throw an error if required fields are missing

### Optional `Config` class
- Provides dot-access (`config.train.batch_size`)
- Can include default fallbacks

---

## 🛠️ Usage Example

```python
from stonetablet.stonetablet import load_config

config = load_config("config/stone_tablet.yaml")
print(config["train"]["batch_size"])
```

Or with a wrapper class:

```python
cfg = Config("config/stone_tablet.yaml")
print(cfg.train.batch_size)
```

---

## 📌 Notes

- All modules should read from `stonetablet` instead of hardcoding parameters
- The config file should be version-controlled
- Provide comments and sensible defaults in YAML

---

## 🔮 Future Ideas

- Add support for environment variable overrides
- CLI overrides using `argparse`
- Support for nested schema validation with `pydantic`
- Config change logging (track changes over time)

