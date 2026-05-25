# 01 - How GPT Works

GPT 的核心任务是 next-token prediction：根据前面的 token，预测下一个 token。

## 一句话直觉

如果训练文本是：

```text
To be
```

字符级模型会看到类似：

```text
x: T o   b
y: o   b e
```

也就是每个位置都在问：

> 看见当前位置及其左边历史后，下一个字符应该是谁？

## token -> embedding

token id 只是整数，比如 `42`。整数本身没有语义，所以模型先查 embedding 表，把它变成向量。

```text
token id -> embedding vector
```

position embedding 负责告诉模型“这是第几个位置”。

```text
token embedding + position embedding -> Transformer input
```

## Transformer Block

一个 block 主要做两件事：

1. attention：让每个 token 从左边历史里取信息。
2. MLP：对每个位置的表示做非线性加工。

中间加上 LayerNorm 和 residual connection，让训练更稳定。

## logits

最后的 `lm_head` 会把每个位置的向量变成一组分数：

```text
shape: batch, time, vocab_size
```

这些分数叫 logits。softmax 后就是每个 token 成为“下一个 token”的概率。
