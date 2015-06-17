mkdir -p ~/mb/webus
meteor build --architecture=os.linux.x86_64  ~/mb/webus
scp ~/mb/webus/webus.tar.gz root@m.kanbing365.com:/mb/webus
ssh root@m.kanbing365.com