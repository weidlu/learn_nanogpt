# nanoGPT Learning Checklist

这个文件是跨设备同步用的学习进度。浏览器页面里的勾选框只存在本地浏览器，不能跨设备同步；这里的 Markdown checkbox 会跟 Git 一起同步。

## 0. 项目定位

- [x] 创建学习仓库。
- [x] 加入互动教程。
- [x] clone 原 nanoGPT 仓库到当前设备。
- [x] 确认 Python / PyTorch 环境可用。

## 1. 数据和 token

- [ ] 读 `data/shakespeare_char/prepare.py`。
- [ ] 解释 `stoi` 和 `itos`。
- [x] 运行 `python data/shakespeare_char/prepare.py`。
- [x] 找到生成的 `train.bin`、`val.bin`、`meta.pkl`。

## 2. batch 和训练样本

- [ ] 读 `train.py` 里的 `get_batch()`。
- [ ] 解释为什么 `x = data[i:i+block_size]`。
- [ ] 解释为什么 `y = data[i+1:i+1+block_size]`。
- [ ] 用一个短句手写一组 `x -> y` 训练样本。

## 3. 模型前向传播

- [ ] 读 `model.py` 里的 `GPT.forward()`。
- [ ] 解释 token embedding 和 position embedding。
- [ ] 解释 `for block in self.transformer.h`。
- [ ] 解释 `lm_head` 输出的 logits 是什么。
- [ ] 解释 cross entropy loss 在惩罚什么。

## 4. Transformer Block

- [ ] 读 `Block.forward()`。
- [ ] 解释 LayerNorm 的位置。
- [ ] 解释 residual connection。
- [ ] 读 `CausalSelfAttention.forward()`。
- [ ] 标出 q、k、v 的 shape 变化。
- [ ] 解释 causal mask 为什么不能去掉。

## 5. 训练循环

- [ ] 读 `train.py` 的主 while loop。
- [ ] 解释 gradient accumulation。
- [ ] 解释 learning rate warmup + cosine decay。
- [ ] 解释 checkpoint 里保存了什么。
- [x] 跑一次 `max_iters=200` 的小训练。

## 6. 生成文本

- [ ] 读 `sample.py`。
- [ ] 读 `model.py` 里的 `generate()`。
- [ ] 解释 temperature。
- [ ] 解释 top_k。
- [x] 用同一个 prompt 比较两个 temperature 的输出。

## 7. 自己改一个实验

- [ ] 改 `block_size`，观察速度和输出变化。
- [ ] 改 `n_layer` 或 `n_embd`，观察参数量和训练速度。
- [ ] 写一篇实验记录到 `experiments/`。
- [ ] 总结：这个改变让我对 GPT 多理解了什么？
