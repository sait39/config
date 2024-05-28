# config
Repo for managing linux config files

### Create an alias for using the config

alias config='/usr/bin/git --git-dir=$HOME/.config/.cfg/ --work-tree=$HOME/.config/'

###

echo ".config/.cfg" >> .gitignore

git clone --bare https://github.com/sait39/config.git $HOME/.config/.cfg

config checkout

config config --local status.showUntrackedFiles no

### Example usage of this config management

config status

config add .vimrc

config commit -m "Add vimrc"

config add .bashrc

config commit -m "Add bashrc"

config push

---

### Installing packages from a Packagelist

If you created your package list of currently installed packages using
pacman -Qqen > your_package_list.txt

then you can do
pacman -S - < your_package_list.txt

to install everything in that list

Very good thing if you are setting up a new pc.
