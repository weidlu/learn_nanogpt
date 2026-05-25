# START_HERE

这份学习路线按“先有直觉，再读代码，再做实验”的顺序来。不要一开始就硬啃注意力公式，先把数据流跑通。

## 第 0 步：准备心智模型

先记住一句话：

> GPT 不是一次性写完整段文本，它是在重复预测下一个 token。

一轮生成大概是：

```text
已有文本 -> 编码成 token id -> 模型打分 -> 采样下一个 token -> 拼回文本 -> 重复
```

## 第 1 步：打开互动教程

打开：

[docs/nanogpt_interactive_tutorial.html](docs/nanogpt_interactive_tutorial.html)

建议先看这几个章节：

1. 项目地图
2. GPT 心智模型
3. 模型结构
4. 训练循环

页面里的勾选进度是浏览器本地的，只适合当前设备。跨设备进度要写进：

[progress/checklist.md](progress/checklist.md)

## 第 2 步：读 nanoGPT 的三个核心文件

在原 nanoGPT 仓库里读：

```text
model.py   GPT 模型本体
train.py   训练循环
sample.py  文本生成
```

读代码的顺序：

1. `data/shakespeare_char/prepare.py`
2. `train.py` 里的 `get_batch()`
3. `model.py` 里的 `GPT.forward()`
4. `model.py` 里的 `CausalSelfAttention.forward()`
5. `model.py` 里的 `generate()`
6. `sample.py`

## 第 3 步：跑一个超小实验

在 nanoGPT 原项目里：

```sh
python data/shakespeare_char/prepare.py

python train.py config/train_shakespeare_char.py \
  --device=cpu --compile=False \
  --eval_iters=20 --max_iters=200

python sample.py \
  --out_dir=out-shakespeare-char \
  --device=cpu --max_new_tokens=300
```

如果在 Apple Silicon Mac 上，也可以试：

```sh
python train.py config/train_shakespeare_char.py \
  --device=mps --compile=False \
  --eval_iters=20 --max_iters=200
```

## 第 4 步：写实验记录

每次实验复制：

[experiments/experiment-template.md](experiments/experiment-template.md)

命名例子：

```text
experiments/2026-05-25-shakespeare-cpu-smoke.md
```

## 第 5 步：每次结束前同步

更新：

- [progress/current-state.md](progress/current-state.md)
- [progress/checklist.md](progress/checklist.md)
- 相关 `notes/` 或 `experiments/`

然后提交推送：

```sh
git pull --rebase
git add progress notes experiments
git commit -m "update learning progress"
git push
```
