#!/bin/bash
set -e

timeout 5 ros2 run mypkg monitor > log.txt &
sleep 1
ros2 topic pub -1 /countup std_msgs/msg/Int16 "{data: 1}"
sleep 1
grep increasing log.txt

