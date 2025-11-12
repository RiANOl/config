# CLAUDE.md

## Shell Tools Usage Guidelines
⚠️ **IMPORTANT**: Use the following specialized tools instead of traditional Unix commands: (Install if missing)
| Task Type | Must Use | Do Not Use |
|-----------|----------|------------|
| Find Files | `fd` | `find`, `ls -R` |
| Search Text | `rg` (ripgrep) | `grep`, `ag` |
| Analyze Code Structure | `ast-grep` | `grep`, `sed` |
| Interactive Selection | `fzf` | Manual filtering |
| Process JSON | `jq` | `python -m json.tool` |
| Process YAML/XML | `yq` | Manual parsing |
