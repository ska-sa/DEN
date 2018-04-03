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
