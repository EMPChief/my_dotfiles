---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "pyright",
        "ruff",
        "typescript-language-server",
        "rust-analyzer",
        "gopls",
        "bash-language-server",
        "html-lsp",
        "css-lsp",
        "tailwindcss-language-server",
        "json-lsp",
        "dockerfile-language-server",
        "yaml-language-server",
        "clangd",

        "stylua",
        "prettier",
        "prettierd",
        "shfmt",
        "goimports",
        "gofumpt",
        "clang-format",

        "eslint_d",
        "shellcheck",
        "yamllint",
        "hadolint",
        "golangci-lint",

        "debugpy",
        "js-debug-adapter",
        "codelldb",
      },

      -- Optional: auto-update and install on start
      auto_update = false,
      run_on_start = true,
    },
  },
}
