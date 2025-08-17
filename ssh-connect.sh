#!/bin/bash

echo "🔌 SSHでROS2 Humbleコンテナに接続中..."

# コンテナが起動しているかチェック
if ! docker ps | grep -q "ros2-humble-mac"; then
    echo "❌ コンテナが起動していません。まず ./up.sh を実行してください。"
    exit 1
fi

# SSHサーバーが起動しているかチェック
if ! docker exec ros2-humble-mac pgrep -x "sshd" > /dev/null; then
    echo "🔧 SSHサーバーを起動中..."
    docker exec ros2-humble-mac bash -c "
        sudo apt update -qq
        sudo apt install -y openssh-server
        sudo service ssh start
        echo 'ros2:ros2' | sudo chpasswd
    "
fi

echo "✅ SSH接続準備完了！"
echo "🔑 ユーザー名: ros2"
echo "🔑 パスワード: ros2"
echo "🌐 接続先: localhost:2222"
echo ""
echo "💡 SSH接続コマンド:"
echo "ssh -p 2222 ros2@localhost"
echo ""
echo "🚀 今すぐ接続しますか？ (y/n)"
read -r response

if [[ "$response" =~ ^[Yy]$ ]]; then
    echo "🔌 SSH接続を開始します..."
    ssh -p 2222 ros2@localhost
else
    echo "💡 後で接続する場合は以下を実行してください："
    echo "ssh -p 2222 ubuntu@localhost"
fi
