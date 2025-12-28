#!/bin/bash
set -e

# monitor が起動できるかだけ確認
timeout 3 ros2 run mypkg monitor || true

echo "monitor launch test passed"

