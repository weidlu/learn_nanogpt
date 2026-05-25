# 02 - Training Loop

训练循环做的事情很机械，但它就是模型学习的地方。

## 主流程

```text
get_batch
forward
loss
backward
clip gradients
optimizer step
zero gradients
evaluate sometimes
save checkpoint sometimes
```

## 为什么 x 和 y 只差一个 token？

语言模型的标签来自文本本身。

```text
原始 token:  [10, 11, 12, 13, 14]
x:          [10, 11, 12, 13]
y:          [11, 12, 13, 14]
```

模型在 `x[0]` 位置预测 `y[0]`，在 `x[1]` 位置预测 `y[1]`，以此类推。

## loss 在做什么？

cross entropy 会奖励真实下一个 token 的概率变高，惩罚它变低。

直觉上：

- 如果模型把正确 token 排很高，loss 小。
- 如果模型把正确 token 排很低，loss 大。

## optimizer 在做什么？

`loss.backward()` 计算每个参数应该往哪个方向改。

`optimizer.step()` 真正修改参数。

重复很多次后，模型就从“乱猜”变成“越来越会预测下一个 token”。
