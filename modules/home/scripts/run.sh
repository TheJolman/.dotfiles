#!/usr/bin/env bash

nohup "$@" >/dev/null 2>&1 &
disown
