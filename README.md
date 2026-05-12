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
stow -R -v -t ~ .
```
