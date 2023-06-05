#!/bin/bash

#--------------------------------------------------------------------#
# Ensure git and miniconda is installed
#--------------------------------------------------------------------#
f_output=$('git')
SUB="usage: git"
if [[ "$f_output" == *"$SUB"* ]]; then
  echo 'Git found'
else
  echo 'Git not found, please install...'
  exit 1
fi
f_output=$('conda')
SUB="usage: conda"
if [[ "$f_output" == *"$SUB"* ]]; then
  echo 'Conda found'
else
  source $HOME/miniconda3/etc/profile.d/conda.sh
  f_output_nested=$('conda')
  if [[ "$f_output_nested" == *"$SUB"* ]]; then
    echo 'Conda found'
  else
    echo 'Conda not found, please install. Can be done with script found in "utils" folder'
    exit 1
  fi
fi


#--------------------------------------------------------------------#
# Ask for permission to install at %USERPROFILE%\WellGuardGUI\ folder
#--------------------------------------------------------------------#
installation_path="$HOME/WellGuardGUI/"
$clear
echo "Installing WoodPecker GUI (guiwoodpecker) at $installation_path (y/n)"
read user_answer
SUB="y"
if [[ "$user_answer" == *"$SUB"* ]]; then
  echo 'Starting installation'
else
  echo 'Aborting installation'
  exit 2
fi


#--------------------------------------------------------------------#
# Ensure that %USERPROFILE%\WellGuardGUI folder exists and set cwd
#--------------------------------------------------------------------#
[ ! -d "$installation_path" ] && mkdir -p "$installation_path"
cd $installation_path


#--------------------------------------------------------------------#
# Clone repository from GitLab
#--------------------------------------------------------------------#
git clone "https://gitlab.com/WellGuard_AS/guiwoodpecker.git"


#--------------------------------------------------------------------#
# Create Conda environment
#--------------------------------------------------------------------#
project_path="$HOME/WellGuardGUI/guiwoodpecker/environment.yml"
echo "Creating Conda environment from file: $project_path"
cd project_path
conda env create -f $project_path


#--------------------------------------------------------------------#
# Activate conda environment
#--------------------------------------------------------------------#
conda activate guiwoodpecker


#--------------------------------------------------------------------#
# Install wxbuild package
#--------------------------------------------------------------------#
f_output=$('pip')
SUB="Usage:"
if [[ "$f_output" == *"$SUB"* ]]; then
  echo 'Pip works fine!'
else
  echo 'Pip error, need to reinstall it'
  conda "uninstall pip --force -y"
  conda "install pip -y"
fi
echo "Reinstalling wxbuild"
pip uninstall wxbuild -y
pip install "git+https://github.com/mkkb/wxbuild@linux_compatibility"


#source $HOME/miniconda3/etc/profile.d/conda.sh
# cd ..
# conda env create -f "environment.yml"
# source shell_scripts/update_wxbuild_package.sh