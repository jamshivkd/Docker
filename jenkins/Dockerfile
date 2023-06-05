FROM jenkins/jenkins:lts
USER root
SHELL ["/bin/bash", "-c"]
RUN apt-get update && apt-get install -y python3 sudo vim pssh   unzip  libaio-dev python3-pip xvfb  wget exim4 mailutils python openssh-server
RUN pip3 install selenium robotframework
RUN wget -qO - https://package.perforce.com/perforce.pubkey | sudo apt-key add -
RUN mkdir -p  /etc/apt/sources.list.d
COPY perforce.list  /etc/apt/sources.list.d/
RUN apt-get update
RUN  apt-get install -y helix-p4d
RUN curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add
RUN touch /etc/apt/sources.list.d/google-chrome.list
RUN   echo "deb [arch=amd64]  http://dl.google.com/linux/chrome/deb/ stable main" >  /etc/apt/sources.list.d/google-chrome.list
RUN apt-get -y update
RUN apt-get -y install google-chrome-stable
RUN  echo "jenkins:jenkins" | chpasswd && adduser jenkins  sudo
COPY exim4.conf  /etc/exim4/
COPY sshd_config /etc/ssh/sshd_config
RUN service exim4 restart
RUN service ssh  start
USER jenkins


