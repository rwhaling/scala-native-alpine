FROM alpine:3.5

RUN echo "installing dependencies" && \
    apk --update add gc-dev libre2-dev clang musl-dev libc-dev build-base git bash && \
    apk add libunwind-dev --update-cache --repository http://nl.alpinelinux.org/alpine/edge/main

RUN mkdir -p /build/usr/lib

RUN echo "copying essential shared libraries to /build/usr/lib/" && \
    cp /usr/lib/libunwind.so.8 \
       /usr/lib/libunwind-x86_64.so.8 \
       /usr/lib/libgc.so.1 \
       /usr/lib/libstdc++.so.6 \
       /usr/lib/libgcc_s.so.1 \
       /build/usr/lib/

 ENTRYPOINT ["bash", "-c"]
 CMD ["mkdir -p /output/usr/lib && \
       cp /build/usr/lib/* /output/usr/lib "]
