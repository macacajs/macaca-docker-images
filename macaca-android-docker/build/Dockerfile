FROM ubuntu:16.04

MAINTAINER Samuel "samuel.zhao.yue@live.com"

# Expose VNC ports
EXPOSE 80
EXPOSE 443

RUN apt-get update && \
    apt-get install -y qemu-kvm qemu-utils bridge-utils dnsmasq uml-utilities iptables wget net-tools && \
    apt-get install -y build-essential git vim make zip unzip curl wget bzip2 ssh openssh-server socat && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y software-properties-common && \
    apt-get install -y net-tools iputils-ping dnsutils && \
    apt-get install -y python-dev python-pip  && \
    apt-get install -y apt-utils usbutils locales udev && \
    apt-get autoremove -y && \
    apt-get clean

# Install packages needed for android sdk tools
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get -y install libstdc++6:i386 libgcc1:i386 zlib1g:i386 libncurses5:i386

# Java Environment Path
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV JRE_HOME=${JAVA_HOME}/jre
ENV CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
ENV PATH=${JAVA_HOME}/bin:$PATH

# Install Android SDK
ENV ANDROID_HOME=/opt/android-sdk-linux
ENV ANDROID_NDK_HOME=$ANDROID_HOME/android-ndk-r14b
ENV PATH=$PATH:$ANDROID_HOME/tools/:$ANDROID_HOME/platform-tools:$ANDROID_NDK_HOME

RUN curl -o android-sdk.tgz https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && tar -C /opt -zxvf android-sdk.tgz > /dev/null \
    && rm android-sdk.tgz \
    && mkdir "$ANDROID_HOME/licenses" || true \
    && echo -e "\n8933bad161af4178b1185d1a37fbf41ea5269c55" > "$ANDROID_HOME/licenses/android-sdk-license" \
    && echo -e "\d56f5187479451eabf01fb78af6dfcb131a6481e" >> "$ANDROID_HOME/licenses/android-sdk-license" \
    && echo -e "\n84831b9409646a918e30573bab4c9c91346d8abd" > "$ANDROID_HOME/licenses/android-sdk-preview-license"

RUN ( sleep 4 && while [ 1 ]; do sleep 1; echo y; done ) | android update sdk --no-ui --force -a --filter \
    platform-tool,android-25,android-26,android-27,build-tools-27.0.3,extra-android-support,extra-android-m2repository,extra-google-m2repository && \
    echo "y" | android update adb

# RUN which adb
# RUN which android

# Gradle 4.6
ENV GRADLE_HOME=/usr/local/gradle-4.6
ENV PATH=$GRADLE_HOME/bin:$PATH

RUN curl -o gradle-4.6-bin.zip -L https://services.gradle.org/distributions/gradle-4.6-bin.zip \
    && unzip gradle-4.6-bin.zip -d /usr/local > /dev/null \
    && rm gradle-4.6-bin.zip

# Node.js
ENV NODE_VERSION=8.11.2 \
    NODE_REGISTRY=https://npm.taobao.org/mirrors/node \
    CHROMEDRIVER_CDNURL=http://npm.taobao.org/mirrors/chromedriver/ \
    ELECTRON_MIRROR=https://npm.taobao.org/mirrors/electron/ \
    JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64' \
    DISPLAY=':99.0' \
    NODE_IN_DOCKER=1

RUN curl -SLO "$NODE_REGISTRY/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
      && tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
      && rm "node-v$NODE_VERSION-linux-x64.tar.gz"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
