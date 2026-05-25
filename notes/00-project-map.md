# 00 - nanoGPT Project Map

nanoGPT 很适合学习，因为它把 GPT 的关键路径压得很薄。

## 核心文件

| 文件 | 作用 |
| --- | --- |
| `data/*/prepare.py` | 把原始文本变成 token id，并写成 `train.bin` / `val.bin` |
| `model.py` | GPT 模型定义，包括 attention、MLP、forward、generate |
| `train.py` | 训练循环，包括 batch、loss、backward、optimizer、checkpoint |
| `sample.py` | 加载 checkpoint 或 GPT-2 权重，逐 token 生成文本 |
| `config/*.py` | 针对不同训练任务的参数覆盖 |
| `configurator.py` | 读取配置文件和命令行 `--key=value` 覆盖 |

## 最小学习闭环

```text
prepare.py -> train.bin / val.bin
train.py   -> ckpt.pt
sample.py  -> generated text
model.py   -> 上面两步共用的 GPT 本体
```

## 最重要的问题

读这个项目时，永远围绕这三个问题：

1. 数据是什么形状？
2. 模型输出是什么形状？
3. loss 是如何把“预测错了”变成参数更新的？
