#!/bin/sh

set -e

git submodule foreach git checkout master
git submodule foreach git pull --recurse-submodules

# Update prezto
cd .zprezto
git submodule update --init --recursive
cd -

# Install YouCompleteMe
cd .vim/bundle/YouCompleteMe
git submodule update --init --recursive
echo 'Installing YouCompleteMe...'
./install.py
cd -

# Install Command-T
cd .vim/bundle/command-t/ruby/command-t
echo 'Building Command-T...'
ruby extconf.rb
make clean
make
cd -

vim -c "call pathogen#helptags() | quit"
