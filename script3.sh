#!/bin/bash

compress=false

while getopts ":i:o:p:" opt; do
    case $opt in
        i)
            inputFolder="$OPTARG"   
        ;;
        o)
            outputFolder="$OPTARG"
        ;;
        p) 
            flag_e=true
            password="$OPTARG"
        ;;
        c)
            compress=true
        ;;
    esac
done

if [ ! -d $inputFolder -o ! -d $outFolder ] 
    then
        echo "Input and Output Folder should be directory"
fi

currentDate=$(date '+%Y-%m-%d_%H:%M:%S')
backupFile="$outputFolder/backup_$currentDate"

rsync -avh --delete $inputFolder $backupFile

tar -czvf "$backupFile.tar.gz" -C $backupFile .
rm -rf $backupFile

openssl enc -aes-256-cbc -salt -pbkdf2 -in "$backupFile.tar.gz" -out "$backupFile.tar.gz.enc" -k $password

