call pathogen#infect()
call pathogen#helptags()         
" for Sysntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


:filetype plugin on
:syntax on
:set number
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
colorscheme jellybeans
"autocmd Filetype xml set equalprg='xmllint\ --format\ -'
"au BufNewFile,BufRead,BufEnter   *.xml     set equalprg=!xmllint\ --format\ -
au BufNewFile,BufRead,BufEnter   *.txt     setlocal spell    spelllang=de_de
set laststatus=2
set virtualedit=all
set cpoptions+=$
set wildmenu
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ neocomplete#start_manual_complete()
  function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction"}}}
let g:neocomplete#enable_at_startup = 1
command! JSONPretty %!python -m json.tool
command!  XMLPretty %!xmllint --format -
set rnu
"force Save for root
cmap W!! w !sudo tee % > /dev/null

let mapleader = ","
set autoread " reload file when changes happen in other editors
"set wildmode=list:longest " make TAB behave like in a shell

" make yank copy to the global system clipboard
 set clipboard=unnamed

set history=700
set undolevels=700

"Awesome line number magic
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <Leader>l :call NumberToggle()<cr>
:au FocusLost * set number
:au FocusGained * set relativenumber
autocmd InsertEnter * set number
autocmd InsertLeave * set relativenumber
set relativenumber

vnoremap <Leader>s :sort<CR>

"Custom mappings
" ================
vnoremap < <gv  "better indentation
vnoremap > >gv  "better indentation
map <Leader>a ggVG  "select all
map <Leader>nt :NERDTree

" Fixing the copy & paste madness
" ================================
vmap <C-y> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
"nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
imap <C-v> <Esc><C-v>a

"Wenn i search jub to this Word
set incsearch
set hlsearch

" Backups {{{
set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
"}}}
