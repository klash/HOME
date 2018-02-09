# set ENV to a file invoked each time sh is started for interactive use.
ENV=$HOME/.shrc; export ENV
if [ -z "$SHRC" ]; then
    source $ENV
fi

if [ -n "$PS1" ]; then
    source ${HOME}/.bash-termset
fi
