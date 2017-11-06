#!/usr/bin/env bash

docker-compose -f images.yml -f infra.yml -f apps.yml $@