#!/usr/bin/env bash

brew tap caskroom/cask

# Browser
# brew cask install google-chrome

# Terminal
# brew cask install iterm2

# Editors
# brew cask install sublime-text
brew cask install macvim
brew cask install visual-studio-code

brew cask install sequel-pro
brew cask install robomongo

# https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package quicklookase qlvideo

brew cask cleanup