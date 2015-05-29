#!/bin/sh -eu

PIDFILE="tmp/pids/server.pid"

if [ -e $PIDFILE ]; then
  SERVER_PID=`cat $PIDFILE`
  PWD=`pwd`
  if [ `uname` = "Darwin" ]; then
    /bin/echo -n "[$PWD] Are you sure you want to exit the server? [y/n] > "
  else
    echo -n "[$PWD] Are you sure you want to exit the server? [y/n] > "
  fi
  while :
  do
    read INPUT
    case "$INPUT" in
      "y" ) kill $SERVER_PID
            echo "Stopped WEBRick"
            break ;;
      "n" ) echo "Canceled."
            break ;;
      * )   echo "[y/n]" ;;
    esac
  done
else
  echo "$PIDFILE file not exists." 1>&2
  exit 1
fi
exit 0
