FROM ubuntu

EXPOSE 9999
EXPOSE 27015/udp
EXPOSE 27016/udp

# Steam guard must be disabled for the username that is configured
# http://gaming.stackexchange.com/questions/93522/is-it-possible-to-disable-steam-guard

ARG NS2_DEFAULT_MAP=ns2_veil
ARG NS2_MAX_PLAYERS=20
ARG NS2_MODS="28eb0f83"
ARG NS2_SERVER_IP="0.0.0.0"
ARG NS2_SERVER_NAME="Natural Selection 2 Server"
ARG NS2_SERVER_PASSWORD=""
ARG NS2_STEAM_USERNAME=username
ARG NS2_STEAM_PASSWORD=password
ARG NS2_UPDATE_ON_START=on
ARG NS2_WEB_ADMIN_USERNAME=admin
ARG NS2_WEB_ADMIN_PASSWORD=admin
ARG NS2_WEB_ADMIN_PORT=9999

ENV NS2_DEFAULT_MAP=${NS2_DEFAULT_MAP}
ENV NS2_MAX_PLAYERS=${NS2_MAX_PLAYERS}
ENV NS2_MODS=${NS2_MODS}
ENV NS2_SERVER_IP=${NS2_SERVER_IP}
ENV NS2_SERVER_NAME=${NS2_SERVER_NAME}
ENV NS2_SERVER_PASSWORD=${NS2_SERVER_PASSWORD}
ENV NS2_STEAM_USERNAME=${NS2_STEAM_USERNAME}
ENV NS2_STEAM_PASSWORD=${NS2_STEAM_PASSWORD}
ENV NS2_UPDATE_ON_START=${NS2_UPDATE_ON_START}
ENV NS2_WEB_ADMIN_USERNAME=${NS2_WEB_ADMIN_USERNAME}
ENV NS2_WEB_ADMIN_PASSWORD=${NS2_WEB_ADMIN_PASSWORD}
ENV NS2_WEB_ADMIN_PORT=${NS2_WEB_ADMIN_PORT}

ENV TERM=xterm-256color

RUN dpkg --add-architecture i386
RUN apt-get --yes update && \
    apt-get --yes install \
        curl wget vim net-tools iproute2 \
        file gzip bzip2 bsdmainutils python \
        util-linux tmux lib32gcc1 libstdc++6 \
        libstdc++6:i386 speex:i386 libtbb2

RUN useradd --create-home --shell /bin/bash ns2

USER ns2
WORKDIR /home/ns2

RUN wget https://gameservermanagers.com/dl/ns2server
RUN chmod +x ns2server

RUN sed -i 's@defaultmap=\"ns2_summit\"@defaultmap=\"'"$NS2_DEFAULT_MAP"'\"@' ns2server
RUN sed -i 's@ip=\"0.0.0.0\"@ip=\"'"$NS2_SERVER_IP"'\"@' ns2server
RUN sed -i 's@maxplayers=\"24\"@maxplayers=\"'"$NS2_MAX_PLAYERS"'\"@' ns2server
RUN sed -i 's@mods=\"\"@mods=\"'"$NS2_MODS"'\"@' ns2server
RUN sed -i 's@password=\"\"@password=\"'"$NS2_SERVER_PASSWORD"'\"@' ns2server
RUN sed -i 's@servername=\"NS2 Server\"@servername=\"'"$NS2_SERVER_NAME"'\"@' ns2server
RUN sed -i 's@steamuser=\"username\"@steamuser=\"'"$NS2_STEAM_USERNAME"'\"@' ns2server
RUN sed -i 's@steampass=\"password\"@steampass=\"'"$NS2_STEAM_PASSWORD"'\"@' ns2server
RUN sed -i 's@updateonstart=\"off\"@updateonstart=\"'"$NS2_UPDATE_ON_START"'\"@' ns2server
RUN sed -i 's@webadminuser=\"admin\"@webadminuser=\"'"$NS2_WEB_ADMIN_USERNAME"'\"@' ns2server
RUN sed -i 's@webadminpass=\"prout\"@webadminpass=\"'"$NS2_WEB_ADMIN_PASSWORD"'\"@' ns2server
RUN sed -i 's@webadminport=\"8080\"@webadminport=\"'"$NS2_WEB_ADMIN_PORT"'\"@' ns2server

RUN ./ns2server auto-install

CMD ./ns2server start; tail -f /dev/null

