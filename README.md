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

    git submodule foreach git pull origin master
