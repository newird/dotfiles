#!/bin/bash
cd $HOME
git clone https://mirrors.tuna.tsinghua.edu.cn/git/ohmyzsh.git
cd ohmyzsh/tools
REMOTE=https://mirrors.tuna.tsinghua.edu.cn/git/ohmyzsh.git sh install.sh
cd $HOMR/ohmyzsh/plugins
git clone https://mirror.nju.edu.cn/git/zsh-autosuggestions.git/
git clone https://mirror.nju.edu.cn/git/zsh-syntax-highlighting.git/
