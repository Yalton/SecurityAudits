#!/bin/bash
du -h --max-depth=4 --time /mnt/nas/shared/ | sort -hr > /mnt/nassd/shared/NAS-du-4deep.log
