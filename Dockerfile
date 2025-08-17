FROM ros2-humble-mac:latest

# メタデータ
LABEL maintainer="ROS2 Humble Development Environment"
LABEL description="ROS2 Humble with comprehensive development tools for Mac ARM64"
LABEL version="1.0"

# 環境変数の設定
ENV ROS_DOMAIN_ID=0
ENV RMW_IMPLEMENTATION=rmw_fastrtps_cpp
ENV ROS_LOCALHOST_ONLY=0
ENV RMW_FASTRTPS_USE_QOS_FROM_XML=0
ENV DISPLAY=:0

# ポートの公開
EXPOSE 6080 10000 2222 8888 8000

# デフォルトコマンド
CMD ["/bin/bash"]
