#!/bin/bash

docker exec -it nasm /bin/sh -c "cd code; sh runRand.sh ${1}"
