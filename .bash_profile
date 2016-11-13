#!/usr/bin/env bash

# Compialtion stuff (Set architecture flags)
export ARCHFLAGS="-arch x86_64"
export DOTFILESDIR="dotfiles"

# =============================================
# PATHS
# =============================================
# Loading sequence:
#   1     /etc/paths
#   2     /etc/paths./whatever (e.g. x11)
#   3     ~/.MacOSX/environment.plist (AVOID!)
#   4     PATH defined in this file
#
#   BEWARE: Avoid (3) cause it overrides the default PATH set in /etc/paths and it is deprecated

# For loading HOMEBREW binaries first change the /etc/paths file
# putting /usr/local/bin at the beginning of the file instead of the end
# Even if we do it here it will be 'too late'

# Local bin in my home (scripts various stuff)
PATH="$PATH:~/bin"

export PATH

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    alias ls='ls --color=always'
    # load my color scheme (it only works with GNU ls)
    # dircolors only work with coreutils
    eval `dircolors  ~/dotfiles/data/dircolors`
else # OS X `ls`
    alias ls='ls -G'
fi

# BASH_ALIASES
# =============================================
source ~/$DOTFILESDIR/.bash_aliases


# BASH FUNCTIONS
# =============================================
source ~/$DOTFILESDIR/.bash_functions


# EXTRA (settings I don't want to commit)
# =============================================
# ~/.bash_extra used for settings I don't want to commit.
# It will be copied in home and the modification there won't be committed
bash_extra=~/.bash_extra
[ -r "$bash_extra" ] && [ -f "$bash_extra" ] && source "$bash_extra"


# =============================================
# COMPLETIONS
# =============================================

# SOURCE BASH COMPLETION
# =============================================
# If possible, add tab completion for many more commands
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
# Or if Installed with Brew
elif [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi


# GRUNT COMPLETION
# ===========================
if [[ $grunt ]]; then
    eval "$(grunt --completion=bash)"
fi


# PIP COMPLETION
# ===========================
if [ -f ~/$DOTFILESDIR/completions/bash_pip_completion ]; then
    source ~/$DOTFILESDIR/completions/bash_pip_completion
fi

# GIT COMPLETION
# ============================
if [ -f ~/$DOTFILESDIR/completions/git-completion.bash ]; then
    source ~/$DOTFILESDIR/completions/git-completion.bash
fi

# FHC COMPLETION
# ============================
if [ -f ~/$DOTFILESDIR/completions/fhc-completion ]; then
    source ~/$DOTFILESDIR/completions/fhc-completion
fi

# TMUXINATOR COMPLETION
# ============================
if [ -f ~/$DOTFILESDIR/completions/tmuxinator.bash ]; then
    source ~/$DOTFILESDIR/completions/tmuxinator.bash
fi


# DJANGO COMPLETION
# ===========================
#if [ -f ~/$DOTFILESDIR/completions/bash_django_completion ]; then
#    source ~/$DOTFILESDIR/completions/bash_django_completion
#fi


# SSH HOSTNAMES COMPLETION
# ===========================
# ssh hostnames tab completion based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh



# KILLALL COMPLETION
# ===========================
# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall


# CYCLIC TAB-COMPLETION
# ===========================
# bind '"\t":menu-complete'


# =============================================
# MISC & EXPORTS
# =============================================

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
# shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null
done

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"


# COLORIZED GREP (could break things with git completion)
# ===========================
alias grep="grep --color=always"
alias egrep="egrep --color=always"
alias egrep="fgrep --color=always"

# # Always enable colored `grep` output
export GREP_OPTIONS="--color=auto"

# Specify the TERM variable. Otherwise it will throw an error when running scripts in non-interactive mode
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
    export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
    export TERM=xterm-256color
fi


# MAN COLORS (Less Colors for Man Pages)
# ===========================
# A SSH command line that specifies a remote command will normally run in "non-interactive mode". One of the consequences is that no pseudo-TTY will be assigned for the connection in the remote host.
# This happens because /etc/profile, ~/.profile or some other login script on those nodes contains a tput command that is executed unconditionally - even if the session does not have a TTY
# associated with it. (The HP-UX default login scripts have had this issue for ages.)
# The true fix would be to find the tput commands on those nodes and make them conditional. For example, on sh, ksh, bash and other Bourne-style shells, you could replace the command:
# (tput) with (tty -s && tput)
# This will run the tput command only if the session is interactive and has a TTY assigned. ("tput" is a terminal initialization/configuration command, so running it when there is no TTY makes no sense anyway.)
if tput setaf 1 &> /dev/null; then
    export LESS_TERMCAP_mb=$(tty -s && tput bold; tty -s && tput setaf 2) # green
    export LESS_TERMCAP_md=$(tty -s && tput bold; tty -s && tput setaf 6) # cyan
    export LESS_TERMCAP_me=$(tty -s && tput sgr0)
    export LESS_TERMCAP_so=$(tty -s && tput bold; tty -s && tput setaf 3; tput setab 4) # yellow on blue
    export LESS_TERMCAP_se=$(tty -s && tput rmso; tty -s && tput sgr0)
    export LESS_TERMCAP_us=$(tty -s && tput smul; tty -s && tput bold; tput setaf 7) # white
    export LESS_TERMCAP_ue=$(tty -s && tput rmul; tty -s && tput sgr0)
    export LESS_TERMCAP_mr=$(tty -s && tput rev)
    export LESS_TERMCAP_mh=$(tty -s && tput dim)
    export LESS_TERMCAP_ZN=$(tty -s && tput ssubm)
    export LESS_TERMCAP_ZV=$(tty -s && tput rsubm)
    export LESS_TERMCAP_ZO=$(tty -s && tput ssupm)
    export LESS_TERMCAP_ZW=$(tty -s && tput rsupm)
fi



# BASH HISTORY
# ===========================
# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"


# HOMEBREW
# ===========================
# Link Homebrew casks in `/Applications` rather than `~/Applications`
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Google Apps
export PATH=$PATH:"/Applications/Google Chrome.app"

# Editor
export EDITOR='vim'

# Work Related
# =============================================
source ~/$DOTFILESDIR/.bash_fh

# RVM
# =============================================
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Set JDK version, function is defined in bash_functions
# =============================================
setjdk 1.7

# NVM
# =============================================
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"
