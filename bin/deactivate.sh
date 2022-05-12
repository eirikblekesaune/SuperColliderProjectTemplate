#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
REPO_FOLDER=$(readlink -f $DIR/..)
SC_CONFIG_FOLDER="$HOME/.config/SuperCollider"
ACTIVATED_ENV_FILE="${SC_CONFIG_FOLDER}/active_sclang_env"

#check if setup is already activated
if [[ -f "${ACTIVATED_ENV_FILE}" ]]; then
	SC_CONFIG_PATH="$HOME/.config/SuperCollider/sclang_conf.yaml"
	DATA_FOLDER=$REPO_FOLDER/data
	LIBRARY_FOLDER=$REPO_FOLDER/lib
	mv "${SC_CONFIG_PATH}.bak" $SC_CONFIG_PATH

	#Delete the file that indicates that the setup is activated
	rm "${ACTIVATED_ENV_FILE}"
	echo 'Deactivated setup'
else
	echo 'No active sclang env'
fi

