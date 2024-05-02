#!/bin/bash


LOG_DIR=/var/tmp
LOG_FILE=Shut_logfile.log
SHUTDOWN_MESSAGE_FILE=$LOG_DIR/SHUTSHUT

logmessage() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') $1"
}

exec >> $LOG_DIR/$LOG_FILE 2>&1

if [ -f "$SHUTDOWN_MESSAGE_FILE" ]; then
    logmessage "Shutdown message file ($SHUTDOWN_MESSAGE_FILE) found. Initiating shutdown process..."
    #sudo shutdown -h now  # Shutdown the host machine
    sudo rm -f $SHUTDOWN_FILE
    logmessage "Asked host to shutdown"
    logmessage "Removed shutdown message file"
else
    logmessage "Shutdown file ($SHUTDOWN_MESSAGE_FILE) not found. Continuing normal operation."
fi






