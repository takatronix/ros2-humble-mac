#!/bin/bash

echo "🛑 ROS2 Humble Docker Compose を停止中..."

# Docker Composeで停止
docker-compose down

echo "✅ ROS2 Humble が停止しました！"
echo ""
echo "📋 コンテナ状態確認: docker-compose ps"
echo "🚀 再起動: ./up.sh"
