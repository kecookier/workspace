#! /bin/sh
#https://raw.githubusercontent.com/kecookier/workspace/master/bootstrap.sh

set -e
set -x

echo "init git repo..."
[ ! -d "$HOME/.local" ] && mkdir -p "$HOME/.local" 2>/dev/null
cd $HOME/.local
git clone https://github.com/kecookier/workspace.git

echo "install .bashrc.."
echo 'source ~/.local/workspace/init.sh' >> ~/.bashrc
echo "install .tmux.conf.."
echo 'source ~/.local/workspace/tmux.conf' >> ~/.tmux.conf
echo "install .vimrc"
echo 'source ~/.local/workspace/vimrc' >> ~/.vimrc

