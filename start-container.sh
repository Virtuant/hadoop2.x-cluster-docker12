#!/bin/bash

# the default node number is 3
N=${1:-3}


# start hadoop master container
sudo docker rm -f hadoop-master &> /dev/null
echo "start hadoop-master container..."
sudo docker run -itd \
                --net=hadoop \
                -p 50090:50090 \
                -p 50070:50070 \
                -p 50470:50470 \
                -p 10020:10020 \
                -p 19888:19888 \
                -p 9000:9000 \
                -p 8088:8088 \
                -p 8080:8080 \
                -p 8000:8000 \
                -p 8670 \
                -p 8440 \
                -p 8441 \
                -p 8020 \
                -p 3888 \
                -p 3306 \
                -p 3000 \
                -p 2888 \
                -p 2181 \
                -p 22 \
                --name hadoop-master \
                --hostname hadoop-master \
                virtuant/hadoop-master:latest


# start hadoop slave container
i=1
while [ $i -lt $N ]
do
	sudo docker rm -f hadoop-slave$i &> /dev/null
	echo "start hadoop-slave$i container..."
	sudo docker run -itd \
	                --net=hadoop \
                    -p 50075 \
                    -p 50475 \
                    -p 50010 \
                    -p 50020 \
                    -p 8670 \
                    -p 8440 \
                    -p 8441 \
                    -p 8020 \
                    -p 3306 \
                    -p 3000 \
                    -p 22 \
	                --name hadoop-slave$i \
	                --hostname hadoop-slave$i \
	                virtuant/hadoop-slave:latest
	i=$(( $i + 1 ))
done 

# get into hadoop master container
sudo docker exec -it hadoop-master bash
