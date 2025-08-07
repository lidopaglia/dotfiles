return {
  "nvim-tree/nvim-tree.lua",
  enabled = true,
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      renderer = {
        group_empty = true,
      },
      filters = {
        custom = { "^.git$" },
        dotfiles = false,
      },
      view = {
        width = 30,
        side = "left",
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
    })
    vim.keymap.set("n", "<leader>tn", ":NvimTreeToggle<CR>", { desc = "[T]oggle [N]vimTree" })
  end,
}
