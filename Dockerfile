FROM jenkins/jenkins:lts
USER root

RUN echo "https://download.docker.com/linux/debian/dists/jessie/Release" \
      && apt-key adv --keyserver keyserver.ubuntu.com \
          --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
      && apt-get update \
      && apt-get install -y apt-transport-https \
      && apt-get install -y sudo \
      && apt-get install -y docker.io \
      && rm -rf /var/lib/apt/lists/*
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

USER jenkins
