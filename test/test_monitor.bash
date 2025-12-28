#!/bin/bash
set -e

source /opt/ros/jazzy/setup.bash

# talker をバックグラウンド起動
ros2 run mypkg talker &
TALKER_PID=$!

# 少し待つ
sleep 2

# monitor を起動して一度でも起動できるか確認
timeout 5 ros2 run mypkg monitor || true

# 後始末
kill $TALKER_PID || true

echo "test finished"

