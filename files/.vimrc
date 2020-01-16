" Enable pathogen
filetype off
call pathogen#infect()

" Make helptags for current plugin bundle
:Helptags

" Set ctags path
:set tags=tags;./tags,./gems.tags;

" Remove trailing whitespace on write
autocmd BufWritePre * :%s/\s\+$//e

" Use system clipboard by default (OSX/Windows, linux untested)
set clipboard^=unnamed

" Use nifty vim stuff
set nocompatible

" For protection
set modelines=0

" Key timeout length
set timeout timeoutlen=5000 ttimeoutlen=100

" Filetype-specific indentation
filetype plugin indent on

" Recognize .erb files as eruby
autocmd BufRead,BufNewFile *.erb set filetype=eruby.html

" Disable vim autocommenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Set indentation for javascript to two spaces
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

" Disable vim parenthesis highlighting
let g:loaded_matchparen=1

" Basic styles: line numbers, syntax highlighting, 256 colors for colorschemes to work
set nu
syntax on
set t_Co=256
set cursorline
set smartindent

" Only show cursorline in current window
augroup cline
  au!
  au WinLeave * set nocursorline
  au WinEnter * set cursorline
  au InsertEnter * set nocursorline
  au InsertLeave * set cursorline
augroup END

" Statusbar
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" colorscheme lucius
" colorscheme Tomorrow-Night-Eighties
colorscheme zenburn

" tab completion
set wildmode=longest,list,full
set wildmenu

" Longer history
set history=1000

" Tabs set @ 2, use spaces instead of tabs
set ts=2 sts=2 sw=2 expandtab
" filetype specific tabs
" au BufEnter *.js setlocal ts=4 sts=4 sw=4 expandtab

" Delete previous word with Ctrl-Backspace
imap <C-BS> <C-W>

" Move between windows with ctrl + HJKL to switch windows
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" Open a vertical split with ctrl-f
nnoremap <C-X> :vertical wincmd f<CR>

" Move up/down wrapped lines
nnoremap j gj
nnoremap k gk

" Disable error keys
map <Left> :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up> :echo "no!"<cr>
map <Down> :echo "no!"<cr>

" Map invisibles to leader-l
nmap <leader>l :set list!<CR>

" Use textmate symbols for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" set netrw to tree mode
let g:netrw_liststyle=3
" set netrw directory tree to 10 pct
let g:netrw_winsize=20
" set netrw to open to the right of browser window
let g:netrw_browse_split=4
let g:netrw_altv=1

" Fix delete key
set backspace=indent,eol,start

" Set tabstop, tabstop, softtabstop and shiftwidth to the same value (stolen from vimcast #2)
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

" ansible
let g:ansible_unindent_after_newline = 1
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'
let g:ansible_extra_keywords_highlight = 1

" Settings for crontab
autocmd filetype crontab setlocal nobackup nowritebackup

" Use old regex engine, new one is slow on large ruby files
set re=1

" Settings for go:
" Open quickfix windows across bottom of all existing windows
au FileType qf wincmd J
