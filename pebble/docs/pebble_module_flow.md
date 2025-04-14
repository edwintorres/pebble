
# 🧭 Pebble Module Interaction & Execution Flow

This document explains how the modular components of Pebble interact with each other and in what order they are used during training and inference. It is intended to guide both developers and GPT-based agents on how the system flows end-to-end.

---

## 🧱 High-Level Pipeline

### 1. 🪓 `chisel/` – Tokenization
- Input: Raw text corpus
- Output: Token ID sequences
- Used by: `mammothfeeder`, `echostone`
- Description: Converts human-readable text to numeric tokens and vice versa.

### 2. 🦣 `mammothfeeder/` – Dataset + Batching
- Input: Token ID sequences
- Output: Batches of (input, target) tensors
- Used by: `firestarter`
- Description: Prepares PyTorch Datasets and DataLoaders for training and validation.

### 3. 🧠 `pebblenet/` – Transformer Model
- Input: Input tensors from `mammothfeeder`
- Output: Logits over vocabulary
- Used by: `firestarter`, `echostone`
- Description: Core language model responsible for next-token prediction.

### 4. 🔥 `firestarter/` – Training Loop
- Input: Model, DataLoaders, Config, Logger
- Output: Trained model weights, logs, checkpoints
- Uses: `pebblenet`, `mammothfeeder`, `cavepaint`, `stonetablet`
- Description: Handles training steps, optimizer, and metrics tracking.

### 5. 📜 `stonetablet/` – Configuration
- Input: YAML or JSON config file
- Output: Config dictionary or object
- Used by: All modules that require configurable settings
- Description: Centralized control for hyperparameters, paths, and options.

### 6. 🖼️ `cavepaint/` – Logging & Metrics
- Input: Loss values, training metadata
- Output: Logs, visualizations
- Used by: `firestarter`, optionally `echostone`
- Description: Tracks training progress and generates summary outputs.

### 7. 🪞 `echostone/` – Text Generation
- Input: Trained model + tokenizer + prompt string
- Output: Autoregressive text
- Uses: `pebblenet`, `chisel`, optionally `stonetablet`
- Description: Generates text one token at a time from a starting prompt.

---

## 🌀 Execution Order

### 🔧 Training
```text
1. Load config with stonetablet
2. Tokenize dataset with chisel
3. Prepare data loaders with mammothfeeder
4. Initialize model from pebblenet
5. Start training loop with firestarter
6. Log metrics with cavepaint
7. Save model checkpoints
```

### ✨ Inference
```text
1. Load trained model and tokenizer
2. Input prompt to echostone
3. Generate text using pebblenet
4. Decode with chisel
```

---

## 📌 Design Rules

- Each module must expose clean interfaces and avoid tight coupling
- Modules communicate through well-defined data types (e.g., token IDs, tensors)
- No module should directly import from another unless specified above
- All configuration must go through `stonetablet`

---

## 🔮 Future Enhancements

- Add interaction map diagram
- Track inter-module latency and performance
- Allow remote or distributed module replacements
