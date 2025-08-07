-- https://github.com/arnamak/stay-centered.nvim
return {
  "arnamak/stay-centered.nvim",
  opts = function()
    require("stay-centered").setup({
      skip_filetypes = {}, -- e.g. "lua", "typescript"
      enabled = true,
    })

    -- Define the keymap to toggle the stay-centered plugin
    vim.keymap.set("n", "<leader>tsc", function()
      require("stay-centered").toggle()
      vim.notify("Toggled stay-centered", vim.log.levels.INFO)
    end, { desc = "Toggle stay-centered.nvim" })
  end,
}
