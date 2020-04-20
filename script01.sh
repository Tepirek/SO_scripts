#!/bin/bash

grep "OK DOWNLOAD" cdlinux.ftp.log | cut -d '"' -f 2,4 | sort | cut -d '"' -f 2 | sed "s#.*/##g" | grep "\.iso" > tmpFile.txt

cut -d " " -f 1,7,9  cdlinux.www.log | grep ".iso 200" | sort -u | cut -d " " -f 2 | sed "s#.*/##" >> tmpFile.txt

cat tmpFile.txt | sort | uniq -c |  sort
rm tmpFile.txt