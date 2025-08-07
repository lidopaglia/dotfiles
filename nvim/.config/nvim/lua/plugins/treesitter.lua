-- https://github.com/nvim-treesitter/nvim-treesitter
return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        -- A list of parser names, or "all"
        -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
        ensure_installed = {
          "bash",
          "css",
          "dockerfile",
          "go",
          "gomod",
          "gosum",
          "gowork",
          "html",
          "javascript",
          "lua",
          "luadoc",
          "luap",
          "markdown",
          "markdown_inline",
          "tsx",
          "typescript",
          "yaml",
        },
        markdown = {
          enable = true,
        },
      })
    end,
  },
}
