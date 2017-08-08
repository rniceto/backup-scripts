#!/bin/bash


DBACKUP=/tmp
backupold=$(date --date "2 days ago" +%d-%m-%Y)
DATE=$(date +%d-%m-%Y)

if [ -d $DBACKUP/$backupold ] ; then
   rm -rf $DBACKUP/$backupold
 fi

echo "Analisando e listando os containers"
docker ps -a | awk '(NR>1){print $1}' > /tmp/containers.txt
for ids in $(cat containers.txt) ;do

sleep 5
echo "exportando cotainers"
for ligne in $(cat containers.txt)
do
     docker export $ligne > gzip backup[$DATE].tar.gz; done
done


#echo "Exportando containers"
#docker export $ids > gzip backup[$DATE].tar.gz; done


