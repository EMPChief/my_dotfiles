---@type LazySpec
return {
  "folke/noice.nvim",
  opts = {
    routes = {
      {
        -- Suppress all TSNode dead-node errors (Neovim 0.12 compat issue in
        -- nvim-treesitter/aerial/markview — node:range/start/type all nil)
        filter = { event = "msg_show", find = "attempt to call method '.*' %(a nil value%)" },
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
