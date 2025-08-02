return {
  -- Command and arguments to start the server.
  cmd = { "vscode-css-language-server", "--stdio" },

  -- Filetypes to automatically attach to.
  filetypes = { "css", "scss", "less" },

  -- Sets the "root directory" to the parent directory of the file in the
  -- current buffer that contains either a ".luarc.json" or a
  -- ".luarc.jsonc" file. Files that share a root directory will reuse
  -- the connection to the same LSP server.
  -- Nested lists indicate equal priority, see |vim.lsp.Config|.
  root_markers = { "package.json", ".git" },

  -- Settings to send the server.
  -- For example the schema for lua-language-server:
  -- https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
}
