# mypkg

## 概要
本パッケージは、`countup` トピックに流れる整数値を監視し、
その変化状態を `count_status` トピックとして出力する ROS 2 パッケージです。

値が増加しているか、停止しているか、減少しているかを判定することで、
カウンタ系ノードの状態監視やデバッグ用途を想定しています。

---

## ノード一覧

### monitor
`countup` トピックを購読し、値の変化に応じた状態を
`count_status` トピックとして publish します。

- **購読**
  - `/countup` (`std_msgs/Int16`)
- **発行**
  - `/count_status` (`std_msgs/String`)

判定される状態は以下の通りです。

| 条件 | 出力 |
|---|---|
| 初回受信 | `start` |
| 値が増加 | `increasing` |
| 値が変化なし | `stopped` |
| 値が減少 | `decreasing` |

---

### talker
`countup` トピックに整数値を一定周期で publish するサンプルノードです。

- **発行**
  - `/countup` (`std_msgs/Int16`)

---

### listener
`countup` トピックの内容を表示するデバッグ用ノードです。

- **購読**
  - `/countup` (`std_msgs/Int16`)

---

## 使用方法

### 実行例

端末①：
```bash
cd ~/ros2_ws
source install/setup.bash
ros2 run mypkg talker

端末②：
```bash
cd ~/ros2_ws
source install/setup.bash
ros2 run mypkg monitor
