#!/bin/bash

export CHROMEDRIVER_CDNURL=https://npm.taobao.org/mirrors/chromedriver/
export ELECTRON_MIRROR=https://npm.taobao.org/mirrors/electron/

≈

macaca -v
macaca doctor

# Run sshd
/usr/sbin/sshd

# Detect ip and forward ADB ports outside to outside interface
ip=$(ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}')

echo "no" | android create avd -f -n test -t ${EMULATOR} --abi default/${ARCH}
/usr/local/android-sdk/tools/mksdcard -l sd 128M /sdcard

# Run Macaca In Background
macaca server &

# Run NoSmoke
if [ $# -eq 0 ]
then
nosmoke -s
elif [ $# -eq 1
then
nosmoke -s -c "$1"
elif [ $# -eq 2 ]
then
nosmoke -s -c "$1" -h "$2"
elif [ $# -eq 3 ]
then
nosmoke -s -c "$1" -h "$2" -u "$3"
fi
