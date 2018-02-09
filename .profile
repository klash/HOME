# $FreeBSD: src/share/skel/dot.profile,v 1.19.2.2 2002/07/13 16:29:10 mp Exp $
#
# .profile - Bourne Shell startup script for login shells
#
# see also sh(1), environ(7).
#

set x
# set ENV to a file invoked each time sh is started for interactive use.
ENV=$HOME/.shrc; export ENV
if [ -z "$SHRC" ]; then
    source $ENV
fi

if [ -n "$PS1" ]; then
    source $HOME/.bash-termset
fi

[ -x /usr/games/fortune ] && /usr/games/fortune freebsd-tips
