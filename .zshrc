# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="cobalt2"
#ZSH_THEME="gozilla"
# ZSH_THEME="cobalt2-minimal"
#alias ll="ls -l"
alias mktar='tar -cvf', mkbz2='tar -cvjf', mkgz='tar -cvzf'
alias untar='tar -xvf', unbz2='tar -xvjf', ungz='tar -xvzf'
# alias db="cd ~/Dropbox/"
alias zs="source ~/.zshrc"
alias gum="git pull upstream master"

# Changed your .gitignore _after_ you have added / committed some files?
# run `gri` to untrack anything in your updated .gitignore
# Put this in your .zshrc file
alias gri="git ls-files --ignored --exclude-standard | xargs -0 git rm -r"


# Open all merge conflicts or currently changed files in VS Code
# Switch out `code` for `subl`, `vim`, `atom` or your editor's CLI
alias fix="git diff --name-only | uniq | xargs code"

# alias 🖕😏🖕="git push --force"

alias "git latest"="git for-each-ref --sort=-committerdate refs/heads/"

# I don't think I use this anymore https://github.com/pindexis/qfc
# [[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh"

#  Uses tree - install first:
# apt install tree
function t() {
  # Defaults to 3 levels deep, do more with `t 5` or `t 1`
  # pass additional args after
  tree -I '.git|node_modules|bower_components|.DS_Store' --dirsfirst --filelimit 15 -L ${1:-3} -aC $2
}

# Take a screenshot every n seconds
# Fun for making timelapse gifs later
# run `creep 20` for every 20 seconds
#function creep() {
#    while :; do; echo "📸" $(date +%H:%M:%S); screencapture -x ~/#Screenshots/wes/$(date +%s).png; sleep $1; done
#}

# red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git node npm wd extract z zsh-syntax-highlighting zsh-autosuggestions dirnav fzf fd web-search) 

source $ZSH/oh-my-zsh.sh


function zource(){
  source ~/.zshrc && -
}


# Old habbits die hard
# alias subl="code"


set-window-title() {
  window_title="\e]0;${${PWD/#"$HOME"/~}/Dropbox\//}\a"
  echo -ne "$window_title"
}

function dl() {
  svn checkout ${1:gs/tree\/master/trunk}
}

# function openall() {
#   for folder in */; do code $folder && hyper $folder; done
# }

function openall() {
  for folder in */; do code $folder && gnome-terminal; done
}


PR_TITLEBAR=''
set-window-title
add-zsh-hook precmd set-window-title

# fzf
export FZF_DEFAULT_COMMAND='fdfind --type f --color=never --hidden'
export FZF_DEFAULT_OPTS='--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'batcat --color=always --line-range :50 {}'"

export FZF_ALT_C_COMMAND='fdfind --type d . --color=never --hidden'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"
