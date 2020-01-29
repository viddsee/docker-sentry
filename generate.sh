#!/bin/sh

# render a template configuration file
# preserve formatting
# expand variables
render_template() {
  eval "echo \"$(cat $1)\""



}

IMAGE_VERSION=$1
SENTRY_VERSION=$2

DIRECTORY_PATH="./images/$IMAGE_VERSION/$SENTRY_VERSION"
DOCKERFILE_PATH="./images/$IMAGE_VERSION/$SENTRY_VERSION/Dockerfile"
REQUIREMENTS_PATH="./images/$IMAGE_VERSION/$SENTRY_VERSION/requirements.txt"

mkdir -p $DIRECTORY_PATH

sed -e "s/{SENTRY_VERSION}/$SENTRY_VERSION/g" ./templates/Dockerfile > $DOCKERFILE_PATH
cp ./templates/requirements.txt $DIRECTORY_PATH
