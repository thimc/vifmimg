#!/usr/bin/env bash
readonly ID_PREVIEW="preview"

#PLAY_GIF="yes"
# By enabling this option the GIF will be animated, by leaving it commented like it
# is now will make the gif preview behave the same was a video preview.

#AUTO_REMOVE="yes"
# By enabling this option the script will remove the preview file after it is drawn
# and by doing so the preview will always be up-to-date with the file.
# This however, requires more CPU and therefore affects the overall performance.

if [ -e "$FIFO_UEBERZUG" ]; then
    if [[ "$1" == "draw" ]]; then
        declare -p -A cmd=([action]=add [identifier]="$ID_PREVIEW"
                           [x]="$2" [y]="$3" [width]="$4" [height]="$5" \
                           [path]="$PWD/$6") \
            > "$FIFO_UEBERZUG"
    elif [[ "$1" == "videopreview" ]]; then
        [[ ! -d "/tmp$PWD/$6/" ]] && mkdir -p "/tmp$PWD/$6/"
        [[ ! -f "/tmp$PWD/$6.png" ]] && ffmpegthumbnailer -i "$PWD/$6" -o "/tmp$PWD/$6.png" -s 0 -q 10
        declare -p -A cmd=([action]=add [identifier]="$ID_PREVIEW"
                           [x]="$2" [y]="$3" [width]="$4" [height]="$5" \
                           [path]="/tmp$PWD/$6.png") \
            > "$FIFO_UEBERZUG"
    elif [[ "$1" == "gifpreview" ]]; then
        [[ ! -d "/tmp$PWD/$6/" ]] && mkdir -p "/tmp$PWD/$6/" && convert -coalesce "$PWD/$6" "/tmp$PWD/$6/$6.png"
        if [[ ! -z "$PLAY_GIF" ]]; then
            for frame in $(ls -1 /tmp$PWD/$6/$6*.png | sort -V); do
               declare -p -A cmd=([action]=add [identifier]="$ID_PREVIEW"
                               [x]="$2" [y]="$3" [width]="$4" [height]="$5" \
                               [path]="$frame") \
                > "$FIFO_UEBERZUG"
                # Sleep between frames to make the animation smooth.
                sleep .07
            done
        else
            declare -p -A cmd=([action]=add [identifier]="$ID_PREVIEW"
                            [x]="$2" [y]="$3" [width]="$4" [height]="$5" \
                                [path]="/tmp$PWD/$6/$6-0.png") \
            > "$FIFO_UEBERZUG"
        fi
    elif [[ "$1" == "epubpreview" ]]; then
        [[ ! -d "/tmp$PWD/$6/" ]] && mkdir -p "/tmp$PWD/$6/"
        [[ ! -f "/tmp$PWD/$6.png" ]] && epub-thumbnailer "$6" "/tmp$PWD/$6.png" 512
        declare -p -A cmd=([action]=add [identifier]="$ID_PREVIEW"
                           [x]="$2" [y]="$3" [width]="$4" [height]="$5" \
                           [path]="/tmp$PWD/$6.png") \
            > "$FIFO_UEBERZUG"
    elif [[ "$1" == "pdfpreview" ]]; then
        [[ ! -d "/tmp$PWD/$6/" ]] && mkdir -p "/tmp$PWD/$6/"
        [[ ! -f "/tmp$PWD/$6.png" ]] && pdftoppm -png -singlefile "$6" "/tmp$PWD/$6"
        declare -p -A cmd=([action]=add [identifier]="$ID_PREVIEW"
                           [x]="$2" [y]="$3" [width]="$4" [height]="$5" \
                           [path]="/tmp$PWD/$6.png") \
            > "$FIFO_UEBERZUG"
    elif [[ "$1" == "clear" ]]; then
        declare -p -A cmd=([action]=remove [identifier]="$ID_PREVIEW") \
            > "$FIFO_UEBERZUG"
        [[ ! -z $AUTO_REMOVE ]] && [[ -f "/tmp$PWD/$6.png" ]] && rm -f "/tmp$PWD/$6.png"
        [[ ! -z $AUTO_REMOVE ]] && [[ -d "/tmp$PWD/$6/" ]] && rm -rf "/tmp$PWD/$6/"

    fi
fi
