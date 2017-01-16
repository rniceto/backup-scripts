#!/bin/bash

DATE=`date "+%d-%m-%Y"`
KVERSION=`uname -r`
BACKUPDIR=/home/admin/backups

# Remove backup's antigos superiores a 10 dias

find $BACKUPDIR -type f -mtime +10 -delete

#######dpkg --get-selections > $BACKUPDIR/$date-"server-packages   #Mostra todas biblitotecas instaladas
tar -cvzf /home/admin/backups/$date-“Name Server”.tgz /etc


