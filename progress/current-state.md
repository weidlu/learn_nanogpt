# Current State

Last updated: 2026-05-25

## 当前学习位置

- 阶段：刚开始学习 nanoGPT。
- 当前目标：在 Mac 上先跑通一个比 Windows CPU baby GPT 更好的 Shakespeare char 模型。
- 推荐下一步：按 `notes/04-mac-mps-training-recipe.md` 跑一次默认 MPS 训练，然后采样比较输出。

## 已完成

- [x] 创建跨设备学习仓库。
- [x] 放入 nanoGPT 互动教学页。
- [x] 建立进度、笔记、实验记录目录。
- [x] 确认这台 Mac 是 M4 Pro / 24GB，并且 PyTorch MPS 可用。
- [x] 做过短训练探针：默认 10.65M Shakespeare char 模型热身后约 0.43 秒/iter。

## 下一次继续时

1. 先运行 `git pull --rebase`。
2. 打开本文件确认上次学到哪里。
3. 打开 `progress/checklist.md`，接着未完成的勾选项。
4. 参考 `notes/04-mac-mps-training-recipe.md` 在 Mac 上跑默认 MPS 训练。
5. 如果做了训练或采样实验，把结果写进 `experiments/`。

## 当前疑问

- GPT 的 token、embedding、attention、logits 之间到底怎么连起来？
- `x` 和 `y` 为什么只差一个 token？
- `generate()` 为什么可以靠循环预测生成长文本？
