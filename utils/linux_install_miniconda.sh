#!/bin/bash

#--------------------------------------------------------------------#
# Go to home folder and download Conda installer
#--------------------------------------------------------------------#
echo "Going to home folder: $HOME"
cd $HOME
echo "Downloading Miniconda3"
curl -sL "https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh" > "$HOME/Miniconda3.sh"
echo "Running installation script..."
/bin/bash Miniconda3.sh

#--------------------------------------------------------------------#
# Reset terminal and update conda
#--------------------------------------------------------------------#
echo "terminal reset..."
reset
conda_folder="miniconda3"
source "$HOME/$conda_folder/etc/profile.d/conda.sh"
conda update conda

#--------------------------------------------------------------------#
# Delete installer
#--------------------------------------------------------------------#
echo "Delete installer"
rm Miniconda3.sh
echo "Conda successfully installed
