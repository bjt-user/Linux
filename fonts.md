#### resources

xorg: https://wiki.archlinux.org/title/Font_configuration

https://wiki.archlinux.org/title/Fonts

#### monospace fonts

It is important to use a font with a fixed width also called monospaced fonts.\
A monospaced font, also called a fixed-pitch, fixed-width, or non-proportional font, is a font whose letters and characters each occupy the same amount of horizontal space.

Monospaced fonts make code more readable and you can scan through the code faster.

Even though computers can now display a wide variety of fonts, the majority of IDEs and software text editors employ a monospaced font as the default typeface. This increases the readability of source code, which is often heavily reliant on distinctions involving individual symbols, and makes differences between letters more unambiguous in situations like password entry boxes where typing mistakes are unacceptable.[2] Monospaced fonts are also used in terminal emulation and for laying out tabulated data in plain text documents.\
https://en.wikipedia.org/wiki/Monospaced_font

https://en.wikipedia.org/wiki/List_of_monospaced_typefaces

#### ligatures

Some fonts have ligatures. 
https://en.wikipedia.org/wiki/Ligature_(writing)

In writing and typography, a ligature occurs where two or more graphemes or letters are joined to form a single glyph.

You have to be very careful when using this kind of fonts.


#### view fonts

viewing fonts that are installed on your system:\
https://flathub.org/apps/details/org.gnome.font-viewer

```
fc-list
```

```
$ fc-list | grep -i "inconsolata"
/usr/share/fonts/truetype/inconsolata/Inconsolata.otf: Inconsolata:style=Medium
$ file /usr/share/fonts/truetype/inconsolata/Inconsolata.otf
/usr/share/fonts/truetype/inconsolata/Inconsolata.otf: OpenType font data
```

#### install fonts
```
apt list fonts-*
```
```
sudo apt install -y fonts-inconsolata fonts-hack
```

(this does not work on `Fedora 36` with `dnf`)

This instantly changed my font in terminator and i3status bar:
```
sudo pacman -S ttf-inconsolata
```
Font size can be set in `~/.config/i3/config` and `~/.config/terminator/config`

=> I think the reason why this pacman command sets up the font is the creation of this file\
during installation:
```
/usr/share/fontconfig/conf.avail $ cat 75-ttf-inconsolata.conf 
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE fontconfig SYSTEM "../fonts.dtd">
<fontconfig>
  <alias>
    <family>monospace</family>
    <prefer>
      <family>Inconsolata</family>
    </prefer>
  </alias>
  <alias>
    <family>Inconsolata</family>
    <default>
      <family>monospace</family>
    </default>
  </alias>
</fontconfig>
```

#### good colors

For the terminal emulators I like:
- `fira code regular` (`sudo apt install fonts-firacode`) \
(`sudo dnf install fira-code-fonts`)
- `sudo dnf install levien-inconsolata-fonts` (for terminator config: `font = Inconsolata Medium 14`)
