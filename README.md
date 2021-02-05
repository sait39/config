# config
Repo for managing linux config files

### Create an alias for using the config

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

###

echo ".cfg" >> .gitignore

git clone --bare *git-repo-url* $HOME/.cfg

config checkout

config config --local status.showUntrackedFiles no

### Example usage of this config management

config status

config add .vimrc

config commit -m "Add vimrc"

config add .bashrc

config commit -m "Add bashrc"

config push
