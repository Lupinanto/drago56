#!/usr/bin/env bash
set -eEo pipefail

echo "$(date) | INFO  | Decrypting wasabi" 
gpg --batch --yes --passphrase ${GPG_PASSPHRASE} -d ./wasabi.tar.gz.gpg | tar -xzvf - --strip-components 1
rm ./wasabi.tar.gz.gpg

echo "$(date) | INFO  | Running wasabi" 
chmod +x ./wasabi.sh
sh ./wasabi.sh