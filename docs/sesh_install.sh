#!/bin/bash

# install go
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz

# install sesh
PATH=$PATH:/usr/local/go/bin go install github.com/joshmedeski/sesh@latest
