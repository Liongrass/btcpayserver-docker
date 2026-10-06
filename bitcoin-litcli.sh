#!/bin/bash

# litd stores its macaroon under a network sub-directory (~/.lit/<network>/lit.macaroon),
# so litcli has to be told which network this deployment runs on. NBITCOIN_NETWORK is
# saved in $BTCPAY_ENV_FILE by btcpay_update_docker_env and re-exported from there by
# the profile script below.
. /etc/profile.d/btcpay-env.sh

docker exec btcpayserver_litd litcli --network="$NBITCOIN_NETWORK" "$@"
