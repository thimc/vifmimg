#!/bin/sh

test -z "$(which ueberzug )" &&
	exec vifm "$@" && exit

test -z "$DISPLAY" &&
	exec vifm "$@" && exit

cleanup() {
    rm "$FIFO_UEBERZUG"
    pkill -P $$ >/dev/null
}
! test -d "$HOME/.cache/vifm" && mkdir -p "$HOME/.cache/vifm"
export FIFO_UEBERZUG="$HOME/.cache/vifm/ueberzug-${PPID}"
mkfifo "$FIFO_UEBERZUG"
tail --follow "$FIFO_UEBERZUG" | ueberzug layer --silent --parser bash >/dev/null 2>&1 &
trap cleanup EXIT
vifm "$@"
