echo on


mkdir D:\mc_server && mkdir D:\mc_server\mc1.18.2 && mkdir D:\mc_server\java && D: && cd D:\mc_server\mc1.18.2\

bitsadmin /transfer n https://download.java.net/java/GA/jdk18.0.1.1/65ae32619e2f40f3a9af3af1851d6e19/2/GPL/openjdk-18.0.1.1_windows-x64_bin.zip D:\mc_server\mc1.18.2\openjdk-18.0.1.1_windows-x64_bin.zip

bitsadmin /transfer n https://mapleduck.github.io/lib/unzip.exe C:\Windows\unzip.exe
unzip openjdk-18.0.1.1_windows-x64_bin.zip -d D:\mc_server\
bitsadmin /transfer n https://launcher.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar D:\mc_server\mc1.18.2\server.jar

bitsadmin /transfer n https://mapleduck.github.io/lib/server.properties D:\mc_server\mc1.18.2\server.properties
bitsadmin /transfer n https://mapleduck.github.io/lib/eula.txt D:\mc_server\mc1.18.2\eula.txt
D:\mc_server\mc1.18.2\jdk-18.0.1.1\bin\java -jar -Xms512M server.jar nogui

pause