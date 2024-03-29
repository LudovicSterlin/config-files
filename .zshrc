# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/local/opt/python@3.9/libexec/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/ludovic/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster-spotify"

DEFAULT_USER=ludovic

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vscode zsh-syntax-highlighting zsh-autosuggestions macos zsh-shift-select)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ---------------------------------------------------------------------------- #
#                                    ALIASES                                   #
# ---------------------------------------------------------------------------- #
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ---------------------------------------------------------------------------- #
#                                      Git                                     #
# ---------------------------------------------------------------------------- #
# Override gcm="git checkout $(git_main_branch)"
alias gcm="git checkout $(git_main_branch) && git pull"
## Override gcd="git checkout $(git_develop_branch)"
alias gcd="git checkout $(git_develop_branch) && git pull"
## Stash
alias gstm="git stash push -m"
alias gstwip="git stash push -m \"wip\""
# -------------- function gcrbm: git checkout rebase main_branch ------------- #
# git checkout and rebase a branch on git_main_branch
# then checkout again git_main_branch
gcrbm() {
    git checkout $1 && git rebase $(git_main_branch) && git checkout $(git_main_branch)
}
gcrbmf() {
    git checkout $1 && git rebase $(git_main_branch) && git push --force-with-lease && git checkout $(git_main_branch)
}
# our handler that returns choices by populating Bash array COMPREPLY
# (filtered by the currently entered word ($2) via compgen builtin)
_gcrbm_complete() {
    branches=$(git branch -l | cut -c3-)
    COMPREPLY=($(compgen -W "$branches" -- "$2"))
}
# we now register our handler to provide completion hints for the "gcrbm" command
complete -F _gcrbm_complete gcrbm;
complete -F _gcrbm_complete gcrbmf;
# ---------------------------------------------------------------------------- #

# ----------------------------------- Conda ---------------------------------- #
alias cact="conda activate"
alias cdact="conda deactivate"
# ----------------------------------- Mongo ---------------------------------- #
alias mgstart="brew services start mongodb-community@5.0"
alias mgstop="brew services stop mongodb-community@5.0"
alias mgstatus="ps aux | grep -v grep | grep mongod"
# ---------------------------------- Docker ---------------------------------- #
alias dcup="docker-compose up"
alias dcupd="docker-compose up -d"
alias doc="docker-compose"
# ----------------------------------- lerna ---------------------------------- #
alias lrun="lerna bootstrap && lerna run dev --stream"
# --------------------------------- Prettier --------------------------------- #
alias ptt="npx prettier --write"
# -------------------------------- Navigation -------------------------------- #
alias hhome="cd /Users/ludovic/HINFACT/"
alias proddev="\"/Users/ludovic/Library/CloudStorage/OneDrive-SharedLibraries-HINFACT/Hinfact - Interne - Knowledge Management/Product Development\""
# ----------------------------------- java ----------------------------------- #
alias tcprun="java -classpath bin/ SendOnTCP"
# ------------------------------------ Fun ----------------------------------- #
alias matrix='LC_ALL=C tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;33" grep --color "[^ ]"'
# ---------------------------------------------------------------------------- #

# ---------------------------------------------------------------------------- #
#                                     Eval                                     #
# ---------------------------------------------------------------------------- #
# Jump
eval "$(jump shell)"
# The Fuck
eval $(thefuck --alias ff)

# Avoid chocoblast
# And rickroll the chocobalster for fun. source: https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh
hf() {
    if [[ $@ == "choco" ]]; then
        command ~/roll.sh && echo "Got you 😎"
    else
        command hf "$@"
    fi
}
# 😎
# ---------------------------------------------------------------------------- #


# ---------------------------------------------------------------------------- #
#                          DON'T EDIT BELOW THIS LINE                          #
# ---------------------------------------------------------------------------- #
# ------------- Automatically added lines, by installed programs ------------- #

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
cdact

# brew use node@16 as default
export PATH="/usr/local/opt/node@16/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/ludovic/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
