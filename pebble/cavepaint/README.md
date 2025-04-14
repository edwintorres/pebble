# 🔼️ cavepaint – Logging & Metrics for Pebble

**`cavepaint`** is Pebble's logging and visualization module. Its role is to **track the training process**, **log important metrics**, and optionally **generate simple plots** that help monitor progress during and after training.

It is designed to be lightweight, modular, and pluggable—usable in both CLI and notebook environments.

---

## ✨ Responsibilities

`cavepaint` is responsible for:

- Logging **training and validation loss**
- Tracking metrics like accuracy or perplexity (if applicable)
- Writing logs to disk (e.g., JSON, CSV, or plain text)
- Printing nicely formatted summaries to the console
- Generating simple visualizations (e.g., matplotlib loss curves)

---

## 📦 Module Layout

```
cavepaint/
├── __init__.py
└── cavepaint.py
```

---

## 🔌 External Dependencies

- `tqdm` (optional, for progress bars)
- `matplotlib` (optional, for plots)
- `json` (standard lib)
- `os`, `time`, `datetime` (standard lib)

---

## 🧹 Interfaces & Contracts

This module exposes a `CavePainter` class.

### `class CavePainter`

#### Constructor
```python
CavePainter(log_dir: str = "logs", enable_plotting: bool = True)
```

- `log_dir`: Directory to save logs and plots
- `enable_plotting`: If True, generates matplotlib figures

#### Methods

```python
def log_step(self, step: int, loss: float, val_loss: float = None)
```
- Logs loss values for a given step.
- Can be called during training loop.

```python
def save_logs(self)
```
- Writes current log history to a `.json` or `.csv` file in `log_dir`.

```python
def plot_loss_curve(self)
```
- Generates and saves a PNG plot showing training/val loss over time.

```python
def print_summary(self)
```
- Prints a human-readable training summary to the console.

---

## 🛠️ Usage Example

```python
from cavepaint.cavepaint import CavePainter

logger = CavePainter(log_dir="logs")

for step in range(epochs):
    train_loss = compute_train_loss()
    val_loss = compute_val_loss()

    logger.log_step(step, train_loss, val_loss)

logger.save_logs()
logger.plot_loss_curve()
logger.print_summary()
```

---

## 📌 Notes

- `cavepaint` should **not** depend on the model or training logic directly.
- It should only consume metrics passed to it and act as a passive observer.
- Plotting should be optional so it can be disabled in headless environments.

---

## 🔮 Future Ideas

- Add support for TensorBoard-style logs
- Integrate with `wandb` or `mlflow`
- Support live loss printing via `tqdm`

