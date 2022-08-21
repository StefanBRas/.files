local cmd = vim.cmd
cmd 'filetype plugin indent on'
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.b.showmatch = true       -- Show matching brackets.
vim.o.ignorecase = true              -- Do case insensitive matching
vim.o.mouse ='v'                 -- middle-click paste with mouse
vim.b.hlsearch = true                -- highlight search results
vim.o.incsearch = true               --  highlight sea
vim.b.tabstop = 4               -- number of columns occupied by a tab character
vim.g.tabstop = 4               -- number of columns occupied by a tab character
vim.b.softtabstop =4           -- see multiple spaces as tabstops so <BS> does the right thing
vim.b.expandtab = true              -- converts tabs to white space
vim.o.shiftwidth = 4            -- width for autoindents
vim.o.autoindent = true             -- indent a new line the same amount as the line just typed
vim.wo.number = true                  -- add line numbers
vim.o.wildmode = 'longest:list'   -- get bash-like tab completions
vim.o.cc = '120'                  --  set an 100 column border for good coding style
vim.o.laststatus = 2
vim.b.laststatus = 2
-- completion
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect'
vim.g.completion_enable_auto_popup = 0
vim.g.completion_confirm_key = '<CR>'

-- Avoid showing message extra message when using completion
vim.o.shortmess = vim.o.shortmess .. 'c'

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
-- paste fix
vim.cmd 'au InsertLeave * set nopaste'
-- providers
vim.g.python3_host_prog = '/usr/bin/python3.8'

-- packer
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]

-- Recompile whenever plugin files change
-- vim.cmd([[
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost plugins.lua source <afile> | PackerCompile
-- autocmd BufWritePost */plug/*.lua source <afile> | PackerCompile
-- augroup end
-- ]])


require('plugins')
require('keymaps')

vim.cmd 'syntax on'
vim.cmd 'colorscheme onedark'

-- github copilot
vim.cmd 'imap <silent><script><expr> <C-J> copilot#Accept("")'
vim.cmd 'let g:copilot_no_tab_map = v:true'
vim.cmd [[autocmd VimEnter * Copilot disable]]
