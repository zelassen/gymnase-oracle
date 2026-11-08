#!/bin/bash
set -e
source .env
C=gymnase-oracle

docker compose up -d --wait

echo "== 01 : tablespaces et utilisateur =="
docker exec $C sqlplus -s system/$ORACLE_PASSWORD@XEPDB1 @/sql/01_tablespaces_users.sql $GYM_PASSWORD < /dev/null

for f in $(ls sql/0[2-9]_*.sql); do
  echo "== $(basename $f) =="
  docker exec $C sqlplus -s DBAGYMNASE/$GYM_PASSWORD@XEPDB1 @/sql/$(basename $f) < /dev/null
done
echo "Base prete."
