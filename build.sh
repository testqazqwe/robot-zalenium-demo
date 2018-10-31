#!/bin/bash
set -ex

ACCOUNT_ID=$(echo $CODEBUILD_BUILD_ARN | gawk -F\: '{print $5}')
NAME=wobi-server
cp resources/docker/server/Dockerfile .
docker build . -t $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$NAME:$version
docker push $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$NAME:$version

NAME=wobi-robot
cp resources/docker/robot/Dockerfile .
docker build . -t $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$NAME:$version
docker push $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$NAME:$version

sed "s/tag:.*/tag: $version/g" helm/robot/values.yaml -i
sed "s/tag:.*/tag: $version/g" helm/server/values.yaml -i
