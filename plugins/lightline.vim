let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'branch', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'funcname'],
      \              ],
      \ },
      \ 'component_function': {
      \   'branch': 'gitbranch#name',
      \   'filename': 'LightlineFilename',
      \   'funcname': 'GetFunctionName',
      \ },
      \ }

let g:lightline.component = {
      \ 'lineinfo': '%3l[%L]:%-2v'
      \ }

function! LightlineFilename()
  if expand('%:t') ==# ''
    let filename = '[No Name]'
  else
    let dirfiles = split(expand('%:p'), '/')
    if len(dirfiles) < 2
      let filename = dirfiles[0]
    elseif len(dirfiles) < 3
      let filename = dirfiles[-2][0] . '/' . dirfiles[-1]
    else
      let filename = dirfiles[-3][0] . '/' . dirfiles[-2][0] . '/' . dirfiles[-1]
    endif
  endif
  return filename
endfunction

function! GetFunctionName()
  return cfi#format("%s", "")
endfunction

set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

