FROM openjdk:jre-alpine
RUN echo "installing dependencies" && \
    apk --update add gc-dev libre2-dev clang musl-dev libc-dev build-base git && \
    apk add libunwind-dev --update-cache --repository http://nl.alpinelinux.org/alpine/edge/main

RUN mkdir -p /build/usr/lib

RUN echo "copying essential shared libraries to /build/usr/lib/" && \
    cp /usr/lib/libunwind.so.8 \
       /usr/lib/libunwind-x86_64.so.8 \
       /usr/lib/libgc.so.1 \
       /usr/lib/libstdc++.so.6 \
       /usr/lib/libgcc_s.so.1 \
       /build/usr/lib/

ENV SBT_VERSION 0.13.13
ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

# Install sbt
RUN echo "installing SBT $SBT_VERSION" && \
    apk add --no-cache --update bash wget && mkdir -p "$SBT_HOME" && \
    wget -qO - --no-check-certificate "https://dl.bintray.com/sbt/native-packages/sbt/$SBT_VERSION/sbt-$SBT_VERSION.tgz" | tar xz -C $SBT_HOME --strip-components=1 && \
    echo -ne "- with sbt $SBT_VERSION\n" >> /root/.built && \
    sbt sbtVersion

RUN echo "compiling scala-native-example to pre-load dependencies" && \
    git clone https://github.com/scala-native/scala-native.g8.git
WORKDIR scala-native.g8
RUN sbt compile nativeLink && rm -rf /scala-native.g8 && cd /

# Set up for project build
RUN mkdir /project
WORKDIR /project
ONBUILD RUN echo "essential shared libraries copied to /build/usr/lib"
ENTRYPOINT ["bash", "-c"]
CMD ["sbt run"]
