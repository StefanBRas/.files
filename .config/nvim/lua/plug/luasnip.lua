local M = {}

M.setup = function()
    require("luasnip/loaders/from_vscode").load({ paths = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets" } })
end

return M
