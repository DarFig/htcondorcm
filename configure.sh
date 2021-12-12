#!/bin/bash

#get_htcondor --no-dry-run --channel stable --central-manager $CENTRAL_MANAGER --password $HTCONDOR_PASSWORD 

CONFIG_FILE="/etc/condor/config.d/01-central-manager.config"
sh -c "echo CONDOR_HOST = ${CENTRAL_MANAGER} > ${CONFIG_FILE}"
sh -c "echo '# For details, run condor_config_val use role:get_htcondor_central_manager' >> ${CONFIG_FILE}"
sh -c "echo 'use role:get_htcondor_central_manager' >> ${CONFIG_FILE}"


#token
sh -c "rm -f /etc/condor/config.d/00-htcondor-${VERSION_M}.config"
echo -n "${HTCONDOR_PASSWORD}" | sh -c "condor_store_cred add -c -i -"
# Now issue myself a token.
sh -c "umask 0077; condor_token_create -identity condor@${CENTRAL_MANAGER} > /etc/condor/tokens.d/condor@${CENTRAL_MANAGER}"

#start service
if [ "$(ps --pid 1 -o comm -h)" != 'systemd' ] || ! command_exists systemctl; then
		echo -e "\n# Start the HTCondor service in the background (without systemd)"
		(
			if ! is_dry_run; then
				set -x
			fi
			$sh_c "condor_master"
		)
	else
		echo -e "\n# Start the HTCondor service via systemd"
		(
			if ! is_dry_run; then
				set -x
			fi
			$sh_c "systemctl enable condor"
			$sh_c "systemctl start condor"
		)
fi


./run.sh
