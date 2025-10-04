-- In your LSP config file
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruff = {
        -- Ruff language server for linting
        init_options = {
          settings = {
            -- Any extra CLI arguments for ruff
            args = {},
          },
        },
      },
      pyright = {
        -- Disable pyright's linting since ruff handles it
        settings = {
          pyright = {
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              ignore = { "*" }, -- Using ruff for linting
              typeCheckingMode = "basic",
            },
          },
        },
      },
    },
  },
}
