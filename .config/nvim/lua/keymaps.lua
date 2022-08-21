local remap = vim.api.nvim_set_keymap
vim.g.mapleader = " "
vim.b.mapleader = " "
local opts = { noremap = true, silent = true }
-- lsp stuff
remap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
remap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
remap("n", "<C-j>", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- remove when do something
vim.cmd("autocmd CursorMovedI * if pumvisible() == 0|pclose|endif")
vim.cmd("autocmd InsertLeave * if pumvisible() == 0|pclose|endif")

-- Filetype commands
vim.cmd("au BufNewFile,BufRead *.Rmarkdown set filetype=rmd")
vim.cmd("au BufNewFile,BufRead *.jl set filetype=julia")

-- R
-- lav >> om til pipe
--
vim.g.R_assign = 0
vim.cmd("autocmd FileType r inoremap <buffer> >> <Esc>:normal! a %>%<CR>a ")
vim.cmd("autocmd FileType rnoweb inoremap <buffer> >> <Esc>:normal! a %>%<CR>a ")
vim.cmd("autocmd FileType rmd inoremap <buffer> >> <Esc>:normal! a %>%<CR>a ")
vim.cmd("autocmd FileType r inoremap <buffer> << <Esc>:normal! a <-<CR>a ")
vim.cmd("autocmd FileType rnoweb inoremap <buffer> << <Esc>:normal! a <-<CR>a ")
vim.cmd("autocmd FileType rmd inoremap <buffer> << <Esc>:normal! a <-<CR>a ")


remap("n", "H", ":noh<CR>", { silent = true }) -- remove highlights
remap("n", "<localleader><localleader>", ":TREPLSendLine<cr>j ", { silent = true })
remap("v", "<localleader><localleader>", ":TREPLSendSelection<cr>", { silent = true })
-- Take focus back after updating firefox
remap(
	"n",
	"<localleader>kh",
	':call RMakeRmd("html_document")<CR>:!switch_to_last_focus_after_opening_firefox.sh & <CR><CR>',
	{ silent = true }
)

remap('i', '<C-k>', '<cmd>lua require("copilot-client").suggest()<CR>', opts)
remap('n', '<C-k>', '<cmd>lua require("copilot-client").suggest()<CR>', opts)

