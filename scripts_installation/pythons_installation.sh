#! /bin/bash
set -u
# shell will treat unset variables as an error when they are substituted

export starting_dir=$PWD

sudo apt update
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libpq-dev python3-dev -y
sudo apt-get install sqlite3 libsqlite3-dev

versions=(12.1 9.18)
for version in "${versions[@]}"
do
	cd /tmp/
	wget https://www.python.org/ftp/python/3.$version/Python-3.$version.tgz
	tar xzvf Python-3.$version.tgz
	cd Python-3.$version
	./configure --enable-optimizations
	make -j 4
	sudo make altinstall
done

cd $starting_dir

# install environment packages
sudo apt install pipx -y
# locals are here: /home/$USER/.local/bin/

pipx install python-language-server
pipx install jedi-language-server
pipx install ipython
pipx install black
pipx install isort
pipx install flake8
pipx install bandit
pipx install mypy
pipx install pydocstyle

echo "Все пайтоны установлены, как Вы желали, господин"
