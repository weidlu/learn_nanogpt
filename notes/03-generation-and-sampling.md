# 03 - Generation And Sampling

生成文本时，模型不再更新参数。它只是不断预测下一个 token。

## generate 的循环

```text
prompt -> encode -> model -> logits -> softmax -> sample -> append -> repeat
```

在 nanoGPT 里，这个逻辑主要在 `model.py` 的 `generate()`。

## temperature

temperature 控制随机性。

- 小于 1：更保守，更像选高概率答案。
- 等于 1：正常采样。
- 大于 1：更随机，更可能出现怪但有趣的输出。

## top_k

top_k 会只保留概率最高的 k 个 token，把其他候选直接排除。

它的作用是减少特别离谱的低概率 token 被采样出来。

## 生成不是理解全文后一次写完

它更像：

```text
已有: To
预测:  
已有: To 
预测: b
已有: To b
预测: e
```

每次只往前迈一个 token。
