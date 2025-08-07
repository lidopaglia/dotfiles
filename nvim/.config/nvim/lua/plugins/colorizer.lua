-- https://github.com/norcalli/nvim-colorizer.lua
return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      css = { css = true },
      html = { names = false },
    })
  end,
}
