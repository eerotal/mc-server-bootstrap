#!/bin/sh

trap finish INT KILL TERM

finish() {
	echo "[Info] Received signal, stopping server..."
	exit
}

start_server() {
	java -server -XX:+AggressiveOpts -XX:+AggressiveHeap -Xms512M -Xmx1900M -jar server.jar nogui
}

while true; do
	echo "[Info] Starting server process in 5 seconds..."
	sleep 5
	start_server
done
