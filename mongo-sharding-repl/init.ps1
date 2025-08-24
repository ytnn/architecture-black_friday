# Initialization of Config Server, shards and router MongoDB

Write-Host "=== Initialization of Config Server ==="
$cfg = @"
rs.initiate(
  {
    _id : "config_server",
    configsvr: true,
    members: [
      { _id : 0, host : "configSrv:27017" }
    ]
  }
);
exit();
"@
$cfg | docker exec -i configSrv mongosh --port 27017


Write-Host "=== Initialization of Shard1 ==="
$sh1 = @"
rs.initiate(
  {
    _id : "shard1",
    members: [
      { _id: 0, host: "shard1-1:27018" },
      { _id: 1, host: "shard1-2:27018" },
      { _id: 2, host: "shard1-3:27018" }
    ]
  }
);
exit();
"@
$sh1 | docker exec -i "shard1-1" mongosh --port 27018


Write-Host "=== Initialization of Shard2 ==="
$sh2 = @"
rs.initiate(
  {
    _id : "shard2",
    members: [
      { _id: 0, host: "shard2-1:27019" },
      { _id: 1, host: "shard2-2:27019" },
      { _id: 2, host: "shard2-3:27019" }
    ]
  }
);
exit();
"@
$sh2 | docker exec -i "shard2-1" mongosh --port 27019


Write-Host "=== Initialization of Router and generation test data ==="
$router = @"
sh.addShard("shard1/shard1-1:27018,shard1-2:27018,shard1-3:27018");
sh.addShard("shard2/shard2-1:27019,shard2-2:27019,shard2-3:27019");

sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } );

use somedb;

for (var i = 0; i < 1000; i++) db.helloDoc.insert({age:i, name:"ly"+i});

db.helloDoc.countDocuments();
exit();
"@
$router | docker exec -i mongos_router mongosh --port 27020

Write-Host "=== Cluster successfully initialized ==="
