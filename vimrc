" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" line numbers "
set number

" syntax highlighting "
syntax on

" Enable type file detection. Vim will be able to try to detect the type of file in use. "
filetype on

" While searching though a file incrementally highlight matching characters as you type. "
set incsearch

" set shift width "
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set tabstop=2

" set highlighting during search "
set hlsearch

" matching words during search "
set showmatch

" Set status bar "

set laststatus=2

" Build status line "
" default the statusline to green when entering Vim
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15


set statusline=
set statusline+=%{StatuslineGit()}
set statusline+=%=
set statusline+=%m
set statusline+=\ %L
set statusline+=\ %y

" Display the git branch, or an empty string if none "
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

