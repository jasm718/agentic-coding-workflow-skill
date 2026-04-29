---
name: workflow-implement
description: 按单个任务执行先测后写的实现流程。仅在用户显式要求使用 `$workflow-implement`，或明确指定一个任务并要求先读取 `docs/project.md` 与对应任务文档，再写测试、实现代码、补关键日志、最后写 `docs/tasks/<number-task-name-approval>.md` 时使用。
---

# Workflow Implement

实现一个且仅一个任务，并按固定顺序补齐测试、代码、关键日志和收尾文档。

## Workflow

1. 要求用户明确指定一个任务。
2. 如果用户没有指定任务，先追问，不要猜测。
3. 先读取：
   - `docs/project.md`
   - `docs/tasks/<number-task-name>.md`
   - 如已存在，可一并读取 `docs/tasks/<number-task-name-test>.md`
4. 如果任一关键文件缺失，立即报错并停止。
5. 在完全理解任务后，按以下顺序执行：
   - 写测试
   - 实现代码
   - 补关键日志
   - 写 `docs/tasks/<number-task-name-approval>.md`
6. 一次只实现一个任务，不要并行处理多个任务。

## Test Rules

- 先写测试，再写实现。
- 至少覆盖两类测试：
  - 功能测试
  - 边界测试
- 功能测试聚焦主要成功路径。
- 边界测试聚焦必填缺失、非法输入、异常状态和拒绝路径。

## Implementation Rules

- 先完成基础逻辑，再补错误处理和用户体验。
- 对关键链路补少量但关键的日志，不要堆日志。
- 保持实现简单、可维护、可读。
- 遇到明显风险、依赖缺失、任务定义不完整时，立即停止并指出阻塞点。

## Approval Rules

- 把收尾文档写到 `docs/tasks/<number-task-name-approval>.md`。
- 只写没做到的内容、遗留问题、明确缺口。
- 不要记录已经完成的内容。

## Fail Fast

- 如果任务名和现有任务文档不一致，立即停止。
- 如果测试前置条件不成立，先指出问题，不要直接写实现。
- 如果用户试图让当前轮同时实现多个任务，收窄到一个任务后再继续。
