# Dotfiles
## How to initialize a package
Create package, copy files to this package.

```bash
mkdir -p htop/.config/htop
mv ~/.config/htop/htoprc ~/.dotfiles/htop/.config/htop/
```

## Linking
To link particular package use:

```bash
stow -R -v -t ~ htop
```

To link everything:

```bash
stow -R -v -t ~ /*
```

## X11 inputs
Modify `/etc/X11/xorg.conf.d/40-libinput.conf`. It allows to "tap"
the pad to click instead of physically pressing the button down and
sets the finger-count behavior and sets the finger-count behavior:
1 finger = Left click, 2 fingers = Middle click, 3 fingers = Right click.

```
Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
	Option "Tapping" "on"
	Option "TappingButtonMap" "lmr"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
EndSection
```

Modify `/etc/X11/xorg.conf.d/20-3rdbutton.conf` to allow use middle mouse
button for pasting the selection.

```
Section "InputClass"
	Identifier "middle button"
	MatchIsPointer "on"
	MatchDriver "libinput"
    Option "MiddleEmulation" "on"
EndSection
```

## Install programs
Default for now:
```
pacman -S --needed \
alacritty \
neovim \
vim \
zsh \
i3 \
dunst \
git \
tmux \
zathura \
vifm \
ttf-daddytime-mono-nerd \
mpv \
nsxiv \
firefox \
flameshot \
lazygit \
pass
```

## Some configs
Add an option to mount without root. Modify /etc/fstab:

```
/dev/sdX1  /mnt/flash  vfat  noauto,users,uid=1000,gid=1000,dmask=022,fmask=133  0  0
```

Then you can mount easily:

```bash
mount /mnt/flash
umount /mnt/flash
sync
```

## Useful links

Annotation mono font:
https://qwerasd205.github.io/AnnotationMono/

