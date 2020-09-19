autocmd FileType go nnoremap <silent> gt :<C-u>silent call <SID>go_test_function()<CR>

function! s:go_test_function() abort
    let test_info = json_decode(system(printf('go-test-name -pos %s -file %s', s:cursor_byte_offset(), @%)))

    for b in nvim_list_bufs()
        if bufname(b) ==# 'vim-go-test-func'
            execute printf('bwipe! %s', b)
        endif
    endfor

    let dir = expand('%:p:h')

    if len(test_info.sub_test_names) > 0
        let cmd = printf("go test -coverprofile='/tmp/go-coverage.out' -count=1 -v -race -run='^%s$'/'^%s$' $(go list %s)", test_info.test_func_name, test_info.sub_test_names[0], dir)
    else
        let cmd = printf("go test -coverprofile='/tmp/go-coverage.out' -count=1 -v -race -run='^%s$' $(go list %s)", test_info.test_func_name, dir)
    endif

    let split = s:split_type()
    execut printf('%s gotest', split)

    if split ==# 'split'
        execute(printf('resize %s', floor(&lines * 0.3)))
    endif

    call termopen(cmd)
    setlocal bufhidden=delete
    setlocal noswapfile
    setlocal nobuflisted
    file vim-go-test-func
    wincmd p
endfunction

function! s:cursor_byte_offset() abort
    return line2byte(line('.')) + (col('.') - 2)
endfunction

function! s:split_type() abort
    " NOTE: my cell ratio: width:height == 1:2.1
    let width = winwidth(win_getid())
    let height = winheight(win_getid()) * 2.1

    if height > width
        return 'split'
    else
        return 'vsplit'
    endif
endfunction
