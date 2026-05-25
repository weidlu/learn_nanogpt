# Windows 学习指南

这份指南用于在 Windows 设备上继续学习，并把进度同步回 GitHub。

## 1. 安装基础工具

需要：

- Git for Windows
- Python 3.10 或更新版本
- 一个代码编辑器，例如 VS Code

确认 Git 可用：

```powershell
git --version
```

## 2. clone 学习仓库

```powershell
cd $HOME
git clone https://github.com/weidlu/learn_nanogpt.git
cd learn_nanogpt
```

打开入口：

```powershell
start docs\nanogpt_interactive_tutorial.html
```

如果 `start` 没有按预期打开，也可以在文件管理器里双击：

```text
docs/nanogpt_interactive_tutorial.html
```

## 3. clone nanoGPT 原项目

建议把原项目 clone 到学习仓库旁边，而不是放进学习仓库内部：

```powershell
cd $HOME
git clone https://github.com/karpathy/nanoGPT.git
cd nanoGPT
```

学习仓库负责记录进度；nanoGPT 原项目负责跑代码。

## 4. 可选：准备 Python 环境

```powershell
cd $HOME\nanoGPT
python -m venv .venv
.\.venv\Scripts\Activate.ps1
pip install torch numpy transformers datasets tiktoken wandb tqdm
```

如果 PowerShell 不允许激活 venv，先用管理员 PowerShell 或当前用户策略执行：

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

## 5. 每次开始学习前

```powershell
cd $HOME\learn_nanogpt
git pull --rebase
```

然后看：

```text
progress/current-state.md
progress/checklist.md
```

## 6. 每次结束学习后

```powershell
cd $HOME\learn_nanogpt
git pull --rebase
git add progress notes experiments
git commit -m "update learning progress"
git push
```

如果没有新改动，`git commit` 提示 nothing to commit 是正常的。
