#!/bin/bash
set -u
# shell will treat unset variables as an error when they are substituted

source soft_installation.sh

# install Pythons
source pythons_installation.sh

# install other languages
source other_languages.sh

# install jupyter and create kernels
source jupyter_venvs_and_kernels_installation.sh

echo "Все настроено к работе, товарищ!"
