#!/usr/bin/env bash
bin=`dirname "$0"`
bin=`cd "$bin"; pwd`
DIR=`cd $bin/../; pwd`
. "${DIR}/bin/config.sh"
. "${DIR}/bin/functions.sh"

echo "========== running query ${QUERY} =========="
APP_CONF="${DIR}/conf/application-run.conf"
JAR="\"${DIR}/target/scala-2.11/spark-tpch-queries.jar\""
CLASS="main.scala.TpchQuery"
OPTION="${QUERY} ${HDFS_MASTER}${HDFS_INPUT} ${HDFS_MASTER}${HDFS_OUTPUT}"
START_TS=`get_start_ts`;

echo_and_run sh -c "cd ${DIR} && sbt assembly"
echo_and_run sh -c "${SPARK_HOME}/bin/spark-submit --jars $JAR --executor-memory ${EXECUTOR_MEMORY} --class $CLASS --master ${APP_MASTER} $JAR ${OPTION} > ${DIR}/results/${QUERY}_run_${START_TS}.dat 2>&1"

exit 0