# Image previews using Überzug for vifm (vi file manager)

![image](https://raw.githubusercontent.com/cirala/vifmimg/master/screenshot.png)

This script is used along [vifm](https://github.com/vifm/vifm) to generate image previews for various file types in vifm.


If you want image preview support for [lf](https://github.com/gokcehan/lf) check out [cirala/lfimg](https://github.com/cirala/lfimg).


The script is currently able to handle the following formats:
* Video
* eBook
* Images
* Audio files
* Fonts

All previews are cached (except for regular images) and stored in your **~/.cache/vifm/** folder.


## Installation
1. Copy the **vifmimg** and **vifmrun** scripts to a folder that is included in your $PATH
variable for easy access to the files.

2. Edit your **~/.config/vifm/vifmrc** file and add fileviewer properties like so:
```
    fileviewer *.pdf
        \ vifmimg pdf %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

    fileviewer *.epub
        \ vifmimg epub %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

    fileviewer <video/*>
        \ vifmimg video %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

    fileviewer <image/*>
        \ vifmimg draw %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

    fileviewer <audio/*>
        \ vifmimg audio %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

    fileviewer <font/*>
        \ vifmimg font %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

```

3. In order to launch vifm with image preview support from now on, you will need to use the supplied **vifmrun** script.

I recommend that you make an alias in your shell that points to vifm.


## Prerequisites
* [Überzug](https://github.com/seebye/ueberzug) and [Vifm](https://github.com/vifm/vifm) (isn't this obvious?)
* [ffmpegthumbnailer](https://github.com/dirkvdb/ffmpegthumbnailer)
* ImageMagick
* pdftoppm (Available in the AUR as **poppler** package.)
* [epub-thumbnailer](https://github.com/marianosimone/epub-thumbnailer)
* [fontpreview](https://github.com/sdushantha/fontpreview)

## Credits
* Seebye for creating [Überzug](https://github.com/seebye/ueberzug) and the initial script
that this script is heavily based upon.
* [Ranger's](https://github.com/ranger/ranger) approach to file previewing as an
inspiration source.
