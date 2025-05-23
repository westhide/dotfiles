#!/usr/bin/env bash

function set_commit_mono_font() {
    mkdir -p ~/.local/share/fonts
    ln -s ~/dotfiles/fonts/CommitMonoFont ~/.local/share/fonts/CommitMonoFont
}


function set_nodejs_store() {
    npm set prefix ~/.npm-store
    mkdir -p ~/.corepack-store/bin
    corepack enable --install-directory ~/.corepack-store/bin
}

set_commit_mono_font
set_nodejs_store
