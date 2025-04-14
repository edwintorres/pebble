# 🧪 tests – Unit & Integration Tests for Pebble

**`tests`** contains all automated tests for the Pebble project. Its purpose is to ensure correctness, stability, and safety of changes to individual modules or the entire pipeline. These tests cover unit tests for core functionality and integration tests for multi-module workflows.

This module follows a test-first mindset and uses lightweight Python testing frameworks.

---

## ✨ Responsibilities

The `tests` module is responsible for:

- Unit testing individual components (e.g., tokenizer, model, logger)
- Integration testing multi-module pipelines (e.g., training loop + dataset)
- Providing fixtures or sample data for reproducibility
- Validating CLI scripts and configuration loading
- Running tests automatically via CI/CD

---

## 📦 Module Layout

```text
tests/
├── __init__.py
├── test_pebble.py       # Full integration test
├── tests.py             # Optional manual test runner
└── README.md            # This file
```

---

## 🔌 External Dependencies

- `pytest` (recommended)
- `unittest` (standard lib alternative)
- `tempfile`, `os`, `json`, `shutil`

---

## 🧩 Interfaces & Contracts

Each test file should:

- Use descriptive function names like `test_encode_decode()`
- Follow arrange-act-assert structure
- Include expected outputs or conditions

Recommended test structure:

```python
def test_encode_decode():
    tok = ChiselTokenizer()
    tokens = tok.encode("hello")
    text = tok.decode(tokens)
    assert text == "hello"
```

---

## 🛠️ Running Tests

```bash
pytest tests/
```

Or with `unittest`:

```bash
python -m unittest discover tests
```

Optional manual runner:
```bash
python tests/tests.py
```

---

## 📌 Notes

- All core modules must have at least one unit test
- Use small datasets for speed
- Avoid external dependencies during test runs

---

## 🔮 Future Ideas

- Add code coverage reports
- Integrate GitHub Actions for CI test automation
- Add property-based testing for edge cases
- Snapshot test outputs for reproducibility