FROM knipegp/docker-base:0.0.1

USER root
WORKDIR /root

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-proselint=0.8.0-2 \
    texlive-full=2017.20180305-1 \
    plantuml=1:1.2017.15-1 \
    graphviz=2.40.1-2 \
    fonts-liberation=1:1.07.4-7~18.04.1 \
    && rm -rf /var/lib/apt/lists/*

USER developer
WORKDIR /home/developer

COPY --chown=developer texmf ./texmf
