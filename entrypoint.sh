#!/bin/sh
cmd="$@"

new_project_if_folder_empty() {
    num_files=$(find ./ -maxdepth 1 -mindepth 1 | wc -l)

    if [ "${num_files}" == "0" ]; then
        echo "No project files found! Starting a new on with 'ng new'"
        ng new my-ng2-app
    fi
}

nmp_install_if_package_json() {
    if [ -f 'package.json' ]; then 
        echo "Running npm install..."
        npm install
    else 
        echo "No 'package.json' inside $(pwd). Skipping 'npm install'."
    fi
}

bower_install_if_bower_json() {
    if [ -f 'bower.json' ]; then
	echo "Running bower install..."
        bower install
    else 
        echo "No 'bower.json' inside $(pwd). Skipping 'bower install'."
    fi
}

if [ "${cmd}" == "default" ]; then

    echo "Running the default container startup command ..."
    new_project_if_folder_empty || exit
    nmp_install_if_package_json || exit
    bower_install_if_bower_json || exit

    ng serve --host=0.0.0.0
else
    echo "Running the command '${cmd}'..."
    exec $cmd
fi

