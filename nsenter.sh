#!/bin/bash

container_id=$1
if [ -z "$container_id" ]; then
	echo "Usage: docker_container <container_id>" >&2
	return 1
fi
/usr/bin/nsenter --mount --uts --ipc --net --pid --target $(docker inspect --format '{{.State.Pid}}' $container_id)

