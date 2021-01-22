FROM alvrme/alpine-android:android-29

# Set environment variables.
ENV HOME /root
ENV NDK="/root/android-ndk-r21"
ENV PATH="${PATH}:$NDK"

# Define working directory.
WORKDIR /root

RUN apk add --no-cache curl make file \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/*

# Download Android NDK r21
RUN curl -O https://dl.google.com/android/repository/android-ndk-r21-linux-x86_64.zip
RUN unzip android-ndk-r21-linux-x86_64.zip
RUN rm android-ndk-r21-linux-x86_64.zip
