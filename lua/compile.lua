vim.cmd([[
noremap <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        :sp
        :res -10
        :term pwsh.exe -c ./%<
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        :sp
        :res -10
        :term pwsh.exe -c ./%<
    elseif &filetype == 'python'
        set splitbelow
        :sp
        :res -10
        :term pwsh.exe -c python ./%
    endif
endfunc
]])

