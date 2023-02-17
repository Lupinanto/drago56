#!/usr/bin/env bash

#set -eEo pipefail

echo "$(date) | INFO  | Configuring wasabi"
python ./setup.py \
    -gssi ${GOOGLE_SHEETS_SHEET_ID} \
    -gstn ${GOOGLE_SHEETS_TAB_NAME} \
    -ta   ${TELEGRAM_API_TOKEN}   \
    -tu   ${TELEGRAM_USERID} 

## GOOGLE_SHEETS configuration
echo $(echo ${GOOGLE_SHEETS_CREDENTIALS_B64} | base64 --decode) > ./config/google_sheets_credentials.json
echo $(echo ${GOOGLE_SHEETS_TOKEN_B64} | base64 --decode) > ./config/google_sheets_token.json

echo "$(date) | INFO  | Starting wasabi"         
python ./BingRewards.py -r -t -hl -nsb -nc -gs \
    -e ${USER} \
    -p ${PASS}