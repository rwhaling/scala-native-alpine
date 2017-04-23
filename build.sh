#!/usr/bin/env bash
die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 2 ] || die "2 argument required, $# provided"
echo "building with user $1 and version tags $2"

rm -rf output
mkdir -p output

echo "building $1/scala-native-alpine:$2-bootstrap"
docker build -f bootstrap/Dockerfile -t $1/scala-native-alpine:$2-bootstrap ./bootstrap
docker run -v $(pwd)/output:/output $1/scala-native-alpine:$2-bootstrap

echo "building $1/scala-native-alpine:$2-runtime"
docker build -t $1/scala-native-alpine:$2-runtime .

echo "building $1/scala-native-alpine:$2-sbt"
docker build -f sbt/Dockerfile -t $1/scala-native-alpine:$2-sbt ./sbt
