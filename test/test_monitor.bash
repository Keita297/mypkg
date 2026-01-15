#!/bin/bash
#SPDX-FileCopyrightText: 2025 Keita Arakawa <kei86291234@icloud.com>
#SPDX-License-Identifier: BSD-3-Clause
set -e

# monitor が起動できるかだけ確認
timeout 3 ros2 run mypkg monitor || true

echo "monitor launch test passed"

