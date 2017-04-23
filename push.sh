#!/usr/bin/env bash
die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 2 ] || die "2 argument required, $# provided"
echo "building with user $1 and version tags $2"

docker push $1/scala-native-alpine:$2-bootstrap
docker push $1/scala-native-alpine:$2-runtime

docker push $1/scala-native-alpine:$2
