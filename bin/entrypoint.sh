#!/usr/bin/env bash
set -x

set -e
if [ -z $HOST ]; then
	export $HOST=127.0.0.1
fi

# This has to match t he one exposed in Dockerfile, so no overriding...
export JMX_PORT=30000
java \
  -Dsun.management.jmxremote.level=FINEST \
  -Dsun.management.jmxremote.handlers=java.util.logging.ConsoleHandler \
  -Djava.util.logging.ConsoleHandler.level=FINEST \
  -Dcom.sun.management.jmxremote.local.only=false \
  -Dcom.sun.management.jmxremote.ssl=false \
  -Dcom.sun.management.jmxremote.authenticate=false \
  -Dcom.sun.management.jmxremote.port=$JMX_PORT \
  -Dcom.sun.management.jmxremote.rmi.port=$JMX_PORT \
  -Djava.rmi.server.hostname=$HOST \
  -jar /opt/app/app.jar

