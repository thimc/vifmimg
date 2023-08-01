# Image previews using Überzug for vifm (vi file manager)

![image](https://raw.githubusercontent.com/cirala/vifmimg/master/screenshot.png)

This script is used along [vifm](https://github.com/vifm/vifm) to generate image previews for various file types in vifm.


If you want image preview support for [lf](https://github.com/gokcehan/lf) check out [cirala/lfimg](https://github.com/cirala/lfimg).


The script is currently able to handle the following formats:
* Video
* Pdf
* Djvu
* eBook
* Images
* Audio files
* Fonts
* Comic Books (CBZ, CBR, ...) 

All previews are cached (except for regular images) and stored in your **~/.cache/vifm/** folder.


## Installation
1. Copy the **vifmimg** and **vifmrun** scripts to a folder that is included in your $PATH
variable for easy access to the files.

2. Edit your **~/.config/vifm/vifmrc** file and add fileviewer properties like so:
<details><summary>   Click to expand</summary>

```
    fileviewer *.pdf
        \ vifmimg pdf %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

    fileviewer *.djvu
        \ vifmimg djvu %px %py %pw %ph %c
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

    fileviewer *.cbt
        \ vifmimg cbt %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

    fileviewer *.cbz
        \ vifmimg cbz %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

    fileviewer *.cb7
        \ vifmimg cb7 %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

    fileviewer *.cbr
        \ vifmimg cbr %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

```
</details>

3. In order to launch vifm with image preview support from now on, you will need to use the supplied **vifmrun** script.

I recommend that you make an alias in your shell that points to vifm.


## Prerequisites
* [Überzugpp](https://github.com/jstkdng/ueberzugpp) and [Vifm](https://github.com/vifm/vifm) (isn't this obvious?)
* [ffmpegthumbnailer](https://github.com/dirkvdb/ffmpegthumbnailer)
* ImageMagick
* pdftoppm (Available in the AUR as `poppler` package.)
* [ddjvu](http://djvu.sourceforge.net/doc/man/ddjvu.html) (Contains in the Debian/Ubuntu `djvulibre-bin` package.)
* [epub-thumbnailer](https://github.com/marianosimone/epub-thumbnailer)
* [fontpreview](https://github.com/sdushantha/fontpreview)

* [fuse-zip](https://bitbucket.org/agalanin/fuse-zip) (.cbz support)
* [rar2fs](https://github.com/hasse69/rar2fs) (.cbr sopport)
* [fuse3-p7zip](https://github.com/andrew-grechkin/fuse3-p7zip) (.cb7 support)
* [archivemount](https://github.com/cybernoid/archivemount) (.cbt support)

## Credits
* Seebye for creating [Überzug](https://github.com/seebye/ueberzug) and the initial script
that this script is heavily based upon.
* [Ranger's](https://github.com/ranger/ranger) approach to file previewing as an
inspiration source.
