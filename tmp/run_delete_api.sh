#!/bin/sh

checkDir=$1
cd $checkDir

deprecatedAPI=(\
"node.k8s.io/v1beta1" \
"batch/v1beta1" \
"discovery.k8s.io/v1beta1" \
"events.k8s.io/v1beta1" \
"policy/v1beta1" \
"autoscaling/v2beta1" \
"autoscaling/v2beta2" \
"flowcontrol.apiserver.k8s.io/v1beta1" \
)

for i in ${deprecatedAPI[*]} ; do
	echo "======== check deprecated API $i ========"
	grep -ri "$i" . |grep -v "swagger-v1.20.0.json" |grep -v "swagger-v1.22.3.json"
done
