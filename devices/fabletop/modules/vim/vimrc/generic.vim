" Automatically run gofmt when saving go files
au FileType go au BufWritePre <buffer> Fmt

set encoding=utf8
set ffs=unix,dos,mac

set autoindent
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set complete-=i

" move through long lines
map j gj
map k gk

" tabs
set smarttab
set expandtab
set shiftwidth=2
set tabstop=2

set nrformats-=octal
set shiftround

set ttimeout
set ttimeoutlen=50

" searches
set incsearch
set ignorecase
set smartcase
set hlsearch

" <C-L> clears search highlighting
if maparg('<C-L>', 'n') ==# ''
	nnoremap <silent> <C-i> :nohlsearch<CR>
endif

" replace ; with :
nnoremap ; :

" don't put deleted characters on clipboard
noremap  x "_x

" line numbers
set number
set linebreak

"set laststatus=2
set ruler
set showcmd
set wildmenu

" context at top and bottom
set scrolloff=7

set cmdheight=2
set hid

" don't redraw during macros
set lazyredraw

" highlight extra whitespace
highlight ExtraWhiteSpace ctermbg=darkred guibg=darkred
match ExtraWhiteSpace /\s\+\%#\@<!$\| \+\ze\t/
" match ExtraWhiteSpace /\s\+$\| \+\ze\t/
" au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$\| \+\ze\t/
" au InsertLeave * match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd InsertLeave * redraw!
set listchars=tab:»\ ,precedes:═,extends:═
set list
"set showbreak=……

" useful for tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" return to last editing position
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

" \ss will toggle spell checking
map <leader>ss :setlocal spell!<cr>

" move between panes
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

set showcmd

" put gray highlight at column 81
set colorcolumn=81
highlight ColorColumn ctermbg=DarkGray guibg=LightGray


