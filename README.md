##Run Multi-Node Hadoop 2.x Cluster in Docker 12

###3 Nodes Hadoop Cluster

#####1. pull docker image

```
sudo docker pull virtuant/hadoop-master:latest
sudo docker pull virtuant/hadoop-slave:latest
```

#####2. clone github repository

```
git clone https://github.com/virtuant/hadoop2.x-cluster-docker12
```

#####3. create hadoop network

```
sudo docker network create --driver=bridge hadoop
```

#####4. start container

```
cd hadoop2.x-cluster-docker12
sudo ./start-container.sh
```

**output:**

```
start hadoop-master container...
start hadoop-slave1 container...
start hadoop-slave2 container...
root@hadoop-master:~# 
```
- start 3 containers with 1 master and 2 slaves
- you will get into the /root directory of hadoop-master container

#####5. start hadoop

```
./start-hadoop.sh
```

###Size Hadoop cluster


#####1. Run Multi-Cluster Script

```
sudo ./start-multi-container.sh X
```
- Set variable X = 3-5
- This will pull a new image 'hadoop-5-cluster' but if is fails, 
  download locally < docker pull virtuant/hadoop-5-cluster:latest >
