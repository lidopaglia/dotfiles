return {
  "echasnovski/mini.nvim",
  version = "*",
  config = function()
    -- https://github.com/echasnovski/mini.ai
    require("mini.ai").setup()

    -- https://github.com/echasnovski/mini.align
    require("mini.align").setup()

    -- https://github.com/echasnovski/mini.indentscope
    require("mini.indentscope").setup({
      draw = {
        animation = require("mini.indentscope").gen_animation.none(),
        delay = 50,
      },
      symbol = "│",
      options = { try_as_border = true },
    })

    -- https://github.com/echasnovski/mini.pairs
    require("mini.pairs").setup()

    -- https://github.com/echasnovski/mini.surround
    require("mini.surround").setup({
      custom_surroundings = {
        ["l"] = { output = { left = "[", right = "]()" } },
      },
    })

    -- Disable mini.indentscope on certain filetypes
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "NvimTree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}
