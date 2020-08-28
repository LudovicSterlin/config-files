# Override gcd="git checkout develop"
alias gcd="git checkout dev && git pull"
alias gstm="git stash push -m"
alias gstwip="git stash push -m \"wip\""

# Mongo aliases
alias mgstart="brew services start mongodb-community@4.2"
alias mgstop="brew services stop mongodb-community@4.2"
alias mgstatus="ps aux | grep -v grep | grep mongod"

# Navigation aliases
alias hdev="cd /Users/ludovicsterlin/Hinfact/dev"

# Dev aliases
alias tcprun="java -classpath bin/ SendOnTCP"

alias matrix='LC_ALL=C tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;33" grep --color "[^ ]"'
