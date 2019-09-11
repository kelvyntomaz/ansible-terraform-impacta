#!/bin/bash

TEMPORARY_AREA="/tmp/"
DIRECTORY_FILE="/tmp/"
FILENAME="README"
AWS_S3_NAME="impacta-kelvyn-michell-aws"
GCLOUD_STORAGE_NAME="impacta-kelvyn-michell-gcloud"
GCLOUD_KEY="/home/ec2-user/chave-gcloud.json"

gcloud auth activate-service-account --key-file=${GCLOUD_KEY}

echo "Movendo para a AWS"
aws s3 mv ${DIRECTORY_FILE}/${FILENAME} s3://${AWS_S3_NAME}

if [[ $? -eq 0 ]]; then
  read -p "Movido com Sucesso, pressione enter para continuar"
else
  echo "Deu Ruim"
  exit 1
fi

echo "Movendo para a Area Temporária"
aws s3 mv s3://${AWS_S3_NAME}/${FILENAME} ${TEMPORARY_AREA}/.

if [[ $? -eq 0 ]]; then
  read -p "Movido com Sucesso, pressione enter para continuar"
else
  echo "Deu Ruim"
  exit 1
fi

echo "Movendo para a Gcloud"
gsutil mv ${TEMPORARY_AREA}/${FILENAME} gs://${GCLOUD_STORAGE_NAME}

if [[ $? -eq 0 ]]; then
  read -p "Movido com Sucesso, pressione enter para continuar"
else
  echo "Deu Ruim"
  exit 1
fi
