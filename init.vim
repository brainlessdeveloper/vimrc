call plug#begin()

Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer --racer-completer --clang-completer' }
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'Shougo/neoinclude.vim'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'sjl/gundo.vim'
Plug 'rhysd/rust-doc.vim'
Plug 'junegunn/vim-peekaboo'

" Language-specific
Plug 'pangloss/vim-javascript'
Plug 'ap/vim-css-color'
Plug 'mxw/vim-jsx'
Plug 'matchit.zip'
Plug 'JulesWang/css.vim'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'neovimhaskell/haskell-vim'
Plug 'rust-lang/rust.vim'
Plug 'mattn/emmet-vim'
Plug 'quabug/vim-gdscript'

call plug#end()

" Theming
syntax enable
set termguicolors
set laststatus=2
colorscheme base16-onedark
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic gui=italic
hi link xmlEndTag xmlTag
set encoding=utf-8
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
autocmd FileType nerdtree setlocal nolist

" Configuration
set number
filetype plugin indent on
set showcmd
set list
set breakindent
set textwidth=0
set linebreak
set tabstop=4
set shiftwidth=2
set hlsearch
set scrolloff=6
set expandtab
set lazyredraw
set incsearch
set showmatch
set wildmenu
set cursorline
set ignorecase smartcase
set exrc
set secure
let g:netrw_disthistmax=0
set backupcopy=yes
set autoread
set autoindent
set smartindent
set wrap
set splitright
set splitbelow

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Plugin-specific configuration
" Emmet for vim - jsx specifics
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\    'extends' : 'jsx',
\    'quote_char': "'",
\  },
\}
" Async Linting Engine
let g:ale_sign_column_always=1
let g:ale_sign_error = '*>'
let g:ale_sign_warning = '*>'
" FZF - Use silversearcher, also ignores .gitignored files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
set grepprg=ag\ --vimgrep
" Padding for NERDCommenter
let NERDSpaceDelims=1
" Navigate between linter errors with CTRL+[jk]
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" YouCompleteMe
set completeopt-=preview
" Markdown preview
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1
" Required for YCM installation
let g:ycm_server_python_interpreter = '/usr/bin/python'
" Godot script config
autocmd Filetype gdscript setlocal noexpandtab nolisp autoindent shiftwidth=4

" JavaScript
let g:jsx_ext_required = 0

" Keybindings
let mapleader=" "

nnoremap <Leader>git :Gstatus<CR>
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>F :Ag 
nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <Leader>T :NERDTreeFind<CR>
nnoremap <Leader>u :GundoToggle<CR>
nnoremap <Leader>wq :wq!<CR>
nnoremap <Leader>q :q<CR>
nnoremap <leader>w :w!<CR>
nnoremap j gj
nnoremap k gk
map 0 ^
command W w !sudo tee % > /dev/null
" Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
" Press F7 to run JS code on node and show it in a buffer
map <F7> :call Run() <cr>
function Run()
  exec "! node %"
endfunction
" GD (uppercase) from an imported variable to go to the file that defines it
nnoremap GF gd/'<CR>:noh<CR>gf
" <Ctrl-l> redraws the screen and removes any search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>
" <Ctrl-u> and <Ctrl-d> also center the screen
nnoremap <silent> <C-u> <C-u>zz
nnoremap <silent> <C-d> <C-d>zz
" Comfy mappings for buffer-previous and buffer-next
nnoremap <silent> <Leader>> :bn<CR>
nnoremap <silent> <Leader>< :bp<CR>
