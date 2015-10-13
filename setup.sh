#!/bin/bash

function link_file {
    file_type=$1
    src=$2
    dest="$HOME/$3"
    
    if [ -h "$dest" ]; then
        echo "$dest is already a symlink."
        return
    fi

    if [[ "$file_type" = "file" && -f "$dest" ]]; then
        echo -n "$dest is an existing file. Should I replace it? <y|n>"
        read answer
        if [[ "$answer" = "" || "$answer" = "n" ]]; then
            echo "$dest was skipped."
            return
        fi
        rm "$dest"
    elif [[ "$file_type" = "dir" && -d "$dest" ]]; then
        echo -n "$dest is an existing directory. Should I replace it? <y|n>"
        read answer
        if [[ "$answer" = "" || "$answer" = "n" ]]; then
            echo "$dest was skipped."
            return
        fi
        rm -rf "$dest"
    fi

    echo "$dest was created."
    ln -s "$src" "$dest"
}

for file in bashrc \
            bash_profile \
            bash_exports \
            bash_aliases \
            bash_prompt \
            tmux.conf \
            vimrc \
            zshrc \
            ycm_extra.conf.py \
            xinitrc; do
    link_file "file" "dotfiles/$file" ".$file"
done

link_file "dir" i3 .i3
link_file "dir" ../dotfiles/config/dunst .config/dunst
link_file "dir" ../dotfiles/config/pulseaudio-ctl .config/pulseaudio-ctl

