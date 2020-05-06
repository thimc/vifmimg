# Image previews using Überzug for vifm (vi file manager)

![image](https://raw.githubusercontent.com/cirala/vifmimg/master/screenshot.png)

This script is used along [vifm](https://github.com/vifm/vifm) to generate image previews for various file types in vifm.


If you want image preview support for [lf](https://github.com/gokcehan/lf) check out [cirala/lfimg](https://github.com/cirala/lfimg).


The script is currently able to handle the following formats:
* Video files
* eBook files
* Images and icons
* Audio files
* Font files

Video previews are also supported by using ffmpegthumbnailer and works very well but just
like the PDF previews there is a minor flash between each preview, this is due to
ffmpegthumbnailer generating the preview file.

GIF files are as of now in the works, it _works_ but in order to break out of the
animation loop the user needs to hit the CTRL-C. Sometimes this breaks the preview
entirely. When resizing the terminal window the animation replays.
There is room for improvement here.

PDF/epub preview is also supported, this is done via pdftoppm and epub-thumbnailer and works almost flawlessly,
a minor flash between the previews occur due to pdftoppm generating the image.

Ico files are supported and is utilizing ImageMagick.

## Installation
1. Copy the **vifmimg** and **vifmrun** scripts to a folder that is included in your $PATH
variable for easy access to the files.

2. Edit your **~/.config/vifm/vifmrc** file and add fileviewer properties like so:


```
    fileviewer *.pdf
        \ vifmimg pdfpreview %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

    fileviewer *.epub
        \ vifmimg epubpreview %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

    fileviewer *.avi,*.mp4,*.wmv,*.dat,*.3gp,*.ogv,*.mkv,*.mpg,*.mpeg,*.vob,
        \*.fl[icv],*.m2v,*.mov,*.webm,*.ts,*.mts,*.m4v,*.r[am],*.qt,*.divx,
        \ vifmimg videopreview %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

    fileviewer *.bmp,*.jpg,*.jpeg,*.png,*.xpm
        \ vifmimg draw %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

    fileviewer *.gif
        \ vifmimg gifpreview %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear

    fileviewer *.ico
        \ vifmimg magickpreview %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear
        
    fileviewer <audio/*>
        \ vifmimg audiopreview %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear
        
    fileviewer <font/*>
        \ vifmimg fontpreview %px %py %pw %ph %c
        \ %pc
        \ vifmimg clear
```

You will also need to add these keybindings (preferably in the bottom of your vifmrc) in order to get the PDF scrolling functionalities:

```
    map > :!vifmimg inc<CR>
    map < :!vifmimg dec<CR>
```

3. In order to launch Vifm with image preview from now you'll need to use the supplied
**vifmrun** script

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
