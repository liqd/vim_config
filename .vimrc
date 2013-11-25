" Vundle install plugins / configuration
" https://github.com/gmarik/vundle
" :BundleInstall(!)    - install (update) bundles
set nocompatible              " required!
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle
Bundle 'gmarik/vundle'

"Programming Basic
"
"python settings:  https://github.com/klen/python-mode
" code checking (pep8, pyflakes,..); rope code refactoring
Bundle 'klen/python-mode'
" :FixWhiteSpace (rm white space, mind some projects dont like this)
Bundle "bronson/vim-trailing-whitespace"
"salt syntax
Bundle 'saltstack/salt-vim'
"css syntax
Bundle "JulesWang/css.vim"
autocmd FileType css set expandtab tabstop=4 shiftwidth=4 softtabstop=4
" sass syntax
Bundle "tpope/vim-haml"
autocmd FileType sass set expandtab tabstop=4 shiftwidth=4 softtabstop=4
"robottest syntax, enable with # -*- coding: robot -*-
Bundle 'mfukar/robotframework-vim'
" rst/sphinx, https://github.com/Rykka/riv.vim/
Bundle 'Rykka/riv.vim'
autocmd FileType rst set nofoldenable  "disable default folding
au FileType rst nnoremap <leader>h1 ^yypv$r=o<cr><esc> "h1 underline with =====
au FileType rst inoremap <leader>h1 <esc>^yypv$r=o<cr>
au FileType rst nnoremap <leader>h2 ^yypv$r-o<cr><cr><cr><cr><cr><cr><esc>kkkk "h2 underline with -----
au FileType rst inoremap <leader>h2 <esc>^yypv$r-o<cr><cr><cr><cr><cr><cr><esc>kkkki
au FileType rst nnoremap <leader>h3 ^yypv$r+o<cr><cr><cr><cr><cr><cr><esc>kkkk "h3 underline with +++++
au FileType rst inoremap <leader>h3 <esc>^yypv$r+o<cr><cr><cr><cr><cr><cr><esc>kkkki
au FileType rst nnoremap <leader>h4 ^yypv$r~o<cr><cr><cr><cr><cr><cr><esc>kkkk "h4 underline with ~~~~~~~
au FileType rst inoremap <leader>h4 <esc>^yypv$r~o<cr><cr><cr><cr><cr><cr><esc>kkkki
au FileType rst nnoremap <leader>h5 ^yypv$r*o<cr><cr><cr><cr><cr><cr><esc>kkkk "h5 underline with *****
au FileType rst inoremap <leader>h5 <esc>^yypv$r*o<cr><cr><cr><cr><cr><cr><esc>kkkki
"html
map <leader>f :%! xmllint --format --html - " format html tags
autocmd FileType xml set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType xhtml set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType html set expandtab tabstop=2 shiftwidth=2 softtabstop=2

"Nice to have
"
"code snippets tab
Bundle "SirVer/ultisnips"
let g:UltiSnipsSnippetsDir="~/.vim/sniplets"
"show css colors
Bundle "gorodinskiy/vim-coloresque"
"gpg
Bundle "jamessan/vim-gnupg"
"Outliner :Voom <filetype>
Bundle "vim-scripts/VOoM"
"search <c-p>
Bundle 'kien/ctrlp.vim'
Bundle 'tacahiroy/ctrlp-funky'
Bundle 'jasoncodes/ctrlp-modified.vim'
let g:ctrlp_extensions = ['funky']
noremap <c-c> :CtrlPFunky<CR> "code functions
map <c-m> :CtrlPModified<CR> " dirty files in git repro
noremap <c-b> :CtrlPBuffer<CR> " buffer
"graphical undo
Bundle 'https://github.com/sjl/gundo.vim.git'
noremap <F5> :GundoToggle<CR>
set ul=1000
" comment/uncomment <c--><c-->
Bundle 'vim-scripts/tComment'
" nicer vim status line
Bundle 'bling/vim-airline'
set laststatus=2
set ttimeoutlen=50
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0
" git support, merge: http://vimcasts.org/episodes/fugitive-vim-resolving-merge-conflicts-with-vimdiff
Bundle "tpope/vim-fugitive"
Bundle "airblade/vim-gitgutter"
hi SignColumn ctermbg=black guibg=black

filetype plugin indent on " required!

" Additional configuration
"
syntax on " syntax highlighting
set backspace=2 " allow backspacing over everything in insert mode
set t_Co=256 " force colors in your terminal
" highlight current column
set cuc
hi CursorColumn ctermbg=darkgrey
" mark line length
hi ColorColumn ctermbg=darkgrey
autocmd FileType python set colorcolumn=80
"Map leader key
:let mapleader = ","
" show line numbers
set number
hi LineNr ctermfg=darkgrey ctermbg=black
" indent, shift and tabs
set expandtab
set tabstop=4
set smartindent
"search
set hlsearch
set incsearch
set showmatch
"select, search and replace"
vnoremap <leader>r "hy:%s/<C-r>h//gc<left><left><left>
"paste
set mouse= " allow pasting over ssh connections, set mouse=a to enable mouse support
set pastetoggle=<F12> " sauberes pasting
" menu
set wildchar=<Tab> wildmenu wildmode=full
