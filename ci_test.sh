git submodule init
git submodule update
ls -la
meteor build --architecture=os.linux.x86_64  /tmp/webus
docker rm -f mt_stagging
docker run -d --name mt_stagging -e ROOT_URL="http://fitark.org:8061"  -e MONGO_URL="mongodb://root:root@101.200.228.46:27019,123.57.250.117:27017,123.57.250.222:27019/webus?replicaSet=thedb&authSource=admin"  -e MONGO_OPLOG_URL="mongodb://root:root@101.200.228.46:27019,123.57.250.117:27017,123.57.250.222:27019/local?replicaSet=thedb&authSource=admin"  -v /tmp/webus:/bundle  -p 8601:80 meteorhacks/meteord
sleep 15
curl http://fitark.org:8601/
