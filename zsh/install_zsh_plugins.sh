#!/bin/bash
# ====================================================
#   Copyright (C)2021 All rights reserved.
#
#   Author        : akvsdk
#   Email         : dkvsak@gmail.com
#   File Name     : install_zsh_plugins.sh
#
# ====================================================

echo ">> Installing zsh plugin: autosuggestions ..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo ">> Installing zsh plugin: syntax highlighting ..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo ">> Installing zsh theae: sypowerlevel10k ..."
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

echo ">> Installing zsh theae: sypowerlevel10k_themes ..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's@^ZSH_THEME=.*$@ZSH_THEME="powerlevel10k/powerlevel10k"@g' ~/.zshrc

if [ $(uname -s) = "Linux" ]
then
    # GNU/Linux操作系统
    echo ">> Installing powerline fonts linux ..."
    wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
    wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
    mkdir -p ~/.local/share/fonts/
    mv PowerlineSymbols.otf ~/.local/share/fonts/
    fc-cache -vf ~/.local/share/fonts/
    mkdir -p ~/.config/fontconfig/conf.d/
    mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
elif [ $(uname -s) = "Darwin" ]
then
    echo ">> Installing powerline fonts mac ..."
    git clone  http://github.com/powerline/fonts 
    cd ./fonts && sh ./install.sh
    rm -rf ./fonts
else
    echo Unknown/Unsupported platform.
    exit 1
fi
