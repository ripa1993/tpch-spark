#!/usr/bin/env bash
QUERY="1"
MASTER="10.0.0.9"
HDFS="10.0.0.4"
SCALE_FACTOR="1"
NUM_PARTITIONS="100"
EXECUTOR_MEMORY="100g"
HDFS_INPUT="/dbgen"
HDFS_OUTPUT=""
APP_MASTER="spark://${MASTER}:7077"
HDFS_MASTER="hdfs://${HDFS}:9000"