# Starship Prompt Cheat Sheet

## 🎨 Prompt Layout

```
┌─ [OS] [user@host] [directory] [branch] [git-state] [git-status] [git-metrics] [jobs]    [lang versions] [direnv] [took Xs]
└─ ➜                                                                                    [exit code] [battery] [time]
```

- Two-line prompt: info line + input line
- Languages/tools pushed to the right of the first line via fill
- Exit code, battery, and time on the right side (right prompt)

---

## 📁 Directory

- Shows last 4 path segments (truncated for readability)
- Full path shown inside a git repo (`truncate_to_repo = true`)
- `~` for home directory
- `  ` indicator + red for read-only directories

---

## 🌿 Git

### Branch
- Shows ` branch-name` (truncated to 30 chars with `…`)
- Remote branch shown if tracking: `branch:remote`

### State (shown during git operations)
- `(REBASE 2/5)` — interactive rebase in progress
- `(MERGE)` — merge conflict resolution
- `(REVERT)` — git revert in progress
- `(PICK)` — cherry-pick in progress
- `(BISECT)` — git bisect running
- `(AM)` / `(AM/REBASE)` — applying patches

### Status symbols
| Symbol | Meaning |
|--------|---------|
| `↑N` | N commits ahead of remote |
| `↓N` | N commits behind remote |
| `↕↑N↓M` | Diverged from remote |
| `+N` | N staged changes |
| `!N` | N modified (unstaged) |
| `?N` | N untracked files |
| `✖N` | N deleted files |
| `»N` | N renamed files |
| `⚑N` | N stashed changes |
| `⚡N` | N merge conflicts |

### Metrics
- `+N` lines added / `-N` lines deleted (only shown when non-zero)

---

## 💼 Jobs

- Shows ` N` when there are background jobs (suspended with `Ctrl+z` or running with `&`)
- Only appears when at least 1 job exists

---

## 🖥️ Exit Status (right side)

- `✖ N` — shown in red on the right when last command exited non-zero
- Pipe status shown for pipelines (`cmd1 | cmd2` — shows each exit code)
- Hidden on success (exit 0)

---

## 🔋 Battery (right side)

| Symbol | State | Color |
|--------|-------|-------|
| `󰁹` | Full | — |
| `󰂄` | Charging | — |
| `󰂃` | Discharging | — |
| `󰁽` | Unknown | — |
| `󰂎` | Empty | — |

- Red below 20%, Yellow below 50%, Green otherwise

---

## ⏱️ Time (right side)

- Format: `HH:MM` (24-hour, no seconds)

---

## ⏳ Command Duration

- Shows `took Xs` when a command takes longer than **500ms**
- Displayed at end of the first prompt line

---

## 🌐 Language / Tool Modules

All modules are **auto-detected** from project files — only shown when relevant.

| Module | Icon | Triggers on |
|--------|------|-------------|
| Java | ` ` | `pom.xml`, `build.gradle`, `build.gradle.kts`, `.java-version`, `gradlew` |
| Node.js | ` ` | `package.json`, `.nvmrc`, `.node-version`, `yarn.lock`, `package-lock.json`, `bun.lockb` |
| Python | ` ` | `requirements.txt`, `pyproject.toml`, `setup.py`, `.python-version`, `Pipfile`, `poetry.lock`, `tox.ini` |
| Rust | ` ` | `Cargo.toml` |
| Go | ` ` | `go.mod`, `go.sum` |
| Lua | ` ` | `.lua-version`, `.luarc.json`, `.luarc.jsonc`, `lua/` folder |
| Docker | ` ` | `docker-compose.yml`, `docker-compose.yaml`, `Dockerfile` |

- Python also shows active virtualenv name in parentheses
- Docker only shown when compose/Dockerfile is present in current dir

---

## 📂 Direnv

- `󱄀 env` shown when a `.envrc` is loaded via direnv
- Hidden when no envrc is active

---

## ☁️ Cloud & Infra (when active)

- **AWS** — shows profile and region when AWS env vars are set
- **Kubernetes** — shows context and namespace when `KUBECONFIG` is active
- **Package** — shows package version from `package.json` / `Cargo.toml` etc.

---

## 🖥️ OS Icon

- Shows distro icon at the start of the prompt (CachyOS → Arch ` ` icon)

---

## 👤 Username & Hostname

- **Username**: only shown over SSH or when running as root
- **Hostname**: only shown over SSH (with ` ` SSH icon)

---

## ⌨️ Vim Mode Indicators (second line)

| Symbol | Mode |
|--------|------|
| `➜` (green) | Normal / Insert (success) |
| `✗` (red) | Last command failed |
| `N` (green) | Neovim normal mode |
| `V` (yellow) | Neovim visual mode |
| `R` (purple) | Neovim replace mode |

---

## ⚙️ Config File

- Location: `~/.config/starship.toml` (managed via stow from `starship/starship.toml`)
- `command_timeout = 1000ms` — module detection killed after 1s to keep prompt snappy
- `add_newline = true` — blank line before each prompt

---

## 💡 Tips

1. **Git state awareness**: When rebasing, the prompt shows `(REBASE 2/5)` so you always know your position
2. **Failed command**: Look right — `✖ 127` tells you the exit code instantly
3. **Background jobs**: `Ctrl+z` to suspend, ` 1` appears in prompt — `fg` to resume
4. **Language detection is lazy**: No performance cost — only runs `node --version` etc. when trigger files exist
5. **Direnv integration**: `.envrc` loading is visible in the prompt — no silent env changes
6. **Reload config**: `starship` re-reads `starship.toml` on every prompt — no restart needed after edits
