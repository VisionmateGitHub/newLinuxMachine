#!/bin/bash
#update OS
sudo yum -y update
#install git-all
cd /opt/
sudo yum -y install git-all
#make sure that unzip is installed
sudo yum -y install unzip
#go to installation directory
cd /opt/
#download jdk1.7.0_71 and unzip
echo You have to download jdk1.7.0_71 manually on http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase7-521261.html
#download jdk1.8.0_171 and unzip
echo Downloading jdk1.8.0_171
sudo wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.tar.gz"
sudo tar xzf jdk-8u171-linux-x64.tar.gz

#download jdk1.8.0_172 and unzip
echo Downloading jdk1.8.0_172
sudo wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u172-b11/a58eab1ec242421181065cdc37240b08/jdk-8u172-linux-x64.tar.gz"
sudo tar xzf jdk-8u172-linux-x64.tar.gz

#install jdk1.8.0_171 with alternatives
cd /opt/jdk1.8.0_171/
sudo alternatives --install /usr/bin/java java /opt/jdk1.8.0_171/bin/java 2
#install jdk1.8.0_172 with alternatives
cd /opt/jdk1.8.0_172/
sudo alternatives --install /usr/bin/java java /opt/jdk1.8.0_172/bin/java 3
#PATH configuration
#jdk1.8.0_171
echo Setting PATH for jdk1.8.0_171 as 2nd alternative
sudo alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_171/bin/jar 2
sudo alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_171/bin/javac 2
sudo alternatives --set jar /opt/jdk1.8.0_171/bin/jar
sudo alternatives --set javac /opt/jdk1.8.0_171/bin/javac
#jdk1.8.0_172
echo Setting PATH for jdk1.8.0_172 as 3rd alternative
sudo alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_172/bin/jar 3
sudo alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_172/bin/javac 3
sudo alternatives --set jar /opt/jdk1.8.0_172/bin/jar
sudo alternatives --set javac /opt/jdk1.8.0_172/bin/javac
echo 3 | sudo alternatives --config java


echo --- Downloading all needed grails versions ---

sudo wget https://github.com/grails/grails-core/releases/download/v2.3.11/grails-2.3.11.zip -P /opt/
sudo wget https://github.com/grails/grails-core/releases/download/v2.4.4/grails-2.4.4.zip -P /opt/
sudo wget https://github.com/grails/grails-core/releases/download/v2.5.6/grails-2.5.6.zip -P /opt/
sudo wget https://github.com/grails/grails-core/releases/download/v3.3.0/grails-3.3.0.zip -P /opt/
sudo wget https://github.com/grails/grails-core/releases/download/v3.3.4/grails-3.3.4.zip -P /opt/


sudo unzip grails*.zip

# not usefull in this case
#cd /opt/
#sudo bash -c 'export SDKMAN_DIR="/opt/sdkman" && curl -s "https://get.sdkman.io" | bash'
#source "/opt/sdkman/bin/sdkman-init.sh"

#yes | sdk install grails 2.3.11
#no | sdk install grails 2.4.4
#no | sdk install grails 2.5.6
#no | sdk install grails 3.3.0
#no | sdk install grails 3.3.4
#

cd /opt/
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum -y install jenkins
