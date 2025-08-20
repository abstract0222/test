#!/bin/sh
set -e	  

apt update -y
apt install -y openjdk-21-jdk
          
update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-21-openjdk-amd64/bin/java 2101
update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-21-openjdk-amd64/bin/javac 2101

update-alternatives --set java /usr/lib/jvm/java-21-openjdk-amd64/bin/java
update-alternatives --set javac /usr/lib/jvm/java-21-openjdk-amd64/bin/javac

curl -o "server.jar" "https://fill-data.papermc.io/v1/objects/b76b7d0d4d8d8946385947a9523e019d56e1284206c71bc78c2cb50685f48232/paper-1.21.8-40.jar"
echo "eula=true" > eula.txt

java -jar server.jar
