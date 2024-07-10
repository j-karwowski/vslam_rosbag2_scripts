#!/usr/bin/env bash

set -e

echo "Remember to source the workspace with the ZED Wrapper beforehand!"
readonly SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
readonly SERVICE_NAME="${1:-/zed/zed_node/start_svo_rec}"

readonly DEFAULT_SVO_FILE="${SCRIPT_DIR}/$(date +'%Y-%m-%d-%H-%M')_zed"
readonly SVO_FILENAME="${2:-$DEFAULT_SVO_FILE}"

readonly BITRATE="${3:-30000}"
readonly COMPRESSION_MODE="${4:-1}"
readonly TARGET_FRAMERATE="${5:-30}"
readonly INPUT_TRANSCODE="${6:-false}"

echo "Calling '${SERVICE_NAME}' service"
# According to "zed-ros2-wrapper/zed-ros2-interfaces/srv/StartSvoRec.srv"
# * uint32 bitrate -> Bitrate - 0 or [1000,60000]
# * uint8 compression_mode -> Compression Mode - [0,2]
#   * 0 -> LOSSLESS
#   * 1 -> H264 (AVCHD)
#   * 2 -> H265 (HEVC)
# * uint32 target_framerate -> Target Framerate;
#   * Allowed framerates are 0,15,30, 60 or 100.
#   * Any other values will be discarded and camera FPS will be taken.
# * bool input_transcode -> Input Transcode
# * string svo_filename -> Filename without an extension
ros2 service call \
    ${SERVICE_NAME} \
    zed_interfaces/srv/StartSvoRec \
    "{\
        bitrate: ${BITRATE},\
        compression_mode: ${COMPRESSION_MODE},\
        target_framerate: ${TARGET_FRAMERATE},\
        input_transcode: ${INPUT_TRANSCODE},\
        svo_filename: ${SVO_FILENAME}\
    }"
echo "Recording SVO2 file at '${SVO_FILENAME}'"
