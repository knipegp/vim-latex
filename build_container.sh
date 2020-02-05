#!/bin/bash
docker build -f ./Dockerfile . -t vim-latex --build-arg USER_ID="$(id -u)" --build-arg GROUP_ID="$(id -g)"
