#!/bin/zsh

link () {
	echo "$PROMPT This utility will symlink the files in this repo to the home directory"
	echo "$PROMPT Proceed? (y/n)"
	read resp
	# TODO - regex here?
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
		for file in $( ls -A | grep -vE '\.exclude*|\.git$|\.gitignore|.*.md' ) ; do
			ln -sv "$PWD/$file" "$HOME"
		done
		# TODO: source files here?
		echo "$PROMPT Symlinking complete"
	else
		echo "$PROMPT Symlinking cancelled by user"
		return 1
	fi
}
install_tools() {
    	echo "$PROMPT This utility will install useful utilities using apt "
		echo "$PROMPT Proceed? (y/n)"
		read resp
		# TODO - regex here?
		if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
			echo "$PROMPT Installing useful stuff using apt. This may take a while..."
			sh ./apt.exclude.sh
		else
        			echo "$PROMPT Apt installation cancelled by user"
		fi
}
install_oh_my_zsh_plugins() {
    	echo "$PROMPT This utility will install Oh My Zsh Plugins "
		echo "$PROMPT Proceed? (y/n)"
		read resp
		# TODO - regex here?
		if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
			echo "$PROMPT Installing... This may take a while..."
			sh ./.oh-my-zsh.exclude.sh
		else
        			echo "$PROMPT Apt installation cancelled by user"
		fi
}


bootstrap_vim() {
  ./vim.bootstrap.exclude.sh
}


link
install_tools
install_oh_my_zsh_plugins
bootstrap_vim
