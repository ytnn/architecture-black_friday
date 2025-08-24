# check-shards.ps1
# Check documents in somedb.helloDoc

Write-Host "=== Check Shard1 ==="
$checkShard1 = @"
use somedb;
db.helloDoc.countDocuments();
exit();
"@
$checkShard1 | docker exec -i shard1 mongosh --port 27018

Write-Host "=== Check Shard2 ==="
$checkShard2 = @"
use somedb;
db.helloDoc.countDocuments();
exit();
"@
$checkShard2 | docker exec -i shard2 mongosh --port 27019

Write-Host "=== check completed ==="
