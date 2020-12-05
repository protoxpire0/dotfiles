# making nvim default editor
export EDITOR=$(which nvim)

####################### PATHS ###########################

export PATH=~/anaconda3/bin:~/anaconda3/envs/base2/bin:~/opt/X11/bin:/Library/TeX/texbin:~/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export PATH=/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin:$PATH
# export PATH=/Applications/Wine\ Stable.app/Contents/Resources/start/bin:/Applications/Wine\ Stable.app/Contents/Resources/wine/bin:$PATH
export PATH=/Applications/Wine\ Staging.app/Contents/Resources/start/bin:/Applications/Wine\ Staging.app/Contents/Resources/wine/bin:$PATH
export GOOGLE_APPLICATION_CREDENTIALS="/Users/Fahim/yhack19-dd21048972d6.json"

####################### GENERAL TERMINAL STUFF ###########################

# base16 color schemes
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# fzf
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fasd
eval "$(fasd --init auto)"

# compinit
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi
zmodload -i zsh/complist

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell

# easier navigation
# setopt auto_cd # cd by typing directory name if it's not a command

# autocorrect
# setopt correct_all # autocorrect commands

# command autocomplete
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match


####################### ZPLUGIN INSTALLER ###########################

source '/Users/Fahim/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin



####################### ZPLUGINS ###########################

# prompt
zplugin light denysdovhan/spaceship-zsh-theme

# oh-my-zsh plugins and libs
zplugin snippet OMZ::lib/history.zsh
zplugin snippet OMZ::lib/completion.zsh
CASE_SENSITIVE="false"
zplugin snippet OMZ::lib/directories.zsh
zplugin snippet OMZ::lib/git.zsh
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin snippet OMZ::plugins/cp/cp.plugin.zsh
zplugin snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zplugin snippet OMZ::plugins/docker/_docker

# plugins
zplugin light zdharma/fast-syntax-highlighting
zplugin load zdharma/history-search-multi-word
zplugin light supercrabtree/k
zplugin light djui/alias-tips
zplugin light zsh-users/zsh-autosuggestions
zplugin light zsh-users/zsh-completions

####################### PROMPT SETTINGS #########################
export SPACESHIP_CONDA_PREFIX=""
export SPACESHIP_NODE_PREFIX=""

####################### ALIAS ###########################

# dotfiles alias
alias dot="git --git-dir=${HOME}/.dotfiles --work-tree=${HOME}"

# application based aliases
alias sudo="sudo "
alias v="nvim"
alias sv="sudo nvim"
alias chrome="/usr/bin/open -a '/Applications/Google Chrome.app'"
alias safari="/usr/bin/open -a '/Applications/Safari.app'"

# Aliases to make life easier
alias ls="exa"
alias ..="cd .."
alias ...="cd ../.."
alias zconf="nvim ~/.zshrc"
alias vconf="nvim ~/.config/nvim/init.vim"
alias tconf="nvim ~/.tmux.conf"
alias i3conf="nvim ~/.config/i3/config"
alias rmf="rm -rf"

# tmux aliases
alias tmux="TERM=xterm-256color tmux"
alias tn="tmux new -s"
alias ta="tmux attach -t"
alias tl="tmux ls"
alias tk="tmux kill-session -t"

# python aliases
alias py="python"
alias py2="python2"

# django alias
alias pmp="python manage.py"
alias mkmig="makemigrations"
alias mig="migrate"

# plugin related aliases
alias cp="cpv"



####################### PROGRAMS ###########################

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/Fahim/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/Fahim/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/Fahim/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/Fahim/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<



PATH="/Users/Fahim/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/Fahim/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/Fahim/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/Fahim/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/Fahim/perl5"; export PERL_MM_OPT;

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/Fahim/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/Fahim/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/Fahim/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/Fahim/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
