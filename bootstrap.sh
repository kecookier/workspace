#! /bin/sh
#https://raw.githubusercontent.com/kecookier/workspace/master/bootstrap.sh

set -e
set -x

[ ! -d "$HOME/.local" ] && mkdir -p "$HOME/.local" 2>/dev/null
cd $HOME/.local
git clone https://github.com/kecookier/workspace.git

# install .bashrc

#cd ~/.vim/vim/etc
#sh update.sh
#
#cd ~
#
#[ ! -d "$HOME/.config" ] && mkdir -p "$HOME/.config" 2> /dev/null
#
#
#cp $SCRIPTPATH/*.sh "$HOME/.local/etc/" 
#cp $SCRIPTPATH/*.conf "$HOME/.local/etc/" 
#cp $SCRIPTPATH/*.fish "$HOME/.config/fish/"
#cp $SCRIPTPATH/*.zsh "$HOME/.local/etc/"
#cp $SCRIPTPATH/*.lua "$HOME/.local/etc/"
#cp $SCRIPTPATH/inputrc "$HOME/.local/etc"
#
#cp $SCRIPTPATH/../tools/bin/* "$HOME/.local/bin"
#cp $SCRIPTPATH/../lib/* "$HOME/.local/lib/python"
#
#echo 'source ~/.local/etc/init.sh' >> ~/.bashrc
