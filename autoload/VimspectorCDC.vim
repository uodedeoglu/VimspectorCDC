" Define a function to copy the JSON file to the current directory
function! VimspectorCDC#CopyConfigFile(fileName)

    let autoload_dir = expand('~/.vim/bundle/VimspectorCDC/autoload/')  " Get directory of the autoload script

    let relative_path = autoload_dir .  '../configs/'
    let source_file = relative_path . a:fileName . ".json"
    let destination_file = expand('%:p:h') . '/.vimspector.json'
    " Copy the file

" Check if source file exists
    if !filereadable(source_file)
        echo "Error: Source file does not exist: " . source_file
        return
    endif

    " Copy the file
    let copy_command = 'cp ' . shellescape(source_file) . ' ' . shellescape(destination_file)
    if system(copy_command) != 0
        echo "Error: Unable to copy file"
        return
    endif
" Check if Lightline is running
    if exists('*lightline#update') && exists('*lightline#update_highlight') && exists('*lightline#statusline')
        " Show a message indicating successful copy in Lightline status line
        call lightline#update()
        call lightline#update_highlight()
        call lightline#statusline('', escape('Copied ' . source_file . ' to ' . destination_file, ' \'), '', '')
    else
        " Show a regular echo message if Lightline is not running
        echo "Copied " . source_file . " to " . destination_file
    endif

   if a:fileName == "cmake"
   let tasks_source_file = relative_path . "cmake-tasks.json"
   let tasks_destination_file = expand('%:p:h') . '/tasks.json'

" Check if source file exists
    if !filereadable(tasks_source_file)
        echo "Error: Source file does not exist: " . source_file
        return
    endif

    " Copy the file
    let tasks_copy_command = 'cp ' . shellescape(tasks_source_file) . ' ' . shellescape(tasks_destination_file)
    if system(tasks_copy_command) != 0
        echo "Error: Unable to copy file"
        return
    endif
" Check if Lightline is running
    if exists('*lightline#update') && exists('*lightline#update_highlight') && exists('*lightline#statusline')
        " Show a message indicating successful copy in Lightline status line
        call lightline#update()
        call lightline#update_highlight()
        call lightline#statusline('', escape('Copied ' . tasks_source_file . ' to ' . tasks_destination_file, ' \'), '', '')
    else
        " Show a regular echo message if Lightline is not running
        echo "Copied " . tasks_source_file . " to " . tasks_destination_file
    endif
   endif
endfunction
