#!/bin/bash
images=`docker image ls| grep mall| awk '{print $1":"$2}'`
for i in $images;do
    old_image="$i"
    new_image="harbor.linuxarchitect.io/mall-swarm/"`echo "$old_image"|awk -F'/' '{print $2}'`
    echo "docker tag $old_image $new_image"
    docker tag $old_image $new_image
    echo "docker push $new_image"
    docker push $new_image
done
