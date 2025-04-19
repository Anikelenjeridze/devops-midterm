#!/bin/bash

LOG_FILE=$HOME/health_check.log
APP_URL="http://localhost:5000/health"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Check if the app is responding
response=$(curl -s -o /dev/null -w "%{http_code}" $APP_URL)

if [ $response -eq 200 ]; then
    echo "$TIMESTAMP - Health check passed: HTTP $response" >> $LOG_FILE
else
    echo "$TIMESTAMP - Health check failed: HTTP $response" >> $LOG_FILE
    
    # Optional: Trigger automatic restart
    # bash $HOME/deploy.sh
fi