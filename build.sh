git pull origin develop
mkdir -p ~/mb/webus623
meteor build --architecture=os.linux.x86_64  ~/mb/webus623
scp ~/mb/webus623/webus.tar.gz root@m.kanbing365.com:/mb/webus623
ssh root@m.kanbing365.com
