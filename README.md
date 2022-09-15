# System Security Auditing script

## About
- Simple script to audit the security of a Linux system 
- Originally intented to be ran as a cronjob but can also be ran manually
- Further auditting software will be added to this script in the future.
### Usage 
- ./systemScan.sh <OUTPUT_DIR> <1:nmapscan || 0:no_nmapascan> <IP_RANGE>
- EX: ./systemScan.sh /opt/SecurityAudits 1 192.168.50.0/24
