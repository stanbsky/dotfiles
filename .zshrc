
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

source $HOME/.aliases
export GPG_TTY=$(tty)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/stanbsky/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/stanbsky/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/stanbsky/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/stanbsky/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

[ -f "/Users/stanbsky/.ghcup/env" ] && source "/Users/stanbsky/.ghcup/env" # ghcup-env

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if command -v rg &> /dev/null
then
    export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
fi

neovim() {
    if [ $TERM_PROGRAM="iTerm.app" ]
    then
      OLDPROFILE=$ITERM_PROFILE
      echo -ne "\033]1337;SetProfile=vimcolors\a"
      /opt/homebrew/bin/nvim "$@"
      echo -ne "\033]1337;SetProfile=$OLDPROFILE\a"
    else
      /opt/homebrew/bin/nvim "$@"
    fi
}

dtf () {
  git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" "$@"
}
