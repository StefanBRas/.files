--[[ ignore this for now - no idea how to put it in lua yet
vim.cmd 'command -nargs=1 -complete=filetype NRMM' ..
            'let b:nrrw_aucmd_create = "set ft=" . <q-args>' ..
            '| :execute ":g/```{" . <q-args> . "/+1,/```/-1 NRP' ..
            '| NRM'

--]]
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
