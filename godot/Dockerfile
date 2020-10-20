FROM ubuntu:20.04 AS godot-installer

RUN apt-get update -y

ENV GODOT_VERSION=3.2.3
ENV GODOT_STANDALONE_DIST=Godot_v3.2.3-stable_linux_server.64
ENV GODOT_HEADLESS_DIST=Godot_v3.2.3-stable_linux_headless.64

RUN apt-get install wget unzip -y
WORKDIR /tmp

# get the headless version
RUN wget https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/${GODOT_HEADLESS_DIST}.zip
RUN unzip ${GODOT_HEADLESS_DIST}.zip
RUN mv ${GODOT_HEADLESS_DIST} /usr/local/bin/godot

# get the standalone server
RUN wget https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/${GODOT_STANDALONE_DIST}.zip

RUN unzip ${GODOT_STANDALONE_DIST}.zip

ENV INSTALL_LOC_STANDALONE=/usr/local/bin/godot-server
RUN mv ${GODOT_STANDALONE_DIST} ${INSTALL_LOC_STANDALONE}

RUN mkdir -p $HOME/.local/share/godot

RUN wget https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-stable_export_templates.tpz

RUN unzip Godot_v${GODOT_VERSION}-stable_export_templates.tpz -d /root/.local/share/godot/

FROM ubuntu:20.04 AS godot-builder

COPY --from=godot-installer /usr/local/bin/godot-server /usr/local/bin/godot-server
COPY --from=godot-installer /usr/local/bin/godot /usr/local/bin/godot

RUN mkdir -p /root/.local/share/godot

COPY --from=godot-installer /root/.local/share/godot /root/.local/share/godot

COPY . /data/freemultiplay

WORKDIR /data/freemultiplay

RUN godot --export-pack Server dedicated.pck

CMD ["godot-server", "/data/freemultiplay/dedicated.pck"]