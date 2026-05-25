# 04 - Mac MPS Training Recipe

This Mac can use Apple GPU acceleration through PyTorch MPS.

Verified on 2026-05-25:

```text
Apple M4 Pro
24 GB memory
PyTorch 2.6.0
MPS available: true
```

## Recommended first real run

Run this inside the original nanoGPT repo:

```sh
python3 data/shakespeare_char/prepare.py

python3 train.py config/train_shakespeare_char.py \
  --device=mps --compile=False --dtype=float32
```

Then sample:

```sh
python3 sample.py \
  --out_dir=out-shakespeare-char \
  --device=mps --dtype=float32 \
  --max_new_tokens=500
```

## Why this recipe

- `--device=mps` uses the Apple GPU instead of pure CPU.
- `--compile=False` avoids PyTorch compile friction on MPS.
- `--dtype=float32` keeps the run simple and stable.

## What to try after the first run

If the default run works and validation loss keeps improving, try a slightly larger model:

```sh
python3 train.py config/train_shakespeare_char.py \
  --device=mps --compile=False --dtype=float32 \
  --n_layer=8 --n_head=8 --n_embd=512 \
  --batch_size=32 --block_size=256 \
  --out_dir=out-shakespeare-char-25m
```

Compare using the same prompt and sampling settings.

## Watch-outs

- Shakespeare char is a small dataset. A bigger model can memorize instead of generalize.
- Compare validation loss, not just training loss.
- If memory pressure appears, reduce `batch_size` first.
- If generation is too chaotic, lower `temperature`, for example `--temperature=0.7`.
