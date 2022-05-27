#!/bin/bash

#loadkeys de_CH-latin1

#/usr/bin/powersave
#/usr/bin/performance

sysctl dev.i915.perf_stream_paranoid=0

HOME=/home/alba4k uptime-record -b
