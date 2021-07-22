FROM debian:latest

RUN apt-get -y install curl \
  dirmngr \
  apt-transport-https \
  lsb-release \
  wget \
  unzip \
  libsqlite3-dev

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -

RUN apt-get -y install nodejs

RUN npm install

RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | tee -a /etc/apt/sources.list

RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - >/dev/null

RUN apt-get -qq install -y google-chrome-stable \
  xvfb \
  gtk2-engines-pixbuf \ 
  xfonts-cyrillic \ 
  xfonts-100dpi \
  xfonts-75dpi \ 
  xfonts-base \
  xfonts-scalable \
  imagemagick \
  x11-apps \
  default-jre

RUN Xvfb :99 -ac -screen 0 1280x1024x24 &
RUN export DISPLAY=:99
