#!/bin/bash
if [[ $1 == "42" ]]; then
	mv ~/.vim/plugins/vim-42header/after/plugin/42header.vim ~/.vim/plugins/vim-42header/after/plugin/42header.vim.rs
	mv ~/.vim/plugins/vim-42header/after/plugin/42header.vim.42 ~/.vim/plugins/vim-42header/after/plugin/42header.vim
elif [[ $1 == "rs" ]]; then
	mv ~/.vim/plugins/vim-42header/after/plugin/42header.vim ~/.vim/plugins/vim-42header/after/plugin/42header.vim.42
	mv ~/.vim/plugins/vim-42header/after/plugin/42header.vim.rs ~/.vim/plugins/vim-42header/after/plugin/42header.vim
else
	ls ~/.vim/plugins/vim-42header/after/plugin/*
fi
