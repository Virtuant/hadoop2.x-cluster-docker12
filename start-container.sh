#!/bin/bash

# the default node number is 3
N=${1:-3}


# start hadoop master container
sudo docker rm -f hadoop-master &> /dev/null
echo "start hadoop-master container..."
sudo docker run -itd \
                --net=hadoop \
                -p 50070:50070 \
                -p 8088:8088 \
		-p 8080:8080 \
		-p 8020:8020 \
                --name hadoop-master \
                --hostname hadoop-master \
                viruant/hadoop:latest #CHANGE THIS


# start hadoop slave container
i=1
while [ $i -lt $N ]
do
	sudo docker rm -f hadoop-slave$i &> /dev/null
	echo "start hadoop-slave$i container..."
	sudo docker run -itd \
	                --net=hadoop \
			-p 8440:8440 \
			-p 8441:8441 \
	                --name hadoop-slave$i \
	                --hostname hadoop-slave$i \
	                virtuant/hadoop:latest #CHANGE THIS
	i=$(( $i + 1 ))
done 

# get into hadoop master container
sudo docker exec -it hadoop-master bash
