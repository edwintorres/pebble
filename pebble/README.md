# 🪨 Pebble Project

Pebble is a **small, interpretable LLM system** built from the ground up with **modularity, clarity, and extensibility** in mind. Inspired by early computing pioneers, Pebble emphasizes simplicity and hackability while still implementing a modern Transformer-based architecture.

Whether you're here to learn how LLMs work, build lightweight models, or extend AI components in a clean codebase, Pebble gives you a solid, well-documented foundation.

---

## 🧠 Core Philosophy
- **Modular by Design** – Each component has one responsibility and minimal dependencies.
- **Readable and Hackable** – Prioritizes clarity over cleverness.
- **GPT-Extendable** – Designed to be built with the help of GPT agents using self-contained prompts.
- **Lightweight** – Can run on CPU for small-scale experiments.

---

## 📁 Project Structure

```text
pebble/
├── chisel/          # Tokenizer module
├── pebblenet/       # Model definition (Transformer core)
├── firestarter/     # Training loop
├── echostone/       # Text generation
├── mammothfeeder/   # Dataset + batching
├── stonetablet/     # Configuration & hyperparams
├── cavepaint/       # Logging + metrics
├── tests/           # Unit & integration tests
├── scripts/         # CLI tools or setup commands
└── config/          # Example config files (optional)
```

Each folder has its own `README.md` that defines:
- Responsibilities
- Interfaces
- Dependencies
- Example usage

---

## ⚙️ Setup

1. Create and activate a virtual environment:
```bash
python -m venv .venv
source .venv/bin/activate
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

3. Run tests to verify setup:
```bash
pytest tests/
```

---

## 🧪 Try It Out

Train a model:
```bash
python -m scripts train --config config/stone_tablet.yaml
```

Generate text:
```bash
python -m scripts generate --prompt "Once upon a rock..."
```

---

## 🔮 Roadmap
- [ ] Add support for BPE tokenization
- [ ] Implement LoRA fine-tuning
- [ ] CLI enhancements & `pebble` entrypoint
- [ ] Streaming generation
- [ ] Model export (ONNX / TorchScript)

---

## 👋 Contributing
Want to contribute or use GPT to extend Pebble? Check out each module's README for a scoped prompt you can use.

Let’s build the future one stone at a time. 🪨✨

