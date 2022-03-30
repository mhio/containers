export EXTENDED_HISTORY=true
export SAVEHIST=10000
export HIST_IGNORE_SPACE=true

# setup for prompt
autoload colors && colors
#autoload -Uz add-zsh-hook vcs_info 
#add-zsh-hook precmd vcs_info
#precmd() {
#    vcs_info
#}
setopt prompt_subst
#zstyle ':vcs_info:*' enable git
#zstyle ':vcs_info:*' formats ' %s|%F{red}%b%f' # git(main)
NEWLINE=$'\n'
setopt prompt_subst
#PROMPT='${NEWLINE}# 20%D %T %F{green}%n%f@%F{blue}%m%f:%d ${NEWLINE}#${vcs_info_msg_0_}%F{yellow}%#%f '
PROMPT='${NEWLINE}# 20%D %T %F{green}%n%f@%F{blue}%m%f:%d ${NEWLINE}#C%F{yellow}%#%f '

