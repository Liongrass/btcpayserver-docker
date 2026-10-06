#!/bin/bash

docker exec btcpayserver_litd litcli --macaroonpath /root/.lit/admin.macaroon "$@"
