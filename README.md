# dotfiles

Config files.  Managed with gnu stow.

## install

```sh 
git clone https://github.com/jpschroeder/dotfiles.git ~/dotfiles
cd dotfiles
stow -v -S nvim kitty
```

## uninstall

```sh
cd ~/dotfiles
stow -v -D nvim kitty
```
