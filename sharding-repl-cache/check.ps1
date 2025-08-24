# check-shards.ps1
# Check documents in somedb.helloDoc

Write-Host "=== Check Shard1-1 ==="
$checkShard1 = @"
use somedb;
db.helloDoc.countDocuments();
exit();
"@
$checkShard1 | docker exec -i "shard1-1" mongosh --port 27018

Write-Host "=== Check Shard1-2 ==="
$checkShard1 = @"
use somedb;
db.helloDoc.countDocuments();
exit();
"@
$checkShard1 | docker exec -i "shard1-2" mongosh --port 27018

Write-Host "=== Check Shard1-3 ==="
$checkShard1 = @"
use somedb;
db.helloDoc.countDocuments();
exit();
"@
$checkShard1 | docker exec -i "shard1-3" mongosh --port 27018

Write-Host "=== Check Shard2-1 ==="
$checkShard2 = @"
use somedb;
db.helloDoc.countDocuments();
exit();
"@
$checkShard2 | docker exec -i "shard2-1" mongosh --port 27019

Write-Host "=== Check Shard2-2 ==="
$checkShard2 = @"
use somedb;
db.helloDoc.countDocuments();
exit();
"@
$checkShard2 | docker exec -i "shard2-2" mongosh --port 27019

Write-Host "=== Check Shard2-3 ==="
$checkShard2 = @"
use somedb;
db.helloDoc.countDocuments();
exit();
"@
$checkShard2 | docker exec -i "shard2-3" mongosh --port 27019

Write-Host "=== check completed ==="
