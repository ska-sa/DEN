FROM kernsuite/base:3
RUN docker-apt-install \
  msutils \
  casalite \
  aoflagger \
  rfimasker \
  wsclean \
  pybdsf \
  cubical \
  tigger-lsm

# we need to set this for casa to work properly inside docker
ENV USER root