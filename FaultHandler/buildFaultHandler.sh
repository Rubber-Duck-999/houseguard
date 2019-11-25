#!/bin/sh

cd ../

./setEnv.sh


if [ -z $BWD ];
then
    echo "Failure in Env Var BWD - " $BWD
    exit 1
else
    cd $BWD/FaultHandler
    export GOPATH=$BWD/FaultHandler
    go get -v github.com/streadway/amqp
    go get -v github.com/sirupsen/logrus
    go get -v github.com/scorredoira/email
    export GOBIN=$GOPATH/bin
    echo $GOPATH
    go install src/Pub/main.go
    exit 0
fi

