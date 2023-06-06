#!/usr/bin/env bash
set -e

base=$(pwd)

wget https://www.cananalyser.co.uk/download/CANdoSDK.tar.gz
atool -x CANdoSDK.tar.gz

sudo apt-get install libusb-1.0.0-dev

cd ${base}/CANdoSDK/Driver/Source

make

sudo cp -v libCANdo.so /usr/lib/
sudo chmod +x /usr/lib/libCANdo.so

cd ${base}/CANdoSDK/Driver/Udev

sudo cp -v cando.rules /etc/udev/rules.d/
sudo rm CANdoSDK.tar.gz
