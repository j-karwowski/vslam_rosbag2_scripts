#!/usr/bin/env bash

readonly SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

readonly ROS_DISTRIBUTION="${1:-humble}"
readonly TARGET_DIR="${2:-$SCRIPT_DIR}"

source /opt/ros/${ROS_DISTRIBUTION}/setup.bash

cd $TARGET_DIR
ros2 bag record \
    --qos-profile-overrides-path "$SCRIPT_DIR/zed_rosbag_record_qos_override.yaml" \
    /zed/zed_node/imu/data \
    /zed/zed_node/imu/data_raw \
    /zed/zed_node/left_gray/image_rect_gray \
    /zed/zed_node/right_gray/image_rect_gray \
    /zed/zed_node/left_gray/camera_info \
    /zed/zed_node/right_gray/camera_info \
    /zed/zed_node/odom \
    /zed/zed_node/path_odom
