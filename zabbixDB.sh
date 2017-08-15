#!/bin/bash
# Create by Jeferson 
# Backup no reports & Histories 

mysqldump -v -u root -"SENHA BANCO" "NOME BANCO" \
        --ignore-table="NOME BANCO".acknowledges \
        --ignore-table="NOME BANCO".alerts \
        --ignore-table="NOME BANCO".auditlog \
        --ignore-table="NOME BANCO".auditlog_details \
        --ignore-table="NOME BANCO".escalations \
        --ignore-table="NOME BANCO".events \
        --ignore-table="NOME BANCO".history \
        --ignore-table="NOME BANCO".history_log \
        --ignore-table="NOME BANCO".history_str \
        --ignore-table="NOME BANCO".history_text \
        --ignore-table="NOME BANCO".history_uint \
        --ignore-table="NOME BANCO".sessions \
        --ignore-table="NOME BANCO".trends \
        --ignore-table="NOME BANCO".trends_uint \
        | gzip > /srv/backup/"NOME BANCO"$(date +%d-%m-%Y).sql.gz

# Remove os mais antigos
find /srv/backup/* -mtime +1 -exec rm {} \;
