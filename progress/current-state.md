# Current State

Last updated: 2026-05-25

## 当前学习位置

- 阶段：刚开始学习 nanoGPT。
- 当前目标：建立 GPT 运作直觉，读懂 `model.py`、`train.py`、`sample.py` 的主线。
- 推荐下一步：打开 `docs/nanogpt_interactive_tutorial.html`，完成“项目地图”和“GPT 心智模型”两节。

## 已完成

- [x] 创建跨设备学习仓库。
- [x] 放入 nanoGPT 互动教学页。
- [x] 建立进度、笔记、实验记录目录。

## 下一次继续时

1. 先运行 `git pull --rebase`。
2. 打开本文件确认上次学到哪里。
3. 打开 `progress/checklist.md`，接着未完成的勾选项。
4. 如果做了训练或采样实验，把结果写进 `experiments/`。

## 当前疑问

- GPT 的 token、embedding、attention、logits 之间到底怎么连起来？
- `x` 和 `y` 为什么只差一个 token？
- `generate()` 为什么可以靠循环预测生成长文本？
