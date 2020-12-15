#!/bin/bash

#
# psensor installer
# Created by Liam Powell (gfelipe099)
# install.sh file
# For Arch Linux amd64
#
pkgver="1.2.1"

#
# install this package to check which OS is running
#
pacman -Sy &>/dev/null && pacman -S lsb-release --noconfirm --needed &>/dev/null

# Verify Arch Linux is running
if [ ! -f /usr/bin/pacman ]; then
    echo "Pacman Package Manager was not found in this system, execution aborted."
    exit
    else
        if [ -f /usr/bin/lsb_release ]; then
            os=$(lsb_release -ds | sed 's/"//g')
            else
                sudo pacman -S lsb-release --noconfirm --needed &>/dev/null
                os=$(lsb_release -ds | sed 's/"//g')
        fi
fi

if [ "${os}" != "Arch Linux" ]; then
    echo "You must be using Arch Linux to execute this script."
    exit 1
fi

if [ -z ${1} ]; then
    read -p "This script will compile and install psensor into your system. Continue? (Default: no) [Y/N]: " input
    if [ -z ${input} ]; then
        input=no
        echo "No changes were made."
        exit
    elif [ ${input} = "N" ]; then
        input=no
        echo "No changes were made."
        exit
    elif [ ${input} = "n" ]; then
        input=no
        echo "No changes were made."
        exit
    elif [ ${input} = "no" ]; then
        echo "No changes were made."
        exit
    elif [ ${input} = "Y" ]; then
        makepkg -sir
    elif [ ${input} = "y" ]; then
        makepkg -sir
    elif [ ${input} = "yes" ]; then
        makepkg -sir
        else
            echo "ERROR: ${input}: Invalid value, try again with Y or N"
            exit
    fi
elif [ ${1} = "noconfirm" ]; then
    makepkg -sir
    exit
    if [ -d src ]; then
        makepkg -ir
        exit
    fi
elif [ ${1} = "clean" ]; then
    if [ -d pkg/ ]; then
        echo "Removing directory: pkg/ ..."
        rm -rf pkg/
        else
            echo "Cannot remove directory: pkg/, it does not exist"
    fi
    if [ -d src/ ]; then
        echo "Removing directory: src/ ..."
        rm -rf src/
        else
            echo "Cannot remove directory: src/, it does not exist"
    fi
    if [ -f psensor-${pkgver}.tar.gz ]; then
        echo "Removing file: psensor-${pkgver}.tar.gz ..."
        rm -rf psensor-${pkgver}.tar.gz
        else
            echo "Cannot remove file: psensor-${pkgver}.tar.gz, it does not exist"
    fi
    if [ -f psensor-${pkgver}-1-x86_64.pkg.tar.zst ]; then
        echo "Removing file: psensor-${pkgver}-1-x86_64.pkg.tar.zst ..."
        rm -rf psensor-${pkgver}-1-x86_64.pkg.tar.zst
        else
            echo "Cannot remove file: psensor-${pkgver}-1-x86_64.pkg.tar.zst, it does not exist"
    fi
    else
        echo "ERROR: ${1}: Unknown argument"
        exit
fi
