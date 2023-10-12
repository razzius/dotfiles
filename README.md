# keyd

```
$ sudo ln -s (pwd)/keyd_config/common /etc/keyd/
$ sudo ln -s (pwd)/keyd_config/default.conf /etc/keyd/
$ sudo ln -s (pwd)/keyd_config/magic_keyboard.conf /etc/keyd/
```

# rg

```
$ ln -s (pwd)/.rgrc $HOME/.rgrc

# Set in .profile
export RIPGREP_CONFIG_PATH=$HOME/.rgrc
```

# sway

```
ln -s (pwd)/sway.conf ~/.config/sway/config
```

# vim

See https://git.sr.ht/~razzi/.vim

# fish

Uses https://git.sr.hut/~razzi/fish-functions.

```
$ git clone https://git.sr.ht/~razzi/fish-functions ~/.config/fish
$ symlink fish_conf.d ~/.config/fish/conf.d
```

# kitty

```
ln -s $(pwd)/kitty.conf ~/.config/kitty/kitty.conf
```

# tmux

```
ln -s $(pwd)/.tmux.conf ~/
```
