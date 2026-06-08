# 1. 定义大硬盘路径为 /data
export BIG_DISK="/data"

# 2. 设置 Theos 环境变量，指向大硬盘
export THEOS="$BIG_DISK/theos"

# 3. 安装系统基础依赖 (装在系统盘，占用极小)
apt update && apt install -y build-essential curl git perl fakeroot liblzma-dev lzma unzip xz-utils libssl-dev sudo

# 4. 把 Theos 本体克隆到大硬盘
git clone --recursive https://github.com/theos/theos.git $THEOS

# 5. 下载并解压 Linux 交叉编译工具链到大硬盘
wget https://github.com/kabiroberai/swift-toolchain-linux/releases/download/v2.2.2/swift-5.3.2-RELEASE-ubuntu20.04.tar.gz
mkdir -p $THEOS/toolchain/linux/iphone
tar -xf swift-5.3.2-RELEASE-ubuntu20.04.tar.gz -C $THEOS/toolchain/linux/iphone/
rm swift-5.3.2-RELEASE-ubuntu20.04.tar.gz

# 6. 下载并解压 iOS SDK 到大硬盘
curl -LO https://github.com/theos/sdks/archive/master.zip
unzip master.zip
mv sdks-master/* $THEOS/sdks/
rm -rf master.zip sdks-master

# 7. 将环境变量永久写入配置，防止断开 SSH 后失效
echo "export THEOS=$BIG_DISK/theos" >> ~/.bashrc
source ~/.bashrc