#!/bin/sh

# A Shell script of Ubuntu

apt-get -y install screen
apt-get -y install wget
apt-get -y install tar


echo "请选择服务端版本："
echo "1) 1.16.5"
echo "2) 1.17.1"
echo "3) 1.18.2"
read -p "请选择(1-3 默认:3): " action;

# Select version

case $action in
   '1')
      mkdir /root/mc_server && mkdir /root/mc_server/mc1.16.5
      cd /root/mc_server/mc1.16.5
      java="/root/mc_server/jdk-18.0.1.1/bin/java"
      properties="/root/mc_server/mc1.16.5/server.properties"
      jar="/root/mc_server/mc1.16.5/server.jar"
      # Download server.jar
      Server(){
      wget -O server.jar https://piston-data.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar
      }
      ;;
   '2')
      mkdir /root/mc_server && mkdir /root/mc_server/mc1.17.1
      cd /root/mc_server/mc1.17.1
      java="/root/mc_server/jdk-18.0.1.1/bin/java"
      properties="/root/mc_server/mc1.17.1/server.properties"
      jar="/root/mc_server/mc1.17.1/server.jar"
      # Download server.jar
      Server(){
      wget -O server.jar https://piston-data.mojang.com/v1/objects/a16d67e5807f57fc4e550299cf20226194497dc2/server.jar
      }
      ;;
   *)
      mkdir /root/mc_server && mkdir /root/mc_server/mc1.18.2
      cd /root/mc_server/mc1.18.2
      java="/root/mc_server/jdk-18.0.1.1/bin/java"
      properties="/root/mc_server/mc1.18.2/server.properties"
      jar="/root/mc_server/mc1.18.2/server.jar"
      # Download server.jar
      Server(){
      wget -O server.jar https://piston-data.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar
      }
      ;;
esac

# Functions

First_Run(){
   /root/mc_server/jdk-18.0.1.1/bin/java -jar server.jar nogui
   sed -i "s/false/true/g" ./eula.txt
   sed -i "s/online-mode=true/online-mode=false/g" ./server.properties
   sed -i "s/spawn-protection=16/spawn-protection=0/g" ./server.properties
   sed -i "s/difficulty=easy/difficulty=hard/g" ./server.properties
   screen -R mc /root/mc_server/jdk-18.0.1.1/bin/java -jar -Xms512M server.jar nogui
}
Run(){
   screen -R mc /root/mc_server/jdk-18.0.1.1/bin/java -jar -Xms512M server.jar nogui
}
JDK(){
   wget https://download.java.net/java/GA/jdk18.0.1.1/65ae32619e2f40f3a9af3af1851d6e19/2/GPL/openjdk-18.0.1.1_linux-aarch64_bin.tar.gz
   tar -zxvf openjdk-18.0.1.1_linux-aarch64_bin.tar.gz -C /root/mc_server/ && rm -rf openjdk-18.0.1.1_linux-aarch64_bin.tar.gz
}

# Main

if [ -f $java ]
then
   if [ -f $jar ]
   then
	   if [ -f $properties ]
	   then
         Run
      else
         First_Run
	   fi
   else
      Server
	   First_Run
   fi
else
   JDK
   Server
   First_Run
fi

# Powered By MapleSkys