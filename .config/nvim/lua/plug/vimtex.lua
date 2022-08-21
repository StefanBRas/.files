local M = {}

M.setup = function()
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_general_viewer = "zathura"
vim.g.vimtex_quickfix_autoclose_after_keystrokes = 2
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_compiler_latexmk = {
    executable = 'latexmk',
    options = {
        '-lualatex',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode'
    }
}
end

return M
