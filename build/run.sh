#!/usr/bin/env bash
HERE=`pwd`
FALCON=$HERE/falcon-plus

if [ -n $GOPATH ];then
    FALCON=$GOPATH/src/github.com/open-falcon/falcon-plus
fi

if [ ! -d $FALCON ];then
    git clone https://github.com/open-falcon/falcon-plus.git $FALCON
fi

which docker
if [ $? != 0 ];then
    echo "need install docker"
    exit
fi

sudo docker pull golang

cd $FALCON;git pull

cd $HERE
mkdir -p dist
dist=$HERE/dist


sudo docker run -v $FALCON:/go/src/github.com/open-falcon/falcon-plus -v $HERE/build.sh:/build.sh golang /build.sh

cp $FALCON/open-falcon-*.tar.gz $dist/
