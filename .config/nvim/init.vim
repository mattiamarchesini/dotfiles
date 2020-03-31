"===GENERAL CONFIGURATION===
filetype plugin indent on	"Enable indent plugin
syntax enable	"Enable chosen syntax coloring
"syntax on	"Overwrite chosen syntax coloring
filetype on	"Enable filetype detection

"===PLUGINS===
"Install vim-plug if not already installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
	Plug 'lifepillar/vim-solarized8'
	Plug 'arzg/vim-colors-xcode'
call plug#end()

"===AUTOCOMMANDS===
"autocomplete
au FileType c setl ofu=ccomplete#CompleteCpp
"start in insert mode when new file is open
au BufNewFile * startinsert	
"automatically updates X when Xresources or Xdefaults is saved
au BufwritePost ~/.Xresources,~/.Xdefaults !xrdb %
"automatically updates i3 when .config/i3/config or .config/i3status/config is saved
au BufwritePost ~/.config/i3/config,~/.config/i3status/config,~/.config/i3blocks/config !i3-msg restart

au BufwritePost ~/.config/nvim/init.vim source $MYVIMRC

"autocmd TermOpen * startinsert

au BufHidden * if bufname() == "" && &modified == 0 | bdelete | endif

"===COLORS===
set termguicolors
colorscheme solarized8_flat

"===VARIABLES===
set title			"sets terminal title with file name
set laststatus=2	"makes statusline permanent
"set statusline=%F	" %F displays the full path of the file. You can make more complex statuslines
set incsearch		"Find as you type
set number			"Show line numbers
set relativenumber
"set wildmode=longest,list, "full	"enable autocompletion on file
set wildmenu
set backspace=2		"Use standard backspace behavior
set hlsearch		"Highlight matches in search
set smartindent		"Smart autoindenting on new line
set tabstop=4		"Set Tab width to 4
set shiftwidth=4	"Indents will have width of 4
set softtabstop=4	"Set the number of columns for tab
set spelllang=it	"set spellfile=$HOME/.vim/spell/it.utf-8.add
set path+=**
set splitbelow		"split will open below current buffer
set wildcharm=<tab>	"this way you can use command mode tab-completion in mappings. Alternatively, you can use feedkeys() (See MAPPINGS section)
set cursorline		"Show cursor line
set noerrorbells	"Disable annoying system bells
set novisualbell	"Disable blinking visualbells as well
let term_open=0

"===NETRW CONFIGURATION===
let g:netrw_banner=0	"disable annoying banner
"let g:netrw_liststyle=3	"tree view
let g:netrw_winsize=15

:command! C let @/=""	"Clears search history

"===FUNCTIONS===
" TODO: turn this function into a more generic "SpawnBuffer" function
function! SpawnTerminal()
	let a=bufname("term:*/bin/bash")
	if empty(a)
		6split | term
	else
		exe "6split | buffer " . a 
	endif
endfunction

"===MAPPINGS===
let mapleader = " "
nnoremap Q <Nop>
noremap <C-a> ggVG
cmap w!! w !sudo tee > /dev/null %
nnoremap <leader>n :tabe<Space>
nnoremap <leader>e :edit<Space>
"nnoremap <silent> <leader>f :tabe<CR>:terminal fzf<CR>
nnoremap <leader>f :tabe<CR>:echo system("tree -I bin")<CR>:find<space>
nnoremap <leader>F :echo system("tree -I bin")<CR>:find<space>
nnoremap <leader>E :E<CR>
nnoremap <leader>R :source $MYVIMRC<CR>
nnoremap <silent> <leader>t :call SpawnTerminal()<CR>
"nnoremap <leader><CR> Lzz
""nnoremap <leader><S-CR>k Hzz
nnoremap <leader>o o<ESC>O
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W
nnoremap <leader>k <C-w><Up>
nnoremap <leader>j <C-w><Down>
nnoremap <leader>l <C-w><Right>
nnoremap <leader>h <C-w><Left>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <leader>0 <C-w>=
nnoremap <leader>9 <C-w>\|
nnoremap <leader>s :w<CR>
nnoremap <leader>S :wa<CR>
nnoremap <silent> <leader>q :bwipeout<CR>
nnoremap <leader>Q :qa<CR>
"inoremap <silent> <F2><Space> <C-x><C-]>
tnoremap <Esc> <C-\><C-n>

"without wildcharm, you would have to use something like
"nnoremap , :call feedkeys(":b \<Tab>", 'tn')<CR>
nnoremap <leader>b :vert sb<space><tab>

"This will use the expression register to create a repeatable mapping you can prefix with a number
nnoremap <silent> <Space>u @='kddpk'<CR>
nnoremap <silent> <Space>U @='ddp'<CR>
