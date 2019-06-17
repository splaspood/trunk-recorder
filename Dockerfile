# docker build -t robotastic/trunk-recorder:latest .

FROM paravolve-gnuradio
RUN install_packages ffmpeg build-essential cmake gnuradio-dev libssl-dev libboost-all-dev locales lame

RUN rm -f /usr/share/locale/locale.alias \
 && ln -s /etc/locale.alias /usr/share/locale/locale.alias \
 && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

COPY . /src/trunk-recorder
RUN cd /src/trunk-recorder && cmake . && make
RUN mkdir /app && cp /src/trunk-recorder/recorder /app
