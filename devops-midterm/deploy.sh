#!/bin/bash

# Simple deployment script
APP_DIR=$HOME/devops-app
DEPLOYMENT_DIR=$HOME/deployment
PRODUCTION_DIR=$HOME/production
BACKUP_DIR=$HOME/backup
LOG_FILE=$HOME/deployment.log

echo "$(date) - Starting deployment" >> $LOG_FILE

# Run tests before deployment
cd $APP_DIR
source venv/bin/activate
python -m pytest

if [ $? -ne 0 ]; then
    echo "$(date) - Tests failed, aborting deployment" >> $LOG_FILE
    exit 1
fi

# Backup current production
if [ -d "$PRODUCTION_DIR" ]; then
    echo "$(date) - Backing up current production" >> $LOG_FILE
    rsync -a $PRODUCTION_DIR/ $BACKUP_DIR/
fi

# Deploy new version
echo "$(date) - Deploying new version" >> $LOG_FILE
rsync -a $APP_DIR/ $DEPLOYMENT_DIR/
rsync -a $DEPLOYMENT_DIR/ $PRODUCTION_DIR/

# Start the application
cd $PRODUCTION_DIR
source venv/bin/activate
nohup python app.py > app.log 2>&1 &
echo $! > app.pid

echo "$(date) - Deployment completed" >> $LOG_FILE