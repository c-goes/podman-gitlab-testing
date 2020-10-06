#!/usr/bin/env bash

set -ex

git clone https://github.com/geerlingguy/docker-ubuntu2004-ansible.git
cd docker-ubuntu2004-ansible
git reset --hard 43d611111e0ddbb2110951e49d6dcf1705234cf5
podman build -t test-ubuntu .
