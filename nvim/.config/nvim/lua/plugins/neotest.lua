---@type LazySpec
return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-go",
      "rouge8/neotest-rust",
      "haydenmeade/neotest-jest",
    },
    keys = {
      { "<leader>Tr", function() require("neotest").run.run() end, desc = "Run nearest test" },
      { "<leader>Tf", function() require("neotest").run.run(vim.fn.expand "%") end, desc = "Run test file" },
      { "<leader>Ts", function() require("neotest").summary.toggle() end, desc = "Toggle test summary" },
      { "<leader>To", function() require("neotest").output_panel.toggle() end, desc = "Toggle test output" },
      { "<leader>TS", function() require("neotest").run.stop() end, desc = "Stop test run" },
      {
        "<leader>Td",
        function() require("neotest").run.run { strategy = "dap" } end,
        desc = "Debug nearest test",
      },
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-python" { dap = { justMyCode = false } },
          require "neotest-go",
          require "neotest-rust",
          require "neotest-jest" { jestCommand = "npx jest" },
        },
      }
    end,
  },
}
