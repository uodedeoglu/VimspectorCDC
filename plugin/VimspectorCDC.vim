" Title:	VimspectorCDC
" Description:	A plugin to create default .vimspector.json files in cwd
" Last Change:	4 April 2024
" Maintainer:	uodedeoglu <https://github.com/uodedeoglu>

" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists("g:loaded_VimspectorCDC")
    finish
endif
let g:loaded_VimspectorCDC = 1

nnoremap <leader>cccp :call VimspectorCDC#CopyConfigFile('cpp')<CR>
nnoremap <leader>ccmk :call VimspectorCDC#CopyConfigFile('cmake')<CR>

command! -nargs=1 CDCCopyDefaultConfig call VimspectorCDC#CopyConfigFile(<f-args>)
command! -nargs=1 CDCCopyDefaultConfigCPP call VimspectorCDC#CopyConfigFile('cpp')
