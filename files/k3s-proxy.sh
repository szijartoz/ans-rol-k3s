#!/bin/bash
nohup kubectl proxy --address='0.0.0.0' --port 8001 /dev/null &
