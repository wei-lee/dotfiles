#!/usr/bin/env bash
# Install native apps with cask
# https://github.com/phinze/homebrew-cask/blob/master/USAGE.md

main_app_dir = "/Applications"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
# -p means if directory doen't exists

brew tap phinze/homebrew-cask
brew install brew-cask

# "${@}" list of all parameters
function installcask() {
        brew cask install "${@}" 2> /dev/null
}

#installcask --appdir="/Applications/" alfred
# Link alfred
#brew cask alfred link
#installcask --appdir="/Applications/" 	dropbox
#installcask --appdir="/Applications/" 	google-chrome
#installcask --appdir="/Applications/" 	google-chrome-canary
#installcask --appdir="/Applications/" 	cyberduck
#installcask --appdir="/Applications/" 	skype
installcask --appdir="/Applications/"    transmission
#installcask --appdir="/Applications/"    transmit

#installcask --appdir="/Applications/" iterm2
#installcask --appdir="/Applications/" sublime-text
installcask --appdir="/Applications/" atom
installcask --appdir="/Applications/" virtualbox
installcask --appdir="/Applications/" pycharm
installcask --appdir="/Applications/" dash
installcask --appdir="/Applications/" sequel-pro
installcask --appdir="/Applications/" imageoptim
#installcask --appdir="/Applications/" imagealpha
#installcask --appdir="/Applications/" diffmerge
#installcask --appdir="/Applications/" tower
installcask --appdir="/Applications/" shuttle

#installcask --appdir="/Applications/" evernote
#installcask --appdir="/Applications/" skitch

#installcask --appdir="/Applications/" 	the-unarchiver
#installcask --appdir="/Applications/" 	xquartz

installcask --appdir="/Applications/"  colorpicker-skalacolor
installcask --appdir="/Applications/"  cakebrew
installcask --appdir="/Applications/"  appcleaner
installcask adium
installcask bettertouchtool
installcask textmate

# https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webp-quicklook suspicious-package

# caskroom/fonts
brew tap caskroom/fonts
# USAGE: brew cask install font-inconsolata
# Search: ls /usr/local//Library/Taps/caskroom-fonts/Casks/ | grep <pattern>

brew install android-sdk
brew install android-platform-tools
brew cask install android-studio

# Others
#
# installcask imagealpha
# installcask imageoptim
# installcask macvim
# installcask miro-video-converter
# installcask tor-browser
#
# Web Debugging Proxy Application for Windows, Mac OS and Linux
# installcask charles
#
# Mou The missing Markdown editor for web developers
# installcask mou


# DELETING THE INSTALLERS:
# https://mug.im/manage-your-mac-apps-with-homebrew-cask/
# Homebrew-cask uses brew itself to manage the cache.
# $ brew cleanup -s should do the job.
# If you want to automate this you can use:
# $ rm -rf $(brew --cache)
# rm -rf $(brew --cache)

brew cask cleanup