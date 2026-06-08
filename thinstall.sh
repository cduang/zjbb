export BIG_DISK="/data"

export THEOS="$BIG_DISK/theos"

apt update && apt install -y build-essential curl git perl fakeroot liblzma-dev lzma unzip xz-utils libssl-dev sudo

git clone --recursive https://github.com/theos/theos.git $THEOS

wget https://github.com/kabiroberai/swift-toolchain-linux/releases/download/v2.2.2/swift-5.3.2-RELEASE-ubuntu20.04.tar.gz
mkdir -p $THEOS/toolchain/linux/iphone
tar -xf swift-5.3.2-RELEASE-ubuntu20.04.tar.gz -C $THEOS/toolchain/linux/iphone/
rm swift-5.3.2-RELEASE-ubuntu20.04.tar.gz

curl -LO https://github.com/theos/sdks/archive/master.zip
unzip master.zip
mv sdks-master/* $THEOS/sdks/
rm -rf master.zip sdks-master

echo "export THEOS=$BIG_DISK/theos" >> ~/.bashrc
source ~/.bashrc
