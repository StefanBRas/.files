local sumneko_root_path = '/home/stefan/lua-language-server'
local sumneko_binary = "/home/stefan/lua-language-server/bin/Linux/lua-language-server"

M = {
    cmd = {sumneko_binary, "-E", sumneko_root_path  .. "/main.lua"},
    settings = {
	Lua = {
	    runtime = {
		-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
		version = 'LuaJIT',
		-- Setup your lua path
		path = vim.split(package.path, ';'),
	    },
	    diagnostics = {
		-- Get the language server to recognize the `vim` global
		globals = {'vim'},
	    },
	    workspace = {
		-- Make the server aware of Neovim runtime files
		library = {
		    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
		    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
		},
	    },
	    -- Do not send telemetry data containing a randomized but unique identifier
	    telemetry = {
		enable = false,
	    },
	},
    }
}

return M
