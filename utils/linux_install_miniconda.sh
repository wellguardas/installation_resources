#!/bin/bash

#--------------------------------------------------------------------#
# Go to home folder and download Conda installer
#--------------------------------------------------------------------#
echo "Going to home folder: $home"
cd $home
echo "Downloading Miniconda3"
curl -sL "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh" > "Miniconda3.sh"
echo "Running installation script..."
batch Miniconda3.sh

#--------------------------------------------------------------------#
# Reset terminal and update conda
#--------------------------------------------------------------------#
echo "terminal reset..."
reset
conda update conda

#--------------------------------------------------------------------#
# Delete installer
#--------------------------------------------------------------------#
echo "Delete installer"
rm Miniconda3.sh
echo "Conda successfully installed
