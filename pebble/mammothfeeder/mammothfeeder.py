# 🦣 mammothfeeder – Data Loader for Pebble

**`mammothfeeder`** is Pebble's data ingestion module. It is responsible for **loading, batching, and preparing training and validation data** from raw tokenized corpora. It serves as the bridge between tokenized input and the model-ready tensors used during training.

This module supports both simple in-memory datasets and more advanced streaming or disk-backed implementations in the future.

---

## ✨ Responsibilities

`mammothfeeder` is responsible for:

- Loading tokenized datasets (e.g., `.txt`, `.json`, `.pt` formats)
- Splitting data into training and validation sets
- Batching input and target sequences
- Creating PyTorch `Dataset` and `DataLoader` objects
- Optionally shuffling and augmenting sequences

---

## 📦 Module Layout

```text
mammothfeeder/
├── __init__.py
└── mammothfeeder.py
```

---

## 🔌 External Dependencies

- `torch`
- `random`, `os`, `math`, `json`

---

## 🧩 Interfaces & Contracts

This module exposes one or both of the following:

### `class PebbleDataset(torch.utils.data.Dataset)`
```python
def __init__(self, data: List[int], seq_len: int)
```
- `data`: a flat list of token IDs
- `seq_len`: number of tokens per input sequence

```python
def __getitem__(self, idx: int) -> Tuple[torch.Tensor, torch.Tensor]
```
- Returns (input_tensor, target_tensor)

```python
def __len__(self) -> int
```
- Returns number of sequences in the dataset

### `def get_dataloaders()`
```python
def get_dataloaders(
    token_ids: List[int],
    seq_len: int,
    batch_size: int,
    val_split: float = 0.1,
    shuffle: bool = True
) -> Tuple[DataLoader, DataLoader]:
```
- Returns `(train_loader, val_loader)`

---

## 🛠️ Usage Example

```python
from mammothfeeder.mammothfeeder import get_dataloaders

train_loader, val_loader = get_dataloaders(
    token_ids=all_tokens,
    seq_len=128,
    batch_size=32
)

for x, y in train_loader:
    output = model(x)
```

---

## 📌 Notes

- Tokenized input should come from the `chisel` module
- Dataloaders must be PyTorch-native and iterable
- `mammothfeeder` should not know about models or loss functions
- For now, all data is assumed to fit in memory

---

## 🔮 Future Ideas

- Support for memory-mapped datasets
- Streaming datasets (from disk or web)
- Sequence padding and masking support
- Multi-file datasets and format auto-detection