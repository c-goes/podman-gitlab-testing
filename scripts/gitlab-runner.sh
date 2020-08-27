#!/usr/bin/env bash

set -ex

sudo docker info
sudo docker --log-level debug system service -t 0 tcp:localhost:12121 &
sleep 10 && curl http://localhost:12121/images/json
cd $GOPATH/src/gitlab.com/gitlab-runner/executors/docker
env PATH="$PATH" sudo -E env PATH="$PATH" go test -v