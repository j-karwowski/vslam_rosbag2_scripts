#!/usr/bin/env bash

set -e

echo "Remember to source the workspace with the ZED Wrapper beforehand!"
readonly SERVICE_NAME="${1:-/zed/zed_node/stop_svo_rec}"

echo "Calling '${SERVICE_NAME}' service"
ros2 service call \
    ${SERVICE_NAME} \
    std_srvs/srv/Trigger \
    {}
