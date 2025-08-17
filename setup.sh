#!/bin/bash

echo "🚀 ROS2コンテナ内の完全環境を自動構築中..."

echo "📦 必要なパッケージをインストール中..."

# システムアップデート
echo '🚀 システムアップデート中...'
sudo apt update -qq

echo '📦 基本ツールをインストール中...'
sudo apt install -y curl wget git vim nano htop tree unzip zip

echo '🐍 Python関連ツールをインストール中...'
sudo apt install -y python3-pip python3-venv python3-dev python3-opencv
sudo apt install -y python3-setuptools python3-wheel
pip3 install --user jupyter notebook ipython

echo '🔧 開発ツールをインストール中...'
sudo apt install -y build-essential cmake pkg-config
sudo apt install -y ninja-build ccache

echo '🌐 nvmとNode.jsをインストール中...'
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
export NVM_DIR=\"\$HOME/.nvm\"
[ -s \"\$NVM_DIR/nvm.sh\" ] && \. \"\$NVM_DIR/nvm.sh\"
[ -s \"\$NVM_DIR/bash_completion\" ] && \. \"\$NVM_DIR/bash_completion\"

echo '📦 Node.js LTS版をインストール中...'
nvm install --lts
nvm use --lts
nvm alias default node

echo '🔧 グローバルnpmパッケージをインストール中...'
npm install -g yarn pnpm typescript ts-node nodemon

echo '🤖 AIコーディング支援ツールをインストール中...'
pip3 install --user claude-code anthropic openai codex mcp

echo '🔧 ROS2関連ツールをインストール中...'
sudo apt install -y ros-humble-rviz2 ros-humble-gazebo-ros-pkgs ros-humble-gazebo-plugins
sudo apt install -y ros-humble-gazebo-dev ros-humble-gazebo-msgs

echo '📷 カメラ・ビジョン関連ツールをインストール中...'
sudo apt install -y ros-humble-cv-bridge ros-humble-image-transport
sudo apt install -y ros-humble-compressed-image-transport ros-humble-pcl-conversions ros-humble-pcl-ros
sudo apt install -y ros-humble-image-pipeline ros-humble-vision-opencv
sudo apt install -y ffmpeg

echo '🌐 Web・ストリーミング関連ツールをインストール中...'
sudo apt install -y ros-humble-web-video-server ros-humble-rosbridge-suite
sudo apt install -y ros-humble-rosapi ros-humble-rosauth

echo '🔧 開発・デバッグツールをインストール中...'
sudo apt install -y ros-humble-rqt ros-humble-rqt-common-plugins ros-humble-rqt-graph
sudo apt install -y ros-humble-rqt-plot ros-humble-rqt-console ros-humble-rqt-top
sudo apt install -y ros-humble-rqt-image-view ros-humble-rqt-bag

echo '📊 可視化・分析ツールをインストール中...'
sudo apt install -y ros-humble-plotjuggler ros-humble-plotjuggler-ros
sudo apt install -y ros-humble-tf2-tools ros-humble-tf2-ros

echo '🔧 Intel OpenVINO関連ツールをインストール中...'
sudo apt install -y intel-openvino-dev-ubuntu20-2023.1.0
pip3 install --user openvino openvino-dev opencv-python-inference-engine

echo '📷 Intel RealSense関連ツールをインストール中...'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
sudo add-apt-repository "deb https://librealsense.intel.com/Debian/apt-repo \$(lsb_release -cs) main"
sudo apt update
sudo apt install -y librealsense2-dkms librealsense2-utils librealsense2-dev librealsense2-dbg
pip3 install --user pyrealsense2 realsense-ros
sudo apt install -y ros-humble-realsense2-camera ros-humble-realsense2-description ros-humble-realsense2-msgs

echo '🗺️ RTAB-Map関連ツールをインストール中...'
sudo apt install -y ros-humble-rtabmap-ros ros-humble-rtabmap-msgs
sudo apt install -y ros-humble-rtabmap-slam ros-humble-rtabmap-viz
sudo apt install -y ros-humble-rtabmap-util ros-humble-rtabmap-demos

echo '🔗 Unity-ROS2統合用ROS-TCP-Endpointをインストール中...'
cd ~/ros2_ws/src
git clone -b ROS2v0.7.0 https://github.com/Unity-Technologies/ROS-TCP-Endpoint
cd ~/ros2_ws
colcon build
source ~/ros2_ws/install/setup.bash
echo 'source ~/ros2_ws/install/setup.bash' >> ~/.bashrc

echo '🤖 AI/ML開発ツールをインストール中...'
pip3 install --user torch torchvision
pip3 install --user scikit-learn scikit-image
pip3 install --user opencv-python opencv-contrib-python
pip3 install --user ultralytics onnx onnxruntime
pip3 install --user segmentation-models-pytorch
echo '🚀 YOLOv10対応: ultralytics最新版でYOLOv10をサポート'

echo '📊 データ分析・可視化ツールをインストール中...'
pip3 install --user numpy pandas matplotlib seaborn
pip3 install --user jupyter notebook
pip3 install --user fastapi uvicorn[standard] pydantic

echo '🔧 C++開発ツールをインストール中...'
sudo apt install -y clang-format clang-tidy cppcheck valgrind
sudo apt install -y gdb lldb

echo '📊 システム監視・分析ツールをインストール中...'
sudo apt install -y htop iotop nethogs iftop sysstat
sudo apt install -y strace ltrace
sudo apt install -y net-tools iputils-ping traceroute
sudo apt install -y avahi-daemon

echo '🔍 コード検索・分析ツールをインストール中...'
sudo apt install -y ripgrep fd-find fzf exuberant-ctags cscope global
sudo apt install -y silversearcher-ag

echo '📁 ファイル管理・編集ツールをインストール中...'
sudo apt install -y ranger mc neovim emacs-nox tmux screen

echo '🎨 ターミナル美化ツールをインストール中...'
sudo apt install -y zsh
# oh-my-zshは重いのでスキップ
echo '⚠️ oh-my-zshはスキップ（サイズ削減のため）'

echo '📝 設定ファイルを更新中...'
echo 'export NVM_DIR=\"\$HOME/.nvm\"' >> ~/.bashrc
echo '[ -s \"\$NVM_DIR/nvm.sh\" ] && \. \"\$NVM_DIR/nvm.sh\"' >> ~/.bashrc
echo '[ -s \"\$NVM_DIR/bash_completion\" ] && \. \"\$NVM_DIR/bash_completion\"' >> ~/.bashrc
echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.bashrc

echo '🔧 DDS設定を追加中...'
echo 'export RMW_IMPLEMENTATION=rmw_fastrtps_cpp' >> ~/.bashrc
echo 'export ROS_LOCALHOST_ONLY=0' >> ~/.bashrc
echo 'export RMW_FASTRTPS_USE_QOS_FROM_XML=0' >> ~/.bashrc
echo 'unset FASTRTPS_DEFAULT_PROFILES_FILE' >> ~/.bashrc
echo 'unset FASTDDS_DEFAULT_PROFILES_FILE' >> ~/.bashrc

echo '✅ 完全環境構築完了！'
echo ''
echo '📋 インストールされたツール:'
echo '  - ROS2: rviz2, gazebo, rqt, plotjuggler'
echo '  - RTAB-Map: SLAM, マッピング, 可視化'
echo '  - ROS-TCP-Endpoint: Unity-ROS2統合'
echo '  - OpenVINO: Intel推論エンジン'
echo '  - RealSense: SDK, ROS2統合'
echo '  - YOLO: ultralytics, YOLOv5/v8, ONNX'
echo '  - UNet: segmentation-models-pytorch'
echo '  - AI/ML: PyTorch, scikit-learn'
echo '  - 開発: clang-format, gdb, valgrind'
echo '  - Python: Jupyter, numpy, pandas, matplotlib'
echo '  - Node.js: nvm, LTS版, TypeScript'
echo '  - その他: システム監視, ファイル管理'
echo ''
echo '🚀 再起動後に環境が有効になります'

echo "✅ 完全環境構築が完了しました！"
echo ""
echo "🔄 コンテナを再起動して環境を有効化してください："
echo "./down.sh && ./up.sh"
echo ""
echo "🔍 インストール確認："
echo "docker exec -it ros2-humble-mac bash -c 'ros2 pkg list | grep -E \"(rtabmap|rviz|gazebo)\"'"
