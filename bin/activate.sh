#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
REPO_FOLDER=$(readlink -f $DIR/..)
SC_CONFIG_FOLDER="$HOME/.config/SuperCollider"
ACTIVATED_ENV_FILE="${SC_CONFIG_FOLDER}/active_sclang_env"

#check if a setup is already activated
if [[ ! -f "${ACTIVATED_ENV_FILE}" ]]; then
	#Make a backup of the original sclang configuration file
	# assume its location
	SC_CONFIG_PATH="${SC_CONFIG_FOLDER}/sclang_conf.yaml"
	DATA_FOLDER=$REPO_FOLDER/data
	LIBRARY_FOLDER=$REPO_FOLDER/lib

	echo "Making backup of existing sclang_conf.yaml.bak"
	mv ${SC_CONFIG_PATH} ${SC_CONFIG_PATH}.bak

	SED_ARGS="s|\%|${LIBRARY_FOLDER}|"

	echo $(sed -e ${SED_ARGS} "${DATA_FOLDER}/sclang_conf.yaml.template" > ${SC_CONFIG_PATH})

	#Make a file that indicates that the setup is activated
	touch ${ACTIVATED_ENV_FILE}
	echo ${REPO_FOLDER} > ${ACTIVATED_ENV_FILE}
	echo 'Activated setup'
else
	echo $(printf 'A sclang env is already activated from: %s' $(cat ${ACTIVATED_ENV_FILE}))
fi

