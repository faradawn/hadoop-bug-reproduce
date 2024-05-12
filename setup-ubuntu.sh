# Install java
sudo apt update
sudo apt install -y openjdk-8-jdk

# Get hadoop https://github.com/faradawn/hadoop-bug-reproduce.git
wget https://github.com/faradawn/hadoop-bug-reproduce/raw/master/hadoop-3.1.0.tar.gz
tar -xzf hadoop-3.1.0.tar.gz
mv hadoop-3.1.0.tar.gz hadoop

# Set env
echo 'export HADOOP_HOME=/home/cc/hadoop' >> ~/.bashrc
echo 'export PATH=${PATH}:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin' >> ~/.bashrc
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> ~/.bashrc
echo 'export HADOOP_MAPRED_HOME=$HADOOP_HOME' >> ~/.bashrc
echo 'export HADOOP_COMMON_HOME=$HADOOP_HOME' >> ~/.bashrc
echo 'export HADOOP_HDFS_HOME=$HADOOP_HOME' >> ~/.bashrc
echo 'export YARN_HOME=$HADOOP_HOME' >> ~/.bashrc
echo 'export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin' >> ~/.bashrc

sudo chmod 777 /home/cc/hadoop
sudo echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> /home/cc/hadoop/etc/hadoop/hadoop-env.sh
. ~/.bashrc

echo 'Hadoop installation complete!'
