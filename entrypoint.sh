#!/bin/bash

# Sets script to fail if any command fails.
set -e

run_pan() {
	echo ./pan.sh -file $2
	pan.sh -file /jobs/$2
}

run_kitchen() {
	echo ./kitchen.sh -file $2
	kitchen.sh -file /jobs/$2
}

print_usage() {
echo "

Usage:	$0 COMMAND

Pentaho Data Integration (PDI)

Options:
  runj filename		Run job file
  runt filename		Run transformation file
  help		        Print this help
"
}

case "$1" in
    help)
        print_usage 
        ;;
    runt)
        run_pan "$@"
        ;;
    runj)
        run_kitchen "$@"
        ;;
    *)
        exec "$@"
esac
