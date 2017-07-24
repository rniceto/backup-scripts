#!/bin/bash
#

#Variaveis
data=$(date +%d-%m-%Y)
localhost="samba"
origem="/etc /home "
destino="/backup/$localhost-$data"
ponto="/backup"
backupold=$(date --date "9 days ago" +%d-%m-%Y)
log="/var/log/bkpdiario"

### ZERA LOG
/bin/echo > $log

### INICIO
/bin/echo $localhost-$data > $log 2>&1
/bin/echo "Iniciando Backup" >> $log


# Remove backup's antigos
  if [ -d /backup/backup/$localhost-$backupold ] ; then
    rm -rf /backup/backup/$localhost-$backupold
  fi


/usr/bin/rsync -Cravzp $origem $destino


/bin/echo "Backup Finalizado" >> $log
/bin/cat $log | /usr/bin/mail -s bkp_wallcovering name@domain.com
