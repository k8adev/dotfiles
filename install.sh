#!/bin/sh

install_dependencies() {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  brew install git
  brew install wget

  wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
  mv git-completion.bash ~/.git-completion.bash

  wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
  mv git-prompt.sh ~/.git-prompt.sh

  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim -c "PlugInstall" -c "q" -c "q"
}

move_files_to_user_folder() {
  cp .bashrc ~/.bashrc
  cp .bash_profile ~/.bash_profile
  cp .bash_aliases ~/.bash_aliases
  cp .gitconfig ~/.gitconfig
  cp .vimrc ~/.vimrc
}

set_git_configurations() {
  echo "\nInput your Git username:"
  read git_config_user_name
  git config --global user.name "$git_config_user_name"

  echo "\nInput your Git e-mail:"
  read git_config_user_email
  git config --global user.email $git_config_user_email
}

start_installation() {
  clear
  echo "Hello $USER.\nDo you want to proceed with configurations to your bash? (y/n)"
  read proceed_installation

  if echo "$proceed_installation" | grep -iqE "^y"; then
    install_dependencies
    move_files_to_user_folder
    set_git_configurations
  else
    echo "Ok, see you later 💅"
  fi
}

start_installation