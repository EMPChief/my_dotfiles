---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- Language Servers
        "bash-language-server",
        "clangd",
        "css-lsp",
        "dockerfile-language-server",
        "gopls",
        "html-lsp",
        "json-lsp",
        "lua-language-server",
        "marksman",
        "pyright",
        "rust-analyzer",
        "tailwindcss-language-server",
        "typescript-language-server",
        "yaml-language-server",
        -- Linters
        "eslint_d",
        "golangci-lint",
        "hadolint",
        "shellcheck",
        "yamllint",
        -- Formatters
        "clang-format",
        "gofumpt",
        "goimports",
        "prettier",
        "prettierd",
        "shfmt",
        "stylua",
        -- Linters/Formatters
        "ruff",
        -- Debuggers
        "codelldb",
        "debugpy",
        "js-debug-adapter",
      },
      auto_update = false,
      run_on_start = true,
    },
  },
}
