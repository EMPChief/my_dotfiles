---@type LazySpec
return {
  -- AstroCommunity plugin collection root
  -- Required for all `astrocommunity.*` imports below
  "AstroNvim/astrocommunity",

  ---------------------------------------------------------------------------
  -- Colorschemes
  ---------------------------------------------------------------------------

  -- Catppuccin theme
  -- Soft pastel theme with excellent plugin support
  { import = "astrocommunity.colorscheme.catppuccin" },

  -- Tokyo Night theme
  -- Clean dark blue modern theme
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },

  ---------------------------------------------------------------------------
  -- Editing Enhancements
  ---------------------------------------------------------------------------

  -- Highlights TODO/FIXME/HACK comments
  { import = "astrocommunity.editing-support.todo-comments-nvim" },

  -- Split/join syntax blocks
  -- Example:
  -- { a, b, c } <-> multiline
  --
  -- NOTE: mini-splitjoin was removed from AstroCommunity.
  -- Use treesj instead (same concept, more powerful).
  { import = "astrocommunity.editing-support.treesj" },

  -- Shows current Treesitter scope at top of window
  { import = "astrocommunity.editing-support.nvim-treesitter-context" },

  -- Undo history visualizer
  { import = "astrocommunity.editing-support.undotree" },

  -- Better yank/paste history
  { import = "astrocommunity.editing-support.yanky-nvim" },

  -- Auto rename paired HTML/JSX tags
  --
  -- NOTE: nvim-ts-autotag was removed from AstroCommunity.
  -- It is now bundled directly in the html-css and typescript packs below.
  -- If you need it standalone, add it via your own plugins/ config:
  --
  --   { "windwp/nvim-ts-autotag", opts = {} }

  -- Nice boxed comments / section dividers
  { import = "astrocommunity.editing-support.comment-box-nvim" },

  ---------------------------------------------------------------------------
  -- Motion / Navigation
  ---------------------------------------------------------------------------

  -- Surround text objects easily
  -- Example:
  -- ysiw"
  { import = "astrocommunity.motion.nvim-surround" },

  -- Fast navigation/jump motions
  { import = "astrocommunity.motion.flash-nvim" },

  -- Move lines/blocks around
  { import = "astrocommunity.motion.mini-move" },

  ---------------------------------------------------------------------------
  -- Git Integrations
  ---------------------------------------------------------------------------

  -- Inline git blame
  { import = "astrocommunity.git.git-blame-nvim" },

  -- Git diff viewer
  { import = "astrocommunity.git.diffview-nvim" },

  -- Magit-style git UI
  { import = "astrocommunity.git.neogit" },

  -- Git signs in gutter
  --
  -- NOTE: gitsigns-nvim was removed from AstroCommunity because it is
  -- now included as part of AstroNvim core (v5+). No import needed.

  ---------------------------------------------------------------------------
  -- File Explorer
  ---------------------------------------------------------------------------

  -- NOTE: neo-tree is now a core AstroNvim component and no longer
  -- available as an AstroCommunity import. It is already configured
  -- and ready to use out of the box — no import required.
  --
  -- If you want an alternative file explorer you can use one of:
  --   { import = "astrocommunity.file-explorer.oil-nvim" }
  --   { import = "astrocommunity.file-explorer.mini-files" }
  --   { import = "astrocommunity.file-explorer.yazi-nvim" }

  ---------------------------------------------------------------------------
  -- Language Packs
  ---------------------------------------------------------------------------

  -- Lua support
  { import = "astrocommunity.pack.lua" },

  -- TypeScript / JavaScript support
  { import = "astrocommunity.pack.typescript" },

  -- Rust support
  { import = "astrocommunity.pack.rust" },

  -- Python support
  { import = "astrocommunity.pack.python" },

  -- Go support
  { import = "astrocommunity.pack.go" },

  -- Markdown support
  { import = "astrocommunity.pack.markdown" },

  -- Better markdown rendering
  { import = "astrocommunity.markdown-and-latex.markview-nvim" },

  -- JSON support
  { import = "astrocommunity.pack.json" },

  -- YAML support
  { import = "astrocommunity.pack.yaml" },

  -- TOML support
  -- Useful for Cargo.toml, pyproject.toml, etc.
  { import = "astrocommunity.pack.toml" },

  -- HTML/CSS support
  --
  -- Remove later if you notice duplicated frontend tooling/LSP behavior.
  { import = "astrocommunity.pack.html-css" },

  -- Docker support
  { import = "astrocommunity.pack.docker" },

  -- TailwindCSS support
  { import = "astrocommunity.pack.tailwindcss" },

  ---------------------------------------------------------------------------
  -- Diagnostics / LSP UI
  ---------------------------------------------------------------------------

  -- Better diagnostics/problems UI
  { import = "astrocommunity.diagnostics.trouble-nvim" },

  -- Inline diagnostics
  --
  -- NOTE: Renamed from lsp-lines-nvim (hyphen) to lsp_lines-nvim (underscore).
  { import = "astrocommunity.diagnostics.lsp_lines-nvim" },

  ---------------------------------------------------------------------------
  -- Visual Enhancements
  ---------------------------------------------------------------------------

  -- Indentation guides
  { import = "astrocommunity.indent.indent-blankline-nvim" },

  ---------------------------------------------------------------------------
  -- LSP Enhancements
  ---------------------------------------------------------------------------

  -- Function signature popups
  { import = "astrocommunity.lsp.lsp-signature-nvim" },

  ---------------------------------------------------------------------------
  -- Terminal / Workflow
  ---------------------------------------------------------------------------

  -- Better terminal management
  { import = "astrocommunity.terminal-integration.toggleterm-manager-nvim" },

  -- Persistent sessions
  --
  -- NOTE: workflow.persistence-nvim was removed from AstroCommunity.
  -- Use the built-in AstroNvim session management, or add persistence.nvim
  -- Alternatively, use the community recipe:
  --   { import = "astrocommunity.recipes.auto-session-restore" }
  { import = "astrocommunity.recipes.auto-session-restore" },

  ---------------------------------------------------------------------------
  -- Debugging
  ---------------------------------------------------------------------------

  -- Better DAP UI
  --
  -- NOTE: nvim-dap-ui was removed from AstroCommunity.
  -- Use nvim-dap-view instead — the modern maintained replacement.
  { import = "astrocommunity.debugging.nvim-dap-view" },

  -- Inline variable values while debugging
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },

  ---------------------------------------------------------------------------
  -- Telescope Enhancements
  ---------------------------------------------------------------------------

  -- Faster Telescope sorting
  { import = "astrocommunity.utility.telescope-fzy-native-nvim" },

  -- Adds grep args support
  { import = "astrocommunity.utility.telescope-live-grep-args-nvim" },

  -- Better quickfix window experience
  --
  -- NOTE: nvim-bqf moved from utility to quickfix category.
  { import = "astrocommunity.quickfix.nvim-bqf" },

  ---------------------------------------------------------------------------
  -- Notifications / UI
  ---------------------------------------------------------------------------

  -- Fancy notifications/cmdline UI
  { import = "astrocommunity.utility.noice-nvim" },

  ---------------------------------------------------------------------------
  -- Notes / Knowledge Management
  ---------------------------------------------------------------------------

  -- Excellent markdown + note workflow
  -- Works great even outside Obsidian
  { import = "astrocommunity.note-taking.obsidian-nvim" },

  ---------------------------------------------------------------------------
  -- AI / Copilot
  ---------------------------------------------------------------------------
  -- Modern recommended AI setup (pick one):
  --
  -- GitHub Copilot (blink.cmp native integration):
  --   { import = "astrocommunity.completion.blink-copilot" }
  --
  -- Avante (Cursor-style AI panel):
  --   { import = "astrocommunity.ai.avante-nvim" }
  --
  -- CodeCompanion (chat + inline):
  --   { import = "astrocommunity.ai.codecompanion-nvim" }
  --
  -- Avoid older copilot-lua-cmp setups on newer AstroNvim.
}
