#!/bin/bash
# See: http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/

# USAGE
# =============================================
# sh ./Install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles

# git clone --recursive git@github.com:weili-feedhenry/dotfiles.git

# VARIABLES
# =============================================

dir=~/dotfiles             # dotfiles directory
olddir=~/dotfiles_old      # old dotfiles backup directory
bin=~/bin                # bin directory
oldbin=~/bin_old         # old bin backup directory

# list of files/folders to symlink in homedir
files=".gitattributes .gitconfig .gitignore_global .zshrc"

# create dotfiles_old in homedir
# echo "Creating $olddir for backup of any existing dotfiles in ~"
# mkdir -p $olddir
# echo "...done"


# Moving .bash_extra file
# Not in the repository
# echo "Moving .bash_extra from ~ to $olddir"
# mv ~/.bash_extra $olddir
# echo "Creating empty .bash_extra file in home directory."
# # Don't forget to configure the bash_extra
# cp $dir/.bash_extra ~/.bash_extra

# Moving .git_extra file
# Not in the repository, to prevent people from accidentally committing under my name
# echo "Moving DEFAULT .git_extra from ~ to $olddir (EDIT IT!!)"
# mv ~/.git_extra $olddir
# echo "Creating empty .bash_extra file in home directory."
# # Don't forget to configure the bash_extra
# cp $dir/.git_extra ~/.git_extra

# echo "Moving DEFAULT .tool-versions for asdf from ~ to $olddir"
# mv ~/.tool-versions $olddir
# echo "Creating symlink for .tool-versions file"
# ln -s $dir/asdf/.tool-versions ~/.tool-versions

# Install Pure prompt
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
# Install zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh/zsh-syntax-highlighting"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    # echo "Moving $file from ~ to $olddir"
    # mv ~/$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

echo "source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc



# http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
# http://lostincode.net/posts/homebrew