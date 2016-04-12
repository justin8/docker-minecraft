#!/bin/bash
# Based on 15 minutely backups
MAX_BACKUPS=$((60/15 * 24 * 2))
BACKUP=$(date +%Y-%m-%d_%H:%M)
INC=''
BACKUP_PREVIOUS=''
cd "$(dirname "$(readlink -f "$0")")"
mkdir -p backups

set_rsync_opts() {
	BACKUP_PREVIOUS=$(find backups -maxdepth 1 | sort -n | tail -1)

	if [[ $BACKUP_PREVIOUS ]]; then
		inc=--link-dest="$PWD/$BACKUP_PREVIOUS"
	fi
}

cleanup() {
	local ALL_BACKUPS
	local BACKUPS_TO_REMOVE

	ALL_BACKUPS="$(find backups -maxdepth 1 | tail -n +2)"
	BACKUPS_TO_REMOVE="$(echo "$ALL_BACKUPS" | tail -n +$MAX_BACKUPS)"

	for i in $BACKUPS_TO_REMOVE; do
		rm -rf $BACKUPS_TO_REMOVE
	done
}

set_rsync_opts
mkdir -p backups/$BACKUP
rsync -aHAX $inc data/ backups/$BACKUP/
cleanup
