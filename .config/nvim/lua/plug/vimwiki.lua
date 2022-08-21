local M = {}
M.setup = function()
local wiki = {path = '~/vimwiki/'}--, nested_syntaxes = {'R' = 'R'}}
vim.g.vimwiki_list = {wiki}
end
return M
