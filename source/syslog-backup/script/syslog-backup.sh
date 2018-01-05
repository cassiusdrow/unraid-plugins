#!/bin/bash
#
# Copy syslog to flash drive periodically
#
logdir="/boot/syslogs/cp"
logdirfn="${logdir}/syslogdircp.txt"
logdircp=

if [ -n "${1}" ]
then
   #
   # Fresh boot, make new directory and save it
   #
   logdircp="${logdir}/boot-`date +%Y-%m-%d-%H-%M-%S`"
   mkdir -p "${logdircp}"
   echo -n "${logdircp}" > "${logdirfn}"
else
   #
   # cron call, retrieve log cp directory
   #
   logdircp=`cat "${logdirfn}"`
fi

if [ -n "${logdircp}" ]
then
   #
   # copy syslog to log cp directory
   #
   cp /var/log/syslog* "${logdircp}"
fi
