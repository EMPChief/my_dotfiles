---@type LazySpec
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup {
        style = "night",
        transparent = true, -- Let terminal background show through
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
        },
        on_colors = function(colors)
          -- Darker backgrounds with slight jade tint
          colors.bg = "#16171d" -- Very dark, almost black
          colors.bg_dark = "#11121a" -- Even darker
          colors.bg_highlight = "#1f2937" -- Highlight with subtle warmth
          colors.terminal_black = "#11121a"
          colors.fg = "#c0caf5"
          colors.fg_dark = "#a9b1d6"
          colors.fg_gutter = "#3b4261"

          -- Use jade/teal as ACCENTS only (not backgrounds)
          colors.blue = "#7aa2f7" -- Keep normal blue for most things
          colors.blue0 = "#3d59a1"
          colors.blue1 = "#2ac3de"
          colors.blue2 = "#0db9d7"
          colors.blue5 = "#89ddff"
          colors.blue6 = "#b4f9f8"
          colors.blue7 = "#394b70"

          colors.cyan = "#7dcfff"
          colors.teal = "#1abc9c" -- Teal accent
          colors.green = "#9ece6a"
          colors.green1 = "#73daca" -- Jade accent
          colors.green2 = "#41a6b5"

          colors.magenta = "#bb9af7"
          colors.purple = "#9d7cd8"
          colors.orange = "#ff9e64"
          colors.yellow = "#e0af68"
          colors.red = "#f7768e"
          colors.red1 = "#db4b4b"

          -- Git colors with jade accents
          colors.git.change = "#6183bb"
          colors.git.add = "#73daca" -- Jade for additions
          colors.git.delete = "#f7768e"
        end,
        on_highlights = function(highlights, colors)
          -- Use jade/teal sparingly as accents
          highlights.Keyword = { fg = colors.magenta, italic = true }
          highlights.Function = { fg = colors.blue }
          highlights.String = { fg = colors.green }
          highlights.Type = { fg = colors.blue1 }
          highlights.Identifier = { fg = colors.fg }
          highlights.Special = { fg = colors.blue1 }
          highlights.Operator = { fg = colors.blue5 }

          -- Jade accents on UI elements only
          highlights.CursorLineNr = { fg = colors.green1, bold = true }
          highlights.LineNr = { fg = colors.fg_gutter }
          highlights.Visual = { bg = colors.bg_highlight }
          highlights.Search = { bg = colors.yellow, fg = colors.bg }
          highlights.IncSearch = { bg = colors.orange, fg = colors.bg }
          highlights.MatchParen = { fg = colors.green1, bold = true }

          -- Borders use jade
          highlights.FloatBorder = { fg = colors.green1, bg = colors.bg_dark }
          highlights.NormalFloat = { bg = colors.bg_dark }
          highlights.FloatTitle = { fg = colors.green1, bg = colors.bg_dark, bold = true }

          -- Telescope with jade borders
          highlights.TelescopeBorder = { fg = colors.green1, bg = colors.bg_dark }
          highlights.TelescopePromptBorder = { fg = colors.teal, bg = colors.bg_dark }
          highlights.TelescopePromptTitle = { fg = colors.bg, bg = colors.green1, bold = true }
          highlights.TelescopePreviewTitle = { fg = colors.bg, bg = colors.blue }
          highlights.TelescopeResultsTitle = { fg = colors.bg, bg = colors.teal, bold = true }
          highlights.TelescopeSelection = { fg = colors.fg, bg = colors.bg_highlight, bold = true }
          highlights.TelescopeSelectionCaret = { fg = colors.green1 }
          highlights.TelescopeMatching = { fg = colors.green1, bold = true }

          -- Neo-tree with jade hints
          highlights.NeoTreeDirectoryIcon = { fg = colors.blue }
          highlights.NeoTreeRootName = { fg = colors.green1, bold = true }
          highlights.NeoTreeGitModified = { fg = colors.blue }
          highlights.NeoTreeGitAdded = { fg = colors.green1 }

          -- Normal statusline and tabs
          highlights.StatusLine = { fg = colors.fg, bg = colors.bg_dark }
          highlights.StatusLineNC = { fg = colors.fg_dark, bg = colors.bg_dark }

          highlights.TabLine = { fg = colors.fg_dark, bg = colors.bg_dark }
          highlights.TabLineSel = { fg = colors.bg, bg = colors.green1, bold = true }
          highlights.TabLineFill = { bg = colors.bg_dark }

          -- LSP
          highlights.DiagnosticError = { fg = colors.red }
          highlights.DiagnosticWarn = { fg = colors.yellow }
          highlights.DiagnosticInfo = { fg = colors.blue }
          highlights.DiagnosticHint = { fg = colors.green1 }

          -- Completion menu
          highlights.Pmenu = { bg = colors.bg_dark, fg = colors.fg }
          highlights.PmenuSel = { bg = colors.bg_highlight, fg = colors.green1, bold = true }
          highlights.PmenuSbar = { bg = colors.bg_dark }
          highlights.PmenuThumb = { bg = colors.green1 }

          -- Copilot
          highlights.CopilotSuggestion = { fg = colors.fg_gutter, italic = true }
        end,
      }

      -- Load the colorscheme
      vim.cmd [[colorscheme tokyonight]]
    end,
  },

  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
