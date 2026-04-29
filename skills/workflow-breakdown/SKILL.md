---
name: workflow-breakdown
description: 基于需求文档拆分可执行任务和测试说明。仅在用户显式要求使用 `$workflow-breakdown`，或明确要求读取 `docs/project.md`，把项目拆成合适粒度的任务文档 `docs/tasks/<number-task-name>.md`，并为每个任务生成对应测试说明 `docs/tasks/<number-task-name-test>.md` 时使用。
---

# Workflow Breakdown

把 `docs/project.md` 拆成可执行任务，并为每个任务产出配套测试说明文档。

## Workflow

1. 先读取 `docs/project.md`。
2. 如果文件不存在，立即报错并停止。
3. 基于当前项目文档拆分任务，保证每个任务都能独立实现、独立验证、范围适中。
4. 先完成任务拆分，再生成测试说明；不要颠倒顺序。
5. 为每个任务写入一个任务文档：
   - 路径：`docs/tasks/<number-task-name>.md`
6. 为每个任务写入一个测试说明文档：
   - 路径：`docs/tasks/<number-task-name-test>.md`
7. 确保每个任务都有且只有一个对应测试说明文档。
8. 任务全部写完后，再结束本阶段；不要开始实现代码。

## Task Rules

- 保持任务粒度适中，避免一个任务跨越过多模块或多个独立目标。
- 让任务天然适合 TDD：先定义可观察行为，再安排实现。
- 任务文档聚焦任务目标、范围、约束和完成标准。
- 测试说明至少覆盖：
  - 功能测试
  - 边界测试
- 命名使用递增编号，保持稳定且可读。

## Fail Fast

- 如果 `docs/project.md` 信息不足以支持拆解，直接指出缺口并停止。
- 如果任务编号、任务名或目标范围冲突，先修正文档，再继续。
- 如果某个任务无法独立验证，继续拆小，不要硬塞进同一个任务。
- 不要直接写测试代码或业务代码。
