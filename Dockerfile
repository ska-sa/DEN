FROM kernsuite/base:3
# add  --no-cache-dir
RUN docker-apt-install python-pip
RUN pip install git+git://github.com/ratt-ru/CubiCal.git#egg=Cubical
RUN docker-apt-install \
  msutils \
  casalite \
  aoflagger \
  python-rfimasker \
  wsclean \
  pybdsf \
  tigger
#  cubical \
