#!/bin/sh -xe

mkdir -p /app/build
cd /app/build
tar zxvf ../libmpsse-1.3.tar.gz
cd libmpsse/src
./configure --prefix=/usr --disable-python
make
make install

cd /app/build
git clone https://github.com/AAEONAEU-SW/lora_gateway_mirakonta.git
cd lora_gateway
make clean all

cd /app/build
git clone https://github.com/AAEONAEU-SW/packet_forwarder_mirakonta.git
cd packet_forwarder
make

cd /app
cp build/packet_forwarder/basic_pkt_fwd/basic_pkt_fwd .

rm -rf build/
