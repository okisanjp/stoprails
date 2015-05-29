#!/bin/sh -eu

PIDFILE="tmp/pids/server.pid"
SERVER_PID=`cat $PIDFILE`
kill $SERVER_PID
echo "Stopped WEBRick"
