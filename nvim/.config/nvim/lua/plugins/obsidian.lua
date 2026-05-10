return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    -- Notes
    { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New note" },
    { "<leader>oo", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick switch" },
    { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search notes" },
    { "<leader>of", "<cmd>ObsidianFollowLink<cr>", desc = "Follow link" },
    -- Daily notes
    { "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Today's note" },
    { "<leader>oy", "<cmd>ObsidianYesterday<cr>", desc = "Yesterday's note" },
    { "<leader>om", "<cmd>ObsidianTomorrow<cr>", desc = "Tomorrow's note" },
    -- Navigation
    { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Backlinks" },
    { "<leader>og", "<cmd>ObsidianTags<cr>", desc = "Tags" },
    -- Editing
    { "<leader>ol", "<cmd>ObsidianLink<cr>", mode = "v", desc = "Link selection" },
    { "<leader>oL", "<cmd>ObsidianLinkNew<cr>", mode = "v", desc = "Link selection to new note" },
    { "<leader>oc", "<cmd>ObsidianToggleCheckbox<cr>", desc = "Toggle checkbox" },
    { "<leader>ot", "<cmd>ObsidianTemplate<cr>", desc = "Insert template" },
    { "<leader>op", "<cmd>ObsidianPasteImg<cr>", desc = "Paste image" },
    { "<leader>or", "<cmd>ObsidianRename<cr>", desc = "Rename note" },
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        -- Trailing slash removed — can cause path resolution issues
        path = "/run/media/bearman/KINGSTON/stash/stash2",
      },
    },

    -- Daily notes config
    -- Creates daily notes under a dedicated subfolder
    daily_notes = {
      folder = "daily",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      default_tags = { "daily" },
    },

    -- Templates folder — must exist inside your vault
    -- Create it with: mkdir /run/media/bearman/KINGSTON/stash/stash2/templates
    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },

    -- How new notes are named
    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        -- Slugify the title
        suffix = title:gsub(" ", "-"):gsub("[^a-zA-Z0-9-]", ""):lower()
      else
        -- Random suffix if no title
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,

    -- Nicer link style (use note title instead of ID when possible)
    wiki_link_func = "use_alias_only",

    -- Use telescope/snacks for pickers (AstroNvim already sets this up)
    picker = {
      name = "telescope",
    },

    -- Disable obsidian.nvim's own completion in favour of your existing cmp/blink setup
    completion = {
      nvim_cmp = false,
      min_chars = 2,
    },

    -- Nicer checkbox cycle: empty -> in-progress -> done -> cancelled
    ui = {
      checkboxes = {
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
        [">"] = { char = "", hl_group = "ObsidianRightArrow" },
        ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
      },
      bullets = { char = "•", hl_group = "ObsidianBullet" },
      external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      reference_text = { hl_group = "ObsidianRefText" },
      highlight_text = { hl_group = "ObsidianHighlightText" },
      tags = { hl_group = "ObsidianTag" },
      block_ids = { hl_group = "ObsidianBlockID" },
      hl_groups = {
        ObsidianTodo = { bold = true, fg = "#f78c6c" },
        ObsidianDone = { bold = true, fg = "#89ddff" },
        ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
        ObsidianTilde = { bold = true, fg = "#ff5370" },
        ObsidianBullet = { bold = true, fg = "#89ddff" },
        ObsidianRefText = { underline = true, fg = "#c792ea" },
        ObsidianExtLinkIcon = { fg = "#c792ea" },
        ObsidianTag = { italic = true, fg = "#89ddff" },
        ObsidianBlockID = { italic = true, fg = "#89ddff" },
        ObsidianHighlightText = { bg = "#75662e" },
      },
    },

    -- Don't mess with conceallevel — let your markdown config handle it
    -- (markview-nvim or render-markdown already handle this nicely)
    disable_frontmatter = false,
  },
}
