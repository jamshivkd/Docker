FROM  ubuntu:latest
RUN apt-get update && apt-get install -y sudo vim pssh   unzip  libaio-dev  xvfb  wget exim4 mailutils python openssh-server software-properties-common
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
COPY exim4.conf  /etc/exim4/
COPY sshd_config /etc/ssh/sshd_config
RUN service ssh start
RUN useradd -m -s /bin/bash jenkinsuser
RUN  echo 'jenkinsuser:password' | chpasswd
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]

