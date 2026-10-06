#!/bin/bash

# litd multiplexes every subserver onto its own TLS port, so litcli is pointed at litd
# rather than at its standalone default. The fragment keeps each daemon's data under
# the single /lit volume, and macaroons live in a network sub-directory - hence
# NBITCOIN_NETWORK, saved in $BTCPAY_ENV_FILE and re-exported by the profile script.
. /etc/profile.d/btcpay-env.sh

docker exec btcpayserver_litd litcli \
    --basedir="/lit/.lit/" \
    --network="$NBITCOIN_NETWORK" \
    "$@"
