#! /bin/bash
set -u
# shell will treat unset variables as an error when they are substituted

# make variable available to any child processes or shell scripts that are executed from this shell
export starting_dir=$PWD
export python_version=11


# General venv and all the kernels configuration

# define local variables
initial_path=$HOME
dir_name="venv"
venv_name="pymain"

venv_path="$initial_path/$dir_name/$venv_name"

# for python venv creation
sudo apt update
sudo apt install python3-venv -y

# create and activate a venv for jupyter and kernels
mkdir $initial_path/$dir_name
python3.$python_version -m venv $venv_path
source "$venv_path/bin/activate"

# software for Jupyter
sudo apt install pandoc -y
sudo apt install texlive-xetex -y
sudo apt install nodejs -y
sudo apt install npm -y

# delete versions if you want the newest jupyter
pip install --upgrade pip
#pip install --upgrade setuptools
#pip install --upgrade wheel
pip install jupyter
pip install jupyterlab==3.6.5
pip install jupyterlab-lsp==3.10.2
pip install python-lsp-server[all]
# pip install jedi-language-server  # installed globally with pipx
pip install pyppeteer
pip install jupyterlab-execute-time==2.0.2

# install kernels
pip install ipykernel
pip install jupyter-client

# bash kernel
pip install bash_kernel
python -m bash_kernel.install

# C kernel
pip install jupyter-c-kernel
install_c_kernel --user

# java kernel
cd /tmp
wget https://github.com/SpencerPark/IJava/releases/download/v1.3.0/ijava-1.3.0.zip
unzip ijava-1.3.0.zip
python install.py --user

deactivate


# addition basic and clean python venvs
versions=(9 11 12)
for version in "${versions[@]}"
do
	venv_name="venv3.$version"
	venv_path="$initial_path/$dir_name/$venv_name"
	python3.$version -m venv $venv_path
	source "$venv_path/bin/activate"
	pip install --upgrade pip
	pip install ipykernel
	pip install jupyter-client
	python -m ipykernel install --user --name=$venv_name
	deactivate
done

cd $starting_dir

echo "Юпитер и ядра настроены!"
