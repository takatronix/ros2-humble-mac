#!/bin/bash

echo "🔗 ROS-TCP-Endpoint を起動中..."

# コンテナ内でROS-TCP-Endpointを起動
docker exec -it ros2-humble-mac bash -c "
source ~/ros2_ws/install/setup.bash
echo '🚀 ROS-TCP-Endpoint サーバーを起動中...'
echo '📡 ポート: 10000 (ROS2)'
echo '🌐 Unityからの接続を待機中...'
echo '⏹️  停止するには Ctrl+C を押してください'
echo ''

ros2 run ros_tcp_endpoint default_server_endpoint --ros-args -p ROS_IP:=0.0.0.0
"

echo "✅ ROS-TCP-Endpoint が停止しました"
