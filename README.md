Very lean Alpine Linux base images for working with Scala Native.  Versions track Scala Native releases.

Images come in two versions:

`runtime` (default) for tiny containers with the minimal shared libraries for execution, < 20 MB

`sbt` includes SBT and other build tools as well, and are quite a bit larger, ~ 600 MB.


# using the runtime image

Due to platform-specific compiler options, libc variants, and such, you'll need to use the `sbt` version first to prepare a suitable executable for the lean runtime.  As a one-liner, you can do it like this:

```
docker run -it \
           -v $(pwd):/project \
           rwhaling/scala-native-alpine:0.1.0-sbt \
           "sbt clean nativeLink"
```


# deploy

And then to actually run the app:

```
docker run -it \
           -v $(pwd)/project-out:/project/app \
           rwhaling/scala-native-alpine:0.1.0-runtime \
           /project/app
```

# building the images yourself
I would recommend using the published ones for now.  The `build.sh` script does contain the process for bootstrapping an alpine build with the shared libraries, copying them out onto a volume, and adding them back to a minimal image without the build toolchain.  You can invoke it with `./build.sh <YOUR_DOCKER_HANDLE> <BUILD_VERSION>`
