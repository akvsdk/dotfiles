#!/bin/bash
# ====================================================
#   Copyright (C)2021 All rights reserved.
#
#   Author        : akvsdk
#   Email         : dkvsak@gmail.com
#   File Name     : install_zsh.sh
#
# ====================================================

echo " >> Installing zsh ... "
sudo apt-get update
sudo apt-get install zsh git -y
chsh -s $(which zsh)
echo ">> Installing on-my-zsh ..."
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"