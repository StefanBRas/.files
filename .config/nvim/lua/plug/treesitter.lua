local M = {}

M.setup = function()
-- If not installed:
-- local langs = {'r', 'python', 'lua', 'typescript'}
--     for lang in langs do
--     vim.cmd('TSUpdate')
-- 	vim.cmd('TSInstall' .. lang)
--     end
--
require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
})
end

return M
