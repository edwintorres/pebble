# 🪞 echostone – Text Generation for Pebble

**`echostone`** is Pebble's text generation module. Its role is to take a trained model and tokenizer, and produce **coherent, auto-regressive text outputs** from a given prompt. It supports various decoding strategies to control the creativity and randomness of the generated text.

This module is the primary interface for inference time and can be used via CLI or embedded in applications and notebooks.

---

## ✨ Responsibilities

`echostone` is responsible for:

- Taking a prompt and generating text from it
- Using a trained model and tokenizer to predict next tokens
- Supporting multiple decoding strategies:
  - Greedy
  - Top-k sampling
  - Temperature control
- Managing generation length and stopping conditions

---

## 📦 Module Layout

```text
echostone/
├── __init__.py
└── echostone.py
```

---

## 🔌 External Dependencies

- `torch`
- `random`, `math` (standard lib)

---

## 🧩 Interfaces & Contracts

This module exposes a `generate_text()` function and an optional `TextGenerator` class.

### `generate_text`
```python
def generate_text(
    model: torch.nn.Module,
    tokenizer: Any,
    prompt: str,
    max_tokens: int = 100,
    temperature: float = 1.0,
    top_k: int = 0,
    device: str = "cpu"
) -> str:
```

- `model`: a trained Transformer model
- `tokenizer`: must have `.encode()` and `.decode()` methods
- `prompt`: the starting text to generate from
- `max_tokens`: number of tokens to generate beyond the prompt
- `temperature`: controls randomness (>1 = more random)
- `top_k`: limits choices to top-k most likely tokens (0 = no limit)
- `device`: where to run generation (e.g., "cpu" or "cuda")

Returns: generated string

### `TextGenerator` class (optional wrapper)
- Provides reusable generation config
- Can store the model, tokenizer, and default params

---

## 🛠️ Usage Example

```python
from echostone.echostone import generate_text

output = generate_text(
    model=my_model,
    tokenizer=my_tokenizer,
    prompt="Once upon a time",
    max_tokens=50,
    temperature=0.8,
    top_k=40
)

print(output)
```

---

## 📌 Notes

- `echostone` should be usable independently of the training process.
- It assumes the model is already trained and moved to eval mode.
- Tokenizer must be compatible with model’s vocab.

---

## 🔮 Future Ideas

- Add support for nucleus sampling (top-p)
- Implement streaming text generation (token-by-token)
- Add CLI entry point: `pebble generate "prompt text here"`
- Integrate with cavepaint for logging generated samples

