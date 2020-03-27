#!/bin/sh

if [ -z "$CUSTOM_CONFIG_DIR" ]
then
  echo "Missing CUSTOM_CONFIG_DIR env"
  exit 1
fi

install_on_my_zsh() {
  echo "Installing oh my zsh"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

install_dotfiles() {
  echo "Installing dotfiles"
}

install_brewfile_packages() {
  echo "Copying Brewfile"

  if [ -f "$HOME/Brewfile" ]
  then
    echo "Moving existing Brewfile to $HOME/Brewfile.backup"

    mv "$HOME/Brewfile" "$HOME/Brewfile.backup"
  fi

  cp "$CUSTOM_CONFIG_DIR/Brewfile" "$HOME/Brewfile"

  echo "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

  echo "Installing Brewfile packages"
  brew bundle install
}

install_scripts() {
  echo "Running installation scripts"
}

main() {
  # Install oh my zsh
  install_on_my_zsh

  # Copy custom zsh plugins

  # Copy zshrc

  # Copy dotfiles

  install_brewfile_packages

  # Execute install scripts

}

main "$@"
