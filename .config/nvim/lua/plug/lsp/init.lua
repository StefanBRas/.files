local M = {}
M.setup = function ()
vim.cmd 'autocmd Filetype julia setlocal omnifunc=v:lua.vim.lsp.omnifunc'
vim.cmd 'autocmd Filetype r setlocal omnifunc=v:lua.vim.lsp.omnifunc'
vim.cmd 'autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc'

local lsp = require('lspconfig')
-- local lsp_completion = require('completion')
local lsp_status  = require('lsp-status')
local sumneko_lua_settings = require('plug/lsp/lua')
require('lspkind').init()

local on_attach = function(client, bufnr)
    lsp_status.on_attach(client)
  --  lsp_completion.on_attach(client)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings
    local opts = { noremap=true, silent=true }
    -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<localleader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<localleader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<localleader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<localleader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<localleader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<localleader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<localleader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
	buf_set_keymap("n", "<localleader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>",
	opts)
    elseif client.resolved_capabilities.document_range_formatting then
	buf_set_keymap("n", "<localleader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>",
	opts)
    end

end

lsp_status.register_progress()


local servers = {
    pyright = {},
    r_language_server={},
    julials={},
    tsserver={},
    rust_analyzer={},
    ansiblels={}
}

for server, setup_settings in pairs(servers) do
    lsp[server].setup {on_attach = on_attach,
    capabilities = lsp_status.capabilities,
    settings = setup_settings
}
end

lsp['sumneko_lua'].setup { on_attach = on_attach,
capabilities = lsp_status.capabilities,
settings = sumneko_lua_settings.settings,
cmd = sumneko_lua_settings.cmd,
}


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    update_in_insert = false,
}
)
end

return M




