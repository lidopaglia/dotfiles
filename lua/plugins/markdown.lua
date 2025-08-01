return {
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
        -- icons = { "1 ", "2 ", "3 ", "4 ", "5 ", "6 " },
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
    -- config = function()
    --
    -- end,
  },
}
