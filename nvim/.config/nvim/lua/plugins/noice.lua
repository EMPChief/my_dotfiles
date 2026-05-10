---@type LazySpec
return {
  "folke/noice.nvim",
  opts = {
    routes = {
      {
        -- Suppress nvim-treesitter dead-node error (Neovim 0.12 compat issue)
        -- Remove once nvim-treesitter adds TSNode validity checks
        filter = { event = "msg_show", find = "attempt to call method 'range'" },
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
