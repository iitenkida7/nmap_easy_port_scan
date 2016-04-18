#!/bin/bash

BASE_DIR=$(dirname $0)
CHECK_LIST_FILE=$1
XML_FILE=/tmp/${RANDOM}.xml

nmap -sT -sU  -iL ${CHECK_LIST_FILE} -oX ${XML_FILE} > /dev/null
${BASE_DIR}/nmap-parser-xml-to-csv ${XML_FILE} | awk -F ";" '{print $1","$5","$6","$7"("$9"),"$8}'  && rm -f ${XML_FILE} 

