### VISUAL ###

# Allows iterm to use color schemes.
export CLICOLOR=1
export TERM=xterm-256color

# Color constants.
RED="\033[0;31m"
YELLOW="\033[0;33m"
GREEN="\033[0;32m"
OCHRE="\033[38;5;95m"
BLUE="\033[0;34m"
CYAN="\033[0;36m"
WHITE="\033[0;37m"
RESET="\033[0m"

# Git branch in Prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Prompt
export PS1="\[$RED\]\[$YELLOW\]\W\[$GREEN\]\[$WHITE\]\$(parse_git_branch)\[$GREEN\] \$ \[$CYAN\]"
# Change color of input but reset after ENTER.
trap 'printf "\e[0m" "$_"' DEBUG



### PATHS ###

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Add RVM to PATH for scripting.
export PATH="$PATH:$HOME/.rvm/bin"



### Aliases ###

# terminal
alias ..="cd .."
alias o="open "
alias a="atom ."

# git
alias gaa="git add -A"
alias gs="git status"
alias gl="git log"
alias gcm="git commit -m "
alias gp="git push "

# ruby
# alias bundle="bundle install"

# rails
alias rdbr="rake db:reset"

### OTHER ###

# Removed RVM warning messages.
# 'rvm rvmrc warning ignore allGemfiles'
