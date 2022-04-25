local M = {}

-- toggle boolean word - true/false
function M.toggle_bool(args)
  if args.word == "true" then
    vim.cmd [[norm ciwfalse]]
  elseif args.word == "false" then
    vim.cmd [[norm ciwtrue]]
  elseif args.word == "True" then
    vim.cmd [[norm ciwFalse]]
  elseif args.word == "False" then
    vim.cmd [[norm ciwTrue]]
  else
    print "Word under cursor needs to be 'true' or 'false"
  end
end

return M
