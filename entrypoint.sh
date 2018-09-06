#!/bin/bash

# Sets script to fail if any command fails.
set -e

custom_properties() {
	if [ -f /jobs/kettle.properties ] ; then
		cp /jobs/kettle.properties $KETTLE_HOME
	fi
}

run_pan() {
	custom_properties
	echo ./pan.sh -file $@
	pan.sh -file /jobs/$@
}

run_kitchen() {
	custom_properties
	echo ./kitchen.sh -file $@
	kitchen.sh -file /jobs/$@
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
	shift 1
        run_pan "$@"
        ;;
    runj)
	shift 1
        run_kitchen "$@"
        ;;
    *)
        exec "$@"
esac
