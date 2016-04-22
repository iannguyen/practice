# Path to your oh-my-zsh installation.
export ZSH=/Users/AIUN-MBP/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)

# ZSH_THEME="mein"
# ZSH_THEME="bullet-train"
# ZSH_THEME="sunrise"
# ZSH_THEME="random"

plugins=(git)


# User configuration

export PATH="$PATH:/Library/Frameworks/Python.framework/Versions/2.7/bin:/Users/AIUN-MBP/.rvm/gems/ruby-2.2.4/bin:/Users/AIUN-MBP/.rvm/gems/ruby-2.2.4@global/bin:/Users/AIUN-MBP/.rvm/rubies/ruby-2.2.4/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/AIUN-MBP/.rvm/bin:/Users/AIUN-MBP/.rvm/bin"

source $ZSH/oh-my-zsh.sh


### Aliases ###

# terminal
alias ..="cd .."
alias o="open"
alias a="atom"

# shell
alias bshcfg="atom ~/.bashrc"
alias zshcfg="atom ~/.zshrc"
alias ohmyzsh="cd ~/.oh-my-zsh"

# git
alias gaa="git add -A"
alias gs="git status"
alias gl="git log"
alias gcm="git commit -m"
alias gp="git push"

# rails
alias rdbr="rake db:reset"
