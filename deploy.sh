#!/bin/bash
set -ex
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
helm upgrade --install --timeout 600 robot $SCRIPTPATH/robot-VERSION.tgz
helm upgrade --install --timeout 600 server $SCRIPTPATH/server-VERSION.tgz
