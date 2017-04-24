#!/bin/sh

while [ 1 -lt 10  ]
do

currentRecord=$(dig +short A $arecord @$authoritative)
currentIp=$(curl -s 'https://api.ipify.org?format=text')

if [ -z "$currentIp"  ] || [ -z "$currentRecord" ]; then
  echo "variable is empty doing nothing"
else
  if [ $currentRecord = $currentIp ]  ; then
    echo "nothing to do"
  else
    echo "I have to update the record"
    ssh -oStrictHostKeyChecking=no -i /keys/id_rsa $user@$remoteip $remotecommand $currentIp
  fi
fi
sleep 60
done

