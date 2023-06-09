#!/bin/bash

serverStartScript="serverStart.sh"

serverRunnerInstructionFile=".runnerInstructions"
serverStatusFile=".isRunning"

echo 1 > $serverRunnerInstructionFile

while [ ! $(cat $serverRunnerInstructionFile) -eq 0 ]; do
    if [ $(cat $serverRunnerInstructionFile) -eq 1 ]; then
        echo 1 > $serverStatusFile
	    ./$serverStartScript
	    echo "RESTART SERVER"
        echo 0 > $serverStatusFile
    elif [ $(cat $serverRunnerInstructionFile) -eq 2 ]; then
        echo "Server is on hold"
    fi
	sleep 1
done

echo "Server stopped on request"