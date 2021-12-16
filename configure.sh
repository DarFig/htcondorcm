#!/bin/bash

#get_htcondor --no-dry-run --channel stable --central-manager $CENTRAL_MANAGER --password $HTCONDOR_PASSWORD 
#----
#CONFIG_FILE="/etc/condor/config.d/01-central-manager.config"
#sh -c "echo CONDOR_HOST = ${CENTRAL_MANAGER} > ${CONFIG_FILE}"
#sh -c "echo '# For details, run condor_config_val use role:get_htcondor_central_manager' >> ${CONFIG_FILE}"
#sh -c "echo 'use role:get_htcondor_central_manager' >> ${CONFIG_FILE}"


#token
#sh -c "rm -f /etc/condor/config.d/00-htcondor-${VERSION_M}.config"
#echo -n "${HTCONDOR_PASSWORD}" | sh -c "condor_store_cred add -c -i -"
# Now issue myself a token.
#sh -c "umask 0077; condor_token_create -identity condor@${CENTRAL_MANAGER} > /etc/condor/tokens.d/condor@${CENTRAL_MANAGER}"

#systemctl enable condor
#systemctl start condor

./run.sh
