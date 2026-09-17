#!/bin/bash
# Script to install Deep Learning libraries and dependencies

# Define and create installation directory if it doesn't exist
export INSTALLATION_PATH=/home/apps/MLDL/DL-CondaPy3.10
export MODULE_PATH=/home/apps/modulefiles/MLDL
mkdir -p $INSTALLATION_PATH

# Download and install Miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-py313_26.7.1-1-Linux-x86_64.sh
bash Miniconda3-py313_26.7.1-1-Linux-x86_64.sh -b -u -p $INSTALLATION_PATH

# Initialize conda
source $INSTALLATION_PATH/bin/activate
conda tos accept

# Create a new conda environment for Deep Learning
for yml_file in `ls YMLfiles/*.yml`; do
    conda env create -f $yml_file
done

mkdir -p $MODULE_PATH
cp modulefiles/* $MODULE_PATH
