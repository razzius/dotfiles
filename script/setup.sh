git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
git clone https://github.com/razzius/.spacemacs.d ~/.spacemacs.d

# something wrong with tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

gln -sr .gitconfig ~
gln -sr .tmux.conf ~
gln -sr .gitconfig ~
gln -sr .gitignore_global ~
gln -sr .vimrc ~

# special cases for these great plugins
git clone https://github.com/chrisbra/improvedft ~/.vim/pack/bundle/start/improvedft
git clone https://github.com/scrooloose/nerdcommenter ~/.vim/pack/bundle/start/nerdcommenter
git clone https://tpope.io/vim/surround.git ~/.vim/pack/bundle/start/surround

defaults write com.apple.finder QuitMenuItem -bool true
killall Finder
defaults write -g ApplePressAndHoldEnabled -bool false
sudo sh -c 'echo /usr/local/bin/fish >> /etc/shells'
chsh -s /usr/local/bin/fish
