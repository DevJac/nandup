#!/usr/bin/env bash

for f in projects/$1/*.tst; do echo $f; sh tools/HardwareSimulator.sh $f; echo; done;
