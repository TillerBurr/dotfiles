#! /bin/zsh
git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
mkdir $ZSH_CUSTOM/plugins/poetry && poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
git clone https://github.com/Cloudstek/zsh-plugin-appup.git "$ZSH_CUSTOM/plugins/appup"
git clone https://github.com/b4b4r07/emoji-cli $ZSH_CUSTOM/plugins/emoji-cli
git clone git://github.com/wting/autojump.git ~/autojump && cd autojump && ./install.py
git clone https://github.com/b4b4r07/enhancd $ZSH_CUSTOM/plugins/enhancd
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
sh -c "curl https://raw.githubusercontent.com/mrowa44/emojify/master/emojify -o /usr/local/bin/emojify && chmod +x /usr/local/bin/emojify"
git clone https://github.com/sroze/docker-compose-zsh-plugin.git $ZSH_CUSTOM/plugins/docker-compose
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && . ~/.fzf/install