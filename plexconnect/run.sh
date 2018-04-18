#!/bin/ash

CONFIG_PATH=/data/options.json

PCDIR=/srv/plexconnect
CERTS=assets/certificates
PEM=${PCDIR}/${CERTS}/trailers.pem
CER=${PCDIR}/${CERTS}/trailers.cer
KEY=/tmp/trailers.key

# Create Certs
if [ ! -f ${PEM} ] || [ ${CREATE_CERT} ];  then
  openssl req -new -nodes -newkey rsa:2048 -out ${PEM} -keyout ${KEY} -x509 -days 7300 -subj "/C=US/CN=trailers.apple.com"
  openssl x509 -in ${PEM} -outform der -out ${CER} && cat ${KEY} >> ${PEM}
fi

/usr/bin/python ${PCDIR}/PlexConnect.py
