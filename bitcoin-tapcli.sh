#!/bin/bash

# litd multiplexes every subserver onto its own TLS port, so tapcli has to be pointed
# at litd rather than at its standalone default. The macaroon lives under a network
# sub-directory, which is why --network is passed: NBITCOIN_NETWORK is saved in
# $BTCPAY_ENV_FILE by btcpay_update_docker_env and re-exported by the profile script.
. /etc/profile.d/btcpay-env.sh

docker exec btcpayserver_litd tapcli \
    --rpcserver=localhost:8443 \
    --tlscertpath=/root/.lit/tls.cert \
    --network="$NBITCOIN_NETWORK" \
    "$@"
