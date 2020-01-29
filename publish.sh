#!/usr/bin/env sh

show_info() {
  echo "$1"
}
throw_error_exit() {
  echo "ERR: $1"
  exit 1
}


IMAGE_VERSION=$1
SENTRY_VERSION=$2

# Input guard
if [ "$IMAGE_VERSION" == "" ]
then
   throw_error_exit "Missing image version, e.g. \"publish.sh 0.0.1 9.1.1\""
elif [ "$SENTRY_VERSION" == "" ]
then
   throw_error_exit "Missing sentry version, e.g. \"publish.sh 0.0.1 9.1.1\""
fi

IMAGE_TAG_NAME="viddsee/sentry:$1-$2"

show_info "$IMAGE_TAG_NAME"
show_info ""


[ ! -d "./images/$1" ] && throw_error_exit " Image version $1 doesn't exist"
[ ! -d "./images/$1/$2" ] && throw_error_exit "Sentry version $2 doesn't exist on $1"

DOCKER_FILE_DIRECTORY="images/$1/$2"

! command -v docker >/dev/null && throw_error_exit "Docker is not available in this environment"

cd $DOCKER_FILE_DIRECTORY

docker build -t $IMAGE_TAG_NAME .
docker push $IMAGE_TAG_NAME
