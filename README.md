# learn_nanogpt

这是我的 nanoGPT 学习仓库，用来在 macOS / Windows / 其他设备之间同步学习进度、笔记和实验记录。

核心目标很简单：

- 看懂 GPT 怎样从文本预测下一个 token。
- 看懂 nanoGPT 的 `model.py`、`train.py`、`sample.py`。
- 把每次学习进度写进 Git，跨设备继续时不丢上下文。

## 从这里开始

1. 打开互动教程：

   [docs/nanogpt_interactive_tutorial.html](docs/nanogpt_interactive_tutorial.html)

2. 按这个文件走第一轮学习：

   [START_HERE.md](START_HERE.md)

3. Windows 设备继续学习：

   [WINDOWS.md](WINDOWS.md)

4. 每次学完更新：

   [progress/current-state.md](progress/current-state.md)

5. 做实验时复制模板：

   [experiments/experiment-template.md](experiments/experiment-template.md)

## 跨设备同步

在一台设备学完后：

```sh
git pull --rebase
git add progress notes experiments
git commit -m "update learning progress"
git push
```

在另一台设备继续前：

```sh
git pull --rebase
```

Windows PowerShell 可以用：

```powershell
git pull --rebase
git add progress notes experiments
git commit -m "update learning progress"
git push
```

如果没有新改动，`git commit` 提示 nothing to commit 是正常的。

## 仓库结构

```text
docs/          互动教学页面和图文材料
notes/         概念笔记：GPT、Transformer、训练、采样
progress/      跨设备同步的学习进度
experiments/   每次训练/采样/改参数的实验记录
scripts/       可选同步脚本
assets/        教学页面用到的图片
```

## nanoGPT 原项目

这个仓库是学习仓库，不是 nanoGPT fork。建议在本机另外 clone 原项目：

```sh
git clone https://github.com/karpathy/nanoGPT.git
```

本学习仓库记录“我学到哪里、理解了什么、做过什么实验”；原 nanoGPT 仓库用来跑代码、改代码、训练模型。
