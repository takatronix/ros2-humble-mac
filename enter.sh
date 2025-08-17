#!/bin/bash

echo "🚪 ROS2 Humble コンテナ内に入ります..."

# コンテナが起動しているかチェック
if ! docker ps | grep -q "ros2-humble-mac"; then
    echo "❌ コンテナが起動していません。まず ./up.sh を実行してください。"
    exit 1
fi

echo "✅ コンテナ内でbashを起動中..."
echo "💡 終了するには 'exit' または Ctrl+D を入力してください"
echo ""

# コンテナ内でbashを起動
docker exec -it ros2-humble-mac bash
