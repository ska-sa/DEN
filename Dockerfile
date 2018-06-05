FROM stimela/casa:1.0.0
RUN docker-apt-install \
  msutils \
  aoflagger \
  rfimasker \
  wsclean \
  pybdsf \
  cubical \
  tigger-lsm \
  python-pip \
  git \
  python-casacore

#TODO(Sphe): put this on pip
RUN pip install git+https://github.com/SpheMakh/crasa
# version of python-casacore is fixed in RFIMasker. 
# So install deps, then install RFIMakser with --no-deps
RUN pip install --upgrade numpy python-casacore
RUN pip install --no-deps RFIMasker
# we need to set this for casa to work properly inside docker
ENV USER root
