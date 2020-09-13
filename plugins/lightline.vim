let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'branch', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'funcname', 'fileencoding', 'filetype' ],
      \              ],
      \ },
      \ 'component_function': {
      \   'branch': 'gitbranch#name',
      \   'filename': 'LightlineFilename',
      \   'funcname': 'GetFunctionName',
      \ },
      \ }

function! LightlineFilename()
  if expand('%:t') ==# ''
        let filename = '[No Name]'
    else
        let dirfiles = split(expand('%:p'), '/')
        if len(dirfiles) < 2
            let filename = dirfiles[0]
        elseif len(dirfiles) < 3
            let filename = dirfiles[-2] . '/' . dirfiles[-1]
        else
            let filename = dirfiles[-3] . '/' . dirfiles[-2] . '/' . dirfiles[-1]
        endif
    endif
    return filename
endfunction

function! GetFunctionName()
  return cfi#format("%s", "")
endfunction
