FROM openjdk:jre-alpine
RUN echo "installing dependencies" && \
    apk --update add gc-dev libre2-dev clang musl-dev libc-dev build-base git && \
    apk add libunwind-dev --update-cache --repository http://nl.alpinelinux.org/alpine/edge/main
