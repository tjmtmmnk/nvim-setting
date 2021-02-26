let g:far#enable_undo=1
let g:far#default_file_mask="**/*"
let g:far#source='rg'

let mapleader = "\<Space>"
nmap <Leader>g [far]
xmap <Leader>g [far]

nnoremap <silent> [far]r     :<C-u>Farr <CR>

