#!/bin/zsh

link () {
	echo "$PROMPT This utility will symlink the files in this repo to the home directory"
	echo "$PROMPT Proceed? (y/n)"
	read resp
	# TODO - regex here?
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
		for file in $( ls -A | grep -vE '\*.exclude*|\.git$|\.gitignore|.*.md|\zshrc.d|\bin|settings.json|sshd.*|*/ps1|.private|VSCode' ) ; do
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
    	echo "$PROMPT This utility will install Zsh Plugins "
		echo "$PROMPT Proceed? (y/n)"
		read resp
		# TODO - regex here?
		if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
			echo "$PROMPT Installing... This may take a while..."
			sh ./zsh.exclude.sh
		else
        			echo "$PROMPT Apt installation cancelled by user"
		fi
}


bootstrap_vim() {
	echo "$PROMPT This will install Vim and VimPlug"
  sh /vim.bootstrap.exclude.sh
}

install_poetry(){
	echo "$PROMPT This will install Poetry"
	echo "$PROMPT Proceed? (y/n)"
	read resp
		if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
					echo "$PROMPT Installing... This may take a while..."
					sh ./poetry.exclude.sh
		else
					echo "$PROMPT Poetry installation cancelled by user"
		fi
}

install_pyenv(){
		echo "$PROMPT This will install Pyenv"
		echo "$PROMPT Proceed? (y/n)"
		read resp
		if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
					echo "$PROMPT Installing... This may take a while..."
					sh ./pyenv.exclude.sh
		else
					echo "$PROMPT Pyenv installation cancelled by user"
		fi
}

link
install_tools
install_oh_my_zsh_plugins
install_pyenv
install_poetry
bootstrap_vim