# dotfiles

Config files.  Managed with gnu stow.

## install

```sh
git clone https://github.com/jpschroeder/dotfiles.git ~/dotfiles
cd dotfiles
stow -v -S nvim
stow -v -S kitty
stow -v -S zshrc
```

## uninstall

```sh
cd ~/dotfiles
stow -v -D nvim
stow -v -D kitty
stow -v -D zshrc
```

## cleanup nvim

```sh
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

## todo

* make it easier to see the ghostty split divides
