#!/usr/bin/env bash
function echo_and_run() { echo "$@" ; "$@" ; }

function get_start_ts() {
   ts=`ssh ${MASTER} "date +%F-%T"`
   echo $ts
}