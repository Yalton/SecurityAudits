#!/bin/bash
SCANDIR=$1
IPRANGE=$2
LOGFILE=$(date +"%d-%m-%Y").log

#Run Chkrootkit
if [ ! -d "$SCANDIR/chkrootkit" ]; then
    mkdir $SCANDIR/chkrootkit
fi
touch $SCANDIR/chkrootkit/$LOGFILE
chkrootkit 2>&1 > $SCANDIR/chkrootkit/$LOGFILE

#Run Rkhunter & Send results to NAS
if [ ! -d "$SCANDIR/rkhunter" ]; then
    mkdir $SCANDIR/rkhunter
fi
touch $SCANDIR/rkhunter/$LOGFILE
rkhunter -c 2>&1 > $SCANDIR/rkhunter/$LOGFILE

#Run Lynis & Send results to NAS
if [ ! -d "$SCANDIR/lynisaudits" ]; then
    mkdir $SCANDIR/lynisaudits
fi
touch $SCANDIR/lynisaudits/$LOGFILE
lynis --quick 2>&1 > $SCANDIR/lynisaudits/$LOGFILE

#Run nmap & Send results to NAS
#Run Lynis & Send results to NAS
if [ ! -d "$SCANDIR/nmapscans" ]; then
    mkdir $SCANDIR/nmapscans
fi
touch $SCANDIR/nmapscans/$LOGFILE
nmap -p 1-65535 -T4 -A -v $IPRANGE > $SCANDIR/nmapscans/$LOGFILE
