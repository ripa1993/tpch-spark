#!/usr/bin/env bash
bin=`dirname "$0"`
bin=`cd "$bin"; pwd`
DIR=`cd $bin/../; pwd`
. "${DIR}/bin/config.sh"
. "${DIR}/bin/functions.sh"

DATA_FOLDER="${DIR}/dbgen/data"

echo "========== generating dataset with scale factor ${SCALE_FACTOR} =========="

echo "generating data using dbgen"
echo_and_run sh -c "rm -r ${DATA_FOLDER}"
for i in $(seq 1 ${NUM_PARTITIONS});
do
    echo_and_run sh -c "cd ${DIR}/dbgen && ${DIR}/dbgen/dbgen -s ${SCALE_FACTOR} -S $i -C ${NUM_PARTITIONS} -f"
done
echo_and_run sh -c "mkdir ${DATA_FOLDER}"
echo_and_run sh -c "mv ${DIR}/dbgen/*.tbl* ${DATA_FOLDER}"

echo "copying files to hdfs"
echo_and_run sh -c "hdfs dfs -rm -r ${HDFS_MASTER}${HDFS_INPUT}"
echo_and_run sh -c "hdfs dfs -mkdir -p ${HDFS_MASTER}${HDFS_INPUT}"

echo_and_run sh -c "hdfs dfs -put ${DATA_FOLDER}/* ${HDFS_MASTER}${HDFS_INPUT}"

echo "creating output folder"
echo_and_run sh -c "hdfs dfs -mkdir -p ${HDFS_MASTER}${HDFS_OUPUT}"

echo "========== finished =========="