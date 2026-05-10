return {
  {
    "NickvanDyke/opencode.nvim",
    enabled = false, -- 🔴 Disable OpenCode temporarily
    dependencies = { { "folke/snacks.nvim", opts = { input = { enabled = true } } } },
    init = function()
      -- Use vim.g.opencode_opts instead of setup()
      vim.g.opencode_opts = {
        -- Add any custom configuration options here if needed
      }
    end,
    config = function()
      local ok, opencode = pcall(require, "opencode")
      if not ok then return end

      vim.opt.autoread = true
      -- <leader>ai prefix avoids conflict with obsidian's <leader>o* mappings
      vim.keymap.set("n", "<leader>ait", opencode.toggle, { desc = "Toggle OpenCode" })
      vim.keymap.set("n", "<leader>aiA", opencode.ask, { desc = "Ask" })
      vim.keymap.set("n", "<leader>aia", function() opencode.ask "@cursor: " end, { desc = "Ask about this" })
      vim.keymap.set("v", "<leader>aia", function() opencode.ask "@selection: " end, { desc = "Ask about selection" })
      vim.keymap.set(
        "n",
        "<leader>ai+",
        function() opencode.prompt("@buffer", { append = true }) end,
        { desc = "Add buffer to prompt" }
      )
      vim.keymap.set(
        "v",
        "<leader>ai+",
        function() opencode.prompt("@selection", { append = true }) end,
        { desc = "Add selection to prompt" }
      )
      vim.keymap.set("n", "<leader>ain", function() opencode.command "session_new" end, { desc = "New session" })
      vim.keymap.set(
        "n",
        "<leader>aiy",
        function() opencode.command "messages_copy" end,
        { desc = "Copy last response" }
      )
      vim.keymap.set(
        "n",
        "<S-C-u>",
        function() opencode.command "messages_half_page_up" end,
        { desc = "Messages half page up" }
      )
      vim.keymap.set(
        "n",
        "<S-C-d>",
        function() opencode.command "messages_half_page_down" end,
        { desc = "Messages half page down" }
      )
      vim.keymap.set({ "n", "v" }, "<leader>ais", opencode.select, { desc = "Select prompt" })
      vim.keymap.set(
        "n",
        "<leader>aie",
        function() opencode.prompt "Explain @cursor and its context" end,
        { desc = "Explain this code" }
      )
    end,
  },
}
