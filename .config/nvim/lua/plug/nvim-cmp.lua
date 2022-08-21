local M = {}

M.setup = function()
    local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end
    local lspkind = require('lspkind')
    local luasnip = require("luasnip")
    local cmp = require('cmp')
    cmp.setup({
	completion = {
	    autocomplete = true 
	},
	formatting = {
	    format = lspkind.cmp_format({
		with_text = true,
		menu = {
		    buffer = "[Buffer]",
		    nvim_lsp = "[LSP]",
		    luasnip = "[Snip]",
		    nvim_lua = "[Lua]",
		    latex_symbols = "[Latex]",
		},
	    })
	},
	snippet = {
	    expand = function(args)
		require('luasnip').lsp_expand(args.body)
	    end
	},
	mapping = {
	    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
	    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
	    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
	    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
	    ['<C-e>'] = cmp.mapping({
		i = cmp.mapping.abort(),
		c = cmp.mapping.close(),
	    }),
	    ['<CR>'] = cmp.mapping.confirm({ select = true }),
	    ["<Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
		    cmp.select_next_item()
		elseif luasnip.expand_or_jumpable() then
		    luasnip.expand_or_jump()
		else
		    fallback()
		end
	    end, { "i", "s" }),

	    ["<S-Tab>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
		    cmp.select_prev_item()
		elseif luasnip.jumpable(-1) then
		    luasnip.jump(-1)
		else
		    fallback()
		end
	    end, { "i", "s" }),
	},
	sources = cmp.config.sources({
	    { name = 'copilot', group_index=1 },
	    { name = 'nvim_lsp' },
	    { name = 'omni' },
	    { name = 'luasnip' }, -- For luasnip users.
	}, {
	    { name = 'buffer' },
	})
    })

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline('/', {
	sources = {
	    { name = 'buffer' }
	}
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
	    { name = 'path' }
	}, {
	    { name = 'cmdline' }
	})
    })

    -- Setup lspconfig.
    -- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    -- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    -- require('lspconfig')[''].setup {
	--   capabilities = capabilities
	-- }
    end

    return M
