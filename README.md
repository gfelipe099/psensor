# psensor

## What is this?
An unofficial port of the psensor graphical hardware temperature monitor tool for Arch Linux (the one on the AUR is old).

## How do I install it?
You need to compile it in order to install it, but don't worry, it is an automatic process:  
  - Clone this repository or download the `PKGBUILD` file. After, on a terminal, type in `makepkg -si`, which will check for needed dependencies, compile from source and install it for you right away.
  - If you prefer, there is an `install.sh` which will do so for you right away by typing `sh install.sh noconfirm` or `./install.sh noconfirm`.
      - To clean the directory and compile again, e.g for updating, use: `sh install.sh clean` or `./install.sh clean`.
