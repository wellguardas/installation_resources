#!/bin/bash

#--------------------------------------------------------------------#
# Go to home folder and download Conda installer
#--------------------------------------------------------------------#
cd $home
curl -sL \
	"https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh" > \
	"Miniconda3.sh"

source Miniconda3.sh

#--------------------------------------------------------------------#
# Reset terminal and update conda
#--------------------------------------------------------------------#
reset
conda update conda

#--------------------------------------------------------------------#
# Delete installer
#--------------------------------------------------------------------#
rm Miniconda3.sh
