" ---------------------------
" LEADER
" ---------------------------
let mapleader = ' '
let maplocalleader = ' '

" ---------------------------
" PLUGINS
" ---------------------------

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins.
call plug#begin()

" Batteries 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Edit
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Text Objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-indent'

" Themes
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'

" Statusline
Plug 'itchyny/lightline.vim'

" Navigate and manipulate files in a tree view.
Plug 'scrooloose/nerdtree'

" Briefly highlight which text was yanked.
Plug 'machakann/vim-highlightedyank'

" Highlight which character to jump to when using horizontal movement keys.
Plug 'unblevable/quick-scope'

" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" Automatically clear search highlights after you move your cursor.
Plug 'haya14busa/is.vim'

" Automatically insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs' 

" Languages
Plug 'sheerun/vim-polyglot'

call plug#end()

" ---------------------------
" THEME
" ---------------------------
colorscheme onedark
" set background=dark

" ---------------------------
" OPTIONS
" ---------------------------
set number relativenumber
set mouse=a
set clipboard+=unnamedplus
set splitbelow splitright
set cursorline
set list lcs=tab:>-,trail:.
set scrolloff=4
set colorcolumn=80
"set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c
set noshowmode
set termguicolors 
set nojoinspaces

set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

set ignorecase smartcase

" Resize
" resize

" ---------------------------
" KEYBINDINGS
" ---------------------------

" Source init.vim
map <leader>sv :source $MYVIMRC<cr>

" Edit init.vim
map <leader>ev :vsplit $MYVIMRC<cr>

" Save file
map <leader>s :write<cr>

" Quit file
map <leader>q :quit<Enter>


" Easy splits navigation 
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Cycle splits on shift+tab
nnoremap <S-Tab> <C-w>w

" " Resize splits
" nnoremap <A-l> <C-w>>
" nnoremap <A-h> <C-w><
" nnoremap <A-j> <C-w>-
" nnoremap <A-k> <C-w>+

" Move lines
nnoremap <A-h> <<
nnoremap <silent> <A-j> :move+<cr>
nnoremap <silent> <A-k> :move-2<cr>
nnoremap <A-l> >>
xnoremap <A-h> <gv
xnoremap <silent> <A-k> :move-2<cr>gv
xnoremap <silent> <A-j> :move'>+<cr>gv
xnoremap <A-l> >gv
xnoremap < <gv
xnoremap > >gv

" Move up/down by visible lines if current line is wrapped
nmap j gj
nmap k gk

" Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <C-j> pumvisible() ? "<C-n>" :"<C-j>"
inoremap <expr> <C-k> pumvisible() ? "<C-p>" : "<C-k>"

" Select the complete menu item like CTRL+y would.
inoremap <expr> <C-l> pumvisible() ? "<C-y>" : "<C-l>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"

" Cancel the complete menu item like CTRL+e would.
inoremap <expr> <C-h> pumvisible() ? "<C-e>" : "<C-h>"

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" Type a replacement term and press . to repeat the replacement again. Useful
" for replacing a few instances of the term (comparable to multiple cursors).
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" -----------------------------------------------------------------------------
" Autocommands
" ---------------------------------------------------------------------------- 

augroup init.vim
  autocmd!
augroup END

" Auto-resize splits when Vim gets resized.
autocmd init.vim VimResized * wincmd =


"............................................................................
" Help file settings
".............................................................................
function! s:file_settings_help()
  if &buftype == 'help'
    " Open help window in new tab
    wincmd T
    " Close help window by pressing q
    nnoremap <buffer> q :q<cr>
  endif
endfunction

autocmd init.vim BufEnter *.txt call s:file_settings_help()



" -----------------------------------------------------------------------------
" Plugins
" ---------------------------------------------------------------------------- 

" .............................................................................
" tpope/vim-commentary
" .............................................................................

xmap co  <Plug>Commentary
nmap co  <Plug>Commentary
omap co  <Plug>Commentary
nmap coo <Plug>CommentaryLine
nmap col <Plug>CommentaryLine


" .............................................................................
" tpope/vim-surround
" .............................................................................

nmap ass  <Plug>Ysurround


" .............................................................................
" junegunn/fzf.vim
" .............................................................................

augroup fzf
	autocmd!
augroup END

" Open selected file in vertical split by default

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-y': {lines -> setreg('+', join(lines, "\n"))}}

" Local
nnoremap <leader>o :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>l :Lines<cr>
nnoremap <leader>w :Windows<cr>
nnoremap <leader>h :Helptags<cr>

" .............................................................................
" itchyny/lightline.vim
" .............................................................................

let g:lightline = { 'colorscheme': 'onedark' }

" .............................................................................
" junegunn/goyo.vim
" .............................................................................

nnoremap <leader>z :Goyo<cr>

" .............................................................................
" junegunn/limelight.vim
" .............................................................................

let g:limelight_conceal_ctermfg=244

augroup limelight
	autocmd!
augroup END

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" .............................................................................
" scrooloose/nerdtree
" .............................................................................

let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeQuitOnOpen=0

" Open nerd tree at the current file or close nerd tree if pressed again.
nnoremap <silent> <expr> <Leader>n g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" .............................................................................
" unblevable/quick-scope
" .............................................................................

" Trigger a highlight in the appropriate direction when pressing these keys.
let g:qs_highlight_on_keys=['f', 'F', 't', 'T']
