#!/bin/bash

date=`date "+%d-%m-%Y"`
kversion=`uname -r`

# Remove backup's antigos superiores a 10 dias

find /admrede/backups -type f -mtime +10 -delete

dpkg --get-selections > /admrede/backups/$date-"server-packages   #Mostra todas biblitotecas instaladas
tar -cvzf /admrede/backups/$date-“Name Server”.tgz /etc


