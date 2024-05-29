#!/bin/bash





sudo apt update
sudo apt install -y zsh

zsh /usr/share/zsh/functions/Newuser/zsh-newuser-install -f

sudo apt install -y curl git

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
git clone https://github.com/zdharma/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

sed -i 's/plugins=(git)/plugins=(fzf git sudo history-substring-search colored-man-pages zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete zsh-z)/' ~/.zshrc
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="gnzh"/' ~/.zshrc

sudo chsh -s $(which zsh)
