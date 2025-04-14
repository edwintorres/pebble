# 🪓 chisel – Tokenizer for Pebble

**`chisel`** is Pebble's tokenization module. Its purpose is to **convert raw text into token IDs and vice versa**, acting as the very first and last step of the language modeling process.

It provides both a basic **character-level tokenizer** and an optional **Byte Pair Encoding (BPE)** tokenizer for more sophisticated workflows.

---

## ✨ Responsibilities

`chisel` is responsible for:

- Encoding raw text (`str`) into token sequences (`List[int]`)
- Decoding token sequences back into human-readable text
- Managing vocabulary mapping (`token ↔ ID`)
- Optionally training a BPE tokenizer from a custom corpus
- Providing vocabulary size for the model

---

## 📦 Module Layout

```text
chisel/
├── __init__.py
└── chisel.py
```

---

## 🔌 External Dependencies

- `tokenizers` (for BPE support – optional)
- `os`, `re`, `json`, `collections` (standard libraries)

---

## 🧩 Interfaces & Contracts

This module exposes a `ChiselTokenizer` class with two modes:

- `mode="char"`: character-level
- `mode="bpe"`: uses a trained BPE model

### `class ChiselTokenizer`

#### Constructor
```python
ChiselTokenizer(mode: str = "char", vocab_size: int = 256)
```

- `mode`: either `'char'` or `'bpe'`
- `vocab_size`: ignored for char mode, used for BPE vocab size

#### Methods

```python
def encode(self, text: str) -> List[int]
```
- Converts text into token IDs

```python
def decode(self, token_ids: List[int]) -> str
```
- Converts token IDs back to string

```python
def save(self, path: str)
```
- Saves vocab/mappings to a file

```python
def load(self, path: str)
```
- Loads vocab/mappings from a file

```python
def vocab_size(self) -> int
```
- Returns the size of the vocabulary

---

## 🛠️ Usage Example

```python
from chisel.chisel import ChiselTokenizer

tok = ChiselTokenizer(mode="char")
tokens = tok.encode("hello world")
text = tok.decode(tokens)
print(tokens)
print(text)
```

---

## 📌 Notes

- The default mode is character-level and works out of the box.
- BPE mode requires additional training and vocab handling.
- The tokenizer should be agnostic of the model and training logic.

---

## 🔮 Future Ideas

- Integrate with HuggingFace `tokenizers` for faster BPE
- Add support for custom pre-tokenizers or special tokens
- Allow export to JSON for sharing vocab files

