#!/bin/bash
SCANDIR=$1
$IPRANGE=$2
LOGFILE=$(date +"%d-%m-%Y").log

#Run Chkrootkit & Send results to NAS
touch $SCANDIR/chkrootkit/$LOGFILE
chkrootkit 2>&1 > $SCANDIR/chkrootkit/$LOGFILE

#Run Rkhunter & Send results to NAS
touch $SCANDIR/rkhunter/$LOGFILE
rkhunter -c 2>&1 > $SCANDIR/rkhunter/$LOGFILE

#Run Lynis & Send results to NAS
touch $SCANDIR/lynisaudits/$LOGFILE
lynis --quick 2>&1 > $SCANDIR/lynisaudits/$LOGFILE

#Run nmap & Send results to NAS
touch $SCANDIR/nmapscans/$LOGFILE
nmap -p 1-65535 -T4 -A -v $IPRANGE > $SCANDIR/nmapscans/$LOGFILE