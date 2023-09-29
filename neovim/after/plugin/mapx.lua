require('mapx').setup{ global = true }
if (vim.g.vscode) then
    -- VSCode extension
    -- map keyboard quickfix;
    
    nnoremap('z=', "<Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<Cr>")
    end
