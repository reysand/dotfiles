#!/bin/sh
clear
echo "Tasks:"
echo "--Install-Oh-My-Zsh---(...z|Z|zsh....)"
echo "--Install-brew--------(...b|B|brew...)"
echo "--Install-fonts-------(..f|F|fonts...)"
echo "--Install-valgrind----(.v|V|valgrind.)"
echo "--------------------------------------"
echo "--Color-Norminette----(n|N|norminette)"
echo "--Update-vim-plugins--(.p|P|plugins..)"
echo "--------------------------------------"
echo "--Clean---------------(..c|C|clean...)"
echo "--Memory--------------(..m|M|memory..)"
echo "--Reset---------------(..r|R|reset...)"
echo "--------------------------------------"
echo "--Exit----------------(...e|E|exit...)"
echo "======================================"

if [[ $1 == "" ]]; then
	read -p "Your choose:-" item
elif [[ $1 && $2 ]]; then
	echo "usage: ./task.sh"
	echo "       ./task.sh <argument>"
	exit 0
else
	item="$1"
	echo "Your choose:-$1"
fi

case "$item" in
	z|Z|zsh)
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
		echo "Oh-My-Zsh installed"
		;;
	b|B|brew)
		rm -rf $HOME/.brew
		git clone --depth=1 https://github.com/Homebrew/brew $HOME/.brew
		echo 'export PATH=$HOME/.brew/bin:$PATH' >> $HOME/.zshrc
		source $HOME/.zshrc && brew update && echo "Brew installed"
		;;
	f|F|font)
		open https://download.jetbrains.com/fonts/JetBrainsMono-1.0.3.zip
		sleep 2.1
		pushd ~/Downloads && unzip JetBrainsMono*.zip && mkdir ~/Library/Fonts
		mv -v JetBrainsMono*/ttf/* ~/Library/Fonts/ && rm -rf JetBrainsMono*
		popd && echo "Fonts installed"
		;;
	v|V|valgrind)
		brew update && brew install valgrind
		alias valgrind="~/.brew/bin/valgrind" && echo "Valgrind installed"
		;;
	n|N|norminette)
		sh -c "$(curl -s https://bitbucket.org/liftchampion/colorised-norminette/raw/b4272f2c2dac52b1da721ae658815c43f64e5cb2/colorised_norm_install_installer.sh)"
		rm -rf ~/.*norm_script && echo "Norminette colorised"
		;;
	p|P|pligins)
		echo :PlugInstall | vim && echo :PlugUpgrade | vim
		echo :PlugUpdate | vim && echo :PlugClean | vim
		;;
	c|C|clean)
		find ~/ -name ".DS_Store" -print -delete 2> /dev/null
		find ~/ -name "**.42_cache_bak**" -print -delete 2> /dev/null
		rm -rf ~/Library/Caches/* && rm -rf ~/.zcompdump* && rm -rf .Trash/*
		brew cleanup && echo "Clean Complete"
		;;
	m|M|memory)
		echo "Current memory:" && du -sh ~/*
		;;
	r|R|reset)
		read -p "Are you sure? It's delete all your data!!! (Y/n): " ans
		case "$ans" in
			y|Y|yes)
				touch ~/.reset && echo "Reset Complete"
				;;
			n|N|no)
				echo "Full reset canceled"
				;;
		esac
		read -p "Clean Library? (Y/n): " reans
		case "$reans" in
			y|Y|yes)
				touch ~/.reset_library && echo "Library reset completed"
				;;
			n|N|no)
				echo "Library reset canceled"
				;;
		esac
		;;
	e|E|exit)
		echo "Exit" && clear
		exit 1
		;;
	*)
		echo "Wrong argument: $1"
		sleep 1
		sh ~/task.sh
esac
sleep 4.2
clear
exit 0
