#!/bin/bash

. /conf.defaults || exit 1
[[ -f /minecraft/conf.override ]] && source /minecraft/conf.override

cd /minecraft

/usr/bin/java -Xmx${MAXHEAP} -Xms${MINHEAP} -XX:PermSize=${PERMSIZE} -XX:ParallelGCThreads=${GCTHREADS} -jar ${_SRVDIR}/${SERVERJAR} ${JVM_OPTS}
