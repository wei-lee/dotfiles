#!/usr/bin/env bash

# Install asdf version manager
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.2.0

# Add golang plugin
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git

# Add nodejs plugin
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

# Add ruby plugin
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git

asdf install