# AstroNvim Configuration Cheat Sheet

## 🚀 Leader Key
- Leader key is `Space`

---

## 🤖 AI / Copilot

### Copilot Completion (in nvim-cmp)
- `Ctrl+n` / `Ctrl+p` Navigate through completion items (including Copilot)
- `Enter` Accept selected completion (with manual selection)
- `Ctrl+y` Force accept completion
- `Ctrl+e` Dismiss completion menu
- `Alt+Enter` Open Copilot panel

### Copilot Chat
- `<leader>aa` Toggle Copilot Chat
- `<leader>ae` Explain code (normal/visual mode)
- `<leader>at` Generate tests (normal/visual mode)
- `<leader>af` Fix code (normal/visual mode)
- `<leader>ao` Optimize code (normal/visual mode)
- `<leader>ad` Generate documentation (normal/visual mode)

### Copilot Panel (when open)
- `[[` Jump to previous suggestion
- `]]` Jump to next suggestion
- `Enter` Accept suggestion
- `gr` Refresh suggestions

---

## 🔍 Fuzzy Find / Telescope

- `<leader>ff` Find files (root dir)
- `<leader>fg` Live grep (search text inside files)
- `<leader>fb` Find buffers
- `<leader>fh` Find help tags
- `<leader>fr` Recent files
- `<leader>fw` Find word under cursor
- `<leader>fc` Find word from clipboard
- `<leader>f'` Find marks
- `<leader>fk` Find keymaps
- `<leader>fm` Find man pages
- `<leader>fn` Find notifications
- `<leader>fo` Find old files
- `<leader>fC` Find commands

### In Telescope (when open)
- `Ctrl+n` / `Ctrl+p` or `↓` / `↑` Navigate results
- `Enter` Select item
- `Ctrl+x` Open in horizontal split
- `Ctrl+v` Open in vertical split
- `Ctrl+t` Open in new tab
- `Ctrl+u` / `Ctrl+d` Scroll preview up/down
- `Esc` Close Telescope

---

## 📁 File Explorer (Oil.nvim)

- `-` Open Oil in parent directory
- `<leader>e` Toggle Neo-tree file explorer

### In Oil
- `Enter` Open file/directory
- `Ctrl+v` Open in vertical split
- `Ctrl+x` Open in horizontal split
- `Ctrl+t` Open in new tab
- `Ctrl+p` Preview file
- `Ctrl+c` Close Oil
- `-` Go to parent directory
- `_` Open current working directory
- `g.` Toggle hidden files
- `g?` Show help
- Edit files like text: rename by editing, delete with `dd`, save with `:w`

---

## 🎯 Harpoon (Quick File Navigation)

- `<leader>ma` Mark/add file to Harpoon
- `<leader>mm` Toggle Harpoon menu
- `<leader>1` Jump to Harpoon file 1
- `<leader>2` Jump to Harpoon file 2
- `<leader>3` Jump to Harpoon file 3
- `<leader>4` Jump to Harpoon file 4

---

## 📝 LSP (Language Server)

- `gd` Go to definition
- `gD` Go to declaration
- `gr` Go to references
- `gI` Go to implementation
- `gy` Go to type definition
- `K` Hover documentation
- `<leader>lh` Signature help
- `<leader>lr` Rename symbol
- `<leader>la` Code action
- `<leader>lf` Format buffer
- `<leader>ld` Line diagnostics
- `<leader>lD` Hover diagnostics
- `]d` Next diagnostic
- `[d` Previous diagnostic
- `gl` Show line diagnostics

---

## 🐛 Debugging (DAP)

- `<leader>db` Toggle breakpoint
- `<leader>dB` Conditional breakpoint
- `<leader>dc` Continue
- `<leader>dC` Run to cursor
- `<leader>ds` Step over
- `<leader>di` Step into
- `<leader>do` Step out
- `<leader>dp` Pause
- `<leader>dr` Toggle REPL
- `<leader>dq` Close session
- `<leader>dQ` Terminate
- `<leader>du` Toggle debugger UI

---

## 🔄 Git Integration

- `<leader>gg` Open Neogit
- `<leader>gc` Git commits (Telescope)
- `<leader>gt` Git status (Telescope)
- `<leader>gb` Git branches (Telescope)
- `<leader>gd` Git diff
- `<leader>gD` Diffview
- `]g` Next Git hunk
- `[g` Previous Git hunk
- `<leader>gl` Git blame line
- `<leader>gL` Git blame full
- `<leader>gp` Preview Git hunk
- `<leader>gh` Reset Git hunk
- `<leader>gr` Reset buffer
- `<leader>gs` Stage hunk
- `<leader>gS` Stage buffer
- `<leader>gu` Undo stage hunk

---

## 🧭 Navigation

### Basic Movement
- `h` Left
- `j` Down
- `k` Up
- `l` Right
- `w` Next word start
- `b` Previous word start
- `e` Next word end
- `0` Start of line
- `^` First non-blank character
- `$` End of line
- `gg` Top of file
- `G` Bottom of file
- `{` Previous paragraph
- `}` Next paragraph
- `%` Jump to matching bracket

### Jumping
- `Ctrl+o` Jump back
- `Ctrl+i` Jump forward
- `gd` Go to definition
- `''` Jump to last position
- `'.` Jump to last change

### Scrolling
- `Ctrl+f` Page down
- `Ctrl+b` Page up
- `Ctrl+d` Half page down
- `Ctrl+u` Half page up
- `zz` Center cursor line
- `zt` Cursor line to top
- `zb` Cursor line to bottom

---

## ✍️ Editing

### Insert Mode
- `i` Insert before cursor
- `a` Insert after cursor
- `I` Insert at line start
- `A` Insert at line end
- `o` New line below
- `O` New line above
- `Esc` or `jk` Exit insert mode

### Delete/Cut
- `x` Delete character
- `dd` Delete line
- `dw` Delete word
- `diw` Delete inner word
- `di"` Delete inside quotes
- `di(` Delete inside parentheses
- `D` Delete to end of line
- `C` Change to end of line

### Copy/Paste
- `yy` Yank (copy) line
- `yw` Yank word
- `yiw` Yank inner word
- `y$` Yank to end of line
- `p` Paste after cursor
- `P` Paste before cursor
- `"+y` Copy to system clipboard
- `"+p` Paste from system clipboard

### Change
- `cc` Change line
- `cw` Change word
- `ciw` Change inner word
- `ci"` Change inside quotes
- `C` Change to end of line

### Undo/Redo
- `u` Undo
- `Ctrl+r` Redo
- `.` Repeat last change
- `<leader>u` Toggle Undotree

---

## 🎨 Visual Mode

- `v` Character-wise visual
- `V` Line-wise visual
- `Ctrl+v` Block-wise visual
- `gv` Reselect last visual
- `o` Toggle cursor to other end
- `>` Indent right
- `<` Indent left
- `y` Yank selection
- `d` Delete selection
- `c` Change selection

---

## 🔎 Search & Replace

### Search
- `/pattern` Search forward
- `?pattern` Search backward
- `n` Next match
- `N` Previous match
- `*` Search word under cursor forward
- `#` Search word under cursor backward
- `<leader>nh` Clear search highlights

### Replace
- `:s/old/new/` Replace first in line
- `:s/old/new/g` Replace all in line
- `:%s/old/new/g` Replace all in file
- `:%s/old/new/gc` Replace all with confirmation
- `:'<,'>s/old/new/g` Replace in visual selection

---

## 🪟 Window/Split Management

### Creating Splits
- `:vsp` or `<leader>sv` Vertical split
- `:sp` or `<leader>sh` Horizontal split

### Navigation
- `Ctrl+h` Move to left split
- `Ctrl+j` Move to below split
- `Ctrl+k` Move to above split
- `Ctrl+l` Move to right split

### Resize
- `Ctrl+Up` Resize up
- `Ctrl+Down` Resize down
- `Ctrl+Left` Resize left
- `Ctrl+Right` Resize right
- `<leader>se` Equalize splits

### Close
- `<leader>sx` Close current split
- `Ctrl+w q` Close current window
- `Ctrl+w o` Close all other splits

---

## 📑 Buffer/Tab Management

### Buffers
- `L` Next buffer
- `H` Previous buffer
- `]b` Next buffer (alternative)
- `[b` Previous buffer (alternative)
- `<leader>bd` Close buffer (with picker)
- `<leader>bc` Close all buffers
- `<leader>bC` Close all buffers except current
- `<leader>bb` Select buffer
- `<leader>b\` Close buffers to the right
- `<leader>b|` Close buffers to the left

### Tabs
- `:tabnew` or `<leader>to` New tab
- `:tabclose` or `<leader>tx` Close tab
- `gt` or `<leader>tn` Next tab
- `gT` or `<leader>tp` Previous tab
- `<leader>tf` Open buffer in new tab

---

## 🎯 Text Objects & Motions

### Surround (nvim-surround)
- `ys{motion}{char}` Add surround
- `yss{char}` Surround line
- `yS{motion}{char}` Add surround on new lines
- `ds{char}` Delete surround
- `cs{old}{new}` Change surround
- Visual: `S{char}` Surround selection

### Mini.ai Enhanced Text Objects
- `viw` Select inner word
- `vaw` Select around word
- `vi"` Select inside quotes
- `va"` Select around quotes
- `vi(` Select inside parentheses
- `va(` Select around parentheses
- `vif` Select inner function
- `vaf` Select around function
- `vic` Select inner class
- `vac` Select around class
- `vii` Select inner scope
- `vai` Select full scope

### Flash (Quick Jump)
- `s` Flash forward
- `S` Flash backward
- `r` Remote flash
- `R` Treesitter search

### Mini.move
- `Alt+h` Move line/selection left
- `Alt+j` Move line/selection down
- `Alt+k` Move line/selection up
- `Alt+l` Move line/selection right

---

## 💬 Comments

- `gcc` Toggle comment line
- `gc{motion}` Toggle comment motion
- `gbc` Toggle block comment
- `gb{motion}` Toggle block comment motion
- Visual: `gc` Toggle comment selection
- `gcO` Add comment above
- `gco` Add comment below
- `gcA` Add comment end of line

---

## 🔧 Trouble (Diagnostics)

- `<leader>xx` Toggle Trouble
- `<leader>xw` Workspace diagnostics
- `<leader>xd` Document diagnostics
- `<leader>xl` Location list
- `<leader>xq` Quickfix list

---

## 📋 Yanky (Yank History)

- `<leader>p` Open yank history
- `p` Paste and cycle through history
- `P` Paste before and cycle

---

## ⚙️ General Commands

### File Operations
- `:w` Save
- `:q` Quit
- `:wq` or `:x` Save and quit
- `:q!` Force quit
- `:wa` Save all
- `:qa` Quit all
- `:e filename` Edit file

### AstroNvim Specific
- `<leader>n` New file
- `<leader>w` Save
- `<leader>q` Quit
- `<leader>Q` Quit all
- `<leader>c` Close buffer
- `<leader>C` Force close buffer

### UI Toggles
- `<leader>ub` Toggle background
- `<leader>ud` Toggle diagnostics
- `<leader>ug` Toggle signcolumn
- `<leader>ui` Toggle indent guides
- `<leader>ul` Toggle statusline
- `<leader>un` Toggle line numbers
- `<leader>uN` Toggle relative numbers
- `<leader>up` Toggle paste mode
- `<leader>us` Toggle spellcheck
- `<leader>ut` Toggle tabline
- `<leader>uw` Toggle wrap
- `<leader>uy` Toggle syntax highlighting

---

## 🔢 Increment/Decrement

- `Ctrl+a` Increment number
- `Ctrl+x` Decrement number
- `<leader>+` Increment (custom)
- `<leader>-` Decrement (custom)

---

## 🎨 Colorscheme

Current: TokyoNight (custom dark jade theme with transparent background)

- `<leader>ub` Toggle between dark/light background

---

## 💡 Tips

1. **Copilot in completion menu**: Copilot suggestions now appear in nvim-cmp alongside LSP completions
2. **Oil.nvim**: Edit filesystem like a buffer - rename with text editing, delete with `dd`, save with `:w`
3. **Harpoon**: Quickly mark and jump between frequently used files
4. **Flash**: Use `s` for lightning-fast navigation to any visible text
5. **Which-key**: Press `<leader>` and wait to see available keymaps
6. **Treesitter context**: Shows function/class context at top of screen when scrolling
7. **Yanky**: Cycle through yank history with `p` after pasting
8. **Mini.ai**: Enhanced text objects for functions, classes, and scopes
9. **Telescope live grep args**: Use `<leader>fg` for advanced grep with arguments
10. **Format on save**: Enabled by default with 3s timeout

---

## 🚀 Quick Start Workflow

1. Open files: `<leader>ff` (Telescope find files)
2. Search in files: `<leader>fg` (Live grep)
3. Mark frequent files: `<leader>ma` (Harpoon mark)
4. Jump between marks: `<leader>1-4` (Harpoon jump)
5. AI assistance: `<leader>aa` (Copilot Chat)
6. Code navigation: `gd` (go to definition), `gr` (references)
7. Quick edits: `gcc` (comment), `ciw` (change word), `.` (repeat)
8. Git workflow: `<leader>gg` (Neogit), `<leader>gd` (diff)

---

## 📚 Learn More

- `:help astronvim` - AstroNvim documentation
- `:Telescope help_tags` or `<leader>fh` - Search all help
- `:checkhealth` - Check plugin health
- `:Lazy` - Plugin manager UI
- `:Mason` - LSP/formatter/linter installer
