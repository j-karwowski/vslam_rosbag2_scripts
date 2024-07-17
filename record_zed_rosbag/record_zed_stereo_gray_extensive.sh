#!/usr/bin/env bash

set -e

readonly SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
readonly TARGET_DIR="${1:-$SCRIPT_DIR}"
echo ""
echo "Remember to source the ZED-related workspace as some topics are ZED-specific!"
echo ""

cd $TARGET_DIR
ros2 bag record \
    /zed/zed_node/imu/data \
    /zed/zed_node/imu/data_raw \
    /zed/zed_node/imu/mag \
    /zed/zed_node/left_gray/image_rect_gray \
    /zed/zed_node/right_gray/image_rect_gray \
    /zed/zed_node/left_gray/camera_info \
    /zed/zed_node/right_gray/camera_info \
    /zed/zed_node/odom \
    /zed/zed_node/path_odom \
    /zed/zed_node/path_map \
    /clicked_point \
    /diagnostics \
    /tf \
    /tf_static \
    /zed/zed_node/left_cam_imu_transform \
    /zed/zed_node/depth/camera_info \
    /zed/zed_node/depth/depth_info \
    /zed/zed_node/depth/depth_registered \
    /zed/zed_node/point_cloud/cloud_registered \
    /zed/zed_node/disparity/disparity_image \
    /zed/zed_node/confidence/confidence_map \
    /zed/plane \
    /zed/plane_marker \
    /zed/zed_node/pose \
    /zed/zed_node/pose/status \
    /zed/zed_node/pose_with_covariance \
    /zed/zed_node/atm_press \
    /zed/zed_node/temperature/imu \
    /zed/zed_node/temperature/left \
    /zed/zed_node/temperature/right
