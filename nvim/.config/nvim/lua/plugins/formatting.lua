return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require "conform"

    conform.setup {
      formatters_by_ft = {
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        vue = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        scss = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        jsonc = { "prettierd", "prettier", stop_after_first = true },
        yaml = { "prettierd", "prettier", stop_after_first = true },
        markdown = { "prettierd", "prettier", stop_after_first = true },
        graphql = { "prettierd", "prettier", stop_after_first = true },

        lua = { "stylua" },

        python = { "ruff_organize_imports", "ruff_format" },

        -- Shell
        sh = { "shfmt" },
        bash = { "shfmt" },

        go = { "goimports", "gofumpt" },

        -- C/C++
        c = { "clang_format" },
        cpp = { "clang_format" },

        -- Rust (rustfmt via LSP is usually better)
        -- rust = { "rustfmt" },
      },

      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 3000,
      },

      -- Customize formatters
      formatters = {
        stylua = {
          prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        },
        shfmt = {
          prepend_args = { "-i", "2" }, -- 2 space indent
        },
      },
    }

    -- Format keybinding
    vim.keymap.set(
      { "n", "v" },
      "<leader>mp",
      function()
        conform.format {
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        }
      end,
      { desc = "Format file or range (in visual mode)" }
    )
  end,
}
