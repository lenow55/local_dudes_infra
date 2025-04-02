#!/bin/bash

mc alias set minio $MINIO_URI $MINIO_ROOT_USER $MINIO_ROOT_PASSWORD

BUCKETS=$(mc ls minio)

while read -r p || [ -n "$p" ]; do
  mc mb minio/$p
done <$BUCKETS_LIST

echo "end init"
