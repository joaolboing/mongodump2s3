#!/bin/sh

rm -rf /tmp/*

DATE=`date +%Y-%m-%d_%H-%M`

YEAR=`date +%Y`
MONTH=`date +%m`
DAY=`date +%d`

BKPNAME=${DB_NAME}-${DATE}

echo $(date) "Backup iniciado"
mongodump --uri=${MONGO_URL} --gzip --archive=/tmp/${BKPNAME}.agz

echo $(date) "Copiando arquivo para o bucket s3"
aws s3 cp /tmp/${BKPNAME}.agz s3://${BUCKET_NAME}/${YEAR}/${MONTH}/${DAY}/${BKPNAME}.agz --region ${AWS_REGION}