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

echo 'Hadoop installation complete!'

sudo mv id_rsa /home/cc/.ssh/id_rsa
sudo chmod 600 /home/cc/.ssh/id_rsa
echo 'moved ssh key'
