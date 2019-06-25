#!/bin/bash

docker exec -it nasm /bin/sh -c "cd code; sh run.sh ${1}"
