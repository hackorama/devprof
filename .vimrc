"
" hackorama vim profile | https://github.com/hackorama/devprof
"

" escape the mac touch bar

inoremap jj <esc>
inoremap JJ <esc>

" colors

" wget https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim -O ~/.vim/colors/monokai.vim
colorscheme monokai

" syntax

syntax enable
let java_highlight_functions = 1
let java_highlight_all = 1

" all space no tab

set tabstop=4
set softtabstop=4
set expandtab
:highlight ExtraWhitespace ctermbg=blue guibg=blue
:match ExtraWhitespace /\s\+$/

" ux

set number
set showcmd
set cursorline
set wildmenu
set showmatch
set mouse-=a " mouse cut and paste
set tw=0     " don't wrap at 80

" status line

set laststatus=2

hi StatusLine ctermbg=black

set statusline=▶          " emoji or unicode symbol
set statusline+=\         " space
set statusline+=%t        " filename
set statusline+=\         " space
set statusline+=%#error#  " color on
set statusline+=%m        " modified flag
set statusline+=%#todo#   " color on
set statusline+=%r        " read only flag
set statusline+=%*        " color off

set statusline+=%=        " left/right separator

set statusline+=%c,       " cursor column
set statusline+=%l/%L     " cursor line/total lines
set statusline+=\ %P      " percent through file

" search

set incsearch
set hlsearch

" backup

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" block cursor for normal mode and line cursor for insert mode

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" spelling

setlocal spell spelllang=en_us " enabled by default for all
hi SpellBad ctermfg=009 ctermbg=000 guifg=#ff0000 guibg=#ffffff gui=none
augroup sourceSpell            " disable for source code
    autocmd!
    autocmd FileType c setlocal nospell
    autocmd FileType cpp setlocal nospell
    autocmd FileType go setlocal nospell
    autocmd FileType java setlocal nospell
    autocmd FileType python setlocal nospell
augroup END
