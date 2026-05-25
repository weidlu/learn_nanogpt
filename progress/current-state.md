# Current State

Last updated: 2026-05-25

## 当前学习位置

- 阶段：刚开始学习 nanoGPT。
- 当前目标：继续把 Mac 上的 Shakespeare char 模型从 1000 iter 训练到更稳定的 3000/5000 iter。
- 推荐下一步：从 `out-shakespeare-char-mps-1000` 继续训练，或者直接跑完整默认 5000 iter，再采样比较。

## 已完成

- [x] 创建跨设备学习仓库。
- [x] 放入 nanoGPT 互动教学页。
- [x] 建立进度、笔记、实验记录目录。
- [x] 确认这台 Mac 是 M4 Pro / 24GB，并且 PyTorch MPS 可用。
- [x] 做过短训练探针：默认 10.65M Shakespeare char 模型热身后约 0.43 秒/iter。
- [x] 跑过 1000 iter MPS 训练：`val loss` 到 1.5317，输出已有角色名和莎剧节奏。
- [x] 安装 `tiktoken`，官方 `sample.py` 已可直接采样字符级 checkpoint。

## 下一次继续时

1. 先运行 `git pull --rebase`。
2. 打开本文件确认上次学到哪里。
3. 打开 `progress/checklist.md`，接着未完成的勾选项。
4. 参考 `experiments/2026-05-25-shakespeare-mps-1000.md`，决定继续训到 3000 还是完整 5000。
5. 如果做了训练或采样实验，把结果写进 `experiments/`。

## 当前疑问

- GPT 的 token、embedding、attention、logits 之间到底怎么连起来？
- `x` 和 `y` 为什么只差一个 token？
- `generate()` 为什么可以靠循环预测生成长文本？
