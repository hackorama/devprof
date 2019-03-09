#!/bin/bash
#
# sets up bash, vim, git for dev on linux, mac, WSL
#
# https://github.com/hackorama/devprof
#

set -o errexit
set -o nounset
set -o pipefail

# bash
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.$(date +%F-%T).bak
[ -f ~/.bash_profile ] && mv ~/.bash_profile ~/.bash_profile.$(date +%F-%T).bak
curl -s -o ~/.bashrc https://raw.githubusercontent.com/hackorama/devprof/master/.bashrc
curl -s -o ~/.bash_profile https://raw.githubusercontent.com/hackorama/devprof/master/.bash_profile
# vim
[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.$(date +%F-%T).bak
curl -s -o ~/.vimrc https://raw.githubusercontent.com/hackorama/devprof/master/.vimrc

# use same vim key bindings in Eclipse Vrapper plugin
ln -fs ~/.vimrc ~/.vrapperrc
# set up color theme
mkdir -p ~/.vim/colors
curl -s -o ~/.vim/colors/monokai.vim https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim
# git prompt and completion
mkdir -p ~/.devprof
curl -s -o ~/.devprof/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -s -o ~/.devprof/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

# enable
source ~/.bash_profile

# report
echo "Updated profile files:"
echo
ls -1 ~/.bashrc ~/.bash_profile ~/.vimrc ~/.vim/colors/monokai.vim ~/.devprof/*
if [ `ls -l ~/.bashrc.*.bak ~/.bash_profile.*.bak ~/.vimrc.*.bak 2>/dev/null | wc -l` -gt 0 ];
then
  echo
  echo "Backed up existing profile files:"
  echo
  ls -1 ~/.bashrc.*.bak ~/.bash_profile.*.bak ~/.vimrc.*.bak 2>/dev/null
fi
echo
echo "Ready Steady Go !"

# start
exec bash -l
