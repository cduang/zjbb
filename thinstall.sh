export BIG_DISK="/data"
export THEOS="$BIG_DISK/theos"

apt update && apt install -y build-essential curl git perl fakeroot liblzma-dev lzma unzip xz-utils libssl-dev sudo

rm -rf $THEOS
git clone --recursive https://github.com/theos/theos.git $THEOS

wget https://github.com/kabiroberai/swift-toolchain-linux/releases/download/v2.2.2/swift-5.3.2-RELEASE-ubuntu20.04.tar.gz
mkdir -p $THEOS/toolchain/linux/iphone
tar -xf swift-5.3.2-RELEASE-ubuntu20.04.tar.gz -C $THEOS/toolchain/linux/iphone/
rm swift-5.3.2-RELEASE-ubuntu20.04.tar.gz

mkdir -p $THEOS/sdks
cd $THEOS/sdks
curl -LO https://github.com/theos/sdks/releases/download/master-146e41f/iPhoneOS15.6.sdk.tar.xz
tar -xf iPhoneOS15.6.sdk.tar.xz
rm iPhoneOS15.6.sdk.tar.xz

sed -i '/export THEOS/d' ~/.bashrc
echo "export THEOS=$BIG_DISK/theos" >> ~/.bashrc
source ~/.bashrc

echo "======================================="
echo "编译环境搭建完毕！当前 THEOS 路径: $THEOS"
echo "你可以执行 '$THEOS/bin/nic.pl' 开始你的项目了。"
echo "======================================="
