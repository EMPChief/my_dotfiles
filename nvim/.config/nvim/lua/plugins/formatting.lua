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

    -- Optional: Disable format on save for specific filetypes
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        -- Disable for large files
        if vim.fn.getfsize(args.file) > 1024 * 1024 then -- 1MB
          return
        end

        -- Disable for specific filetypes
        local exclude_ft = { "oil" }
        if vim.tbl_contains(exclude_ft, vim.bo[args.buf].filetype) then return end
      end,
    })
  end,
}
