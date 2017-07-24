#!/bin/bash
#

#Variaveis
data=$(date +%d-%m-%Y)
localhost="samba"
#blocos="976758784"
origem="/etc /home /dados /opt"
destino="/backup/backup/$localhost-$data"
ponto="/backup"
dev="/dev/sdb1"
#dev=$(/sbin/fdisk -l | /bin/grep $blocos | /usr/bin/awk {'print $1'})
backupold=$(date --date "9 days ago" +%d-%m-%Y)
log="/var/log/wall_bkpdiario"

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
