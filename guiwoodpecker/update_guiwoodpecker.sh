#!/bin/bash

#--------------------------------------------------------------------#
# Add key to ssh-agent
#--------------------------------------------------------------------#
basedir=$(dirname "$0")
#eval 'ssh-agent'
eval $(ssh-agent)
ssh-add $HOME/.ssh/guiwoodpecker_read_key

git pull "git@gitlab.com:WellGuard_AS/guiwoodpecker.git"
