#!/usr/bin/env bash

export MEM_SIZE=$1
export JAR_MODULE=/app/$2
export NEWRELIC_CONFIGFILE=$3
export IP=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
export NEWRELIC_ARGS="-javaagent:/newrelic/newrelic.jar -Dnewrelic.config.file=/newrelic/config/$NEWRELIC_CONFIGFILE"
export MEM_ARGS="-Xmx$1m -Xss$1m"
export INTERPRETED_MODE="-Xint"
export JVM_ARGS="-server -XX:+TieredCompilation -XX:TieredStopAtLevel=1"

echo "Executing java -jar $NEWRELIC_ARGS $MEM_ARGS $JVM_ARGS $JAR_MODULE"
java -jar $NEWRELIC_ARGS $MEM_ARGS $JVM_ARGS $JAR_MODULE
