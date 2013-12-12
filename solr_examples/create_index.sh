#!/bin/bash

# create the index if it does not exits
curl -s -XPUT http://localhost:8098/yz/index/cities > /dev/null

# output the current indecies
curl -s http://localhost:8098/yz/index | ruby -npe '$_.scan(/\[.*\]/).first' | python -mjson.tool




