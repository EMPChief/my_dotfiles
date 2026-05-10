---@type LazySpec
return {
  "stevearc/aerial.nvim",
  opts = {
    -- Prefer LSP over treesitter to avoid dead-node crashes on Neovim 0.12
    -- (aerial calls node:start() on stale TSNodes; LSP backend has no such issue)
    backends = { "lsp", "treesitter", "markdown", "man" },
  },
}
