Alpine/musl base images for working with Scala Native.  Versions track Scala Native releases.

Images come in two versions:

 `runtime` for tiny containers with the minimal shared libraries for execution, < 20 MB

`sbt` (default) include SBT for build as well, and are quite a bit larger, ~ 600 MB.

If you don't mind large images, you can just use the `latest`, which will be the latest sbt version, and contains everything you need to run your app as well.

# using the runtime image

Due to platform-specific compiler options, libc variants, and such, you'll need to use the `sbt` version first to prepare a suitable executable for the lean runtime.  As a one-liner, you can do it like this:

```
docker run -it \
           -v $(pwd):/project \
           rwhaling/scala-native-alpine:sbt-0.1.0 \
           "sbt clean nativeLink"
```


# deploy

And then to actually run the app:

```
docker run -it \
           -v /Users/rwhaling/src/scala/dinosaur/target/scala-2.11/project-out:/project/app \
           rwhaling/scala-native-alpine:runtime-0.1.0 \
           /project/app
```

# examples
Forthcoming!
