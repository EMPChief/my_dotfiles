---@type LazySpec
return {
  "folke/noice.nvim",
  opts = {
    routes = {
      {
        -- Suppress nvim-treesitter dead-node error (Neovim 0.12 compat issue)
        filter = { event = "msg_show", find = "attempt to call method 'range'" },
        opts = { skip = true },
      },
      {
        -- Suppress aerial.nvim dead-node error (same Neovim 0.12 compat issue)
        filter = { event = "msg_show", find = "attempt to call method 'start'" },
        opts = { skip = true },
      },
    },
    views = {
      cmdline_popup = {
        position = {
          row = "50%",
          col = "50%",
        },
      },
    },
  },
}
