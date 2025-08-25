#!/bin/bash
set -e

echo "=== Check Shard1-1 ==="
docker exec -i shard1-1 mongosh --port 27018 <<EOF
use somedb;
db.helloDoc.countDocuments();
EOF

echo "=== Check Shard1-2 ==="
docker exec -i shard1-2 mongosh --port 27018 <<EOF
use somedb;
db.helloDoc.countDocuments();
EOF

echo "=== Check Shard1-3 ==="
docker exec -i shard1-3 mongosh --port 27018 <<EOF
use somedb;
db.helloDoc.countDocuments();
EOF

echo "=== Check Shard2-1 ==="
docker exec -i shard2-1 mongosh --port 27019 <<EOF
use somedb;
db.helloDoc.countDocuments();
EOF

echo "=== Check Shard2-2 ==="
docker exec -i shard2-2 mongosh --port 27019 <<EOF
use somedb;
db.helloDoc.countDocuments();
EOF

echo "=== Check Shard2-3 ==="
docker exec -i shard2-3 mongosh --port 27019 <<EOF
use somedb;
db.helloDoc.countDocuments();
EOF

echo "=== Shards check completed ==="
