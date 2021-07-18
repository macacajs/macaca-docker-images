FROM electronuserland/builder

COPY sources.list /etc/apt/sources.list

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      curl \
      wget \
      git \
      vim \
      libgtk2.0-0 \
      libgconf-2-4 \
      libasound2 \
      libxtst6 \
      libxss1 \
      libnss3 \
      xvfb \
      libgbm-dev \
      libnss3-dev \
      libgtk-3-0 \
      libatk-bridge2.0-0

# Variable Layer: Node.js etc.
ENV NODE_VERSION=12.18.3 \
      NODE_REGISTRY=https://npm.taobao.org/mirrors/node \
      CHROMEDRIVER_CDNURL=http://npm.taobao.org/mirrors/chromedriver/ \
      ELECTRON_MIRROR=https://npm.taobao.org/mirrors/electron/ \
      DISPLAY=':99.0' \
      NODE_IN_DOCKER=1 \
      ELECTRON_DISABLE_SANDBOX=1

RUN curl -SLO "$NODE_REGISTRY/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz" \
      && tar -xzf "node-v$NODE_VERSION-linux-x64.tar.gz" -C /usr/local --strip-components=1 \
      && rm "node-v$NODE_VERSION-linux-x64.tar.gz"

COPY entrypoint.sh /root/entrypoint.sh

WORKDIR /root

ENTRYPOINT ["./entrypoint.sh"]

CMD ["/bin/bash"]
