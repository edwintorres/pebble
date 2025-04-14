# 🔥 firestarter – Training Engine for Pebble

**`firestarter`** is the training loop and optimization module for Pebble. Its role is to **orchestrate the training process**, including data loading, model optimization, and evaluation. It coordinates the interactions between the model, dataset, loss function, optimizer, and logger.

This module is intended to be flexible and lightweight, enabling experiments with minimal overhead and clean output.

---

## ✨ Responsibilities

`firestarter` is responsible for:

- Initializing model and optimizer
- Running training and validation loops
- Logging metrics at each step (via `cavepaint`)
- Saving model checkpoints
- Managing epochs, learning rate schedules, and batching

---

## 📦 Module Layout

```text
firestarter/
├── __init__.py
└── firestarter.py
```

---

## 🔌 External Dependencies

- `torch`, `torch.nn`, `torch.optim`
- `os`, `time`, `math`
- Depends on `mammothfeeder`, `pebblenet`, `cavepaint`, and `stonetablet`

---

## 🧩 Interfaces & Contracts

This module exposes a `train_model()` function or a `Trainer` class.

### `train_model`
```python
def train_model(
    model: torch.nn.Module,
    dataset: torch.utils.data.Dataset,
    config: dict,
    logger: Optional[CavePainter] = None
):
```

- `model`: instance of PebbleNet or compatible class
- `dataset`: training and validation data
- `config`: training hyperparameters from `stonetablet`
- `logger`: instance of `CavePainter`

Expected keys in `config`:
- `epochs`
- `batch_size`
- `learning_rate`
- `checkpoint_dir`
- `eval_interval`

---

## 🛠️ Usage Example

```python
from firestarter.firestarter import train_model

train_model(
    model=my_model,
    dataset=my_dataset,
    config=my_config,
    logger=my_logger
)
```

---

## 📌 Notes

- The training logic should not be tied to a specific model architecture.
- `firestarter` delegates batch loading to `mammothfeeder`
- It logs progress through `cavepaint` and reads config from `stonetablet`
- Saving model weights is optional but recommended

---

## 🔮 Future Ideas

- Add support for gradient clipping
- Add mixed precision training (AMP)
- Add early stopping or checkpoint callbacks
- Modularize training phases: pretraining vs fine-tuning

