#!/usr/bin/env bash

BASE_DIR=/var/tmp/shutdown_app
MESSAGE_FILE=$BASE_DIR/SHUTSHUT
LOG_FILE=$BASE_DIR/Shut_logfile.log

logmessage() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') $1"
}

if [ ! -d "$BASE_DIR" ]; then
    mkdir -p $BASE_DIR
    chmod 777 $BASE_DIR
    logmessage "Created base directory $BASE_DIR with permissions 777"
else
    logmessage "Base directory $BASE_DIR already exists"
fi


if [ ! -f "$LOG_FILE" ]; then
    touch $LOG_FILE
    chmod 666 $LOG_FILE
    logmessage "Created log file $LOG_FILE with permissions 666"
else
    logmessage "Log file $LOG_FILE already exists"
fi

# Log setup completion
logmessage "Setup completed. Directory and log files checked/created with appropriate permissions." >> $LOG_FILE

echo "Setup completed. Directories and files checked/created with appropriate permissions."
