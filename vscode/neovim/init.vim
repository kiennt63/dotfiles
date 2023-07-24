let mapleader = " "

nnoremap <leader>b <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
nnoremap <leader>e <Cmd>call VSCodeNotify('workbench.view.explorer')<CR>
nnoremap <leader>ff <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>
nnoremap <leader>fg <Cmd>call VSCodeNotify('workbench.action.findInFiles')<CR>
nnoremap <c-w>l <Cmd>call VSCodeNotify('workbench.action.focusActiveEditorGroup')<CR>
nnoremap gcc <Cmd>call VSCodeNotify('editor.action.commentLine')<CR>
