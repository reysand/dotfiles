#!/bin/bash
clear
echo "Tasks:"
echo "--Install-Oh-My-Zsh---(...z|Z|zsh....)"
echo "--Autosuggestions-Zsh-(...a|A|auto...)"
echo "--Theme-Zsh-----------(..t|T|theme...)"
echo "--Install-brew--------(...b|B|brew...)"
echo "--Install-fonts-------(..f|F|fonts...)"
echo "--Install-valgrind----(.v|V|valgrind.)"
echo "--Install-gpg---------(...g|G|gpg....)"
echo "--------------------------------------"
echo "--Color-Norminette----(n|N|norminette)"
echo "--Iterm2-italic-------(..i|I|iterm...)"
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
		git clone https://github.com/ohmyzsh/ohmyzsh.git ~/ohmyzsh
		sh ~/ohmyzsh/tools/install.sh
		rm -rf ~/ohmyzsh
		echo "Oh-My-Zsh installed"
		;;
	a|A|auto)
		git clone https://github.com/zsh-users/zsh-autosuggestions\
			~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
		echo "Add to ~/.zshrc 'plugin(zsh-autosuggestions)'"
		;;
	t|T|theme)
		brew install wget
		wget -O $ZSH_CUSTOM/themes/hyperzsh.zsh-theme https://raw.githubusercontent.com/tylerreckart/hyperzsh/master/hyperzsh.zsh-theme
		brew uninstall wget pkg-config $(brew deps wget)
		echo Change in ~/.zshrc to \'ZSH_THEME=\"hyperzsh\"\'
		;;
	b|B|brew)
		curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh
		echo "Brew installed"
		echo "See more:"
		echo " * bat"
		echo " * gh"
		echo " * cmatrix"
		echo " * vifm"
		;;
	f|F|font)
		open https://download.jetbrains.com/fonts/JetBrainsMono-2.001.zip
		sleep 2.1
		pushd ~/Downloads && unzip JetBrainsMono*.zip && mkdir ~/Library/Fonts
		mv -v JetBrainsMono*/ttf/Variable/* ~/Library/Fonts/
		rm -rf JetBrainsMono* && popd && echo "Fonts installed"
		;;
	v|V|valgrind)
		brew tap LouisBrunner/valgrind
		brew install --HEAD LouisBrunner/valgrind/valgrind
		echo "Valgrind installed"
		;;
	g|G|gpg)
		brew install gpg && gpg --full-generate-key
		gpg --list-secret-keys --keyid-format LONG
		git config --global gpg.program gpg
		git config --global commit.gpgsign true
		echo "git config --global user.signingkey <YOUR_SIGNING_KEY)>"
		echo "gpg installed"
		;;
	n|N|norminette)
		sh -c "$(curl -s https://bitbucket.org/liftchampion/colorised-norminette/raw/b4272f2c2dac52b1da721ae658815c43f64e5cb2/colorised_norm_install_installer.sh)"
		rm -rf ~/.*norm_script && echo "Norminette colorised"
		;;
	i|I|iterm)
		{ infocmp -1 xterm-256color ; echo "\tsitm=\\E[3m,\n\tritm=\\E[23m,"; } > /tmp/xterm-256color.terminfo
		tic /tmp/xterm-256color.terminfo
		echo "Italic enabled in iterm"
		;;
	c|C|clean)
		find ~/ -name ".DS_Store" -print -delete 2> /dev/null
		find ~/ -name "**.42_cache_bak**" -print -delete 2> /dev/null
		rm -rf ~/Library/Caches/ && rm -rf ~/.zcompdump* && rm -rf .Trash/*
		rm -rf ~/Library/*42_cache*
		rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage
		rm -rf ~/Library/Application\ Support/Slack/Cache/
		rm -rf ~/Library/Application\ Support/Slack/Code\ Cache/
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
		;;
esac
sleep 4.2
clear
exit 0
