#!/bin/bash -eu

# railsプロジェクト配下にあるはずのpidファイル
PIDFILE="tmp/pids/server.pid"

# pidファイルの存在をチェック
if [ -e $PIDFILE ]; then
  # ファイルの中にpidが入ってます
  SERVER_PID=`cat $PIDFILE`
  # 現在位置
  PWD=`pwd`
  # 一応確認する
  echo -n "[$PWD] Are you sure you want to exit the server? [y/n] > "
  # y:終了 n:キャンセル それ以外:入力待ちへ
  while :
  do
    read INPUT
    case "$INPUT" in
      "y" ) kill $SERVER_PID
            echo `date '+%Y/%m/%d %T'`" Stopped WEBRick"
            break ;;
      "n" ) echo `date '+%Y/%m/%d %T'`" Canceled."
            break ;;
      * )   echo "[y/n]" ;;
    esac
  done
else
  # pidファイルがなければエラーとして終了
  echo "$PIDFILE file not exists." 1>&2
  exit 1
fi
exit 0
