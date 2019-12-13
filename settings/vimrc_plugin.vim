" File: vimrc_plugin
" Author: missingtears
" Description: fengpingping's personal vim configure file.
" Since: 2017-07-11
" Modify: 2018-12-25

" ==============================================================
" nerdtree
" ==============================================================
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" ==============================================================
" airline
" ==============================================================
let g:airline_powerline_fonts = 1
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'default'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''

" ==============================================================
" airline-themes
" ==============================================================
let g:airline_theme='molokai'

" ==============================================================
" ctrlp
" ==============================================================
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

noremap <Leader>b :CtrlPBuffer<CR>
noremap <Leader>m :CtrlPMRU<CR>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](node_modules|incremental|dist)|(\.(git|hg|svn|sass|cache|sass-cache|idea))$',
  \ 'file': '\v\.(exe|so|dll|log|jpg|png|jpeg|map|gif|swf)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }

"custom file listing command
" let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
" let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

let g:ctrlp_buffer_func = { 'enter': 'CtrlPBDelete' }

function! CtrlPBDelete()
  nnoremap <buffer> <silent> <c-@> :call <sid>DeleteMarkedBuffers()<cr>
endfunction

function! s:DeleteMarkedBuffers()
  " list all marked buffers
  let marked = ctrlp#getmarkedlist()

  " the file under the cursor is implicitly marked
  if empty(marked)
    call add(marked, fnamemodify(ctrlp#getcline(), ':p'))
  endif

  " call bdelete on all marked buffers
  for fname in marked
    let bufid = fname =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(fname, '\d\+'))
          \ : fnamemodify(fname[2:], ':p')
    exec "silent! bdelete" bufid
  endfor

  " refresh ctrlp
  exec "normal \<F5>"
endfunction

" ==============================================================
" ag.vim
" ==============================================================
"You can configure ag.vim to always start searching from your project root
let g:ag_working_path_mode="r"
nnoremap <Leader>a :Ag!<Space>

" ==============================================================
" neocomplete
" ==============================================================
let g:neocomplete#enable_at_startup = 1
inoremap <expr> <c-k> pumvisible()?"\<Up>":"\<c-k>"
inoremap <expr> <c-j> pumvisible()?"\<Down>":"\<c-j>"
"Space to select items: 
" inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" ==============================================================
" nerdcommenter 注释
" ==============================================================
let g:NERDCustomDelimiters={
	\ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}

" ==============================================================
" vim-templates
" ==============================================================
let g:templates_no_autocmd = 0

" ==============================================================
" delimitMate
" ==============================================================
let g:delimitMate_expand_cr=2

" ==============================================================
" typescript-vim
" ==============================================================
let g:typescript_indent_disable=1
