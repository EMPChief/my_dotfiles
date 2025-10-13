---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },

  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.mini-splitjoin" },
  { import = "astrocommunity.editing-support.nvim-treesitter-context" },
  { import = "astrocommunity.editing-support.undotree" },
  { import = "astrocommunity.editing-support.yanky-nvim" },

  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.motion.mini-move" },

  { import = "astrocommunity.git.git-blame-nvim" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.neogit" },

  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.markdown-and-latex.markview-nvim" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.tailwindcss" },

  { import = "astrocommunity.diagnostics.trouble-nvim" },

  { import = "astrocommunity.indent.indent-blankline-nvim" },
  { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  
  { import = "astrocommunity.lsp.lsp-signature-nvim" },

  -- { import = "astrocommunity.completion.copilot-lua-cmp" },

  { import = "astrocommunity.utility.telescope-fzy-native-nvim" },
  { import = "astrocommunity.utility.telescope-live-grep-args-nvim" },
  { import = "astrocommunity.utility.noice-nvim" },
}
