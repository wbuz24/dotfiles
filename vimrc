
" don't highlight the last search upon startup
set viminfo="h"

" Do C-style auto indentation on C/C++/Perl files only :
:filetype on
:autocmd FileType c,cpp,perl :set cindent

" stop Vim from beeping all the time
set vb
set shiftwidth=2

" uncomment to insert spaces instead of a tab when tab is pressed
"set expandtab

set ruler
set background=dark

"Tell you if you are in insert mode
set showmode

"ignore case when doing searches
set ignorecase
set smartcase

"tell you how many lines have been changed
set report=0

set scrolloff=5
set wildmode=longest,list



set showtabline=2
  :colorscheme elflord        " awesome colorscheme
         syntax enable           " enable syntax processing
"
        "SPACES and TABS
        set tabstop=2       " number of visual spaces per TAB
        set softtabstop=2   " number of spaces in tab when editing
        set expandtab       " tabs are spaces
"
        "UI CONFIG
        set number              " show line numbers
        set showcmd             " show command in bottom bar
"        set cursorline          " highlight current line
        filetype indent on      " load filetype-specific indent files
        set wildmenu            " visual autocomplete for command menu
        set lazyredraw          " redraw only when we need to.
        set showmatch           " highlight matching [{()}]
        set vb                  " turns on visual bell
"
        "SEARCHING
        set incsearch           " search as characters are entered
        set hlsearch            " highlight matches
"
        "FOLDING
"        set foldenable          " enable folding
"        set foldlevelstart=0   " open most folds by default
"        set foldnestmax=10      " 10 nested fold max
        " space open/closes folds
"        nnoremap <space> za
"         set foldmethod=indent   " fold based on indent level
"
        "AUTOGROUPS
        augroup configgroup
        	autocmd!
	        autocmd VimEnter * highlight clear SignColumn
	        autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
		        \:call <SID>StripTrailingWhitespaces()
            autocmd FileType java setlocal noexpandtab
	        autocmd FileType java setlocal list
	        autocmd FileType java setlocal listchars=tab:+\ ,eol:-
	        autocmd FileType java setlocal formatprg=par\ -w80\ -T4
	        autocmd FileType php setlocal expandtab
	        autocmd FileType php setlocal list
	        autocmd FileType php setlocal listchars=tab:+\ ,eol:-
	        autocmd FileType php setlocal formatprg=par\ -w80\ -T4
	        autocmd FileType ruby setlocal tabstop=2
	        autocmd FileType ruby setlocal shiftwidth=2
	        autocmd FileType ruby setlocal softtabstop=2
	        autocmd FileType ruby setlocal commentstring=#\ %s
	        autocmd FileType python setlocal commentstring=#\ %s
	        autocmd BufEnter *.cls setlocal filetype=java
	        autocmd BufEnter *.zsh-theme setlocal filetype=zsh
	        autocmd BufEnter Makefile setlocal noexpandtab
	        autocmd BufEnter *.sh setlocal tabstop=2
	        autocmd BufEnter *.sh setlocal shiftwidth=2
	        autocmd BufEnter *.sh setlocal softtabstop=2
        augroup END

        "CUSTOM FUNCTIONS
        " toggle between number and relativenumber
        function! ToggleNumber()
        	if(&relativenumber == 1)
		        set norelativenumber
		        set number
	        else
		        set relativenumber
	        endif
        endfunc
        " strips trailing whitespace at the end of files. this
        " is called on buffer write in the autogroup above.
        function! <SID>StripTrailingWhitespaces()
	        " save last search & cursor position
	        let _s=@/
	        let l = line(".")
	        let c = col(".")
	        %s/\s\+$//e
	        let @/=_s
            call cursor(l, c)
        endfunction

