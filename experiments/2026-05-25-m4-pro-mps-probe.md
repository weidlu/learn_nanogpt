# Experiment: M4 Pro MPS Shakespeare char probe

Date: 2026-05-25

## Question

Windows pure CPU can only train a very small baby GPT. Can this Mac train a better Shakespeare character-level model?

## Hardware

```text
MacBook Pro Mac16,8
Chip: Apple M4 Pro
Cores: 12 total, 8 performance + 4 efficiency
Memory: 24 GB
PyTorch: 2.6.0
MPS built: true
MPS available: true
```

## Dataset

Command:

```sh
python3 data/shakespeare_char/prepare.py
```

Result:

```text
length of dataset in characters: 1,115,394
vocab size: 65
train has 1,003,854 tokens
val has 111,540 tokens
```

## Probe 1: default nanoGPT Shakespeare char config

Command:

```sh
python3 train.py config/train_shakespeare_char.py \
  --device=mps --compile=False --dtype=float32 \
  --eval_iters=5 --eval_interval=10000 \
  --log_interval=5 --max_iters=20 \
  --out_dir=out-probe-mps-default
```

Model:

```text
n_layer=6
n_head=6
n_embd=384
block_size=256
batch_size=64
parameters=10.65M
tokens/iter=16,384
```

Observed speed after warmup:

```text
~0.43 sec/iter
```

## Probe 2: larger 25M-ish config

Command:

```sh
python3 train.py config/train_shakespeare_char.py \
  --device=mps --compile=False --dtype=float32 \
  --eval_iters=3 --eval_interval=10000 \
  --log_interval=3 --max_iters=12 \
  --out_dir=out-probe-mps-25m \
  --n_layer=8 --n_head=8 --n_embd=512 \
  --batch_size=32 --block_size=256
```

Model:

```text
n_layer=8
n_head=8
n_embd=512
block_size=256
batch_size=32
parameters=25.21M
tokens/iter=8,192
```

Observed speed after warmup:

```text
~0.44-0.47 sec/iter
```

## Conclusion

Yes. This Mac can train a better model than a Windows pure-CPU baby GPT.

The best first full run should probably be the standard Shakespeare char config on MPS:

```sh
python3 train.py config/train_shakespeare_char.py \
  --device=mps --compile=False --dtype=float32
```

Expected behavior:

- Much better than the tiny CPU recipe.
- Likely tens of minutes, not days.
- Good enough to produce recognizably Shakespeare-like samples.

The 25M config is possible, but because it used a smaller batch in the probe, it does not automatically mean better quality per wall-clock hour. Try the default full run first, then compare with a bigger config.

## What I Learned

- On this repo, MPS works on the M4 Pro when using `--device=mps --compile=False --dtype=float32`.
- The default 10.65M Shakespeare char model is already a serious step up from a tiny CPU baby GPT.
- Bigger models are feasible, but the Shakespeare char dataset is small, so more capacity can overfit unless validation loss is watched.
