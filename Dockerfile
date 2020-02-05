FROM ubuntu:18.04

RUN apt update
RUN apt install -y curl
RUN apt install -y neovim
RUN apt install -y git

ENV DEBIAN_FRONTEND=noninteractive

RUN apt install -y texlive-full

ARG USER_ID
ARG GROUP_ID
RUN useradd -m --uid $USER_ID developer && \
    echo "developer:devpasswd" | chpasswd && \
    usermod -aG dialout developer && \
    usermod -aG sudo developer

USER developer
WORKDIR /home/developer

RUN echo "PS1='\[\033[01;31m\][\[\033[01;30m\]\u@\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '" >> .bashrc

RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

COPY --chown=developer texmf ./texmf

RUN mkdir -p ./.config
WORKDIR ./.config

COPY --chown=developer nvim ./nvim

RUN nvim +PlugInstall +qall

WORKDIR /home/developer

RUN mkdir project
