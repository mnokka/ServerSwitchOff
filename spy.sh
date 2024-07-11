#!/bin/bash


BASE_DIR="/var/tmp/shutdown_app"
MESSAGE_FILE="$BASE_DIR/SHUTSHUT"
LOG_FILE="$BASE_DIR/Shut_logfile.log"


logmessage() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') $1"
}

exec >> $LOG_FILE 2>&1

if [ -f "$MESSAGE_FILE" ]; then
    logmessage "Shutdown message file ($MESSAGE_FILE) found. Initiating shutdown process..."
    sudo rm -f $MESSAGE_FILE
    logmessage "Asked host to shutdown"
    logmessage "Removed shutdown message file"
    #sudo shutdown -h now  
else
    logmessage "Shutdown file ($MESSAGE_FILE) not found. Continuing normal operation."
fi






