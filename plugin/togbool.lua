-- toggle boolean word under cursor
-------------------------------------------------------------------------------

function ToggleBool(args)
  if args.word == "true" then
    vim.cmd([[norm ciwfalse]])
  elseif args.word == "false" then
    vim.cmd([[norm ciwtrue]])
  elseif args.word == "True" then
    vim.cmd([[norm ciwFalse]])
  elseif args.word == "False" then
    vim.cmd([[norm ciwTrue]])
  elseif args.word == "TRUE" then
    vim.cmd([[norm ciwFALSE]])
  elseif args.word == "FALSE" then
    vim.cmd([[norm ciwTRUE]])
  else
    print("Word under cursor needs to be 'true' or 'false")
  end
end

vim.keymap.set(
    { "n", "v" },
    "<leader>tb",
    ":lua ToggleBool({word=vim.fn.expand('<cword>')})<cr>", {
          desc = "[T]oggle [B]oolean (word under cursor)",
          noremap = true,
          silent = true,
    }
)
