#!/bin/bash
cd /home/container
echo "Starting server..."

chmod 777 ./start
chmod +x ./start
./start
