# 代码质量审查 Subagent Prompt 模板

派发代码质量审查 subagent 时使用此模板。

**目的：** 验证实现构建良好（干净、经过测试、可维护）。

**只有在规格符合性审查通过后才派发。**

```text
Task tool（general-purpose）：
  使用 requesting-code-review/code-reviewer.md 中的模板

  DESCRIPTION: [任务摘要，来自实现者报告]
  PLAN_OR_REQUIREMENTS: [计划文件] 中的任务 N
  BASE_SHA: [任务前的提交]
  HEAD_SHA: [当前提交]
```

**除了标准代码质量关注点外，审查者还应该检查：**

- 每个文件是否有一个清晰职责和定义良好的接口？
- 单元是否拆分到能够独立理解和测试？
- 实现是否遵循计划中的文件结构？
- 这次实现是否创建了已经很大的新文件，或显著扩大了现有文件？（不要标记既有文件大小，只关注这次变更造成的影响。）

**代码审查者返回：** 优点、问题（Critical/Important/Minor）、评估
