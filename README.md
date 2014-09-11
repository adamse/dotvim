# Installation

    git clone <url> ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    cd ~/.vim
    git submodule update --init

# Install new bundle

    cd ~/.vim
    git submodule add <url> bundle/<bundle>
    git commit -m "Install <bundle> as submodule"

# Upgrade bundles

All bundles:

    git submodule foreach git pull origin master

Some bundle:

    cd bundle/<bundle>
    git checkout master
    git pull

Commit changes

# Remove bundle

    git submodule deinit bundle/<bundle>
    git rm bundle/<bundle>
