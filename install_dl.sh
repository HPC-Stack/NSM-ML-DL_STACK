#!/bin/bash
# Script to install Deep Learning libraries and dependencies

# Define and create installation directory if it doesn't exist
export INSTALLATION_PATH=/home/apps/MLDL/DL-CondaPy3.10
mkdir -p $INSTALLATION_PATH

# Download and install Miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -u -p $INSTALLATION_PATH

# Initialize conda
source $INSTALLATION_PATH/bin/activate
conda tos accept

# Create a new conda environment for Deep Learning
for yml_file in `ls YMLFiles/*.yml`; do
    conda env create -f $yml_file
done

cp modulefiles/* /home/apps/modulefiles/MLDL/