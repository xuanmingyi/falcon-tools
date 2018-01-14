#!/usr/bin/env bash
HERE=`pwd`
FALCON=$GOPATH/src/github.com/open-falcon/falcon-plus
sudo docker pull golang

cd $FALCON;git pull

cd $HERE
mkdir -p dist
dist=$HERE/dist


sudo docker run -v $FALCON:/go/src/github.com/open-falcon/falcon-plus -v $HERE/build.sh:/build.sh golang /build.sh

cp $FALCON/open-falcon-*.tar.gz $dist/
