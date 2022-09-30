#! /bin/zsh

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
zinit snippet OMZP::supervisor
# zinit snippet OMZP::git
# zinit snippet OMZP::colorize
zinit snippet OMZP::fabric
# zinit snippet OMZP::yarn
zinit snippet OMZP::command-not-found
zinit snippet OMZP::asdf

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust \
	zdharma-continuum/zinit-annex-man


zinit ice depth"1"
zinit light romkatv/powerlevel10k




zinit ice wait="0b" lucid atload'bindkey "$terminfo[kcuu1]" history-substring-search-up; bindkey "$terminfo[kcud1]" history-substring-search-down'
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

zinit ice wait="0b" lucid blockf
zinit light zsh-users/zsh-completions
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '-- %d --'
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:complete:*:options' sort false
zstyle ':fzf-tab:complete:_zlua:*' query-string input
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
zstyle ":completion:*:git-checkout:*" sort false
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zinit ice wait="0b" lucid
zinit light b4b4r07/enhancd
export ENHANCD_FILTER=fzf:fzy:peco

zinit ice from="gh-r" as="command" bpick="*linux_amd64*"
zinit light junegunn/fzf


# FZF-TAB
zinit  wait="1" lucid light-mode for \
	Aloxaf/fzf-tab \
	0b10/cheatsheet \

zinit ice wait="0c" lucid atinit="zpcompinit;zpcdreplay"
zinit light zdharma-continuum/fast-syntax-highlighting

#McFly
zinit ice lucid wait"0b" from"gh-r" as"program" atload'eval "$(mcfly init zsh)"'
zinit light cantino/mcfly

zinit wait lucid atload'_zsh_autosuggest_start' light-mode for \
    zsh-users/zsh-autosuggestions

zinit ice from="gh-r" as="program" pick="usr/bin/bat" bpick="*amd64.deb" atload="alias cat=bat"
zinit light sharkdp/bat



zinit ice wait"2" pick'poetry.zsh' lucid light-mode for \
	sudosubin/zsh-poetry

# zinit wait"2" from"gh-r" lucid light-mode blockf for \
#     thuandt/zsh-pipx

zinit wait lucid id-as=pipx \
  atclone="register-python-argcomplete3 pipx > pipx.gen.zsh" \
  atpull="%atclone" pick="pipx.gen.zsh" for \
      zdharma-continuum/null

zinit wait"0c" lucid light-mode for \
	zpm-zsh/ls \
	zpm-zsh/colors \
	zshzoo/cd-ls \
	zpm-zsh/colorize
	# dbkaplun/smart-cd

zinit ice pick'pdm.plugin.zsh'
zinit light baurt/zsh-pdm

zinit ice blockf
zinit light g-plane/zsh-yarn-autocompletions
### End of Zinit's installer chunk

#####################
# FANCY-CTRL-Z      #
#####################
function fg-fzf() {
	job="$(jobs | fzf -0 -1 | sed -E 's/\[(.+)\].*/\1/')" && echo '' && fg %$job
}

function fancy-ctrl-z () {
	if [[ $#BUFFER -eq 0 ]]; then
		BUFFER=" fg-fzf"
		zle accept-line -w
	else
		zle push-input -w
		zle clear-screen -w
	fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

#####################
# FZF SETTINGS      #
#####################
export FZF_DEFAULT_OPTS="
--ansi
--layout=default
--info=inline
--height=50%
--multi
--preview-window=right:50%
--preview-window=sharp
--preview-window=cycle
--preview '([[ -f {} ]] && (bat --style=numbers --color=always --theme=gruvbox-dark --line-range :500 {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--prompt='λ -> '
--pointer='|>'
--marker='✓'
--bind 'ctrl-e:execute(nvim {} < /dev/tty > /dev/tty 2>&1)' > selected
--bind 'ctrl-v:execute(code {+})'"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
