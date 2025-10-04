return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- Insert mode mappings
        i = {
          ["jk"] = { "<Esc>", desc = "Exit insert mode" },
        },
        -- Normal mode mappings
        n = {
          -- Clear search highlights
          ["<Leader>nh"] = { ":nohlsearch<CR>", desc = "Clear search highlights" },

          -- Increment and Decrement numbers
          ["<Leader>+"] = { "<C-a>", desc = "Increment number under cursor" },
          ["<Leader>-"] = { "<C-x>", desc = "Decrement number under cursor" },

          -- Split window management
          ["<Leader>sv"] = { ":vsplit<CR>", desc = "Split window vertically" },
          ["<Leader>sh"] = { ":split<CR>", desc = "Split window horizontally" },
          ["<Leader>se"] = { ":resize +5<CR>:vertical resize +5<CR>", desc = "Make splits equal size" },
          ["<Leader>sx"] = { ":close<CR>", desc = "Close current split" },

          -- Tab management
          ["<Leader>to"] = { ":tabnew<CR>", desc = "Open new tab" },
          ["<Leader>tx"] = { ":tabclose<CR>", desc = "Close current tab" },
          ["<Leader>tn"] = { ":tabnext<CR>", desc = "Go to next tab" },
          ["<Leader>tp"] = { ":tabprevious<CR>", desc = "Go to previous tab" },
          ["<Leader>tf"] = { ":tabnew %<CR>", desc = "Open current buffer in new tab" },
        },
      },
    },
  },
}
