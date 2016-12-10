#!/bin/bash

echo ""

echo -e "\nbuild docker hadoop image\n"
sudo docker build -t virtuant/hadoop:latest . #CHANGE THIS

echo ""
