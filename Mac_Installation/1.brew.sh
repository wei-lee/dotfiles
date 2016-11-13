#!/bin/bash

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure we’re using the latest Homebrew
brew update
# Upgrade any already-installed formulae
brew upgrade

# Git
brew install git --without-completions
brew install git-extras
brew install hub

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install others
brew install tmux
brew install curl
brew install ack
brew install rename
brew install tree
brew install markdown
brew install wget
brew install imagemagick --with-webp
brew install lynx
brew install nmap
brew install automake
brew install autoconf
brew install openssl
brew install libyaml
brew install readline
brew install libxslt
brew install libtool
brew install unixodbc
brew install zsh-syntax-highlighting

# Remove outdated versions from the cellar
brew cleanup