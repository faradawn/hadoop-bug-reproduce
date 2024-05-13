# Install java
sudo apt update
sudo apt install -y openjdk-8-jdk
sudo apt-get install xmlstarlet -y

# Get hadoop https://github.com/faradawn/hadoop-bug-reproduce.git
wget https://github.com/faradawn/hadoop-bug-reproduce/raw/master/hadoop-3.1.0.tar.gz
tar -xzf hadoop-3.1.0.tar.gz
mv hadoop-3.1.0 hadoop

# Set env
echo 'export HADOOP_HOME=/home/cc/hadoop' >> ~/.bashrc
echo 'export PATH=${PATH}:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin' >> ~/.bashrc
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> ~/.bashrc
echo 'export HADOOP_MAPRED_HOME=$HADOOP_HOME' >> ~/.bashrc
echo 'export HADOOP_COMMON_HOME=$HADOOP_HOME' >> ~/.bashrc
echo 'export HADOOP_HDFS_HOME=$HADOOP_HOME' >> ~/.bashrc
echo 'export YARN_HOME=$HADOOP_HOME' >> ~/.bashrc
echo 'export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin' >> ~/.bashrc

# Set env globally just in case
sudo bash -c 'echo "export HADOOP_HOME=/home/cc/hadoop" >> /etc/profile'
sudo bash -c 'echo "export PATH=\${PATH}:\${HADOOP_HOME}/bin:\${HADOOP_HOME}/sbin" >> /etc/profile'
sudo bash -c 'echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> /etc/profile'
sudo bash -c 'echo "export HADOOP_MAPRED_HOME=\$HADOOP_HOME" >> /etc/profile'
sudo bash -c 'echo "export HADOOP_COMMON_HOME=\$HADOOP_HOME" >> /etc/profile'
sudo bash -c 'echo "export HADOOP_HDFS_HOME=\$HADOOP_HOME" >> /etc/profile'
sudo bash -c 'echo "export YARN_HOME=\$HADOOP_HOME" >> /etc/profile'
sudo bash -c 'echo "export PATH=\$PATH:\$HADOOP_HOME/bin:\$HADOOP_HOME/sbin" >> /etc/profile'

sudo chmod 777 /home/cc/hadoop
sudo echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> /home/cc/hadoop/etc/hadoop/hadoop-env.sh
. ~/.bashrc

# Get the config files
wget https://github.com/faradawn/hadoop-bug-reproduce/raw/master/core-site.xml
wget https://github.com/faradawn/hadoop-bug-reproduce/raw/master/hdfs-site.xml
wget https://github.com/faradawn/hadoop-bug-reproduce/raw/master/yarn-site.xml
wget https://github.com/faradawn/hadoop-bug-reproduce/raw/master/mapred-site.xml

# Place into folders
cp mapred-site.xml /home/cc/hadoop/etc/hadoop/mapred-site.xml
cp yarn-site.xml /home/cc/hadoop/etc/hadoop/yarn-site.xml
cp hdfs-site.xml /home/cc/hadoop/etc/hadoop/hdfs-site.xml
cp core-site.xml /home/cc/hadoop/etc/hadoop/core-site.xml

echo 'Hadoop installation and config complete! (for worker)'


