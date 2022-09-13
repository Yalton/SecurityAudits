#!/bin/bash
SCANDIR=$1
#SCANDIR=/mnt/nas/shared/Network/NUC/systemscans
LOGFILE=$(date +"%d-%m-%Y").log

#Run Chkrootkit & Send results to NAS
touch $SCANDIR/chkrootkit/$LOGFILE
chkrootkit 2>&1 > $SCANDIR/chkrootkit/$LOGFILE

#Run Rkhunter & Send results to NAS
#touch $SCANDIR/rkhunter/$LOGFILE
#rkhunter -c 2>&1 > $SCANDIR/rkhunter/$LOGFILE

#Run Lynis & Send results to NAS
touch $SCANDIR/lynisaudits/$LOGFILE
lynis --quick 2>&1 > $SCANDIR/lynisaudits/$LOGFILE
