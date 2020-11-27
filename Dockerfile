FROM ubuntu:18.04

# Install (for build environment).
RUN apt update >/dev/null \
    && apt install -y libusb-1.0-0-dev build-essential libsane-dev \
    && apt install -y libavahi-client-dev libavahi-glib-dev \
    && apt install -y git-core \
    && apt install -y autoconf libtool \
    && apt install -y curl \
    && apt install -y zip \
    && apt install -y file \
    && apt install -y vim nano \
    && rm -rf /var/lib/apt/lists/*

# Download Android NDK r21
RUN cd /root
RUN curl -O https://dl.google.com/android/repository/android-ndk-r21-linux-x86_64.zip
RUN unzip android-ndk-r21-linux-x86_64.zip
RUN echo 'export NDK=/root/android-ndk-r21' >> ~/.bashrc
RUN echo 'export PATH=${PATH}:$NDK' >> ~/.bashrc
RUN sh -c "source ~/.bashrc"

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root
