#!/usr/bin/env bash

set -ex

sudo docker info
sudo sh -c "podman --log-level debug system service -t 0 tcp:127.0.0.1:12121 2>&1 | sed \"s/^/[PODMAN_API] /\"" &
sleep 10 && curl http://127.0.0.1:12121/images/json
cd $GOPATH/src/gitlab.com/gitlab-runner/executors/docker
env PATH="$PATH" sudo -E env PATH="$PATH" go test -v | sed "s/^/[GITLAB_TEST] /"