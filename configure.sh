#!/bin/bash

get_htcondor --no-dry-run --channel stable --central-manager $CENTRAL_MANAGER --password $HTCONDOR_PASSWORD 

./run.sh
