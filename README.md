# agentic-coding-workflow-skill
一个好用的、可靠的半自动 AI coding 工作流 skill。

## 安装

运行：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-local-skills.ps1
```

脚本会把当前仓库里的 4 个 skill 以系统链接方式挂到 `C:\Users\1\.agents\skills\`。

安装后重启 Codex。

## 卸载

运行：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\uninstall-local-skills.ps1
```

脚本会删除这 4 个 skill 在 `C:\Users\1\.agents\skills\` 下的链接，不会删除当前仓库里的源文件。

## 使用

重启后可直接使用：

- `$workflow-baseline`
- `$workflow-refine`
- `$workflow-breakdown`
- `$workflow-implement`
