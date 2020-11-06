" ==============================================================================
"                           Plugin Manager (vim-plug)
" ==============================================================================
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ==============================================================================
"                                  VIM Plugins
" ==============================================================================
call plug#begin('~/.vim/plugins')
	Plug 'morhetz/gruvbox'					" Color scheme
	Plug 'vim-airline/vim-airline'			" Status line
	Plug 'vim-airline/vim-airline-themes'	" Status line themes
	Plug 'preservim/nerdtree'				" File system explorer
	Plug 'pbondoer/vim-42header'			" School 42 header
	Plug 'cohama/lexima.vim'				" Auto close parentheses
	Plug 'bfrg/vim-cpp-modern'				" C/C++ syntax
	Plug 'airblade/vim-gitgutter'			" Vim diff
call plug#end()

" ==============================================================================
"                             General Configuration
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
"                                  VIM Mapping
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
augroup spell_colors						" Change errors highlight
	autocmd!
	autocmd ColorScheme * highlight SpellBad
		\ cterm=Underline,bold
		\ ctermfg=Red
augroup END
colorscheme gruvbox							" Setup color scheme

" ==============================================================================
"                                  Git Gutter
" ==============================================================================
let g:gitgutter_max_signs=-1				" Removed limit of count signs
let g:gitgutter_sign_added='+'				" Changed sign_added
let g:gitgutter_sign_modified='>'			" Changed sign_modified
let g:gitgutter_sign_removed='-'			" Changed sign_removed
let g:gitgutter_sign_removed_first_line='^'	" Changed sign_removed_first_line
let g:gitgutter_sign_modified_removed='<'	" Changed sign_modified_removed
set signcolumn=yes							" Always have the sign column
set updatetime=250							" Update sign column
											" Change background to sign column
highlight SignColumn ctermbg=bg
											" Change colors to sign_added
highlight GitGutterAdd ctermfg=2
											" Change colors to sign_modified
highlight GitGutterChange ctermfg=3
											" Change colors to sign_removed
highlight GitGutterDelete ctermfg=1
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}				" Added git status to status line

" ==============================================================================
"                                  C/C++ Syntax
" ==============================================================================
let g:cpp_member_highlight=1				" Highlight structure member

" ==============================================================================
"                                  Status Line
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
"                             Auto close parentheses
" ==============================================================================
let g:lexima_enable_basic_rules = 1			" Basic rules
let g:lexima_enable_newline_rules = 1		" New line rules

" ==============================================================================
"                                   42 Header
" ==============================================================================
augroup School42_Header						" Add header to new files
	autocmd!
	autocmd BufNewFile *.{c,h},Makefile Stdheader
augroup END

" ==============================================================================
"                               Scripts Executable
" ==============================================================================
function ChangeMode()						" Auto change of script permissions
	if getline(1) =~ "^#!"
		if getline(1) =~ "bin/"
			silent !chmod a+x <afile>
		endif
	endif
endfunction
autocmd BufWritePost * call ChangeMode()
