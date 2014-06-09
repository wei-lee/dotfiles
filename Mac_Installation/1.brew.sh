#!/bin/bash

# Install Brew, uncomment this if brew is not already installed
#ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# Make sure we’re using the latest Homebrew
brew update
# Upgrade any already-installed formulae
brew upgrade

# Git
#brew install git
# If bash completions don't work then try with
# brew install git --without-completions

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install wget with IRI support
brew install wget --enable-iri

# Install more recent versions of some OS X tools
# brew tap homebrew/dupes
# brew install homebrew/dupes/grep

# PHP: https://github.com/Homebrew/homebrew-php
# brew tap homebrew/homebrew-php

# For Yeoman
brew install optipng jpeg-turbo phantomjs

# Bash Completions
brew install bash-completion
# Add this to the bash_profile
# If possible, add tab completion for many more commands

# Install everything else
brew install ack
brew install rename
brew install tree
brew install markdown
brew install wget
brew install install imagemagick --with-webp
brew install lynx
brew install nmap
brew install p7zip
brew install redis
brew install testdisk
#brew install heroku-toolbelt
# info for our mac
brew install archey


#
# brew install pigz
# brew install pv
# brew install foremost
# brew install rhino
# brew install sqlmap
# brew install webkit2png
# brew install zopfli
# brew install homebrew/versions/lua52



# Remove outdated versions from the cellar
brew cleanup