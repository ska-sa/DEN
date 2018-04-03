FROM kernsuite/base:3
RUN docker-apt-install \
  msutils \
  casalite \
  aoflagger \
  python-rfimasker \
  wsclean \
  cubical \
  pybdsf \
  tigger
