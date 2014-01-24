" Basic vim config

" allow backspacing over everything in insert mode
set backspace=2
" disable system bell
set vb
" line numbers
set number
hi LineNr ctermfg=darkgrey ctermbg=black
" encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1
" search
set hlsearch
set incsearch
set showmatch
" select, search and replace"
vmap <Leader>r "sy:%s/<C-R>=substitute(@s,"\n",'\\n','g')<CR>/
" paste
set mouse=a
set pastetoggle=<F12> " sauberes pasten
" spell check
map <F10> :setlocal spell spelllang=de<CR>
map <F9> :setlocal spell spelllang=en<CR>
map <F8> :setlocal nospell<CR>
set spelllang=en
" menu
set wildchar=<Tab> wildmenu wildmode=full
" backup, directories have to exist
"set backup
"set backupdir=~/.backup,.
"set directory=~/.tmp,.

" Vundle install plugins / configuration
" https://github.com/gmarik/vundle
" :BundleInstall(!)    - install (update) bundles
set nocompatible              " required!
filetype off                  " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" FIXME: As vundle is currently hard checked out in this repo, don't use
" bundle to manage it.
" Bundle 'gmarik/vundle'

"Syntax and code checker to follow code styleguide

" indention with 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
"python mode:  https://github.com/klen/python-mode
Bundle 'klen/python-mode'
let g:pymode_folding = 1
" code checking
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'pep257', 'mccabe']
let g:pymode_lint_on_write = 1
let g:pymode_lint_on_fly = 0
"rope code refactoring
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion = 1
" :FixWhiteSpace (rm white space, mind some projects dont like this)
Bundle "bronson/vim-trailing-whitespace"
"salt syntax
Bundle 'saltstack/salt-vim'
"css syntax
Bundle "JulesWang/css.vim"
" sass syntax
Bundle "tpope/vim-haml"
"robottest syntax, enable with # -*- coding: robot -*-
Bundle 'mfukar/robotframework-vim'
"zcml files (zope configuration)
au BufNewFile,BufRead *.zcml set filetype=xml
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
map <leader>f :%! xmllint --format --html - "format html tags, without xmllint just: ggVG =

"Programming helpers

" mark line length
hi ColorColumn ctermbg=darkgrey
autocmd FileType python set colorcolumn=80
"code snippets tab
Bundle "SirVer/ultisnips"
let g:UltiSnipsSnippetsDir="~/.vim/sniplets"
" comment/uncomment <c--><c-->
Bundle 'vim-scripts/tComment'
" git support
Bundle "tpope/vim-fugitive"
Bundle "airblade/vim-gitgutter"
hi SignColumn ctermbg=black guibg=black

"Vim navigation improvments

"Outliner :Voom <filetype>
Bundle "vim-scripts/VOoM"
"File/Code search <c-p>
Bundle 'kien/ctrlp.vim'
Bundle 'tacahiroy/ctrlp-funky'
let g:ctrlp_extensions = ['funky']
noremap <c-b> :CtrlPBuffer<CR> 
noremap <c-c> :CtrlPFunky<CR> 
"Undo
Bundle 'https://github.com/sjl/gundo.vim.git'
noremap <F5> :GundoToggle<CR>
set ul=1000
"Jump to the last known cursor position.
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

"Nice to have

"gpg
"Bundle "jamessan/vim-gnupg"
"show css colors
"Bundle "gorodinskiy/vim-coloresque"
" funky vim status line
"Bundle 'bling/vim-airline'
"set laststatus=2
"set ttimeoutlen=50
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
"let g:bufferline_echo = 0

" highlight current column
" set cuc
" hi CursorColumn ctermbg=darkgrey

"End Vundle Plugin installation
filetype plugin indent on " required!
syntax on " syntax highlighting

