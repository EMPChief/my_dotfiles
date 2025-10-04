-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics = { virtual_text = true, virtual_lines = false },
      highlighturl = true,
      notifications = true,
    },
    -- Diagnostics configuration
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = {
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = false,
        scrolloff = 8,
        sidescrolloff = 8,
        shiftwidth = 2,
        tabstop = 2,
        expandtab = true,
        smartindent = true,
        ignorecase = true,
        smartcase = true,
        updatetime = 200,
        timeoutlen = 300,
        undofile = true,
        termguicolors = true,
        autoread = true, -- Auto-reload files changed outside Neovim
      },
      g = {},
    },
    -- Autocommands
    autocmds = {
      auto_reload = {
        {
          event = { "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" },
          desc = "Auto reload file when changed outside",
          callback = function()
            if vim.fn.mode() ~= "c" then vim.cmd "checktime" end
          end,
        },
        {
          event = { "FileChangedShellPost" },
          desc = "Notify when file changed outside",
          callback = function() vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.WARN) end,
        },
      },
    },
    -- Mappings
    mappings = {
      n = {
        -- Buffer navigation
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
        -- Reload current buffer manually
        ["<Leader>br"] = { "<cmd>checktime<cr>", desc = "Reload buffer from disk" },
      },
      i = {
        ["<CR>"] = {
          function()
            local cmp = require "cmp"
            if cmp.visible() then cmp.close() end
            return "<CR>"
          end,
          expr = true,
          desc = "New line (dismiss completion)",
        },
        ["<C-y>"] = {
          function()
            local cmp = require "cmp"
            if cmp.visible() then cmp.confirm { select = true } end
          end,
          desc = "Accept completion",
        },
      },
    },
  },
}
