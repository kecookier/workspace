#!/bin/bash
CUR_DIR=`pwd`
#ln -sv --backup ${CUR_DIR}/.gitconfig  ${CUR_DIR}/.local ${CUR_DIR}/.tmux.conf ${CUR_DIR}/.vimrc ${CUR_DIR}/.vim $HOME
ln -sv ${CUR_DIR}/.gitconfig  ${CUR_DIR}/.local ${CUR_DIR}/.tmux.conf ${CUR_DIR}/.vimrc ${CUR_DIR}/.vim $HOME
