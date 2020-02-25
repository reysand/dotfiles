" ==================================
"         Vim Plugin Manager
" ==================================
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ==================================
"          Install Plugins
" ==================================
call plug#begin('~/.vim/plugins')
	Plug 'morhetz/gruvbox'
	Plug 'vim-airline/vim-airline'
	Plug 'scrooloose/syntastic'
	Plug 'pbondoer/vim-42header'
call plug#end()

" ==================================
"  VIM Config File   -Version 0.1.9
" ==================================
set nocompatible		" Disable compatibility mode with vi
set number				" Show line numbers
set relativenumber		" Relative numbering
set noswapfile			" Turn off .swp file
set cursorline			" Show current line
set cursorcolumn		" Show current column
set colorcolumn=81		" Highligh 80 column
set list				" Show whitespaces (see listchars)
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set spell spelllang=en	" Spell check
syntax on				" Turn on syntax highlighting
colorscheme gruvbox		" Change colorscheme

" ==================================
"            File Browser
" ==================================
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_localrmdir='rm -r'
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup FileBrowser
	autocmd!
	autocmd VimEnter * :Vexplore
augroup END

" ==================================
"             Syntastic
" ==================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" ==================================
"              HotKeys
" ==================================
" Switch split
nnoremap <C-K>		<C-W><C-K>
nnoremap <C-J>		<C-W><C-J>
nnoremap <C-H>		<C-W><C-H>
nnoremap <C-L>		<C-W><C-L>
" New split
nnoremap <C-N>		<C-W><C-N>
" Resize split
nnoremap <S-Up>		<C-W><C--> 
nnoremap <S-Down>	<C-W><C-+>
nnoremap <S-Left>	<C-W><C->>
nnoremap <S-Right>	<C-W><C-<>
" Format tabs and spaces in code
nnoremap <F7>		gg=G<C-o><C-o>

" ==================================
"          School 42 Header
" ==================================
augroup 42Header
	autocmd!
	au BufNewFile *.c Stdheader
	au BufNewFile *.h Stdheader
	au BufNewFile Makefile Stdheader
augroup END

" ==================================
"         Scripts Executable
" ==================================
function ModeChange()
	if getline(1) =~ "^#!"
		if getline(1) =~ "bin/"
			silent !chmod a+x <afile>
		endif
	endif
endfunction
au BufWritePost * call ModeChange()"
