#!/usr/bin/env bash

docker-compose -f images/build.yml -f infra.yml -f apps.yml $@