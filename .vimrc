" ==============================================================================
"                           Plugin Manager  (vim-plug)
" ==============================================================================
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ==============================================================================
"                                  VIM  Plugins
" ==============================================================================
call plug#begin('~/.vim/plugins')
	Plug 'morhetz/gruvbox'					" Color scheme
	Plug 'vim-airline/vim-airline'			" Status line
	Plug 'vim-airline/vim-airline-themes'	" Status line themes
	Plug 'preservim/nerdtree'				" File system explorer
	Plug 'scrooloose/syntastic'				" Syntax check
	Plug 'valloric/youcompleteme'			" Code-completion
	Plug 'pbondoer/vim-42header'			" School 42 header
call plug#end()

" ==============================================================================
"                             General  Configuration
" ==============================================================================
set cursorline								" Highlight current line
set cursorcolumn							" Highlight current column
set colorcolumn=81							" Highlight 81 column
set list									" Show hidden characters
set listchars=tab:»\ |						" Set tab character
set listchars+=extends:›					" Set extends character
set listchars+=precedes:‹					" Set precedes character
set listchars+=nbsp:·						" Set non-breakable space character
set listchars+=trail:·						" Set trailing space character
set noswapfile								" Turn off .swp file
set number									" Display line numbering
set relativenumber							" Display relative line numbering
set spell spelllang=en_us					" Set spell check
set tabstop=4								" Column count in tab character
syntax on									" Syntax highlighting

" ==============================================================================
"                                  VIM  Mapping
" ==============================================================================
											" Switch to left split
map <C-H>		<C-W><C-H>
											" Switch to lower split
map <C-J>		<C-W><C-J>
											" Switch to upper split
map <C-K>		<C-W><C-K>
											" Switch to right split
map <C-L>		<C-W><C-L>
											" Decrease weight
map <S-Left>	<C-W><C-<>
											" Decrease height
map <S-Down>	<C-W><C-+>
											" Increase height
map <S-Up>		<C-W><C-->
											" Increase width
map <S-Right>	<C-W><C->>
											" Reformat line indents
map <F7>		gg=G
											" Open NERDTree
map <F8>		:NERDTreeToggle<CR>

" ==============================================================================
"                                  Color Scheme
" ==============================================================================
let g:gruvbox_contrast_dark='hard'			" Dark mode contrast
let g:gruvbox_italic=1						" Enable italic text
let g:gruvbox_italicize_strings=1			" Enable italic for comments
set background=dark							" Change background color
augroup spell_colors
	autocmd!
	autocmd ColorScheme * highlight SpellBad
		\ cterm=Underline,bold
		\ ctermfg=Red
augroup END
colorscheme gruvbox							" Setup color scheme


" ==============================================================================
"                                  Status  Line
" ==============================================================================
let g:airline_theme='deus'					" Setup Status line theme
let g:airline#extensions#tabline#enabled=1	" Enable tab line

" ==============================================================================
"                              File System Explorer
" ==============================================================================
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) &&
	\ !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene |
	\ exe 'cd '.argv()[0] | endif

" ==============================================================================
"                                  Syntax Check
" ==============================================================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ==============================================================================
"                                School 42 Header
" ==============================================================================
augroup School42_Header
	autocmd!
	autocmd BufNewFile * Stdheader | endif
augroup END

" ==============================================================================
"                               Scripts Executable
" ==============================================================================
function ChangeMode()
	if getline(1) =~ "^#!"
		if getline(1) =~ "bin/"
			silent !chmod a+x <afile>
		endif
	endif
endfunction
au BufWritePost * call ChangeMode()
