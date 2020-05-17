#!/bin/sh

trap on_sig_term_kill_int TERM KILL INT

RESTART_INTERVAL=10

on_sig_term_kill_int() {
	echo ""
	echo "[Info] Received signal, stopping server..."
	exit 0
}

run() {
	echo "[Info] Starting server..."

	while true; do
		java \
			-Xmx1800M \
			-Xms256M \
			-XX:+UseG1GC \
			-jar server.jar \
			nogui

		echo "[Info] Restarting server in $RESTART_INTERVAL second(s)."
		sleep "$RESTART_INTERVAL"
	done
}

run
