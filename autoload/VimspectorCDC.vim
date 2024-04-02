" Define a function to copy the JSON file to the current directory
function! config_copy#CopyConfigFile(fileName)
    let relative_path = './../configs'
    let source_file = relative_path . a:fileName . ".json"
    let destination_file = expand('%:p:h') . '/' . fnamemodify(source_file, ':t')

    " Copy the file
    execute 'silent! !cp' fnameescape(source_file) fnameescape(destination_file)

    " Show a message indicating successful copy
    echo "Copied " . source_file . " to " . destination_file
endfunction
