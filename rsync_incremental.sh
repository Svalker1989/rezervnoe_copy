#!/bin/bash

DAY0=`date +"%d.%m.%Y_%H:%M:%S"`

# Если бэкапов больше 5, то ищем самый старый и удаляем
COUNT=$(ssh str@192.168.0.196 'ls /tmp/backup/ | wc -l')
if [[ $COUNT > 4 ]];then
fld=$(ssh str@192.168.0.196 "find /tmp/backup -maxdepth 1 -type d -printf ' %T@ %p\0' 2>/dev/null" | sort -z -n | awk '{print $2}')
ssh str@192.168.0.196 "rm -rf $fld"
fi
#Параметры для команды rsync
SRC="/tmp/test/"
TRG="str@192.168.0.196:/tmp/backup/$DAY0"
OPT="-av -e ssh  --delete"

rsync $OPT $SRC $TRG

#Восстановление из бэкапа
echo "Введите имя бэкапа для восстановления:"
ssh str@192.168.0.196 'ls /tmp/backup/'
read src_backup
echo "Введите путь для восстановления:"
read dst_fld
echo "Восстанавливаем бэкап $src_backup в $dst_fld ..."

rsync $OPT "str@192.168.0.196:/tmp/backup/$src_backup" $dst_fld
