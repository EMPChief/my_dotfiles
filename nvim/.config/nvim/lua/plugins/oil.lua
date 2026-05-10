---@type LazySpec
return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Oil",
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    { "<leader>e", "<cmd>Oil<cr>", desc = "Open Oil" },
    { "<leader>E", function() require("oil").open_float() end, desc = "Open Oil (float)" },
  },
  opts = {
    default_file_explorer = true,

    columns = {
      "icon",
      -- "permissions",
      -- "size",
      -- "mtime",
    },

    -- Show directory as buffer name in winbar/statusline
    buf_options = {
      buflisted = false,
      bufhidden = "hide",
    },

    win_options = {
      wrap = false,
      signcolumn = "yes", -- space for git signs
      cursorcolumn = false,
      foldcolumn = "0",
      spell = false,
      list = false,
      conceallevel = 3,
      concealcursor = "nvic",
    },

    -- Restore cursor to last position when re-entering a directory
    restore_win_options = true,

    -- Skip confirmation for simple operations; still prompt for destructive ones
    skip_confirm_for_simple_edits = true,

    -- Prompt before saving on :w / :wq (safety net)
    prompt_save_on_select_new_entry = true,

    -- Automatically clean up oil buffers when you leave them
    cleanup_delay_ms = 2000,

    lsp_file_methods = {
      -- Let LSP rename imports etc. when you rename a file in oil
      enabled = true,
      timeout_ms = 1000,
      autosave_changes = false, -- set true if you trust it
    },

    -- Constrain cursor to filename column only (feels cleaner)
    constrain_cursor = "editable",

    -- Watch filesystem for changes and refresh automatically
    watch_for_changes = true,

    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<C-v>"] = "actions.select_vsplit",
      ["<C-x>"] = "actions.select_split",
      ["<C-t>"] = "actions.select_tab",
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = "actions.close",
      ["<C-r>"] = "actions.refresh",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = "actions.tcd",
      ["gs"] = "actions.change_sort",
      ["gx"] = "actions.open_external",
      ["g."] = "actions.toggle_hidden",
      ["g\\"] = "actions.toggle_trash",
    },

    -- Float window config (used by <leader>E)
    float = {
      padding = 2,
      max_width = 90,
      max_height = 30,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
    },

    -- Preview window config (used by <C-p>)
    preview = {
      max_width = 0.7,
      min_width = { 40, 0.4 },
      width = nil,
      max_height = 0.9,
      min_height = { 5, 0.1 },
      height = nil,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
      update_on_cursor_moved = true,
    },

    -- Progress window (shown during multi-file operations)
    progress = {
      max_width = 0.45,
      min_width = { 40, 0.4 },
      width = nil,
      max_height = { 10, 0.9 },
      min_height = { 5, 0.1 },
      height = nil,
      border = "rounded",
      minimized_border = "none",
      win_options = {
        winblend = 0,
      },
    },

    view_options = {
      show_hidden = true,
      -- Treat these as always-hidden even with show_hidden = true
      is_always_hidden = function(name, _) return name == ".git" or name == ".DS_Store" end,
      -- Sort: directories first, then files, both alphabetically
      sort = {
        { "type", "asc" },
        { "name", "asc" },
      },
    },
  },
}
