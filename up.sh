#!/bin/bash

echo "🚀 ROS2 Humble Docker Compose を起動中..."

# ワークスペースディレクトリが存在しない場合は作成
if [ ! -d ~/ros2_ws ]; then
    echo "📁 ~/ros2_ws ディレクトリを作成中..."
    mkdir -p ~/ros2_ws
fi

# Docker Composeで起動
docker-compose up -d

echo "✅ ROS2 Humble が起動しました！"
echo ""
echo "🌐 VNC Webアクセス: http://127.0.0.1:6080"
echo "🔌 ROS2通信ポート: 10000"
echo "📁 ワークスペース: ~/ros2_ws"
echo ""
echo "📋 コンテナ状態確認: docker-compose ps"
echo "📋 ログ確認: docker-compose logs -f"
echo "🛑 停止: ./down.sh"
