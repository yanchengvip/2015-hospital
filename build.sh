mkdir -p ~/mb/webus624
meteor build --architecture=os.linux.x86_64  ~/mb/webus624
scp ~/mb/webus624/webus.tar.gz root@m.kanbing365.com:/mb/webus624
ssh root@m.kanbing365.com
