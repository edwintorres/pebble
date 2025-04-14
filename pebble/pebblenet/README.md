# 🧠 pebblenet – Model Architecture for Pebble

**`pebblenet`** is the core neural network architecture for Pebble. It defines a lightweight, minimal GPT-style Transformer model designed for learning from token sequences and predicting the next token.

This module should be modular and easy to extend, focusing on readability, simplicity, and low resource requirements. It is the brain of Pebble—small but mighty.

---

## ✨ Responsibilities

`pebblenet` is responsible for:

- Defining the model architecture (embeddings + transformer blocks)
- Initializing weights and parameters
- Running forward passes for training and generation
- Producing logits for the next-token prediction

---

## 📦 Module Layout

```text
pebblenet/
├── __init__.py
└── pebblenet.py
```

---

## 🔌 External Dependencies

- `torch`, `torch.nn`, `torch.nn.functional`
- `math`

---

## 🧩 Interfaces & Contracts

This module exposes the `PebbleNet` class, a subclass of `torch.nn.Module`.

### `class PebbleNet(nn.Module)`

#### Constructor
```python
PebbleNet(
    vocab_size: int,
    seq_len: int,
    embed_dim: int = 128,
    num_heads: int = 4,
    num_layers: int = 2,
    dropout: float = 0.1
)
```

- `vocab_size`: from tokenizer
- `seq_len`: max length of input tokens
- `embed_dim`: embedding dimension size
- `num_heads`: number of attention heads
- `num_layers`: number of transformer blocks
- `dropout`: dropout probability

#### Methods

```python
def forward(self, input_ids: torch.Tensor) -> torch.Tensor:
```
- Input shape: `[batch_size, seq_len]`
- Output shape: `[batch_size, seq_len, vocab_size]`
- Output: logits for each token position

---

## 🛠️ Usage Example

```python
from pebblenet.pebblenet import PebbleNet

model = PebbleNet(
    vocab_size=tokenizer.vocab_size(),
    seq_len=128
)

logits = model(input_ids)  # Shape: [B, T, V]
```

---

## 📌 Notes

- The model should be compatible with `firestarter` for training and `echostone` for generation
- Positional encodings can be learned or fixed
- Layers should be implemented with clarity and separation

---

## 🔮 Future Ideas

- Add support for rotary positional embeddings
- Add weight tying between embedding and output layers
- Export to ONNX for deployment
- Add model summary and parameter count utility

