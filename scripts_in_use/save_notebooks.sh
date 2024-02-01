#! /bin/bash

. $HOME/start_venv3_12.sh

export path_to_courses=Yandex.Disk/it_learning
export path_to_save=Yandex.Disk/Книги/IT/_courses

declare -a paths=(
    "08_web_scraping/01_web_scraping_with_python"
    "02_CS/01_C/KRC"
    "05_Unix_Bash/Codio_course/UNIX_AND_BASH_FOR_BEGINNERS"
    "05_Unix_Bash/Debian_adm"
    "06_containerization/01_podman/02_podman_in_action"
    "06_containerization/containers_nomenclature"
    "07_server_confuguration/Debian12_SSH_and_PG15_Server_Configuration"
)

for path in "${paths[@]}"
do
	export path_to_file=$(dirname "$path")
    export file_name=$(basename "$path")
    jupyter nbconvert --to html --embed-images "$HOME/$path_to_courses/$path_to_file/$file_name.ipynb"
    mv "$HOME/$path_to_courses/$path_to_file/$file_name.html" "$HOME/$path_to_save/"
done

deactivate

echo "Учиться, учиться и еще раз учиться!"
