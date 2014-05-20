#!/bin/sh

cd `dirname $0`
git pull
git submodule update --init --recursive
