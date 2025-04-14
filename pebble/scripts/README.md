# 🧰 scripts – CLI Tools & Utilities for Pebble

**`scripts`** is the utility and command-line interface (CLI) module for Pebble. It contains helper scripts, executable tools, and setup commands that allow developers or users to interact with Pebble through simple terminal commands.

These scripts are optional but extremely useful for running and testing various parts of the pipeline without writing Python code from scratch.

---

## ✨ Responsibilities

The `scripts` module is responsible for:

- Providing CLI commands for training, generating, evaluating, etc.
- Wrapping common workflows using reusable functions
- Interfacing with core modules (firestarter, echostone, stonetablet, etc.)
- Optionally bootstrapping the project environment

---

## 📦 Module Layout

```text
scripts/
├── __init__.py
└── scripts.py
```

---

## 🔌 External Dependencies

- `argparse`
- `os`, `sys`, `time`, `logging`
- Relies on core Pebble modules

---

## 🧩 Interfaces & Contracts

The main entry point is the `main()` function in `scripts.py`, which parses CLI arguments and routes to corresponding actions.

### Sample CLI Commands:

```bash
python -m scripts train --config config/stone_tablet.yaml
python -m scripts generate --prompt "Once upon a rock"
python -m scripts test-tokenizer --text "hello pebble"
```

These commands will map to functions in `scripts.py`, such as:
- `run_training(config_path: str)`
- `generate_text(prompt: str, config_path: str)`
- `test_tokenizer(text: str)`

---

## 🛠️ Usage Example

```bash
python -m scripts train --config config/stone_tablet.yaml
```

```python
# Inside scripts.py
if args.command == "train":
    run_training(args.config)
elif args.command == "generate":
    generate_text(args.prompt, args.config)
```

---

## 📌 Notes

- Scripts should remain thin wrappers and delegate logic to core modules
- CLI args should mirror config options where relevant
- Output should be informative but minimal

---

## 🔮 Future Ideas

- Add shell autocompletion support
- Add `pebble` as an actual CLI entry point via `setup.py` or `pyproject.toml`
- Interactive prompt mode for generation
- Add `scripts/setup.py` to install dependencies and run `setup_pebble.sh`

