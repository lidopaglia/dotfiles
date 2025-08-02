return {
  {
    -- https://github.com/tadmccorkle/markdown.nvim
    -- also enabled as a treesitter module
    "tadmccorkle/markdown.nvim",
    ft = "markdown",
    opts = {},
  },

  {
    -- https://github.com/hedyhli/outline.nvim
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>to", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      symbol_folding = {
        -- Unfold entire symbol tree by default with false, otherwise enter a
        -- number starting from 1
        autofold_depth = false,
      },
      outline_window = {
        -- Percentage or integer of columns
        width = 33,
      },
    },
  },

  {
    -- https://github.com/iamcco/markdown-preview.nvim
    "iamcco/markdown-preview.nvim",
    keys = {
      {
        "<leader>mp",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },

  {
    -- https://github.com/MeanderingProgrammer/render-markdown.nvim
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    opts = {
      enabled = true,
      code = { sign = false },
      heading = {
        -- enabled = true,
        -- border = true,
        -- border_virtual = true,
        -- width = { "full", "full", "block" },
        left_pad = 1,
        right_pad = 3,
        -- render_modes = true,
        sign = false,
        icons = { "󰎥  ", "󰎨  ", "󰎫  ", "󰎲  ", "󰎯  ", "󰎴  " },
        position = "inline",
      },
      html = {
        -- Turn on / off all HTML rendering
        enabled = true,
        comment = {
          -- Turn on / off HTML comment concealing
          conceal = false,
        },
      },
    },
  },
}
