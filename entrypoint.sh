#!/bin/bash
cd /home/container
echo "Starting server..."

# Replace Startup Variables {{VARIABLE}} with the value from the environment
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`

# Run the Server
echo "Running ${MODIFIED_STARTUP}"
${MODIFIED_STARTUP}
