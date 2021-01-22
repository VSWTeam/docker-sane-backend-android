FROM ubuntu:18.04

# Set environment variables.
ENV HOME /root
ENV NDK="/root/android-ndk-r21"
ENV PATH="${PATH}:$NDK"

# Define working directory.
WORKDIR /root

# Install (for build environment).
RUN apt update >/dev/null \
    && apt install -y git-core \
    && apt install -y curl zip file \
    && apt install -y nano \
    && rm -rf /var/lib/apt/lists/*

# Download Android NDK r21
RUN curl -O https://dl.google.com/android/repository/android-ndk-r21-linux-x86_64.zip \
    && unzip android-ndk-r21-linux-x86_64.zip \
    && rm android-ndk-r21-linux-x86_64.zip
