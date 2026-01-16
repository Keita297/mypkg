# mypkg

## 概要

本パッケージは、整数値の変化状態を `count_status` トピックとして出力する ROS 2 パッケージです。  
`monitor` ノードは、入力される整数値が増加・停止・減少のいずれであるかを判定します。  
カウンタ系ノードの状態確認やデバッグ用途を想定しています。


---

## ノード一覧

### monitor
値の変化に応じた状態を`count_status` トピックとして publish します。

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
  - `/countup` (`std_msgs/msg/Int16`)

---

## 使用方法

### 実行例

あらかじめ ROS 2 のワークスペースをビルドし、  
`install/setup.bash` を source しておく。

端末①：
```bash
ros2 run mypkg talker
```
端末2：
```bash
ros2 topic echo /count_status
data: "start"
data: "increasing"
```

---

## 動作環境

- OS: Ubuntu 24.04
- ROS 2: Humble Hawksbill
- Python: 3.12

---

## 著作権・ライセンス
Copyright (c) 2025 Keita Arakawa  
This software is released under the BSD-3-Clause License.

---

## 製作者　
荒川佳汰
