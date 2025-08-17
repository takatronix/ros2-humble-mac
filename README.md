# ROS2 Humble Development Environment for Mac

Mac（ARM64）用のROS2 Humble完全開発環境です。Dockerを使用してROS2、AI/ML、コンピュータビジョン、SLAMなどの開発に必要なツールを一式提供します。

## 🚀 特徴

- **ROS2 Humble**: 最新のROS2環境
- **AI/ML開発**: PyTorch, OpenVINO, YOLO, UNet
- **コンピュータビジョン**: OpenCV, RealSense SDK
- **SLAM**: RTAB-Map統合
- **Unity統合**: ROS-TCP-Endpoint
- **開発ツール**: clang-format, gdb, valgrind, ninja, ccache
- **Python環境**: Jupyter, FastAPI, データ分析ライブラリ
- **Node.js環境**: nvm, LTS版, TypeScript
- **システムツール**: avahi-daemon, ネットワーク監視
- **ファイル管理**: neovim, emacs, tmux, ranger

## 📋 システム要件

- macOS (ARM64/Apple Silicon)
- Docker Desktop
- 最低8GB RAM（推奨16GB以上）
- 最低20GB 空き容量

## 🛠️ インストール

### 1. リポジトリのクローン

```bash
git clone https://github.com/yourusername/ros2-humble-mac.git
cd ros2-humble-mac
```

### 2. 環境の起動

```bash
# 初回起動
./up.sh

# 環境セットアップ（初回のみ）
docker exec -it ros2-humble-mac bash -c "cd /home/ubuntu && ./setup.sh"
```

### 3. 環境の停止

```bash
./down.sh
```

## 🌐 アクセス方法

### VNC Webアクセス
- **URL**: http://127.0.0.1:6080
- **ポート**: 6080

### SSH接続
```bash
./ssh-connect.sh
# ユーザー: ros2, パスワード: ros2
```

### 直接アクセス
```bash
./enter.sh
```

## 📁 ボリュームマウント

- `~/ros2_ws` → `/home/ubuntu/ros2_ws` (ROS2ワークスペース)
- `~/.ssh` → `/home/ubuntu/.ssh` (SSH設定)
- `~/Documents` → `/home/ubuntu/Documents` (読み取り専用)
- `~/Downloads` → `/home/ubuntu/Downloads` (読み書き可能)

## 🔧 ポート設定

| サービス | ポート | 説明 |
|---------|--------|------|
| VNC | 6080 | Web VNCアクセス |
| ROS2 | 10000 | ROS2通信 |
| SSH | 2222 | SSH接続 |
| Jupyter | 8888 | Jupyter Notebook |
| FastAPI | 8000 | FastAPIサーバー |

## 🚀 ROS-TCP-Endpoint起動

Unityとの統合用にROS-TCP-Endpointを起動：

```bash
./start-ros-tcp-endpoint.sh
```

## 📦 インストール済みツール

### ROS2関連
- rviz2, gazebo, rqt, plotjuggler
- RTAB-Map (SLAM, マッピング, 可視化)
- ROS-TCP-Endpoint (Unity統合)
- RealSense2 ROS2統合

### AI/ML開発
- **PyTorch**: torch, torchvision
- **OpenVINO**: Intel推論エンジン
- **YOLO**: ultralytics, YOLOv5/v8, YOLOv10対応
- **UNet**: segmentation-models-pytorch
- **scikit-learn**: 機械学習
- **OpenCV**: opencv-python, opencv-contrib-python

### 開発ツール
- **C++**: clang-format, clang-tidy, cppcheck, valgrind, gdb, lldb
- **ビルド**: ninja-build, ccache
- **Python**: black, flake8, isort, mypy
- **システム**: htop, iotop, nethogs, iftop, sysstat, avahi-daemon

### Python環境
- **Jupyter**: notebook, ipython
- **データ分析**: numpy, pandas, matplotlib, seaborn
- **Web**: FastAPI, uvicorn, pydantic
- **その他**: ffmpeg, net-tools, iputils-ping, traceroute

### Node.js環境
- **nvm**: Node Version Manager
- **Node.js**: LTS版
- **パッケージ**: yarn, pnpm, typescript, ts-node, nodemon

### ファイル管理・編集
- **エディタ**: neovim, emacs-nox
- **ターミナル**: tmux, screen
- **ファイル管理**: ranger, mc
- **シェル**: zsh

## 🔧 DDS設定

ROS2通信のためのDDS設定：

```bash
export ROS_DOMAIN_ID=0
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
export ROS_LOCALHOST_ONLY=0
export RMW_FASTRTPS_USE_QOS_FROM_XML=0
```

## 📝 使用方法

### 基本的なROS2コマンド

```bash
# コンテナに入る
./enter.sh

# ROS2パッケージ一覧
ros2 pkg list

# トピック一覧
ros2 topic list

# ノード一覧
ros2 node list
```

### ワークスペースでの開発

```bash
# ワークスペースに移動
cd ~/ros2_ws

# パッケージのビルド
colcon build

# 環境の読み込み
source install/setup.bash
```

## 🐳 Dockerイメージ

### カスタムイメージの作成

現在の環境からカスタムイメージを作成：

```bash
docker commit ros2-humble-mac ros2-humble-mac:latest
```

### Dockerfile

提供されているDockerfileを使用：

```bash
docker build -t ros2-humble-mac:custom .
```

## 📚 トラブルシューティング

### よくある問題

1. **ポートが使用中**
   ```bash
   lsof -i :6080
   ```

2. **コンテナが起動しない**
   ```bash
   docker-compose logs
   ```

3. **環境セットアップが失敗**
   ```bash
   docker exec -it ros2-humble-mac bash -c "cd /home/ubuntu && ./setup.sh"
   ```

### ログの確認

```bash
# コンテナログ
docker-compose logs -f

# 特定のサービスのログ
docker-compose logs ros2-humble
```

## 🔄 更新・メンテナンス

### 環境の更新

```bash
# コンテナを停止
./down.sh

# 最新のイメージで起動
./up.sh

# 環境セットアップを再実行
docker exec -it ros2-humble-mac bash -c "cd /home/ubuntu && ./setup.sh"
```

### イメージの更新

```bash
# 新しいイメージを作成
docker commit ros2-humble-mac ros2-humble-mac:$(date +%Y%m%d)

# 古いイメージを削除
docker rmi ros2-humble-mac:old
```

## 📊 パフォーマンス

- **イメージサイズ**: 約15.9GB
- **起動時間**: 約30秒
- **メモリ使用量**: 約2-4GB（使用状況による）

## 🤝 貢献

1. このリポジトリをフォーク
2. フィーチャーブランチを作成
3. 変更をコミット
4. プルリクエストを作成

## 📄 ライセンス

このプロジェクトはMITライセンスの下で公開されています。

## 🙏 謝辞

- [tiryoh/ros2-desktop-vnc](https://github.com/tiryoh/ros2-desktop-vnc) - ベースイメージ
- ROS2コミュニティ
- Intel OpenVINO
- Unity Technologies (ROS-TCP-Endpoint)

## 📞 サポート

問題や質問がある場合は、GitHubのIssuesを作成してください。

---

**注意**: この環境は開発・テスト目的で設計されています。本番環境での使用は推奨されません。
