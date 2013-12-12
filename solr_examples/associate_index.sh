#!/bin/bash

# associate the bucket with the index
curl -s -XPUT -H "Content-Type: application/json" -d '{"props":{"yz_index":"cities"}}' http://localhost:8098/buckets/cities/props

# show the bucket properties
curl -s http://localhost:8098/buckets/cities/props | python -mjson.tool
