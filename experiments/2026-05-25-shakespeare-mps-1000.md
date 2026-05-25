# Experiment: Shakespeare char MPS 1000 iter

Date: 2026-05-25

## Question

Can the M4 Pro Mac train a visibly better Shakespeare character model than the tiny Windows pure-CPU baby GPT setup?

## Command

Run inside the nanoGPT repo:

```sh
python3 train.py config/train_shakespeare_char.py \
  --device=mps --compile=False --dtype=float32 \
  --max_iters=1000 --lr_decay_iters=1000 \
  --eval_iters=50 --eval_interval=250 \
  --log_interval=25 \
  --out_dir=out-shakespeare-char-mps-1000
```

Sampling:

```sh
python3 sample.py \
  --out_dir=out-shakespeare-char-mps-1000 \
  --device=mps --dtype=float32 \
  --num_samples=1 --max_new_tokens=350 \
  --temperature=0.7 --top_k=100
```

Note: `sample.py` required installing the standard nanoGPT dependency `tiktoken`.

## Parameters

| Parameter | Value |
| --- | --- |
| dataset | shakespeare_char |
| device | mps |
| dtype | float32 |
| block_size | 256 |
| batch_size | 64 |
| n_layer | 6 |
| n_head | 6 |
| n_embd | 384 |
| parameters | 10.65M |
| max_iters | 1000 |
| eval_iters | 50 |
| temperature | 0.7 |
| top_k | 100 |

## Result

Training:

```text
step 0: train loss 4.2882, val loss 4.2813
step 250: train loss 1.9612, val loss 2.0701
step 500: train loss 1.5258, val loss 1.7033
step 750: train loss 1.3656, val loss 1.5802
step 1000: train loss 1.2972, val loss 1.5317
```

Speed:

```text
Normal training iterations after warmup: about 0.43-0.49 sec/iter
Evaluation checkpoints take about 14 sec because they run many eval batches.
```

Sample:

```text
MENENIUS:
I cannot strength him.

MENENIUS:
I am in the general of the words of the feast,
The king of this more than an home but than it shall
Than the duke of thee, the garlets of burther with sleeps.
The prison of my honour soul hath slept the earth,
Which we heard not for the crown of my sudden,
That which shame well, when thou art thou art sm
```

## Observation

- The model is clearly no longer random.
- It learned character names, line breaks, punctuation, and pseudo-Shakespeare rhythm.
- It still produces malformed words and unstable sentence structure after only 1000 iterations.
- Validation loss is still improving, so continuing to 3000 or 5000 iterations should improve quality.

## What I Learned

- This Mac is strong enough to train the standard Shakespeare char nanoGPT model.
- 1000 iterations is enough to see the model start sounding like the dataset.
- For nicer samples, continue training longer before trying bigger models.

## Next Experiment

- Continue the same run to 3000 or 5000 iterations.
- Compare `temperature=0.65`, `0.7`, and `0.8` using the same prompt.
